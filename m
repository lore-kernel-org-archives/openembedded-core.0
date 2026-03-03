Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5F5EB3647
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7688.1772498758133687117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JlGwoM8v;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4638a18efc2so3795492b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498757; x=1773103557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AODhThGJ5yZROpI3OOikCCsiX15Pqojv0hH5uqF+es=;
        b=JlGwoM8vC8hF9o3eAf8oCsaJpiOowwe5Th+lwpvxIbUzFHMJu33pBOqRumCmgwpETo
         /8X71/VzxrbGUH+MGxLrucxpb5wMvRZ4PSbOFWZSrtku9vI/Rn52TcQPNRCEvotQT0RC
         vBnZ5o64W2Q8fYL5YkShHVBQxO3GA4DD+PD8t33en8OFsmNi9j3xaFMk0j1LHCjNaRB7
         +8NtVuWlVWV/oHmcedCgF4Eb3thtDNrYHv/pzr6rRavc+q9s2Zd9jyUIIujtDbl7Jeio
         7uBCHOdq8d6fpnIjn0wGE5GVjX25axgEXbVcsYEDRHT+1oZE+fXkd+q8aV/1nyKNcZeR
         EjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498757; x=1773103557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AODhThGJ5yZROpI3OOikCCsiX15Pqojv0hH5uqF+es=;
        b=HF+CMHxAftCnVFNZdASuqAKJ1ZIUN1sf5n8Xsz1O9T4Et3RZlYPgqrZp0DtCiB4F1j
         j/ms2mYIqqozYpys0rRcJUN+KLyQZqmIlCNBD/BHA83Onj6WrsjbBuGXzRGCYrT419hQ
         y1URYMwt4Gj4NwzpIm+8oKACw63CQ2I0+GHDySuMEaQJHirvreqtWSfAy2MYYdS/E0KF
         fDiFKcuvjW0Qxz3oIibVMjLuK9c+KjG0RZwKzsXpzFHAT4kopq8xm3um0CHg1bEiTUL7
         TogN2Cmfymt4mphZvTe845XIKajoUTnIwn8kI2xA7bWRHW0ROVgLQm2F+l6fGTsiv3Nj
         buYw==
X-Gm-Message-State: AOJu0YxqDeQ3Ru0b9//rS3umqd3bQrj9VZlUVYmRhFcV72K/WYRUjHly
	cXkXbWiXZHSoceAQ+ummGxD0b5kvYARh7qxbdBxGO8HLQelJNALz4siw/CPszQ==
X-Gm-Gg: ATEYQzzO5LyGG5qmMbbd1X2JaqSxmz2bPwggjheGobcJNvgCMleoULORo1nrhz5lh7j
	YDmpZ/TuwFrBhCagmHxgtYtbiPHNlWQNgNmcNBkJgOYlutii0+fMyDBqU+ftpOqJz0pFNrW2fuv
	HdW0tJzrbtatjRVRu2B+h3/xvT0x5bksmgI8m9ct9PnB9X3H51RB2d/zK2982X+9KuTNmT5zM9x
	gNC/2Nnt8jXku+mIb1k4U4h57m8Z1I45lma4wwFdO3GvIrB6jsJ9GeTxtP6qSR1wgWc9sDz1MHF
	QUK7dthR8QQVGsQzobdlBnNenbV/svZUr9GG6KtWYEJWTkF+Ck39d4nIqdA8vwg6nZprOZcwauu
	4cN3rA40HV0RaAyY9+0pK8wlj0xE0ZFCDzDXnUF8WHjufI2sydq3DCCgvaA/WLWShQ+UfnKK3Ua
	SDV+5S5pyQFP3cPSJmOdCc5Tk/GwG2fjg=
X-Received: by 2002:a05:6808:e8b:b0:462:d1c1:6de2 with SMTP id 5614622812f47-464be9e125bmr7527336b6e.26.1772498757251;
        Mon, 02 Mar 2026 16:45:57 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:45:56 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 4/9] spdx3: Add recipe SBoM task
Date: Mon,  2 Mar 2026 17:43:51 -0700
Message-ID: <20260303004550.650726-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232227

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


