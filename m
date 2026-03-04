Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E8EEF901E
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:47 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22976.1772642921686010018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUusxu6i;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40438e0cba6so1474095fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642921; x=1773247721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AODhThGJ5yZROpI3OOikCCsiX15Pqojv0hH5uqF+es=;
        b=ZUusxu6ifPjoKqu7kRLk/SKN/CQnHC4Okj9I1lSqcuH2Wh4wM2hUhj62IrpM7xoiZp
         PghW2zOf993Qud8T6kh9+A0RyF4pUNMhSim+ZvBYr9oyJvNObKnbWwIQqK0XK1gAs/q6
         o+aYykrngH7o3T2GnUxuVQlBTcqBLdEuA/xrUdwffkXbZ8ix0vLDWcgzwywGY8Hip9ar
         CtORD0O8nGRPIavz5PSuUHgAAAajCm7X30QOmm7tAvh3A4QrRx93dXTliYwcd5T89WbV
         VNICsE+UOdUL6egXohCTdorIeDsf7FAyycQDvFbLXmNWu5BkmiTnLZf3OGZgAkudraTj
         In5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642921; x=1773247721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AODhThGJ5yZROpI3OOikCCsiX15Pqojv0hH5uqF+es=;
        b=g1YX3jR0VWkGO9E6M0LfpIVJ+U22rc+iXityprHrtliM4uaNEgxS/UbA037z4ifXp7
         HfV2J6fvpeeb0tpqGTfPBc+im0sPLW2WwmZWmeCOJ33gneY0gPCfkAeHADChF7PCeW5W
         3V42K8j1e7D1B0Hs/BttpRi+3q3Vby09yl1C9i+Tatrpd80j22RcTzbbD3Gv9OZpeRHl
         IM1okbXSg3wL4WwWyrpF0FVnxFZDwK0dFB3Tgl96dNjmywVyiMoaaOuN3E7jcO58wiBP
         I28PX0wPBmqSLg+ZnBJbCpBPTbSmIYXTneTe9yRUM30MXNN43cg6k5XyfrVKtyqMtDIK
         pxHQ==
X-Gm-Message-State: AOJu0YxLc7Uz8zQjIm3r8rxlK8tZnZaZD5GeVt2AkAWq9Rzn5ZL5WFjK
	OsgP2gl3hjH3Hs6gk+RlhndFhNDSBZGIuZCcZiXAGz/UuprEyKiWjEg9z+jW9A==
X-Gm-Gg: ATEYQzwBugR7qJqNvHdpv4bWSSA0XGXJyUxaCehnlsgaAxEG5kdofi/UUqhmFZ9bHFs
	Iv99PsIjQKyeOmSgC5RztyVE+YT0K2OMIjU9KJrTrZHgqd/lxZOuuz3vBgFQoRfajZYCo3pq7WH
	gtMmas8zadlruYMuMGBIefEqFtdPs07KY7OZbWXfoAcjhwdrwC5DvC3tekJt/y3WqDcEjkabcEy
	qStvGDUC7x1Zwvu7hEjzQG2i6scufooQA2a2fwLIGccrBWuOEz4er15DLqdEWwFpLMMr2lUlpS8
	Aula7Ei1GPUUNoifgIdVu/nxlpcCbmBw1mhspfrDCr3tiLjvjjcC4bz1x5ZltKbRA4VErK3G19F
	Cr1rW9wZJ8/G90U4bBpI9CEzZUjfDTcXnX6yHosPamuKkv4YbEvdLFsOiZTCLI4+xtB/nmxZs4b
	WgCg3ztO0SsBcVLdaG+qBT
X-Received: by 2002:a05:6871:a981:b0:40e:e0b2:e375 with SMTP id 586e51a60fabf-416aba5c9d2mr1543601fac.31.1772642920476;
        Wed, 04 Mar 2026 08:48:40 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 04/13] spdx3: Add recipe SBoM task
Date: Wed,  4 Mar 2026 09:44:15 -0700
Message-ID: <20260304164835.3072507-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232393

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

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass          | 32 +++++++++++++++++++
 meta/classes/spdx-common.bbclass              |  1 +
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oe/spdx30_tasks.py                   | 10 ++++++
 meta/lib/oeqa/selftest/cases/spdx.py          | 10 ++++++
 .../meta/meta-world-recipe-sbom.bb            | 29 +++++++++++++++++
 6 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 672ca27cd0..c3ea95b8bc 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -142,6 +142,10 @@ SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
     Override this variable to replace the default, otherwise append or prepend \
     to add additional purls."
 
+SPDX_RECIPE_SBOM_NAME ?= "${PN}-recipe-sbom"
+SPDX_RECIPE_SBOM_NAME[doc] = "The name of output recipe SBoM when using \
+    create_recipe_sbom"
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
@@ -240,6 +244,34 @@ python do_create_package_spdx_setscene () {
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
index 3c239a718b..abf2332bee 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -25,6 +25,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 
 SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+SPDXRECIPESBOMDEPLOY = "${SPDXDIR}/recipes-bom-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b5ab35d92a..5bea863798 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -532,6 +532,7 @@ RECIPE_MAINTAINER:pn-meta-go-toolchain = "Richard Purdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-meta-ide-support = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-world-pkgdata = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-meta-world-recipe-sbom = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-mini-x-session = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-minicom = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8b4525e3d..b6c917045e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1564,3 +1564,13 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
+
+
+def create_recipe_sbom(d, deploydir):
+    sbom_name = d.getVar("SPDX_RECIPE_SBOM_NAME")
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
+
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 759ca86b73..efee0214fc 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -151,6 +151,16 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
         )
 
+    def test_world_sbom(self):
+        objset = self.check_recipe_spdx(
+            "meta-world-recipe-sbom",
+            "{DEPLOY_DIR_IMAGE}/world-recipe-sbom.spdx.json",
+            task="create_recipe_sbom",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
     def test_gcc_include_source(self):
         objset = self.check_recipe_spdx(
             "gcc",
diff --git a/meta/recipes-core/meta/meta-world-recipe-sbom.bb b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
new file mode 100644
index 0000000000..b47a3229c9
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
@@ -0,0 +1,29 @@
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
+SPDX_RECIPE_SBOM_NAME = "world-recipe-sbom"
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


