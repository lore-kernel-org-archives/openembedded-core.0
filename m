Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 306E47404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NLaKpb018066 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:36:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OI_778Rgugue
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:36:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NLa70k018059
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:36:18 +0100
Message-ID: <1443044167.19044.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Sep 2015 22:36:07 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] archiver: stamp-base is dead, remove it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Sep 2015 21:36:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

stamp-base was only ever used by the shared workdir code in gcc. This 
turned out to be problematic and has been replaced by other approaches
which don't need specialist bitbake knowledge.

stamp-base will likely get removed from bitbake but for now, remove it
from archiver to simplfy the code since gcc no longer uses it.

This stops people getting confused by the obsolete code paths which I'm
getting a lot of questions about.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 089d707..eec8024 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -99,27 +99,6 @@ python () {
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_patched' % pn)
             elif ar_src == "configured":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
-
-    # The gcc staff uses shared source
-    flag = d.getVarFlag("do_unpack", "stamp-base", True)
-    if flag:
-        if ar_src in [ 'original', 'patched' ]:
-            ar_outdir = os.path.join(d.getVar('ARCHIVER_TOPDIR', True), 'work-shared')
-            d.setVar('ARCHIVER_OUTDIR', ar_outdir)
-        d.setVarFlag('do_ar_original', 'stamp-base', flag)
-        d.setVarFlag('do_ar_patched', 'stamp-base', flag)
-        d.setVarFlag('do_unpack_and_patch', 'stamp-base', flag)
-        d.setVarFlag('do_ar_original', 'vardepsexclude', 'PN PF ARCHIVER_OUTDIR WORKDIR')
-        d.setVarFlag('do_unpack_and_patch', 'vardepsexclude', 'PN PF ARCHIVER_OUTDIR WORKDIR')
-        d.setVarFlag('do_ar_patched', 'vardepsexclude', 'PN PF ARCHIVER_OUTDIR WORKDIR')
-        d.setVarFlag('create_diff_gz', 'vardepsexclude', 'PF')
-        d.setVarFlag('create_tarball', 'vardepsexclude', 'PF')
-
-        flag_clean = d.getVarFlag('do_unpack', 'stamp-base-clean', True)
-        if flag_clean:
-            d.setVarFlag('do_ar_original', 'stamp-base-clean', flag_clean)
-            d.setVarFlag('do_ar_patched', 'stamp-base-clean', flag_clean)
-            d.setVarFlag('do_unpack_and_patch', 'stamp-base-clean', flag_clean)
 }
 
 # Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
@@ -179,12 +158,7 @@ python do_ar_patched() {
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
     bb.note('Archiving the patched source...')
     d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
-    # The gcc staff uses shared source
-    flag = d.getVarFlag('do_unpack', 'stamp-base', True)
-    if flag:
-        create_tarball(d, d.getVar('S', True), 'patched', ar_outdir, 'gcc')
-    else:
-        create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
+    create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
 }
 
 python do_ar_configured() {
@@ -222,17 +196,14 @@ python do_ar_configured() {
         create_tarball(d, srcdir, 'configured', ar_outdir)
 }
 
-def create_tarball(d, srcdir, suffix, ar_outdir, pf=None):
+def create_tarball(d, srcdir, suffix, ar_outdir):
     """
     create the tarball from srcdir
     """
     import tarfile
 
     bb.utils.mkdirhier(ar_outdir)
-    if pf:
-        tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % (pf, suffix))
-    else:
-        tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % \
+    tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % \
             (d.getVar('PF', True), suffix))
 
     srcdir = srcdir.rstrip('/')



