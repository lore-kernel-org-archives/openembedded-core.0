Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31405E83076
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:02:24 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13238.1770112936009857106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a4xMeHvS;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dd22b9895so802584e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770112934; x=1770717734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=31TNJ4/K2WgjURK1rDsu8o1s5mYx8usZmHh1t/ZVQ14=;
        b=a4xMeHvSpNjPsumDcuH3aLoQ6pdxL+w0HdznbPUxog9QfPsvbsSx5OX/LX3sxgEuFW
         V7g1CJzcct3OzuarChmHQQF+L+O68H2H8pAaLx6HxL1PkcIw7PXmusckMj9OjoHcWieX
         TEpWxEPJ4i3ZfXkIkqEs2iHL54R/ye2A2zeCEzOkH/I11doDqeKMLpq7dWL1d78oFEKK
         KAK8N9sOgbUnsPbTWP9lKo5/oca+ttiQUSs3QC5fEwQsb0YFIXyELLETsau3gDBA8bLj
         yuFrk/xF3wN+ZeItMnEfkTuz3N3EDlVdh/RrOyW/QNUo+yxArxSbCQ/n4v9TbBSz2FFn
         QFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112934; x=1770717734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31TNJ4/K2WgjURK1rDsu8o1s5mYx8usZmHh1t/ZVQ14=;
        b=mguIFFLPdG2xUFO14zN17Q7L+9Iw2m+stUksmHfiNocq3YTM9l+1GL7AFS2ZRfkq6A
         PCf+aj1wrIDTFB/mhFN8juog4uokR+1g6InzZnpK/y2Oxk1sfWA6S8rGxN0i4ZIStE57
         7AzZYUj5ogahTh/3xjueDWM1flXQko7h//OvxxVpyf6+xxgj7YeUJ3DJmJkJiw34pr06
         Fa3EvjFTUitZFUHXn3ZIhmNEcTgZ2ckMtpmW2IR3biSd2udQZzn9qFpBf+JulpEh7WwW
         fInidjZdaqL6majGqLOnkqgogOcLW4ickEEeY0JzLXNg0IHl/fhUTBPrYMkZEGhpVQKS
         A0nA==
X-Gm-Message-State: AOJu0YwdSMpsAAwb3DqDkENfbWDDtNxjg+hWUfGlgUZLmThFxB5J0FC9
	ClWJ8txL31d46MOsB8cTsuDBp5uASzkF8qqIN7cChQt7y8nxBmMf40CMKFtwYw==
X-Gm-Gg: AZuq6aLaVwAJ5dlIbvrbUnGgYUFVe1IH4EkOp3rSJV/eF/a0cGFdxIUtnxBt0TEEJH1
	anfL2X7bTMtj4xXOBbbxqZxtTFMtCOVGmpnZR6vcmwamM53x9iXGrqyH7/gVQD6OZf3/xZp9nn0
	4lZ7iGQboHoDDUYQA/fDVlcsKz2xUznMaGJLrkzx//lH0mMvrtyw57HJmuYdv4THMVx4SpHIyvy
	uhgLWZQxmWN60kT+AhqtC6gJA4R87gCn38A0rn5DnLIOeyEtKtiQZrfMHvSsCJMUyx2OyhbhHVM
	QNzffQ6EsII/O3/WY3NEHRUJx5j3ga9FEdrT6eYZW2ixQnUVqCJaZG7nTh94o+yOPcreFgViSQa
	Ezw4Kx9Y/b/j1bxOt87D2ZDvMK2hxRD0vrcMFDxIqp/uK/mcc+SQDsSVE46BVY4UIt4nT7kVmwF
	hVkO+mOVLpEEsC60oTFqbpq9DHl8/xtjp1gP+ohHOsZvtpmbtXlJwHqSgjWS1oHwU=
X-Received: by 2002:a05:6512:3ba2:b0:59e:355:af8b with SMTP id 2adb3069b0e04-59e316eac2cmr809531e87.15.1770112933558;
        Tue, 03 Feb 2026 02:02:13 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07488749sm3973272e87.23.2026.02.03.02.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:02:13 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license_image: extend to SDK coverage
Date: Tue,  3 Feb 2026 10:01:54 +0000
Message-ID: <20260203100154.2218102-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230425

Extend the license_image.bbclass to create package and license
manifests for the SDK host and target sysroots and copy common
licenses to the sdk.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/classes-recipe/license_image.bbclass | 66 +++++++++++++++++++++--
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index d2c5ab902c..8332905da5 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
+ROOTFS_LICENSE_DIR = "/usr/share/common-licenses"
 
 # This requires LICENSE_CREATE_PACKAGE=1 to work too
 COMPLEMENTARY_GLOB[lic-pkgs] = "*-lic"
@@ -16,6 +16,26 @@ python() {
             bb.error("'lic-pkgs' in IMAGE_FEATURES but LICENSE_CREATE_PACKAGE not enabled to generate -lic packages")
 }
 
+python write_sdk_host_package_manifest() {
+    write_sdk_package_manifest(d, 'host')
+}
+python write_sdk_target_package_manifest() {
+    write_sdk_package_manifest(d, 'target')
+}
+
+def write_sdk_package_manifest(d, sysroot):
+    # Get list of installed packages
+    license_sdk_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+        d.getVar('SSTATE_PKGARCH'), d.getVar('SDK_NAME'), sysroot)
+    bb.utils.mkdirhier(license_sdk_dir)
+    from oe.sdk import sdk_list_installed_packages
+    from oe.utils import format_pkg_list
+
+    pkgs = sdk_list_installed_packages(d, sysroot == 'target')
+    output = format_pkg_list(pkgs)
+    with open(os.path.join(license_sdk_dir, 'package.manifest'), "w+") as package_manifest:
+        package_manifest.write(output)
+
 python write_package_manifest() {
     # Get list of installed packages
     license_image_dir = d.expand('${LICENSE_DIRECTORY}/${SSTATE_PKGARCH}/${IMAGE_NAME}')
@@ -29,6 +49,40 @@ python write_package_manifest() {
         package_manifest.write(output)
 }
 
+python license_create_sdk_host_manifest() {
+    pkgdata_dir = d.getVar('PKGDATA_DIR_SDK')
+    rootfs = d.expand('${SDK_OUTPUT}/${SDKPATHNATIVE}')
+    license_create_sdk_manifest(d, 'host', pkgdata_dir, rootfs)
+}
+python license_create_sdk_target_manifest() {
+    pkgdata_dir = d.getVar('PKGDATA_DIR')
+    rootfs = d.expand('${SDK_OUTPUT}/${SDKTARGETSYSROOT}')
+    license_create_sdk_manifest(d, 'target', pkgdata_dir, rootfs)
+}
+
+def license_create_sdk_manifest(d, sysroot, pkgdata_dir, rootfs):
+    import oe.packagedata
+    from oe.sdk import sdk_list_installed_packages
+
+    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS')
+    if build_images_from_feeds == "1":
+        return 0
+
+    pkg_dic = {}
+    for pkg in sorted(sdk_list_installed_packages(d, sysroot == 'target')):
+        pkg_info = os.path.join(pkgdata_dir,
+                                'runtime-reverse', pkg)
+        pkg_name = os.path.basename(os.readlink(pkg_info))
+
+        pkg_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
+        if not "LICENSE" in pkg_dic[pkg_name].keys():
+            pkg_lic_name = "LICENSE:" + pkg_name
+            pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
+
+    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                        d.getVar('SSTATE_PKGARCH'), d.getVar('SDK_NAME'), sysroot, 'license.manifest')
+    write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs)
+
 python license_create_manifest() {
     import oe.packagedata
     from oe.rootfs import image_list_installed_packages
@@ -50,10 +104,11 @@ python license_create_manifest() {
 
     rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                         d.getVar('SSTATE_PKGARCH'), d.getVar('IMAGE_NAME'), 'license.manifest')
-    write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=True)
+    rootfs = d.getVar('IMAGE_ROOTFS')
+    write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs)
 }
 
-def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
+def write_license_files(d, license_manifest, pkg_dic, rootfs):
     import re
     import stat
 
@@ -125,7 +180,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
     copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
     if rootfs and copy_lic_manifest == "1":
-        rootfs_license_dir = d.getVar('ROOTFS_LICENSE_DIR')
+        rootfs_license_dir = rootfs + d.getVar('ROOTFS_LICENSE_DIR')
         bb.utils.mkdirhier(rootfs_license_dir)
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
                 os.path.split(license_manifest)[1])
@@ -295,7 +350,10 @@ def get_deployed_files(man_file):
     return dep_files
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "write_package_manifest license_create_manifest "
+POPULATE_SDK_POST_HOST_COMMAND:prepend = "write_sdk_host_package_manifest license_create_sdk_host_manifest "
+POPULATE_SDK_POST_TARGET_COMMAND:prepend = "write_sdk_target_package_manifest license_create_sdk_target_manifest "
 do_rootfs[recrdeptask] += "do_populate_lic"
+do_populate_sdk[recrdeptask] += "do_populate_lic"
 
 python do_populate_lic_deploy() {
     license_deployed_manifest(d)
-- 
2.43.0


