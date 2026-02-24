Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFE9F55425
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:57 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33717.1771974167355734453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbJxLwy/;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-463a0e14b4dso1885381b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974166; x=1772578966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuZ09cpe+jljIdRJEO5Irjci+Kvl3vGKNxyzTjKNY64=;
        b=VbJxLwy/8H7mHGSZl2e8jGpzgur2S2mQFj87IepyX4zhUvEAUDPjJeb2q2HUvn6CdI
         G7rorqXjmY3+rmMoxpkLxwRpjzJlHmDFdlSf8APAhGjnOZajMiZKOjveT3lKKvDNOxeI
         fJ9kTtaleGQuVRdov4BJqYvqDYfxlbek2ml26E76ZROWr1LYUYM4nPWUuqlIPvK27Htz
         N7ULJOW2zH+qOLeki8JPLvfEFUUC7Gzk7YBMJUGS7Xl7sYgqiVqAP49xxBdW8Odu8YCg
         cJxSOI6/NjmwWjLfQ1BY4pwXE5XS7HfxuZ14pCni3oC0qGiP2cp8wLA3dbGPJam5D4zD
         JpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974166; x=1772578966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kuZ09cpe+jljIdRJEO5Irjci+Kvl3vGKNxyzTjKNY64=;
        b=EDS9DPnOL4FLiLpGYinQQup0WRnkRuSr0IVrOAOhtW74MsQ/PO2tBhSf7fsiQ3khjJ
         GY9WF+fz6ffi2aJComjWeWKBxGSVQdh18+fzUVP+Q2hbsu5G3x5C0oDx5znBMzyDs0C6
         YpGPtlLclhXZnjlL6vmW3GjtejsKHxiBAF7HKo99naVRkusYb4QKaZrrNhnm8+VvOApV
         GTszCUDou1qI5JzWUZu3lf3hsGRF9nUBfsL3cOSlLA2xtd/Hxd942baCjbzz3wSR7d5H
         ODL8NQ8Rrw3caFd5GECBVFbDEG1hEdx0dcK/VlaqPUFkUv3BqIBCi+AzNs8J0dKD3Gni
         oLQA==
X-Gm-Message-State: AOJu0YzoaEJiRul1ABnSD7qCnxx/1qax5z1jJOlurjN1RzFrRLzDHQ1j
	8VJHj2iAiezojB4/NYzU3t+Mcgh5eUqoiZAOeb3QjHS1g6Su700epIvniQfyxw==
X-Gm-Gg: AZuq6aLL1ibpSz/1JU62UMpI48LSYq01c1SjgVC86Nwvhf0lccO6HdddckApVeqb3qF
	G14LXQqoVL/JB9RMfQYUlF/ACL2Z9+r0BQXJG7UjekzNDaEQLsHb7JdbL5LXCs/6eQDc67klqKO
	Kf2BF0ARwhy5AUy6GiFAUEnfJ8HFbJ7aBnOWae2enHYCLpTcrxCxx5zpcvL/abiBY8jYNImv/tn
	Jv2uINC800AV+iwgkyw8YnmhozZUS7YJdK6vVLF9K1r9tJtniAsM1BCKuOZEBxxICpmxnEexaBc
	D6959gPmcaaXgJsJQTtl7tpFSa/Dz49gr4vVmTgG4Tt8qYIcsLEl5tmlInfAz7cPPLNZaPnCEL8
	MkUVwxIPCGPKZ5h6v9fk4tNiguzWWBr7kvokpciO99aTV4fR66kdos4oxLAn03hkFBm7XXMYi4y
	fffIWs6yov4iwsMgbNfjMIUwPuisb3V6s=
X-Received: by 2002:a05:6808:320b:b0:462:d9a2:84e1 with SMTP id 5614622812f47-464463ef61fmr6505636b6e.60.1771974166451;
        Tue, 24 Feb 2026 15:02:46 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:45 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 4/8] spdx3: Add recipe SBoM task
Date: Tue, 24 Feb 2026 16:00:17 -0700
Message-ID: <20260224230234.679049-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231913

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
 meta/classes/create-spdx-3.0.bbclass          | 28 +++++++++++++++++++
 meta/classes/spdx-common.bbclass              |  1 +
 meta/lib/oe/spdx30_tasks.py                   | 10 +++++++
 .../meta/meta-world-recipe-sbom.bb            | 26 +++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 61223ee0a5..fdd0c60690 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -238,6 +238,34 @@ python do_create_package_spdx_setscene () {
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
index 0000000000..60209fba7e
--- /dev/null
+++ b/meta/recipes-core/meta/meta-world-recipe-sbom.bb
@@ -0,0 +1,26 @@
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
+python calculate_extra_depends() {
+    exclude = set('${WORLD_SBOM_EXCLUDE}'.split())
+    for p in world_target:
+        if p == self_pn or p in exclude:
+            continue
+        deps.append(p)
+}
-- 
2.53.0


