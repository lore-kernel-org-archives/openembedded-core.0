Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TNiAk-0005J5-CZ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 12:45:22 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TNhxw-0003dO-TL; Mon, 15 Oct 2012 12:32:09 +0200
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 15 Oct 2012 11:32:06 +0100
In-Reply-To: <507B3297.3010102@linux.intel.com>
References: <1349112564.32611.71.camel@phil-desktop>
	<507B3297.3010102@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350297128.3259.132.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: Rationalise phdrs-based QA checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2012 10:45:22 -0000
X-Groupsio-MsgNum: 30581
Content-Type: multipart/mixed; boundary="=-88a6o0OFV6FTaHUl+ArD"

--=-88a6o0OFV6FTaHUl+ArD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-10-14 at 14:45 -0700, Saul Wold wrote:
> On 10/01/2012 10:29 AM, Phil Blundell wrote:
> > Various different QA checks are based on essentially the same data from
> > the ELF program headers.  Calling objdump to extract it repeatedly is
> > inefficient, particularly if the shell is involved.  Instead, let's
> > cache the output from objdump inside the qa.elf object and allow it to
> > be reused by multiple tests.
> >
> > Also, using objdump instead of scanelf to check for bad RPATHs (in the
> > same way that the useless-rpaths check was doing already) allows the
> > dependency on pax-utils-native to be dropped.
> >
> This seems to be failing for a QemuArm build of world, specifically 
> lsbsetup, quilt, sysvinit, and foomatic-filters seems like its failing 
> on symlinks.

I wasn't able to complete a build of world successfully due to some
unrelated-looking breakage in xserver-xorg, but I did reproduce this
problem by building quilt by hand.  The attached patch fixes it for me.

thanks

p.


--=-88a6o0OFV6FTaHUl+ArD
Content-Disposition: attachment;
	filename="0001-insane-Don-t-try-to-run-objdump-on-symlinks.patch"
Content-Type: text/x-patch;
	name="0001-insane-Don-t-try-to-run-objdump-on-symlinks.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 0aa4c262ded3e9d9da8293d899cd6ec28b4f60bb Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Mon, 15 Oct 2012 11:28:00 +0100
Subject: [PATCH] insane: Don't try to run objdump on symlinks

If the link is absolute then we might end up reading from a host binary
or a nonexistent path, neither of which will produce useful results and
may result in objdump failure and python backtrace spew.  If the link
does point to a binary within the installation root then we will scan the
pointed-to file at some point anyway so there is no need to do it again.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/insane.bbclass |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2b48419..71a9a58 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -157,6 +157,9 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     if not elf:
         return
 
+    if os.path.islink(file):
+        return
+
     bad_dirs = [d.getVar('TMPDIR', True) + "/work", d.getVar('STAGING_DIR_TARGET', True)]
     bad_dir_test = d.getVar('TMPDIR', True)
 
@@ -186,6 +189,9 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     if not elf:
         return
 
+    if os.path.islink(file):
+        return
+
     libdir = d.getVar("libdir", True)
     base_libdir = d.getVar("base_libdir", True)
 
-- 
1.7.10.4


--=-88a6o0OFV6FTaHUl+ArD--
