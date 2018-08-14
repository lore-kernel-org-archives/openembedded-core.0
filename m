Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6297902D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:32:03 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f21-v6so13075905wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uiKGGReu08ENoaQBqHgmB8VE57xc7gcAznEzyfaefV4=;
	b=SynVYNVaXW6GC9HC2ZWGwBdmTDK2oTHA9OoToRp6LqLrP9Q5qtfHz+dNqzirQSmoag
	zln8/XFcJ5uCVSS68LppAFhgOVCbE65Tv1zbvGNWUoUBkJ0TeShC8S6EEgGE+BZ9c02/
	mw9xBCk23dSyfREKEj70BhBLYBZtX8PmteLT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uiKGGReu08ENoaQBqHgmB8VE57xc7gcAznEzyfaefV4=;
	b=nppHCTY/Ef6CVdV1IxOl9kdzX9iPNMx7IiNkaHaFxvNYomSseUqrhkXpXzVq193Av+
	o0NzHLpg/qh4J5s1Lkfx8aOF8ZnSLVWyYHdY627WrCh3T93d3L7nbLtTB5dLGTVko4EW
	IKagCHeH0cZnb+AcClI493VGzFxdB62A0b2wHRe08L4ZEpZu/ac448wqdABfb2l4S691
	JIhb04m0H4QVAtLwaVGyY9S55twjt6eGhT2Lxi58qCFm2QuVw9d1vapfmom6zxHwO5OM
	0Wvjm9/G9JAFj/NqK8KzIOV1letvV6QNpgtX0FLGXqyVyv0G322AKs+4pXGe5fwSJAn+
	ccyA==
X-Gm-Message-State: AOUpUlHRJ+7wVJHrqVNIg3+vbcWTipNYOXI97Z+AVQwa9vPrBX7oy6Vn
	W/lFynL/Mf9uc8tUfHF4LhdQVw2TIs4=
X-Google-Smtp-Source: AA+uWPzZR4oenx18KMhFUTptdNtNIUaXl3EIPedKHjk149zAMIY7lPsF+zReUiML/4EBLYtn0EP/Tw==
X-Received: by 2002:a1c:b6d6:: with SMTP id
	g205-v6mr12559594wmf.17.1534267924398; 
	Tue, 14 Aug 2018 10:32:04 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm14519462wmt.30.2018.08.14.10.32.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 10:32:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:31:57 +0100
Message-Id: <20180814173201.6723-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
References: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] package_manager/sdk: Use filtered copies of the deploy ipk/deb directories
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
X-List-Received-Date: Tue, 14 Aug 2018 17:32:04 -0000

Similar to rpm, use copies of the ipk/deb directories for rootfs construction.
This means the image creation code can no longer "see" recipes wich aren't in its
dependency chain which is good for a variety of reasons including determinism,
incompatible recipe (e.g. systemd/sysvinit) package conflicts and locking
performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py         | 13 +++++++++----
 meta/lib/oe/sdk.py                     | 20 ++++++++++++++++----
 meta/lib/oeqa/utils/package_manager.py |  6 ++++--
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f1dbe48a720..0f1c5899fd5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1124,19 +1124,21 @@ class OpkgDpkgPM(PackageManager):
         self.mark_packages("unpacked", registered_pkgs.split())
 
 class OpkgPM(OpkgDpkgPM):
-    def __init__(self, d, target_rootfs, config_file, archs, task_name='target'):
+    def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
         super(OpkgPM, self).__init__(d, target_rootfs)
 
         self.config_file = config_file
         self.pkg_archs = archs
         self.task_name = task_name
 
-        self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK")
+        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
 
+        create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
+
         opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
         if opkg_lib_dir[0] == "/":
             opkg_lib_dir = opkg_lib_dir[1:]
@@ -1501,9 +1503,12 @@ class OpkgPM(OpkgDpkgPM):
         return tmp_dir
 
 class DpkgPM(OpkgDpkgPM):
-    def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
+    def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
         super(DpkgPM, self).__init__(d, target_rootfs)
-        self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
+        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), deb_repo_workdir)
+
+        create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
+
         if apt_conf_dir is None:
             self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
         else:
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index f20441ccf66..153b07d76b4 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -227,11 +227,17 @@ class OpkgSdk(Sdk):
         self.host_manifest = OpkgManifest(d, self.manifest_dir,
                                           Manifest.MANIFEST_TYPE_SDK_HOST)
 
+        ipk_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            ipk_repo_workdir = "oe-sdk-ext-repo"
+
         self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
-                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
+                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
+                                ipk_repo_workdir=ipk_repo_workdir)
 
         self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
-                              self.d.getVar("SDK_PACKAGE_ARCHS"))
+                              self.d.getVar("SDK_PACKAGE_ARCHS"),
+                                ipk_repo_workdir=ipk_repo_workdir)
 
     def _populate_sysroot(self, pm, manifest):
         pkgs_to_install = manifest.parse_initial_manifest()
@@ -307,15 +313,21 @@ class DpkgSdk(Sdk):
         self.host_manifest = DpkgManifest(d, self.manifest_dir,
                                           Manifest.MANIFEST_TYPE_SDK_HOST)
 
+        deb_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            deb_repo_workdir = "oe-sdk-ext-repo"
+
         self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
                                 self.d.getVar("PACKAGE_ARCHS"),
                                 self.d.getVar("DPKG_ARCH"),
-                                self.target_conf_dir)
+                                self.target_conf_dir,
+                                deb_repo_workdir=deb_repo_workdir)
 
         self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
                               self.d.getVar("SDK_PACKAGE_ARCHS"),
                               self.d.getVar("DEB_SDK_ARCH"),
-                              self.host_conf_dir)
+                              self.host_conf_dir,
+                              deb_repo_workdir=deb_repo_workdir)
 
     def _copy_apt_dir_to(self, dst_dir):
         staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE")
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index afd5b8e75f6..1495f873210 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -22,13 +22,15 @@ def get_package_manager(d, root_path):
         pm = OpkgPM(d,
                     root_path,
                     d.getVar("IPKGCONF_TARGET"),
-                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"))
+                    d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),
+                    filterbydependencies=False)
 
     elif pkg_class == "deb":
         pm = DpkgPM(d,
                     root_path,
                     d.getVar('PACKAGE_ARCHS'),
-                    d.getVar('DPKG_ARCH'))
+                    d.getVar('DPKG_ARCH'),
+                    filterbydependencies=False)
 
     pm.write_index()
     pm.update()
-- 
2.17.1


