Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00D0C3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 11:00:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.33618.1721905215344118765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 04:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GRbA9ASv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso5979685e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721905213; x=1722510013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+xefumcbq6ycuKzlFzaAjpvdeBUP5SqDuAWEmpZsY=;
        b=GRbA9ASvPyCPdgIjwBKX0tya6CI5Ggz+ceFYGzyWfFQm16YN03v1VCmelAe8k+ax5J
         GcD4r4jv+W0ZEIjg9KLPFDYOt8AP954lds9kZByLe8OlKkgXjjlPdXPZ1SaXitSF/uWi
         3nlzlKDvTmDyC/qBWGabM7xt5S+OUNNEUGjmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721905213; x=1722510013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+xefumcbq6ycuKzlFzaAjpvdeBUP5SqDuAWEmpZsY=;
        b=NuFr3ODdqX9eXtM2FUdQA2j2GUG98HWr/hHFzZGVzVZ2XnLa6sCrXXmb6bTVER/+Dx
         8zoUwmmdw/8nV7NHOIbLnZgVOYqUoMQjHU09241RH8779fZ9Xdx6FERAjbpRWGVtojFK
         GU0t+k4VkEhIODXG5y9O8ThATgSdPyGgBZ67nDzMJjgr1SMK+5tyHKb366y8seRkXDXP
         DCsVn9Hi0Ul0JRTitIHo8vWJTla7+4Abl1hqSgjATEmWTDTi3zL+gqE9BNqDH83yV9q4
         WUKns1Ity4mxFJMerILKJRXrJc387XbmqqHUaAbYPUWyXhryES9IU7O99hH3dib4XKbJ
         vyhQ==
X-Gm-Message-State: AOJu0YwqzXns92zmNtx5X6cOhAp59ahu4jXC2mCfqNpS4jFPxBIyDwso
	qPZPprLIDxYqYyTvkn/mTk3CdfXkQnbrchEnnbXTBthibMsQaM9tJX8/py9CCCRqsTD57U+Jc77
	Av3Q=
X-Google-Smtp-Source: AGHT+IFkY2a3W5YKykFTNjk7zdU3haimVRNTwKXZElxkMEz9l5xdo5QwD3wywDTPx67ZH5v+gLcjhA==
X-Received: by 2002:a5d:5281:0:b0:368:669c:3bd9 with SMTP id ffacd0b85a97d-36b319e9a55mr1630671f8f.21.1721905212881;
        Thu, 25 Jul 2024 04:00:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:267:c2d:5abd:7ee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42808473208sm13267275e9.42.2024.07.25.04.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:00:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to fix tarball SPDX manifests
Date: Thu, 25 Jul 2024 12:00:11 +0100
Message-ID: <20240725110011.2344927-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 11:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202495

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
 .../create-spdx-image-3.0.bbclass             | 66 -----------------
 .../create-spdx-sdk-3.0.bbclass               | 72 +++++++++++++++++++
 meta/classes-recipe/populate_sdk_base.bbclass |  3 +
 meta/classes-recipe/testimage.bbclass         |  2 +-
 meta/classes/create-spdx-3.0.bbclass          |  1 +
 5 files changed, 77 insertions(+), 67 deletions(-)
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
index 61a8b5e3004..0e856b6da43 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+SDK_CLASSES ??= ""
+inherit_defer ${SDK_CLASSES}
+
 PACKAGES = ""
 
 # This exists as an optimization for SPDX processing to only run in image and
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 531330f3848..6877e0ee9d3 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -484,4 +484,4 @@ python () {
         bb.build.addtask("testimage", "do_build", "do_image_complete", d)
 }
 
-inherit testsdk
+SDK_CLASSES += "testsdk"
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 2eb44ba8089..c1241e58563 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -115,6 +115,7 @@ SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
 
 
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
+SDK_CLASSES += "create-spdx-sdk-3.0"
 
 oe.spdx30_tasks.set_timestamp_now[vardepsexclude] = "SPDX_INCLUDE_TIMESTAMPS"
 oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"

