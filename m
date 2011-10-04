Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RB6by-0006lh-No
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 17:08:50 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RB6Wd-00019m-BP
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 17:03:19 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 16:03:18 +0100
In-Reply-To: <1317725702.14671.33.camel@ted>
References: <1317660469.13337.16.camel@phil-desktop>
	<1317725702.14671.33.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317740599.13337.43.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Tue, 04 Oct 2011 15:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 11:54 +0100, Richard Purdie wrote:
> I think we need to teach this clean function about stamp-extra-info and
> instead of stfile + ".*", remove stfile + ".*." + stamp-extra-info if
> stamp-extra-info is set. That would likely fix the problem you're
> seeing.

Okay, thanks.  I applied this change locally:

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 91f209a..7f38800 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -258,10 +258,15 @@ def sstate_clean(ss, d):
             bb.utils.unlockfile(lock)
 
     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
+    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
     oe.path.remove(stfile)
     oe.path.remove(stfile + "_setscene")
-    oe.path.remove(stfile + ".*")
-    oe.path.remove(stfile + "_setscene" + ".*")
+    if extrainf:
+        oe.path.remove(stfile + ".*." + extrainf)
+       oe.path.remove(stfile + "_setscene" + ".*." + extrainf)
+    else:
+        oe.path.remove(stfile + ".*")
+       oe.path.remove(stfile + "_setscene" + ".*")
 
 CLEANFUNCS += "sstate_cleanall"
 
and it does indeed seem to resolve the problem I was seeing before.

p.




