Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7B844755F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 19:56:58 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so38814519ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jcDmSKCGjh0e03Xstu+mGn2Pe980eTg6gaL7vu34TGU=;
	b=SYx/cKKmcrUE64BcU+gWGxa21GWd6cJOpyKe+FKNy2RkDjNBrsh4w74WOe36Xc0bN1
	xK7O6v7nrmQ0/7Fii7oYtt9RJ8xH1FoyzAQbF+Gdm2FgbErzww9uY+EtmvIAvGZZ9Ev9
	TNt0BF4egm2o/xiz9s+xL/PzBbkxiq80OMwAT/wXgtLSHrjaqBgcpfIzia03UxAl5kDk
	69MdfwTQ45/sa7YrgWXn7mRbPBaoQdRuE0X2yMcI5FAvu8iOa9/QuprCFIEQ/eFfWU3c
	QSe25JWcI4FWtPERc/gMAbc3FOGvQxcqRqgmn+vog5sD+2iNSuJgD8ewdo7eafBzfMLq
	Snag==
X-Received: by 10.42.85.147 with SMTP id q19mr11349317icl.96.1432324620255;
	Fri, 22 May 2015 12:57:00 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by mx.google.com with ESMTPSA id
	y124sm2508709iod.13.2015.05.22.12.56.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 12:56:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:56:53 -0700
Message-Id: <d6125a94af36c3e6ea4a32a0bcf5efad46bbde3f.1432324432.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
References: <29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
In-Reply-To: <cover.1432324432.git.raj.khem@gmail.com>
References: <cover.1432324432.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] image.bbclass: Add a method for creating a companion debug filesystem
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
X-List-Received-Date: Fri, 22 May 2015 19:57:01 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The companion debug filesystem contains only the package database and the
complementary *-dbg packages for the main filesystem component.  This is
useful in a production environment to produce a companion filesystem capable
of remote system debugging, without requiring corresponding debug symbols or
source code on the device.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

If dbg pkgs have already been installed to the rootfs image,
the installation to companion debug filesystem will fail,
because both of image creation make use of the same pm
database.

In this situation, try to copy installed dbg files from rootfs
image to companion debug filesystem.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Acked-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass |  5 +++-
 meta/lib/oe/rootfs.py      | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 01f8b3f..58b4add 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -24,6 +24,9 @@ IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
 IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password allow-empty-password post-install-logging"
 
+# Generate companion debugfs?
+IMAGE_GEN_DEBUGFS ?= "0"
+
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
 
@@ -108,7 +111,7 @@ def rootfs_variables(d):
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
                  'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'COMPRESSIONTYPES']
+                 'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS']
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ce23b23..7d86988 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -95,6 +95,57 @@ class Rootfs(object):
     def _cleanup(self):
         pass
 
+    def _setup_dbg_rootfs(self, dirs):
+        gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS', True) or '0'
+        if gen_debugfs != '1':
+           return
+
+        bb.note("  Renaming the original rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-orig')
+        except:
+            pass
+        os.rename(self.image_rootfs, self.image_rootfs + '-orig')
+
+        bb.note("  Creating debug rootfs...")
+        bb.utils.mkdirhier(self.image_rootfs)
+
+        bb.note("  Copying back package database...")
+        for dir in dirs:
+            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
+            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir)
+
+        cpath = oe.cachedpath.CachedPath()
+        # Copy files located in /usr/lib/debug or /usr/src/debug
+        for dir in ["/usr/lib/debug", "/usr/src/debug"]:
+            src = self.image_rootfs + '-orig' + dir
+            if cpath.exists(src):
+                dst = self.image_rootfs + dir
+                bb.utils.mkdirhier(os.path.dirname(dst))
+                shutil.copytree(src, dst)
+
+        # Copy files with suffix '.debug' or located in '.debug' dir.
+        for root, dirs, files in cpath.walk(self.image_rootfs + '-orig'):
+            relative_dir = root[len(self.image_rootfs + '-orig'):]
+            for f in files:
+                if f.endswith('.debug') or '/.debug' in relative_dir:
+                    bb.utils.mkdirhier(self.image_rootfs + relative_dir)
+                    shutil.copy(os.path.join(root, f),
+                                self.image_rootfs + relative_dir)
+
+        bb.note("  Install complementary '*-dbg' packages...")
+        self.pm.install_complementary('*-dbg')
+
+        bb.note("  Rename debug rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-dbg')
+        except:
+            pass
+        os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
+
+        bb.note("  Restoreing original rootfs...")
+        os.rename(self.image_rootfs + '-orig', self.image_rootfs)
+
     def _exec_shell_cmd(self, cmd):
         fakerootcmd = self.d.getVar('FAKEROOT', True)
         if fakerootcmd is not None:
@@ -369,6 +420,8 @@ class RpmRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
+
         if self.inc_rpm_image_gen == "1":
             self.pm.backup_packaging_data()
 
@@ -472,6 +525,8 @@ class DpkgRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        self._setup_dbg_rootfs(['/var/lib/dpkg'])
+
         self.pm.fix_broken_dependencies()
 
         self.pm.mark_packages("installed")
@@ -740,6 +795,8 @@ class OpkgRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        self._setup_dbg_rootfs(['/var/lib/opkg'])
+
         execute_pre_post_process(self.d, opkg_post_process_cmds)
         execute_pre_post_process(self.d, rootfs_post_install_cmds)
 
-- 
2.1.4


