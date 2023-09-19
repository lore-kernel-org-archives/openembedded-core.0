Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424D5CE79A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.22617.1695159985276521142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MKEIbaEB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3216ba1b01eso837299f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159983; x=1695764783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAnbdXaHah1ruKey2JGToMfh7fBQz2GVDoStz4MQTm0=;
        b=MKEIbaEBZ7UUX/faMl33CqvBhjoGFqlBhHzTrHbOseep4nTioRry5anTri+p5Tt9X3
         Vc0bHC/KiZCpocm+h9aXcCuQ+A+JA5MQQmRvmdN9hCJWprDmmzFRSugcuHknUFN35+na
         VoGpqTZg5ZMLOTq7RZ7h2b/QkPH8XcnqAzR9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159983; x=1695764783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAnbdXaHah1ruKey2JGToMfh7fBQz2GVDoStz4MQTm0=;
        b=u5J+FZhDa34cVYyBLMRoN09Tl7JiVsL11fY6PMG2xh8Gi/WKDxIKDFri9VsW0VS1ba
         Fly7NSANt7aepP4FVXadb2olVZ4ouLjHix6P2M0Q4M+3HD7xoGc2m9LuLAWjYQ93ITMN
         ZPWAmQD/OLnerLgeivuOCK8IHASdLfw7Xzy7B3SjKaxlzvK9uH27G/3sSaEhSwCS2M9i
         0aOzz6to/INpnK9z3BvCGG/nx+5rEPibzYNFCxhMGkJo+Kc1naJcipU810pue8WLtuYV
         p0QX8U9ILrlXFTNhnnSOVtqWpI43Wu68ejbo4uemu8nWscofBKJ3rowGjI0kRNmU+XwZ
         apJw==
X-Gm-Message-State: AOJu0Yx5UYpP6jBWiOZR9tAMbgB+jf6upF1rZ+85dmYEXDqpsQmEmvL2
	nRpx3gXR9BG4h+9dEmtbpHqTk6rKSE5eAXR7bws=
X-Google-Smtp-Source: AGHT+IFXi8nrdPGw8l4TEpYp9iHTEAd763n93wjVWTEfdvyxLo6fsgiOxAplj7Q/blWpDVWfFK7MFQ==
X-Received: by 2002:a5d:6a10:0:b0:31c:8880:5d0f with SMTP id m16-20020a5d6a10000000b0031c88805d0fmr762081wru.11.1695159982931;
        Tue, 19 Sep 2023 14:46:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] license/license_image: Fix license file layout to avoid overlapping files
Date: Tue, 19 Sep 2023 22:46:15 +0100
Message-Id: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187878

Currently DEPLOY_DIR/licenses is added to SSTATE_ALLOW_OVERLAP_FILES. This
leads to bugs since when one MACHINE_ARCH recipes is cleaned, it removes the
files for another which then results in later build failures as license files
disappear.

The solution is to include SSTAGE_PKGARCH in the path names to the license files.
That does mean a search has to be used to find the correct license files for a
given PN but that can be done via SSTATE_ARCHS.

The implication for other tools is the layout has changed so tools will need to
adapt to the new paths. The benefit is no more strange build failures such as from
patterns like:

MACHINE=qemux86-64 bitbake core-image-minimal
MACHINE=genericx86-64 bitbake core-image-minimal
MACHINE=qemux86-64 bitbake linux-yocto -c clean
MACHINE=genericx86-64 bitbake core-image-minimal -C rootfs

[YOCTO #14123]

For anyone finding this commit, I'd question how much people should be relying on
this code for tooling and suggest the SPDX manifests should be the preferred data
format going forward anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/license.bbclass       |  2 +-
 meta/classes-global/sstate.bbclass        |  2 --
 meta/classes-recipe/license_image.bbclass | 41 ++++++++++++++++-------
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 23625f0104f..b2e0d3fabaf 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -29,7 +29,7 @@ python do_populate_lic() {
     lic_files_paths = find_license_files(d)
 
     # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('PN'))
+    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('SSTATE_PKGARCH'), d.getVar('PN'))
     copy_license_files(lic_files_paths, destdir)
     info = get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index c50198449c2..706c2ae9388 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -55,8 +55,6 @@ PV[vardepvalue] = "${PV}"
 SSTATE_EXTRAPATH[vardepvalue] = ""
 SSTATE_EXTRAPATHWILDCARD[vardepvalue] = ""
 
-# For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
-SSTATE_ALLOW_OVERLAP_FILES = "${DEPLOY_DIR}/licenses/"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_ALLOW_OVERLAP_FILES += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 # sdk-provides-dummy-nativesdk and nativesdk-buildtools-perl-dummy overlap for different SDKMACHINE
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index fc859c7c659..b570a7d37c9 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -18,7 +18,7 @@ python() {
 
 python write_package_manifest() {
     # Get list of installed packages
-    license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
+    license_image_dir = d.expand('${LICENSE_DIRECTORY}/${SSTATE_PKGARCH}/${IMAGE_NAME}')
     bb.utils.mkdirhier(license_image_dir)
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
@@ -49,7 +49,7 @@ python license_create_manifest() {
             pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
 
     rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                        d.getVar('IMAGE_NAME'), 'license.manifest')
+                        d.getVar('SSTATE_PKGARCH'), d.getVar('IMAGE_NAME'), 'license.manifest')
     write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=True)
 }
 
@@ -98,9 +98,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES"])
 
             for lic in pkg_dic[pkg]["LICENSES"]:
-                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                        pkg_dic[pkg]["PN"], "generic_%s" % 
-                                        re.sub(r'\+', '', lic))
+                for pkgarch in d.getVar("SSTATE_ARCHS").split():
+                    lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                            pkgarch,
+                                            pkg_dic[pkg]["PN"], "generic_%s" %
+                                            re.sub(r'\+', '', lic))
+                    if os.path.exists(lic_file):
+                        break
                 # add explicity avoid of CLOSED license because isn't generic
                 if lic == "CLOSED":
                    continue
@@ -130,8 +134,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
             for pkg in sorted(pkg_dic):
                 pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
                 bb.utils.mkdirhier(pkg_rootfs_license_dir)
-                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                            pkg_dic[pkg]["PN"]) 
+                for pkgarch in d.getVar("SSTATE_ARCHS").split():
+                    pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                                   pkgarch, pkg_dic[pkg]["PN"])
+                    if os.path.exists(pkg_license_dir):
+                        break
+                if not os.path.exists(pkg_license_dir ):
+                    bb.fatal("Couldn't find license information for dependency %s" % pkg)
 
                 pkg_manifest_licenses = [canonical_license(d, lic) \
                         for lic in pkg_dic[pkg]["LICENSES"]]
@@ -183,7 +192,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                     os.lchown(p, 0, 0)
                     os.chmod(p, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
 
-
+write_license_files[vardepsexclude] = "SSTATE_ARCHS"
 
 def license_deployed_manifest(d):
     """
@@ -204,12 +213,18 @@ def license_deployed_manifest(d):
         man_dic[dep]["PN"] = dep
         man_dic[dep]["FILES"] = \
             " ".join(get_deployed_files(dep_dic[dep]))
-        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
+        for pkgarch in d.getVar("SSTATE_ARCHS").split():
+            licfile = os.path.join(lic_dir, pkgarch, dep, "recipeinfo")
+            if os.path.exists(licfile):
+                break
+        if not os.path.exists(licfile):
+            bb.fatal("Couldn't find license information for dependency %s" % dep)
+        with open(licfile, "r") as f:
             for line in f.readlines():
                 key,val = line.split(": ", 1)
                 man_dic[dep][key] = val[:-1]
 
-    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'), d.getVar('SSTATE_PKGARCH'),
                                     d.getVar('IMAGE_NAME'))
     bb.utils.mkdirhier(lic_manifest_dir)
     image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
@@ -217,7 +232,7 @@ def license_deployed_manifest(d):
 
     link_name = d.getVar('IMAGE_LINK_NAME')
     if link_name:
-        lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+        lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'), d.getVar('SSTATE_PKGARCH'),
                                     link_name)
         # remove old symlink
         if os.path.islink(lic_manifest_symlink_dir):
@@ -227,6 +242,8 @@ def license_deployed_manifest(d):
         if lic_manifest_dir != lic_manifest_symlink_dir:
             os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
 
+license_deployed_manifest[vardepsexclude] = "SSTATE_ARCHS"
+
 def get_deployed_dependencies(d):
     """
     Get all the deployed dependencies of an image
@@ -255,7 +272,7 @@ def get_deployed_dependencies(d):
                 break
 
     return deploy
-get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
+get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA SSTATE_ARCHS"
 
 def get_deployed_files(man_file):
     """
-- 
2.39.2


