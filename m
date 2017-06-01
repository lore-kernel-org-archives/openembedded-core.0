Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 12F2177DB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=KaiLzTZ3fNwhIJmlj33jj9VvoM8ZFgFrIOq5XfgVp+o=; 
	b=NWESzE9uHy62PFSYaNdt2srnEgv1trbY2mw3y9wn3JhAIlnhD2AaGkJ0ubNx0TL1LiICWRvQNCpNt3/y5WP5zjb9Z+pxPe63Uj5Qe/Qp3Fj4JEEp9VQRikKW/54f5y+u1ysNu1NOJIqhWoUpa2AL+nsxSnLaz6TkzxnChNyxTxqCdoiv8e9livqLQBrdl01vJv4/8EqC7GOhWFzGso6rlE0zaQz5BaeI3SgOHH9KYjngCXGoZd5SSz1ppDwPxPkZRZzy8wlVOLzm9F4Zjr7URGQyIYuBaPLm/kDQ2nPwHkIaOupb7nY9yiDxsyc1Ivq7temk3zLcIwm0swWm4YT/Cw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dGSPh-0005pJ-1l; Thu, 01 Jun 2017 18:53:29 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dGSPh-0002JB-0d; Thu, 01 Jun 2017 18:53:29 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: poky@yoctoproject.org
Date: Thu,  1 Jun 2017 18:53:14 +0300
Message-Id: <1496332394-6615-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <20170601125029.wli6reydiovo7xjk@hiutale>
References: <20170601125029.wli6reydiovo7xjk@hiutale>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3 v2] meta: Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 01 Jun 2017 15:53:28 -0000

Python function subprocess.call() returns the return value of the
executed process. If return values are not checked, errors may
go unnoticed and bad things can happen.

Change all callers of subprocess.call() which do not check for
the return value to use subprocess.check_call() which raises
CalledProcessError if the subprocess returns with non-zero value.

https://docs.python.org/2/library/subprocess.html#using-the-subprocess-module

All users of the function were found with:

$ git grep "subprocess\.call" | \
  egrep -v 'if.*subprocess\.call|=\ +subprocess\.call|return.*subprocess\.call'

Tested similar patch on top of yocto jethro. Only compile tested
core-image-minimal on poky master branch.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/archiver.bbclass            | 2 +-
 meta/classes/cml1.bbclass                | 2 +-
 meta/classes/kernel-module-split.bbclass | 2 +-
 meta/classes/sstate.bbclass              | 4 ++--
 meta/lib/oeqa/utils/buildproject.py      | 2 +-
 meta/lib/oeqa/utils/targetbuild.py       | 4 ++--
 meta/recipes-extended/cups/cups.inc      | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

v2:
split patches to bitbake, meta and scripts

v1:
http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136901.html

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..703eacb 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -288,7 +288,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     os.chdir(dirname)
     out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF'))
     diff_cmd = 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basename, basename, out_file)
-    subprocess.call(diff_cmd, shell=True)
+    subprocess.check_call(diff_cmd, shell=True)
     bb.utils.remove(src_patched, recurse=True)
 
 # Run do_unpack and do_patch
diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 38e6613..eb8e790 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -63,7 +63,7 @@ python do_diffconfig() {
 
     if isdiff:
         statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
-        subprocess.call(statement, shell=True)
+        subprocess.check_call(statement, shell=True)
 
         shutil.copy(configorig, config)
 
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 5e10dcf..1035525 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -47,7 +47,7 @@ python split_kernel_module_packages () {
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
         cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
-        subprocess.call(cmd, shell=True)
+        subprocess.check_call(cmd, shell=True)
         f = open(tmpfile)
         l = f.read().split("\000")
         f.close()
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0a12935..f446c3d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -404,7 +404,7 @@ python sstate_hardcode_path_unpack () {
             return
 
         bb.note("Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd))
-        subprocess.call(sstate_hardcode_cmd, shell=True)
+        subprocess.check_call(sstate_hardcode_cmd, shell=True)
 
         # Need to remove this or we'd copy it into the target directory and may 
         # conflict with another writer
@@ -453,7 +453,7 @@ def sstate_clean_manifest(manifest, d, prefix=None):
     if os.path.exists(manifest + ".postrm"):
         import subprocess
         os.chmod(postrm, 0o755)
-        subprocess.call(postrm, shell=True)
+        subprocess.check_call(postrm, shell=True)
         oe.path.remove(postrm)
 
     oe.path.remove(manifest)
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 487f08b..721f35d 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -52,4 +52,4 @@ class BuildProject(metaclass=ABCMeta):
 
     def clean(self):
         self._run('rm -rf %s' % self.targetdir)
-        subprocess.call('rm -f %s' % self.localarchive, shell=True)
+        subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 9249fa2..1202d57 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -69,7 +69,7 @@ class BuildProject(metaclass=ABCMeta):
 
     def clean(self):
         self._run('rm -rf %s' % self.targetdir)
-        subprocess.call('rm -f %s' % self.localarchive, shell=True)
+        subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
         pass
 
 class TargetBuildProject(BuildProject):
@@ -136,4 +136,4 @@ class SDKBuildProject(BuildProject):
 
     def _run(self, cmd):
         self.log("Running . %s; " % self.sdkenv + cmd)
-        return subprocess.call(". %s; " % self.sdkenv + cmd, shell=True)
+        return subprocess.check_call(". %s; " % self.sdkenv + cmd, shell=True)
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c3fa459..699a34a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -83,7 +83,7 @@ python do_package_append() {
     import subprocess
     # Change permissions back the way they were, they probably had a reason...
     workdir = d.getVar('WORKDIR')
-    subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir, shell=True)
+    subprocess.check_call('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir, shell=True)
 }
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
-- 
1.9.1


