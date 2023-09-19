Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43693CD54B2
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 10:53:01 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.5459.1695120771270552524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 03:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JVH+4N3K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bffe2840adso38462681fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695120769; x=1695725569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ+vKIva/b2WLbxglMi2NK8+VsJ7QD5tPFgw8/afw0Y=;
        b=JVH+4N3K+gT4+T8JPqw+rVSYrjDtbeuf729wjjHnkmmPRVBdiwmSmo4i3CkPTCuzxz
         X0Qvf/OVDbQxqW0Bdsy5tEINyRr0IfUaj3s2mSVZiu1msVDW0TcoU6odIGuDP51U1W/n
         Aou/Sejmo1ksYMt48qy4y6M5utPlmBl2YToII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120769; x=1695725569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ+vKIva/b2WLbxglMi2NK8+VsJ7QD5tPFgw8/afw0Y=;
        b=DhHirRiRJMDFrm/IHC1+QZFKNUgu/jHh275U2nOxRDivkG26te448px25K1npxbtyQ
         agmumXlusQbmKOjcdiShf0dSflxB2SF00DF7DkQSg4aKPbA/DC0qC5Gd/kg5psFa/pMX
         iMB6iXJHnL5r5XugT7RSwCKFbfmbjuLozcoUxxjqz1LV3UMU1loFDlwhtyw5W082anIC
         dzGbLHnqC98TwyR4yS8bBAUuS1khR7IP5NRm4CptxcWrIjHL/b/8oBQ6FhcbQZDhsIwm
         FoUx4AvPQDZeTJvIvRh0X7FQI877MQOWnMFD+w72P1nhC+Sg2XvfZlFtAKszGuJbut8g
         CMrw==
X-Gm-Message-State: AOJu0YxeUn0PAfApnOYZWxVivR7OZMeXnrVztYTf4EWbQX44rflUHjQW
	A6zxnURQvnZ9DV1bFBoaCq6/NpBxViVmOQ2eC3o=
X-Google-Smtp-Source: AGHT+IEIMfyUmqrdBMiUghNRbx0hhzzlKceTX5U2ju28vjc1dTwLeoi/Te1k0VM8v7XZvDpeUzCjSQ==
X-Received: by 2002:a05:6512:104e:b0:500:daec:280a with SMTP id c14-20020a056512104e00b00500daec280amr11249053lfb.2.1695120768691;
        Tue, 19 Sep 2023 03:52:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f50:2b60:4068:dda8])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fed70fb09dsm14903825wml.26.2023.09.19.03.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:52:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license/license_image: Fix license file layout to avoid overlapping files
Date: Tue, 19 Sep 2023 11:52:47 +0100
Message-Id: <20230919105247.819564-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 10:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187853

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
 meta/classes-recipe/license_image.bbclass | 35 ++++++++++++++++-------
 3 files changed, 26 insertions(+), 13 deletions(-)

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
index c63e6730ea1..69163f5b7ca 100644
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
index fc859c7c659..838e13803e4 100644
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
-- 
2.39.2


