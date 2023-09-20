Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B136CE79CA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.35158.1695207485601880291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZkdpiPXQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5978868f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695207484; x=1695812284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=apgn/GOOO0fzJtzOTS+6hQroxIEDPV6LTI8uRRCOqf8=;
        b=ZkdpiPXQf2KHJsbBxWdHIOxscW3MjPVB3uekJtHIcWKyFHWth0ibrTU3ViX86HDm4a
         djWiSDtU9rdqFyDC3ipeFvmSavmtwsprWKwnnW/VD5IZgNwao6xsU9iyGF0IScWMLiM3
         h1fwn4G8obyKlTDtXV269beBzh+tl9sYTbywQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207484; x=1695812284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apgn/GOOO0fzJtzOTS+6hQroxIEDPV6LTI8uRRCOqf8=;
        b=B3aYhNDby9RtsD52vzOzYUkXSKihnEBs17Zrx/fa8AqEfoYPajmBsCK2qyyD/BFtIp
         GPK6HIg0m41/bQ9f/47Ot3gaGYZp6dIXCZEOzIlscFe9/Huic5v7tnfGY+k2alNMJT7g
         LS9GVPWewjKOZULZI/VlpEl9QmWix455mGUhbbPfLxhJIzEyUsbCQ+NIEMmcR6hnJTuO
         O97tVmo1k/sEc+4QQN7wyoW7gHUMmgh8o0+9Ys1dVeHB5i7EUFotmBgnMYq+QMglfggO
         0ki1mg0A0AJPlRGEVhkOHAl1DHMM5dCv4L62ZNPy20fvKEZaQJGxA+IQYhhu7UYfMrYT
         eBxg==
X-Gm-Message-State: AOJu0YwYjlJJRXPwNQxfsXoLF8mH70sKMe1YOV7ORyP2jsPLN9Ug9YUl
	UzGAC9/HY0/FQXC/rlJkWy+jz7LaThbB+GdqDsM=
X-Google-Smtp-Source: AGHT+IGi9GE7tNCwo2sziteOMxLw0hZxZMB66ghan8pZ8YONCzp1ot/vhXeo47KpFdnrgzUUnCqZaA==
X-Received: by 2002:a5d:68c6:0:b0:31c:4c68:e73a with SMTP id p6-20020a5d68c6000000b0031c4c68e73amr1916169wrw.66.1695207483253;
        Wed, 20 Sep 2023 03:58:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm426636wrm.93.2023.09.20.03.58.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:58:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6 v2] license/license_image: Fix license file layout to avoid overlapping files
Date: Wed, 20 Sep 2023 11:57:57 +0100
Message-Id: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187917

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
 meta/classes-global/sstate.bbclass        |  2 -
 meta/classes-recipe/license_image.bbclass | 46 +++++++++++++++++------
 3 files changed, 35 insertions(+), 15 deletions(-)

v2 - use reversed order of SSTATE_ARCHS

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
index fc859c7c659..19b3dc55ba2 100644
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
 
@@ -59,6 +59,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+    pkgarchs = d.getVar("SSTATE_ARCHS").split()
+    pkgarchs.reverse()
 
     exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
     with open(license_manifest, "w") as license_file:
@@ -98,9 +100,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES"])
 
             for lic in pkg_dic[pkg]["LICENSES"]:
-                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                        pkg_dic[pkg]["PN"], "generic_%s" % 
-                                        re.sub(r'\+', '', lic))
+                for pkgarch in pkgarchs:
+                    lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                            pkgarch,
+                                            pkg_dic[pkg]["PN"], "generic_%s" %
+                                            re.sub(r'\+', '', lic))
+                    if os.path.exists(lic_file):
+                        break
                 # add explicity avoid of CLOSED license because isn't generic
                 if lic == "CLOSED":
                    continue
@@ -130,8 +136,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
             for pkg in sorted(pkg_dic):
                 pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
                 bb.utils.mkdirhier(pkg_rootfs_license_dir)
-                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                            pkg_dic[pkg]["PN"]) 
+                for pkgarch in pkgarchs:
+                    pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                                   pkgarch, pkg_dic[pkg]["PN"])
+                    if os.path.exists(pkg_license_dir):
+                        break
+                if not os.path.exists(pkg_license_dir ):
+                    bb.fatal("Couldn't find license information for dependency %s" % pkg)
 
                 pkg_manifest_licenses = [canonical_license(d, lic) \
                         for lic in pkg_dic[pkg]["LICENSES"]]
@@ -183,7 +194,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                     os.lchown(p, 0, 0)
                     os.chmod(p, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
 
-
+write_license_files[vardepsexclude] = "SSTATE_ARCHS"
 
 def license_deployed_manifest(d):
     """
@@ -195,6 +206,8 @@ def license_deployed_manifest(d):
     dep_dic = {}
     man_dic = {}
     lic_dir = d.getVar("LICENSE_DIRECTORY")
+    pkgarchs = d.getVar("SSTATE_ARCHS").split()
+    pkgarchs.reverse()
 
     dep_dic = get_deployed_dependencies(d)
     for dep in dep_dic.keys():
@@ -204,12 +217,19 @@ def license_deployed_manifest(d):
         man_dic[dep]["PN"] = dep
         man_dic[dep]["FILES"] = \
             " ".join(get_deployed_files(dep_dic[dep]))
-        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
+
+        for pkgarch in pkgarchs:
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
@@ -217,7 +237,7 @@ def license_deployed_manifest(d):
 
     link_name = d.getVar('IMAGE_LINK_NAME')
     if link_name:
-        lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+        lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'), d.getVar('SSTATE_PKGARCH'),
                                     link_name)
         # remove old symlink
         if os.path.islink(lic_manifest_symlink_dir):
@@ -227,6 +247,8 @@ def license_deployed_manifest(d):
         if lic_manifest_dir != lic_manifest_symlink_dir:
             os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
 
+license_deployed_manifest[vardepsexclude] = "SSTATE_ARCHS"
+
 def get_deployed_dependencies(d):
     """
     Get all the deployed dependencies of an image
@@ -255,7 +277,7 @@ def get_deployed_dependencies(d):
                 break
 
     return deploy
-get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
+get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA SSTATE_ARCHS"
 
 def get_deployed_files(man_file):
     """
-- 
2.39.2


