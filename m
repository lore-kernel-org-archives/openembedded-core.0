Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269A5C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 06:24:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.55802.1721975074828892563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 23:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZrIfODU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-369c609d0c7so1212536f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721975073; x=1722579873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEe7OB4xcixTnCC3he6GbMN43UuH8NGGrYSi7q6kI1k=;
        b=bZrIfODUob3LbOVhxJHwu6mU4HIJ4dOqZcwj0ZhzHEulCB6vKoayjAZanI9V+ooXNC
         eehcE894TGvwShOPC5xuM2U6mA+GkIdX0GvYDmbcLJAPTfVqxUWg0OZV+POELmh6puUW
         WKUskegUJgLVjmce4utK+A61wt7dr9NzcBQu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721975073; x=1722579873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEe7OB4xcixTnCC3he6GbMN43UuH8NGGrYSi7q6kI1k=;
        b=WUyX26mG427wiuRmeWWqTEn2iRxuX15liUT+CAHqawBsPOL7FZo4OyCNi9wyq8BPM1
         OgqqdCCuicPQRoNOkhap/ry9IiPvxWrU1zpk+TS4sfZdJ544y0mbf8BJt/2dzH18zty2
         78sFC9KMd5DnmFIVlyknnm+Lj9zLwu20BNX4WQClP4xi2wPFERyXKBEsCGdpavB15Pv8
         n78nnNvNZ+3vNRJqnS844Ku9U+FOBQdUNvSyvYM3W7pvby8CU7ye+edjPYtJOkydHG51
         A6Ii0didFGoEWp8o5luJCk0WVuHQo864IELCFzyY/o+z3Ba4Nc3VeqNauKx592IV2gz7
         JHtQ==
X-Gm-Message-State: AOJu0Ywv+a+VJ+ptSzpe607e05/BokDxdd8psRB93T5vaBG0+yslc0me
	VxBD9unDfNpQaI+TG1GXRcWj4who2cVK485lmxptnyiXPueQBVKikN1GiisO6Q8/KKAg6TGbLrQ
	bwUs=
X-Google-Smtp-Source: AGHT+IFxfJEAShVokbzqAJ5RKIte1Nwzkj6yEmESb6M2DI7+esB/l0/UjgOncwjkc95Ts/pSLaUaGA==
X-Received: by 2002:a5d:58c4:0:b0:366:f50a:2061 with SMTP id ffacd0b85a97d-36b3643f6a6mr3331642f8f.50.1721975072809;
        Thu, 25 Jul 2024 23:24:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:661a:1cbf:cf5:d3ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428054b9196sm62734965e9.0.2024.07.25.23.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 23:24:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to fix tarball SPDX manifests
Date: Fri, 26 Jul 2024 07:24:31 +0100
Message-ID: <20240726062431.2646434-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202515

Currently, "tarball" sdk based recipes don't generate SPDX manifests as they
don't include the rootfs generation classes. Split the SPDX 3.0 image class into
two so the SDK components can be included where needed.

To do this, introduce an SDK_CLASSES variable similar to IMAGE_CLASSES which
the SDK code can use.

Migrate testsdk usage to this.

Also move the image/sdk spdx classes to classes-recipe rather than the general classes
directory since they'd never be included on a global level.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2 - handle testsdk inherit using bb.utils.contains due to inherit_defer 
usage in both sites making v1 ineffective

 .../create-spdx-image-3.0.bbclass             | 66 -----------------
 .../create-spdx-sdk-3.0.bbclass               | 72 +++++++++++++++++++
 meta/classes-recipe/populate_sdk_base.bbclass |  3 +
 meta/classes-recipe/testimage.bbclass         |  2 -
 meta/classes/create-spdx-3.0.bbclass          |  1 +
 5 files changed, 76 insertions(+), 68 deletions(-)
 rename meta/{classes => classes-recipe}/create-spdx-image-3.0.bbclass (53%)
 create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass

diff --git a/meta/classes/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
similarity index 53%
rename from meta/classes/create-spdx-image-3.0.bbclass
rename to meta/classes-recipe/create-spdx-image-3.0.bbclass
index 1cad8537d14..fcae134d66e 100644
--- a/meta/classes/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -77,69 +77,3 @@ python do_create_image_sbom_spdx_setscene() {
     sstate_setscene(d)
 }
 addtask do_create_image_sbom_spdx_setscene
-
-do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
-do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
-do_populate_sdk[postfuncs] += "sdk_create_sbom"
-POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
-
-do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
-do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
-do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
-POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
-
-python sdk_host_create_spdx() {
-    from pathlib import Path
-    import oe.spdx30_tasks
-    spdx_work_dir = Path(d.getVar('SPDXSDKWORK'))
-
-    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNAME"))
-}
-
-python sdk_target_create_spdx() {
-    from pathlib import Path
-    import oe.spdx30_tasks
-    spdx_work_dir = Path(d.getVar('SPDXSDKWORK'))
-
-    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNAME"))
-}
-
-python sdk_ext_host_create_spdx() {
-    from pathlib import Path
-    import oe.spdx30_tasks
-    spdx_work_dir = Path(d.getVar('SPDXSDKEXTWORK'))
-
-    # TODO: This doesn't seem to work
-    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
-}
-
-python sdk_ext_target_create_spdx() {
-    from pathlib import Path
-    import oe.spdx30_tasks
-    spdx_work_dir = Path(d.getVar('SPDXSDKEXTWORK'))
-
-    # TODO: This doesn't seem to work
-    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
-}
-
-
-python sdk_create_sbom() {
-    from pathlib import Path
-    import oe.spdx30_tasks
-    sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
-    spdx_work_dir = Path(d.getVar('SPDXSDKWORK'))
-
-    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNAME"))
-}
-
-python sdk_ext_create_sbom() {
-    from pathlib import Path
-    import oe.spdx30_tasks
-    sdk_deploydir = Path(d.getVar("SDKEXTDEPLOYDIR"))
-    spdx_work_dir = Path(d.getVar('SPDXSDKEXTWORK'))
-
-    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
-}
-
diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
new file mode 100644
index 00000000000..ea01a21cc59
--- /dev/null
+++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
@@ -0,0 +1,72 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# SPDX SDK tasks
+
+do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
+do_populate_sdk[postfuncs] += "sdk_create_sbom"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
+
+do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
+do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
+
+python sdk_host_create_spdx() {
+    from pathlib import Path
+    import oe.spdx30_tasks
+    spdx_work_dir = Path(d.getVar('SPDXSDKWORK'))
+
+    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNAME"))
+}
+
+python sdk_target_create_spdx() {
+    from pathlib import Path
+    import oe.spdx30_tasks
+    spdx_work_dir = Path(d.getVar('SPDXSDKWORK'))
+
+    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNAME"))
+}
+
+python sdk_ext_host_create_spdx() {
+    from pathlib import Path
+    import oe.spdx30_tasks
+    spdx_work_dir = Path(d.getVar('SPDXSDKEXTWORK'))
+
+    # TODO: This doesn't seem to work
+    oe.spdx30_tasks.sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
+}
+
+python sdk_ext_target_create_spdx() {
+    from pathlib import Path
+    import oe.spdx30_tasks
+    spdx_work_dir = Path(d.getVar('SPDXSDKEXTWORK'))
+
+    # TODO: This doesn't seem to work
+    oe.spdx30_tasks.sdk_create_spdx(d, "target", spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
+}
+
+
+python sdk_create_sbom() {
+    from pathlib import Path
+    import oe.spdx30_tasks
+    sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
+    spdx_work_dir = Path(d.getVar('SPDXSDKWORK'))
+
+    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNAME"))
+}
+
+python sdk_ext_create_sbom() {
+    from pathlib import Path
+    import oe.spdx30_tasks
+    sdk_deploydir = Path(d.getVar("SDKEXTDEPLOYDIR"))
+    spdx_work_dir = Path(d.getVar('SPDXSDKEXTWORK'))
+
+    oe.spdx30_tasks.create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPUTNAME"))
+}
+
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 61a8b5e3004..50bb81cd049 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+SDK_CLASSES += "${@bb.utils.contains("IMAGE_CLASSES", "testimage", "testsdk", "", d)}"
+inherit_defer ${SDK_CLASSES}
+
 PACKAGES = ""
 
 # This exists as an optimization for SPDX processing to only run in image and
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 531330f3848..6d1e1a107a7 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -483,5 +483,3 @@ python () {
     if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
         bb.build.addtask("testimage", "do_build", "do_image_complete", d)
 }
-
-inherit testsdk
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 2eb44ba8089..c1241e58563 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -115,6 +115,7 @@ SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
 
 
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
+SDK_CLASSES += "create-spdx-sdk-3.0"
 
 oe.spdx30_tasks.set_timestamp_now[vardepsexclude] = "SPDX_INCLUDE_TIMESTAMPS"
 oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"

