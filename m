Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AF3C52D72
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:41 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.30097.1722791379925534040
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nKCo2FtI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso8443749b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791379; x=1723396179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtRvxK9eHW1trUtssjiTrCYI6K5Fv4uXzUC64P1M0cw=;
        b=nKCo2FtIwZwQslsE85k2J0PhglOxoDqrrj+kc/EZLQr59nRsMESb6SyMJH5vs9/MUT
         QdEufLHecfvpCzM6IyoL0crBh46rThOznu7fShxZs8LtrtM+qBB2qH7hrIQXo6Ecui6x
         znct1AUDemCaEehW5kxefy80V3rIb4sdDUx2o7q+abqJPF0Cuc8Gx9vz3YiPeYgr/rZc
         oCI3sJX3Ic9IcUaGfOZWOykWMQs5AU7CN9Vdm51fiTFL8uzCYXZA9HdtjHLpbhC8MxBU
         RZQ2msjONcT8U6X307MLKSaW/D74IHg8grIUJAH0bRSYekT5mCFgCXGCDtYkClymHNXH
         xxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791379; x=1723396179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtRvxK9eHW1trUtssjiTrCYI6K5Fv4uXzUC64P1M0cw=;
        b=oigNi8VF/L0C0M6KAb0TRHyHGbd7ROGYVRRjJ6ZI+TuM3TxruS+AUQ5W13d1BAhji3
         O1kLsiYwarZixcSozpSknXjCBafAuQ+QnxgCT1jDVk008sI+JZjM1Vzc2y2osFaEqZob
         YB1YtmT4RQrisrojxbDm5x0Erng/nGf7NQlpUOUfP8PIrH5PLTZ4sGYhZyvh6grhecpb
         A0D+U/sDY61pfc8fmHtGKNdMHhB7HFaMqU2ZnFtlqOQaZ1d50TgToVq+hxHLK61qNGQx
         pL4f1V4hiNZP7yyLu2sH/qSgJCAVVudJTkoHH3s9XLl06uoRVOqGNnv2jn/6PQeRpZKn
         hy1g==
X-Gm-Message-State: AOJu0Yxc24nr/vrxGg4LHOqVGd357UhK+kvFolzIoi4nsY9/VTzRgSyp
	xmdYxwh1UGpjgCXGhWLROVYwlMFKAm97m5/REw4yVByzDB2InVGiA2tTCo3e990Kv+/4/VeVkmo
	racfp/A==
X-Google-Smtp-Source: AGHT+IFuD/C3JaRheQ9IBqCdqyL29uz0mmFic+rEj7xsp9LyrdPArBJuhqhfj5tL7sdeu/7Pf8ZB9Q==
X-Received: by 2002:a05:6a00:858f:b0:70d:14d1:1bb7 with SMTP id d2e1a72fcca58-7106d0466b0mr11507005b3a.28.1722791378958;
        Sun, 04 Aug 2024 10:09:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/18] create-spdx-*: Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS
Date: Sun,  4 Aug 2024 10:09:12 -0700
Message-Id: <5c1ce317fff6df6818f72d93197e5ec59ad4c462.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202968

From: Mark Hatle <mark.hatle@amd.com>

When a create-spdx-* classes is processing documents, it needs to
find the document in a path that is related to the SSTATE_ARCH
when a packge is generated.  The SSTATE_ARCH can be affected by
multilib configurations, resulting is something like armv8a-mlib.

When the image (or SDK) is being generated and the components are
collected, the system has no knowledge of the multilib arch and
will fail to find it, such as:

  ERROR: meta-toolchain-1.0-r0 do_populate_sdk: No SPDX file found
   for package libilp32-libgcc-dbg,
   False sstate:libilp32-libgcc:armv8a-ilp32-mllibilp32-elf:14.1.0:r0:armv8a-ilp32:12:
   sstate:libilp32-libgcc::14.1.0:r0::12:

Adding in the new SPDX_MULTILIB_SSTATE_ARCHS will provide a full
set of SSTATE_ARCHS including ones that contain the multilib
extension which will allow create-spdx-* to correctly find the
document it is looking for.  This would also be valuable to any
other function doing a similar search through SSTATE_ARCH that may
have been extended with multilib configurations.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit f1499c36c1054fc90f7b7268cc95285f2eca72f7)

spdx-3.0 items are not application and were removed.

spdx-common.bbclass item was moved into create-sdpx-2.2.bbclass.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass |  4 ++++
 meta/classes/create-spdx-2.2.bbclass          | 14 ++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 81896d808f..6cb43ade30 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -6,6 +6,10 @@
 
 PACKAGES = ""
 
+# This exists as an optimization for SPDX processing to only run in image and
+# SDK processing context.  This class happens to be common to these usages.
+SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
+
 inherit image-postinst-intercepts image-artifact-names
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 4ea91f6499..d104668ffd 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -35,6 +35,8 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
+SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
+
 SPDX_ORG ??= "OpenEmbedded ()"
 SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
 SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
@@ -349,7 +351,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     dep_recipes = []
@@ -389,7 +391,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
-collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
+collect_dep_recipes[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -763,7 +765,7 @@ python do_create_runtime_spdx() {
 
     providers = collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     if not is_native:
@@ -869,7 +871,7 @@ python do_create_runtime_spdx() {
             oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SPDX_MULTILIB_SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -1004,7 +1006,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = collect_package_providers(d)
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
@@ -1155,4 +1157,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
             tar.addfile(info, fileobj=index_str)
 
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SPDX_MULTILIB_SSTATE_ARCHS"
-- 
2.34.1


