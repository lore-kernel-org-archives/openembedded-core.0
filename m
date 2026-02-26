Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD67FD8FEC
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75804.1772127577096476130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NStkYOpw;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d4c7d04890so551548a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127576; x=1772732376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP0Wp9MniMcKfuYvIt2TNmTYjdil8nqBqroSCEaCiYo=;
        b=NStkYOpwVxQKjdqS53osI8AL3E3r6Rj7qcAOkPuyighAaWVURjVq0BYTNJ92ri5NFN
         /QT8xaVcBcxYWkC/AHXJFfgxnWQmwsvvr5QfvtS2trzOndikRisFD4K4vLSfTis0hxmx
         Np6fI/v4C0xX9mWYTMeS8oRT42baQ0drWBncRSsfxyCRiNljySK3btNr/8ksks8Tmte8
         Vk7kDs3xbrXJJNaWOEtelRSaS8UNX1aQB9/S0KAlkBJHaHjkD6IIxDr5rWOcU63V/smd
         Ze5dLQgIY40kEMI/B1cynPwzKNCVv9jQDfByCbi97A4fJOgoBLdP9DJo2kiRJgBYcMUR
         82Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127576; x=1772732376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZP0Wp9MniMcKfuYvIt2TNmTYjdil8nqBqroSCEaCiYo=;
        b=QWftGslsUrMoP3E1uJDdso4PCIIPdJ7KQ4inznrAyquMMhLBx87feh9fniXe8RH/0P
         wiIulm1RFmsqbVYAaO86LFOzwG47fQq5PVT70s1rw2dJDpF7enM67I68Tz9mG9/LQmnS
         0RiOaqvciWL4Bv5TEkFAot9u+V1CIF7LDmlGhnx7l3135FOV3ZUMvtmjsLcXDPDeoHRR
         a8ulRFemOFvgNhjyfjdUgE/n/LaihA/xOkLF+maI1j84FcGCR/sa6KAjcqjfqk34vXls
         w4/yXe4pGB1RLGTTtwOGar1WDfs4jnj/sVipq062rWsDNPWN8xD37TBtsIQnLOL/J7uD
         Bycg==
X-Gm-Message-State: AOJu0YwXRKOA5EdTvKs2EXKOaruF52KqiBGLNdriqeJQMcYWuHWOZjRN
	ymXOfGfb4qD3YVE9y3IhTQ0wvUcqV6FKWPkpvKfyxrQiRbP6wSsB8Abe8OmLhw==
X-Gm-Gg: ATEYQzw7MTatEePjRTz4FtODOEsQg1D4Acb1nd3K2EWtFJUXa1OPBNi0PZNUsFl64Qr
	MepvPkVILkbgWZ06SV3/P5gZv13QZX10XYrKuAHh1NYed2nKXyhqIBNDqOW6PD6p2/DmF6lk3+5
	IDLyxG+7aMJ2pikzEJOE04/3Qu0Uf4uPrckNyQoozauCNghUHScZSdpUiWT0vdFQ0iIQF4URLLf
	iTfrK4aDmigD5lf4Y08E66mhFD0DcI5jjUzZzQ5E0V/wkHBWjPypFNrkcQc6ymmSEh7/TfWWeer
	+JDNqTiUhmKpD6otyJknCAGqh4Cp1xfakvUiwvKI1RyPFNvKwdNXjrjpOsPChOHXrnhgM3biVJt
	+fMFFiLEQ32TgmgknkISnAyfFe9QW/JAboS16mJbjiw0SUoupZ56Lz0scJiWyY9d4XTNoPxsd1R
	h3Nhxb0I73GpDC1Pml0GcW
X-Received: by 2002:a05:6830:6201:b0:7c7:69c8:2d2 with SMTP id 46e09a7af769-7d591b324dbmr2695a34.13.1772127576135;
        Thu, 26 Feb 2026 09:39:36 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 4/8] spdx3: Add recipe SBoM task
Date: Thu, 26 Feb 2026 10:33:05 -0700
Message-ID: <20260226173930.2847872-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232050

Adds a task that will create the complete recipe-level SBoM for a given
target recipe, following all dependencies. For example:

```
bitbake -c create_recipe_sbom zstd
```

Would produce the complete recipe SBoM for the zstd recipe, include all
build time dependencies (recursively).

The complete SBoM for all (target) recipes can be built with:

```
bitbake -c create_recipe_sbom meta-world-recipe-sbom
```

Co-authored-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass          | 28 +++++++++++++++++++
 meta/classes/spdx-common.bbclass              |  1 +
 meta/lib/oe/spdx30_tasks.py                   | 10 +++++++
 .../meta/meta-world-recipe-sbom.bb            | 28 +++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c5f6462c5a..782aa2c52e 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -239,6 +239,34 @@ python do_create_package_spdx_setscene () {
 }
 addtask do_create_package_spdx_setscene
 
+addtask do_create_recipe_sbom after create_recipe_spdx
+python do_create_recipe_sbom() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+    deploydir = Path(d.getVar("SPDXRECIPESBOMDEPLOY"))
+    oe.spdx30_tasks.create_recipe_sbom(d, deploydir)
+}
+
+SSTATETASKS += "do_create_recipe_sbom"
+do_create_recipe_sbom[recrdeptask] = "do_create_recipe_spdx"
+do_create_recipe_sbom[nostamp] = "1"
+do_create_recipe_sbom[sstate-inputdirs] = "${SPDXRECIPESBOMDEPLOY}"
+do_create_recipe_sbom[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_create_recipe_sbom[file-checksums] += "${SPDX3_DEP_FILES}"
+do_create_recipe_sbom[cleandirs] = "${SPDXRECIPESBOMDEPLOY}"
+do_create_recipe_sbom[vardeps] += "\
+    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
+    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
+    SPDX_PROFILES \
+    SPDX_NAMESPACE_PREFIX \
+    SPDX_UUID_NAMESPACE \
+    "
+
+python do_create_recipe_sbom_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_recipe_sbom_setscene
+
 python spdx30_build_started_handler () {
     import oe.spdx30_tasks
     d = e.data.createCopy()
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 2804c27b0b..1ec4877a6a 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -25,6 +25,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 
 SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+SPDXRECIPESBOMDEPLOY = "${SPDXDIR}/recipes-bom-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8b4525e3d..9a312a870d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1564,3 +1564,13 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
+
+
+def create_recipe_sbom(d, deploydir):
+    sbom_name = d.getVar("PN") + "-recipe-sbom"
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
+
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
diff --git a/meta/recipes-core/meta/meta-world-recipe-sbom.bb b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
new file mode 100644
index 0000000000..5731e27c83
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Generates a combined SBoM for all world recipes"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit nopackages
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+
+do_prepare_recipe_sysroot[deptask] = ""
+
+WORLD_SBOM_EXCLUDE ?= ""
+
+EXCLUDE_FROM_WORLD = "1"
+
+python calculate_extra_depends() {
+    exclude = set('${WORLD_SBOM_EXCLUDE}'.split())
+    exclude |= set(f"{v}-{self_pn}" for v in '${MULTILIB_VARIANTS}'.split())
+    exclude.add(self_pn)
+
+    deps.extend(p for p in world_target if p not in exclude)
+}
-- 
2.53.0


