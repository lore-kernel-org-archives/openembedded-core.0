Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CFAC7EE2C
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.13170.1685712898162251362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WaLiaWyg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30d181952a2so105061f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712896; x=1688304896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfGKcIK7/sAlMPLWI87IL1gQoI6ib42pUk2rr3KAN/g=;
        b=WaLiaWygzbpalaSH07UPF95PS2xvLD3X3mOAsYmegG46ZkPCLq/4A7iqGXU1ddNrIh
         wv/GD6oYUxO1mLbAxSOkCq7acjuI86pr9GYZdrMKO1ba93gJ2coa4wDNjZaMm4kUI7jr
         YGo5vVU6L62ry+c9YCJ6uIiE3eox7tqWry10w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712896; x=1688304896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfGKcIK7/sAlMPLWI87IL1gQoI6ib42pUk2rr3KAN/g=;
        b=KPe1c4YKndrICcSSqUGP/vZUD0kSrZEUA3AsiuEyTutoI+cu2TIboiziw9UdeRFX4q
         jgaK3QDEgehHyu+Ex4A4Mxk7VI8jM2KqFmXv1iypVOViPDxEeThCUMTxvM4WSNAGAeRO
         eUTBj6vAGh4i0Go/6V4hvn+DqtRUP68zKZ6r5jwPBI5qubtddIv7JCvIdjA8nHAcjMyW
         GKNW6T+cW7YEqryCr2unwzDA10W46lrt8n8UGeKfXhDbALsaWxaOtkOPu2ISRBelqoJl
         RnBgfy+57fCoDbr5Rte7kcogBKlLkfzvonGSsRJi0JrW4yDqGqUC81JCm5LmxAZjrr+A
         CvFg==
X-Gm-Message-State: AC+VfDw4UwjAJA6lNRS2lmUTaXz0XANZhayV/bza6KnFZZ/eMt3HleZI
	WwrRNIk0Wo9o3YyHz2AbES2dQpV9HsuChXrh7xU=
X-Google-Smtp-Source: ACHHUZ6XPwXVTAPFQUpPbkarjWcAFitZeDGuHiPngrSYzKiHt6VVjTz+U91sD9iteXdp0x901D7z0Q==
X-Received: by 2002:a5d:4524:0:b0:30a:e495:2544 with SMTP id j4-20020a5d4524000000b0030ae4952544mr7936wra.23.1685712896469;
        Fri, 02 Jun 2023 06:34:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:34:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 03/11] classes/create-spdx-2.2: Fix build time dependency calculations
Date: Fri,  2 Jun 2023 14:34:45 +0100
Message-Id: <20230602133453.229023-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182321

From: Joshua Watt <JPEWhacker@gmail.com>

Build time dependencies were not being correctly calculated for SPDX
documents because while a task can `deptask` itself (as do_create_spdx
did), those dependencies do not appear in BB_TASKDEPDATA (to avoid
circular dependencies).

To fix this, an intermediate task called do_collect_sdpx_deps is created
that does the 'deptask' on do_create_spdx and records the recipe
dependencies. do_create_spdx then runs after this new task. This breaks
the circular dependency and thus all of the do_create_spdx tasks
correctly show up as dependencies of do_collect_spdx_deps.

In addition, the dependency collection logic was improved to handle the
case of transitive dependencies (that is, a dependency of a dependency)
SPDX documents missing and causing an error. These transitive
dependencies don't actually need to be included anyway since one can
follow the relationship of the direct dependency to find them. As such,
the code is reworked to find the current task in BB_TASKDEPDATA, and
then only collect the immediate dependencies of the current task.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 71 +++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index f12e155f6ba..c461c77744a 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -16,6 +16,7 @@ SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 SPDXIMAGEWORK = "${SPDXDIR}/image-work"
 SPDXSDKWORK = "${SPDXDIR}/sdk-work"
+SPDXDEPS = "${SPDXDIR}/deps.json"
 
 SPDX_TOOL_NAME ??= "oe-spdx-creator"
 SPDX_TOOL_VERSION ??= "1.0"
@@ -337,30 +338,21 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
 
             package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_id, comment=debugsrc)
 
-def collect_deps(d):
-    current_task = "do_" + d.getVar("BB_CURRENTTASK")
-
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-    deps = sorted(set(
-        (dep[0], dep[7]) for dep in taskdepdata.values() if
-            dep[1] == current_task and dep[0] != d.getVar("PN")
-    ))
-
-    return deps
-
-collect_deps[vardepsexclude] += "BB_TASKDEPDATA"
-collect_deps[vardeps] += "DEPENDS"
-
 def collect_dep_recipes(d, doc, spdx_recipe):
+    import json
     from pathlib import Path
     import oe.sbom
     import oe.spdx
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
 
     dep_recipes = []
 
-    for dep_pn, dep_hashfn in collect_deps(d):
+    with spdx_deps_file.open("r") as f:
+        deps = json.load(f)
+
+    for dep_pn, dep_hashfn in deps:
         dep_recipe_path = oe.sbom.doc_path_by_hashfn(deploy_dir_spdx, "recipe-" + dep_pn, dep_hashfn)
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
@@ -462,6 +454,52 @@ def add_download_packages(d, doc, recipe):
             # but this should be sufficient for now
             doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
 
+def collect_deps(d, dep_task):
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+    pn = d.getVar("PN")
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+
+    for this_dep in taskdepdata.values():
+        if this_dep[0] == pn and this_dep[1] == current_task:
+            break
+    else:
+        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdata")
+
+    deps = set()
+    for dep_name in this_dep[3]:
+        dep_data = taskdepdata[dep_name]
+        if dep_data[1] == dep_task and dep_data[0] != pn:
+            deps.add((dep_data[0], dep_data[7]))
+
+    return sorted(deps)
+
+collect_deps[vardepsexclude] += "BB_TASKDEPDATA"
+collect_deps[vardeps] += "DEPENDS"
+
+python do_collect_spdx_deps() {
+    # This task calculates the build time dependencies of the recipe, and is
+    # required because while a task can deptask on itself, those dependencies
+    # do not show up in BB_TASKDEPDATA. To work around that, this task does the
+    # deptask on do_create_spdx and writes out the dependencies it finds, then
+    # do_create_spdx reads in the found dependencies when writing the actual
+    # SPDX document
+    import json
+    from pathlib import Path
+
+    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+
+    deps = collect_deps(d, "do_create_spdx")
+
+    with spdx_deps_file.open("w") as f:
+        json.dump(deps, f)
+}
+# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
+addtask do_collect_spdx_deps after do_unpack
+do_collect_spdx_deps[depends] += "${PATCHDEPENDENCY}"
+do_collect_spdx_deps[deptask] = "do_create_spdx"
+do_collect_spdx_deps[dirs] = "${SPDXDIR}"
+
 python do_create_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
@@ -647,7 +685,7 @@ python do_create_spdx() {
             oe.sbom.write_doc(d, package_doc, d.getVar("SSTATE_PKGARCH"), "packages", indent=get_json_indent(d))
 }
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_create_spdx after do_package do_packagedata do_unpack before do_populate_sdk do_build do_rm_work
+addtask do_create_spdx after do_package do_packagedata do_unpack do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
 
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
@@ -661,7 +699,6 @@ addtask do_create_spdx_setscene
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += "${PATCHDEPENDENCY}"
-do_create_spdx[deptask] = "do_create_spdx"
 
 def collect_package_providers(d):
     from pathlib import Path
-- 
2.39.2


