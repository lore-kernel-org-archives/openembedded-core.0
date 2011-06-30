Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QcFIw-0005M4-8T for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 13:21:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QcFFM-0000dh-06
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 13:17:24 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309355375.20015.383.camel@rex>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 30 Jun 2011 12:17:22 +0100
Message-ID: <1309432642.2551.131.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 11:21:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 14:49 +0100, Richard Purdie wrote:
> On Wed, 2011-06-29 at 14:36 +0100, Phil Blundell wrote:
> > On Tue, 2011-06-28 at 22:32 +0200, Koen Kooi wrote:
> > > From http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=0d0e14cda2ddd881d09798b0e6edd8086aa9b6d9
> > > 
> > > +libc6 -> libc6_dev;
> > > 
> > > So libc6 now depends on libc6-dev :(
> > 
> > I guess it would be straightforward to patch insane.bbclass to detect
> > that particular failure (which does indeed seem to happen to libc
> > distressingly often).  It already diagnoses the case where a package
> > erroneously depends on a -dbg package, and I can't think of any reason
> > why the same logic couldn't be applied to -dev.
> 
> I'd love to see a patch for this! :)

Your wish, naturally, is my command.  I've built micro-base-image with
this and verified that I didn't get any false positives; I also checked
(via some manual fiddling) that it did indeed detect the case that we
want it to.  

I guess it might be a good idea for someone to test it with a slightly
larger dataset before actually checking it in, just in case.

p.

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 35809b9..f7e5524 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -103,6 +103,7 @@ def package_qa_get_machine_dict():
 # 8 - .la contains reference to the workdir
 # 9 - LDFLAGS ignored
 # 10 - Build paths in binaries
+# 11 - package depends on devel package
 
 def package_qa_clean_path(path,d):
     """ Remove the common prefix from the path. In this case it is the TMPDIR"""
@@ -134,6 +135,7 @@ def package_qa_write_error(error_class, name, path, d):
         ".la contains reference to the workdir",
         "LDFLAGS ignored",
         "package contains reference to tmpdir paths",
+	"package depends on devel package",
     ]
 
     log_path = os.path.join( bb.data.getVar('T', d, True), "log.qa_package" )
@@ -493,12 +495,14 @@ def package_qa_check_rdepends(pkg, pkgdest, d):
         # Now check the RDEPENDS
         rdepends = bb.utils.explode_deps(bb.data.getVar('RDEPENDS', localdata, True) or "")
 
-
         # Now do the sanity check!!!
         for rdepend in rdepends:
             if "-dbg" in rdepend:
                 error_msg = "%s rdepends on %s" % (pkgname,rdepend)
                 sane = package_qa_handle_error(2, error_msg, pkgname, rdepend, d)
+	    if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev"):
+	        error_msg = "%s rdepends on %s" % (pkgname, rdepend)
+                sane = package_qa_handle_error(11, error_msg, pkgname, rdepend, d)
 
     return sane
 




