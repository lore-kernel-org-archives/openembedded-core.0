Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A345ECD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:23:49 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7675.1781043822526094417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NpaKFRHh;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6b5dfde3cso3181233a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043822; x=1781648622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrYcfiwhDMBjl1gbu8GGtUbIG/r9/yQiFylLpvQbJjE=;
        b=NpaKFRHh08l4X3zM+h8H1a1ue0wAkg25Wsbzq95qCdN3t+7AR/9xba/b7qUcH0PReq
         zbNHCKa8HIMzatbK1zyG52cArB1M00AE27xWxBEhNBaQLHzrAjSCCG1CbHrWlaY79qnE
         NUoQY5213ya83WmfQNlQwcPskKHUSybzxgSM7Ej57aOFNSXT9EcH2AhcixinTwF6TWtM
         GBXzZo782giDknNddeRsOR+4WNNLtCANu8Hf4TMgAQcE/ZzTRNSBlKRtFuH04YJ8SgK0
         Gc15o8yMoqyXixynyuVakJiZ7JFGA+G6kizSmOXBgcOq6+91KTqesq9bvJOYzrccz2ST
         iOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043822; x=1781648622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrYcfiwhDMBjl1gbu8GGtUbIG/r9/yQiFylLpvQbJjE=;
        b=WNWbgbhmmcADJdcWmJz3R+vx9ewjDJfD/ldOsc6OvOlHCCC1jsgrowWgnpNuaTMgEf
         AiDx3K9aYp6mmrP1cdoAmIPKwsOqx3ESrXAx5gib942tp5ib5pkRJmKmLc52z0qRRuYZ
         KakmprOkRjwZXVsto3p4AuVy1JYqJAWRlxrxHsMMz8RY5OWXEjWJ7/oRTERvwbHjTJ9o
         MtBT1dTMmW8TMV122UZDmfe/GgBhfmzueapfYFmh35HGWTzK9RhqoMmjGHV535Ce7SHS
         INILeQsGHpB6ejWi2b9GSh1H3pI4Zte8QT+Cm1J4olTThvo4Fek3S662W76m3A+RSD1r
         PTpQ==
X-Gm-Message-State: AOJu0YwJDvzflrgMpEJhy5gca4Gilh4kk+oRizKEKwtJS2hIIkJFeC+q
	B2LCTSMk/09sn0JUA7X5bUCQQYAXeQPxo9DxBBG7UvhPus3Fq3Jby62EauHJMA==
X-Gm-Gg: Acq92OEpjsJO8VMaEQMvFGiVyPslo17iq6UsTI2o1OHqO97NLSL8xDADgWBqLksgPdA
	bZAaODyubzkQDr93+mp6+7CoYS3TBSGfKSv301Vgwri5RNv8hie6zLDB7nX6kxgEuX4Xqm1VY1b
	xMmF/gdjO7P6u4UI2BMzGg1MmtCPMqaKZTW4TC4B+0tzVKp9GVqL2SBSWKo5ijSZgg4Ig/FqyJv
	vgGCPAHnqhKFhoDtxD38DOTrNN+ASOM28wwGmvCj1qJIp5tUo2WCMlZRzKmbUix8KY4+fwb74KT
	QxDPO6yVUmRg09v/+i6IXAtrTOjR0ySj2ZkFnk/zMOXrI3vJOm6hE2/xMzsr/dIrEmo4jO/TYFM
	quwbJSDbL+kd7ROA3OJ3rvBnP98V6fOtm31QG9/303XgIBJ6XqjFwE0KrrPssQlsZXElrU/2Ayl
	4IDOkpAc42GyLMaIPdMJxVUaST9VebQA==
X-Received: by 2002:a05:6820:8188:b0:69e:14a:f303 with SMTP id 006d021491bc7-69e68c645d4mr13068728eaf.41.1781043821324;
        Tue, 09 Jun 2026 15:23:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::ce1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm19122610fac.8.2026.06.09.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:23:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/5] spdx: Add ability for deploy tasks to create SPDX
Date: Tue,  9 Jun 2026 16:15:54 -0600
Message-ID: <20260609222331.1293007-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609222331.1293007-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238306

Adds support for "deploy" tasks (like do_deploy) to write out SPDX
documents that describe what has been deployed.

Deploy tasks will automatically detect many dependencies on other
recipes; specifically they will correctly detect dependencies on any
do_create_spdx task, and also other deploy tasks that generate SPDX
output. The only known notable exception are transitive (e.g.
originating from other upstream tasks) dependencies on
do_image_complete, and do_populate_sysroot. However, these are detected
if a direct dependency of the deploy task (via translation of the task
dependencies).

This same dependency finding algorithm is now applied to the image
generation SBoM; this means that if an image creation task depends on a
task that generates a deploy SBoM, it will show up in the dependency
graph of the image. A typical example is a wic file that consumes the
kernel, u-boot, etc. will now correctly list those as a dependency, as
long as their do_deploy step is added to SPDX_DEPLOY_TASKS.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../create-spdx-image-3.0.bbclass             |   4 +-
 meta/classes-recipe/deploy.bbclass            |   1 +
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-3.0.bbclass          | 158 ++++++++++
 meta/classes/spdx-common.bbclass              |   1 +
 meta/lib/oe/sbom30.py                         |  46 +--
 meta/lib/oe/spdx30_tasks.py                   | 282 +++++++++++++++---
 meta/lib/oe/spdx_common.py                    |   2 +-
 8 files changed, 430 insertions(+), 65 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e2..a96cfb25ed 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -30,7 +30,7 @@ python do_create_rootfs_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_rootfs_spdx(d)
 }
-addtask do_create_rootfs_spdx after do_rootfs before do_image
+addtask do_create_rootfs_spdx after do_rootfs do_create_recipe_spdx before do_image
 SSTATETASKS += "do_create_rootfs_spdx"
 do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
@@ -47,7 +47,7 @@ python do_create_image_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_spdx(d)
 }
-addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx before do_build
+addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx do_create_recipe_spdx before do_build
 SSTATETASKS += "do_create_image_spdx"
 SSTATE_SKIP_CREATION:task-create-image-spdx = "1"
 do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
diff --git a/meta/classes-recipe/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
index f56fe98d6d..f222a8560f 100644
--- a/meta/classes-recipe/deploy.bbclass
+++ b/meta/classes-recipe/deploy.bbclass
@@ -6,6 +6,7 @@
 
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
+SPDX_DEPLOY_ARTIFACTS_DIR:task-deploy = "${DEPLOYDIR}"
 do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 7c99fcd1ec..b405f57d11 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -11,3 +11,4 @@ deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
 deltask do_create_image_sbom
+deltask do_create_deploy_sbom
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 56fd01fd53..19d5a45eba 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -163,6 +163,34 @@ SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
     on gitlab.example.com to the pkg:gitlab PURL type. \
     github.com is always mapped to pkg:github by default."
 
+SPDX_DEPLOY_TASKS ?= ""
+SPDX_DEPLOY_TASKS[doc] = "A space separated list of sstate tasks that produce \
+    deployed output (usually written to DEPLOY_DIR_IMAGE). Tasks in this list \
+    will produce SPDX documents that describe the deployed output. If a task \
+    is in this list, see the SPDX_DEPLOY_ARITFACTS and SPDX_DEPLOY_ARTIFACTS_DIR \
+    for how to configure its SPDX output.\
+    \
+    Dependencies of deploy tasks that produce SPDX data will be automatically \
+    linked in as a build time dependency of the deploy task's SBoM. (for \
+    example, if one do_deploy depends on another recipes do_deploy, this will \
+    be reflected in the SPDX data). If the deploy task should depend on the \
+    primary build process of the recipe, the task should be declared \
+    'after do_create_spdx'.\
+    "
+
+SPDX_DEPLOY_ARTIFACTS = "AUTO"
+SPDX_DEPLOY_ARITFACTS[doc] = "A space separated list of deployed artifacts, \
+    relative to SPDX_DEPLOY_ARTIFACTS_DIR that should be included in the SBoM. \
+    If 'AUTO' (the default), all files in SPDX_DEPLOY_ARITFACTS_DIR will be \
+    added. A :task- override *must* be used to set this value so that it is \
+    scoped to a specific task"
+
+SPDX_DEPLOY_ARTIFACTS_DIR = ""
+SPDX_DEPLOY_ARTIFACTS_DIR[doc] = "The directory recipe specific directory \
+    where artifacts are deployed for staging to sstate (e.g. for do_deploy, \
+    this is DEPLOY_DIR). A :task- override *must* be used to set this value so \
+    that it is scoped to a specific task."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
@@ -291,3 +319,133 @@ python spdx30_build_started_handler () {
 addhandler spdx30_build_started_handler
 spdx30_build_started_handler[eventmask] = "bb.event.BuildStarted"
 
+python create_deploy_spdx() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+    spdxdeploydir = Path(d.getVar("SPDXDIR") + "/deploy-" + current_task)
+
+    artifactsdir = d.getVar("SPDX_DEPLOY_ARTIFACTS_DIR")
+    if not artifactsdir:
+        bb.fatal(f"{pn}: spdx-artifactsdir must be set for task {current_task}")
+        return
+
+    artifacts = d.getVar("SPDX_DEPLOY_ARTIFACTS")
+
+    oe.spdx30_tasks.create_deploy_spdx(d, spdxdeploydir, artifactsdir, artifacts)
+}
+oe.spdx30_tasks.find_build_dep_objsets[vardepsexclude] += "BB_TASKDEPDATA"
+
+python () {
+    # Most recipes generate SPDX output in a distinct task from the task that
+    # actually is the relevant dependency. As such, we need to map the task
+    # that we care about to the task that generates the corresponding SPDX
+    # output so that we can rely on the SPDX output being present when the time
+    # comes to use it downstream.
+    #
+    # The down side of this is that only the first level of dependencies (e.g
+    # tasks listed in SPDX_DEPLOY_TASKS) will have the mapping done and thus
+    # find the dependencies. Transitive dependencies will not be mapped and
+    # thus the SPDX data will not be linked in.
+    #
+    # Ideally, this will be able to go away once more tasks directly generate
+    # SPDX files for their output instead of combining it into monolithic
+    # functions; tasks listed in this map are the best candidates to have this
+    # done first.
+    TASK_MAP = {
+        # If a task requires the RSS be extended, depend on the SPDX build task
+        # for the recipe, at least until it's possible for do_populate_sysroot
+        # to describe it's own output.
+        "do_populate_sysroot": "do_create_spdx",
+        # If an image is needed, also depend on the task to create the SBoM for
+        # the image
+        "do_image_complete": "do_create_image_spdx",
+    }
+
+    def map_task_deps(task, flag):
+        task_flags= (d.getVarFlag(task, flag) or "").split()
+        for t in task_flags:
+            if t in TASK_MAP and TASK_MAP[t] not in task_flags:
+                d.appendVarFlag(task, flag, f" {TASK_MAP[t]}")
+
+    def before_postfunc(f):
+        return f == "sstate_task_postfunc" or "buildhistory" in f
+
+    if bb.data.inherits_class("nospdx", d):
+        return
+
+    sstate_tasks = set((d.getVar("SSTATETASKS") or "").split())
+    spdx_tasks = (d.getVar("SPDX_DEPLOY_TASKS") or "").split()
+    deploy_sbom_tasks = []
+    for task in spdx_tasks:
+        if ":" in task:
+            task, func = task.split(":")
+        else:
+            func = "create_deploy_spdx"
+
+        deploy_sbom_tasks.append(task)
+
+        if task not in sstate_tasks:
+            bb.fatal(f"{task} is not an sstate task")
+
+        spdx_deploy = "${SPDXDIR}/deploy-" + task
+
+        # Ensure function is sorted properly. It should be right before
+        # sstate_task_postfunc
+        postfuncs = (d.getVarFlag(task, "postfuncs") or "").split()
+        d.setVarFlag(task, "postfuncs", " ".join(
+            [f for f in postfuncs if not before_postfunc(f)] +
+            [func] +
+            [f for f in postfuncs if before_postfunc(f)]
+        ))
+        d.prependVarFlag(task, "sstate-inputdirs", f"{spdx_deploy} ")
+        d.prependVarFlag(task, "sstate-outputdirs", "${DEPLOY_DIR_SPDX} ")
+        d.prependVarFlag(task, "file-checksums", "${SPDX3_DEP_FILES} ")
+        d.prependVarFlag(task, "dirs", f"{spdx_deploy} ")
+        d.prependVarFlag(task, "cleandirs", f"{spdx_deploy} ")
+
+        deps = (d.getVarFlag(task, "depends") or "").split()
+        extra_deps = ["${PN}:do_create_recipe_spdx"]
+        for dep in deps:
+            _, fn, taskname = bb.runqueue.split_tid(dep)
+            if taskname in TASK_MAP:
+                extra_deps.append(f"{fn}:{TASK_MAP[taskname]}")
+
+        d.prependVarFlag(task, "depends", " ".join(extra_deps) + " ")
+
+        map_task_deps(task, "deptask")
+        map_task_deps(task, "rdeptask")
+        map_task_deps(task, "recrdeptask")
+
+    # For now, if a recipe is directly built, deploy all of it's deploy tasks
+    # into a single SBoM. We may need an option in the future to have tasks
+    # that don't do this (e.g. because they do not deploy to a location that is
+    # intended to be consumed by the user)
+    if spdx_tasks:
+        bb.build.addtask("do_create_deploy_sbom", "do_build", " ".join(deploy_sbom_tasks), d)
+}
+
+python do_create_deploy_sbom() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+    deploydir = Path(d.getVar("SPDXDEPLOYSBOMDEPLOY"))
+    deploy_tasks = []
+    for task in (d.getVar("SPDX_DEPLOY_TASKS") or "").split():
+        if ":" in task:
+            task, _ = task.split(":")
+        deploy_tasks.append(task)
+
+    oe.spdx30_tasks.create_deploy_sbom(d, deploydir, deploy_tasks)
+}
+do_create_deploy_sbom[sstate-inputdirs] = "${SPDXDEPLOYSBOMDEPLOY}"
+do_create_deploy_sbom[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_create_deploy_sbom[recrdeptask] += "do_create_recipe_spdx do_create_spdx"
+do_create_deploy_sbom[cleandirs] += "${SPDXDEPLOYSBOMDEPLOY}"
+do_create_deploy_sbom[file-checksums] += "${SPDX3_DEP_FILES}"
+
+SSTATETASKS += "do_create_deploy_sbom"
+python do_create_deploy_sbom_setscene() {
+    sstate_setscene(d)
+}
+addtask do_create_deploy_sbom_setscene
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 40701730a6..bca169670d 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRECIPEDEPLOY = "${SPDXDIR}/recipe-deploy"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 SPDXRECIPESBOMDEPLOY = "${SPDXDIR}/recipes-bom-deploy"
+SPDXDEPLOYSBOMDEPLOY = "${SPDXDIR}/deploy-bom-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
 SPDX_INCLUDE_SOURCES[doc] = "If set to '1', include source code files in the \
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0926266295..16f42f41d6 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1048,6 +1048,25 @@ def write_jsonld_doc(d, objset, dest):
     objset.objects.remove(objset.doc)
 
 
+def make_jsonld_link(d, fn, subdir, name, deploydir):
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+
+    link_name = jsonld_arch_path(
+        d,
+        pkg_arch,
+        subdir,
+        name,
+        deploydir=deploydir,
+    )
+    try:
+        link_name.parent.mkdir(exist_ok=True, parents=True)
+        link_name.symlink_to(os.path.relpath(fn, link_name.parent))
+    except:
+        target = link_name.readlink()
+        bb.warn(f"Unable to link {fn} as {link_name}. Already points to {target}")
+        raise
+
+
 def write_recipe_jsonld_doc(
     d,
     objset,
@@ -1055,6 +1074,7 @@ def write_recipe_jsonld_doc(
     deploydir,
     *,
     create_spdx_id_links=True,
+    create_task_link=False,
 ):
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
@@ -1062,23 +1082,7 @@ def write_recipe_jsonld_doc(
 
     def link_id(_id):
         hash_path = jsonld_hash_path(hash_id(_id))
-
-        link_name = jsonld_arch_path(
-            d,
-            pkg_arch,
-            *hash_path,
-            deploydir=deploydir,
-        )
-        try:
-            link_name.parent.mkdir(exist_ok=True, parents=True)
-            link_name.symlink_to(os.path.relpath(dest, link_name.parent))
-        except:
-            target = link_name.readlink()
-            bb.warn(
-                f"Unable to link {_id} in {dest} as {link_name}. Already points to {target}"
-            )
-            raise
-
+        make_jsonld_link(d, dest, *hash_path, deploydir)
         return hash_path[-1]
 
     objset.add_aliases()
@@ -1094,6 +1098,14 @@ def write_recipe_jsonld_doc(
         # out, so always do that even if there is an error making the links
         write_jsonld_doc(d, objset, dest)
 
+    if create_task_link:
+        pn = d.getVar("PN")
+        current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+        make_jsonld_link(d, dest, "by-task", f"{pn}:{current_task}", deploydir)
+
+    return dest
+
 
 def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_filter):
     objset, fn = find_jsonld(d, subdir, fn_name, required=True)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 72d17aade6..3dae502e64 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -605,6 +605,135 @@ def get_is_native(d):
     return bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
 
 
+def set_var_field(d, var, obj, name, package=None):
+    val = None
+    if package:
+        val = d.getVar("%s:%s" % (var, package))
+
+    if not val:
+        val = d.getVar(var)
+
+    if val:
+        setattr(obj, name, val)
+
+
+def find_build_dep_objsets(d, start_task):
+    def find_deps(d, taskdepdata, current_dep, start_dep, visited, depth=0):
+        key = f"{current_dep.pn}:{current_dep.taskname}"
+
+        dep_objsets = []
+
+        if key not in visited:
+            visited.add(key)
+
+            for n in current_dep.deps:
+                dep = taskdepdata[n]
+                dep_name = f"{dep.pn}:{dep.taskname}"
+
+                dep_objset, dep_path = oe.sbom30.find_jsonld(d, "by-task", dep_name)
+                if dep_objset:
+                    dep_objsets.append(dep_objset)
+
+                elif dep.pn == start_dep.pn:
+                    # If this task is still part of the same recipe, continue
+                    # searching up the dependency tree until a valid dependency
+                    # is found. This detects transitive dependencies that may
+                    # have been pulled in by previous tasks in the same recipe.
+                    dep_objsets.extend(
+                        find_deps(d, taskdepdata, dep, start_dep, visited, depth + 1)
+                    )
+
+        return dep_objsets
+
+    pn = d.getVar("PN")
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    for dep in taskdepdata.values():
+        if dep.pn == pn and dep.taskname == start_task:
+            start_dep = dep
+            break
+    else:
+        bb.fatal(f"Unable to find {pn}:{start_task} in taskdepdata")
+
+    return find_deps(d, taskdepdata, start_dep, start_dep, set())
+
+
+def create_deploy_package(d, objset, build, spdxid, name, start_task, files, **attrs):
+    recipe, _ = load_recipe_spdx(d)
+
+    deploy_package = objset.add_root(
+        oe.spdx30.software_Package(
+            _id=spdxid,
+            creationInfo=objset.doc.creationInfo,
+            name=name,
+            software_packageVersion=d.getVar("PV"),
+        )
+    )
+
+    objset.new_scoped_relationship(
+        [oe.sbom30.get_element_link_id(recipe)],
+        oe.spdx30.RelationshipType.generates,
+        oe.spdx30.LifecycleScopeType.build,
+        [deploy_package],
+    )
+
+    set_var_field(d, "HOMEPAGE", deploy_package, "software_homePage")
+    set_var_field(d, "SUMMARY", deploy_package, "summary")
+    set_var_field(d, "DESCRIPTION", deploy_package, "description")
+
+    set_purls(deploy_package, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
+
+    set_timestamp_now(d, deploy_package, "builtTime")
+
+    supplier = objset.new_agent("SPDX_PACKAGE_SUPPLIER")
+    if supplier is not None:
+        deploy_package.suppliedBy = (
+            supplier if isinstance(supplier, str) else supplier._id
+        )
+
+    if files:
+        objset.new_relationship(
+            [deploy_package],
+            oe.spdx30.RelationshipType.contains,
+            sorted(list(files)),
+        )
+
+    objset.new_scoped_relationship(
+        [build],
+        oe.spdx30.RelationshipType.hasOutput,
+        oe.spdx30.LifecycleScopeType.build,
+        sorted(list(files) + [deploy_package]),
+    )
+
+    # Collect dependencies
+    if start_task is not None:
+        dep_builds = set()
+        dep_packages = set()
+        for o in find_build_dep_objsets(d, start_task):
+            if obj := o.find_root(oe.spdx30.software_Package):
+                dep_packages.add(oe.sbom30.get_element_link_id(obj))
+
+            if obj := o.find_root(oe.spdx30.build_Build):
+                dep_builds.add(oe.sbom30.get_element_link_id(obj))
+
+        if dep_packages:
+            objset.new_scoped_relationship(
+                [deploy_package],
+                oe.spdx30.RelationshipType.dependsOn,
+                oe.spdx30.LifecycleScopeType.build,
+                sorted(list(dep_packages)),
+            )
+
+        if dep_builds:
+            objset.new_scoped_relationship(
+                [build],
+                oe.spdx30.RelationshipType.dependsOn,
+                oe.spdx30.LifecycleScopeType.build,
+                sorted(list(dep_builds)),
+            )
+
+    return deploy_package
+
+
 def create_recipe_spdx(d):
     deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
     pn = d.getVar("PN")
@@ -795,7 +924,9 @@ def create_recipe_spdx(d):
             sorted(list(all_cves)),
         )
 
-    oe.sbom30.write_recipe_jsonld_doc(d, recipe_objset, "static", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, recipe_objset, "static", deploydir, create_task_link=True
+    )
 
 
 def load_recipe_spdx(d):
@@ -809,17 +940,6 @@ def load_recipe_spdx(d):
 
 
 def create_spdx(d):
-    def set_var_field(var, obj, name, package=None):
-        val = None
-        if package:
-            val = d.getVar("%s:%s" % (var, package))
-
-        if not val:
-            val = d.getVar(var)
-
-        if val:
-            setattr(obj, name, val)
-
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
     pn = d.getVar("PN")
@@ -947,10 +1067,12 @@ def create_spdx(d):
                 )
 
             set_var_field(
-                "HOMEPAGE", spdx_package, "software_homePage", package=package
+                d, "HOMEPAGE", spdx_package, "software_homePage", package=package
+            )
+            set_var_field(d, "SUMMARY", spdx_package, "summary", package=package)
+            set_var_field(
+                d, "DESCRIPTION", spdx_package, "description", package=package
             )
-            set_var_field("SUMMARY", spdx_package, "summary", package=package)
-            set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
             purls = (
                 d.getVar("SPDX_PACKAGE_URLS:%s" % package)
@@ -1130,7 +1252,9 @@ def create_spdx(d):
                 f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled"
             )
 
-    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, build_objset, "builds", deploydir, create_task_link=True
+    )
 
 
 def create_package_spdx(d):
@@ -1364,26 +1488,9 @@ def create_rootfs_spdx(d):
         d, "%s-%s-rootfs" % (image_basename, machine)
     )
 
-    rootfs = objset.add_root(
-        oe.spdx30.software_Package(
-            _id=objset.new_spdxid("rootfs", image_basename),
-            creationInfo=objset.doc.creationInfo,
-            name=image_basename,
-            software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.archive,
-        )
-    )
-    set_timestamp_now(d, rootfs, "builtTime")
-
     rootfs_build = objset.add_root(objset.new_task_build("rootfs", "rootfs"))
     set_timestamp_now(d, rootfs_build, "build_buildEndTime")
 
-    objset.new_scoped_relationship(
-        [rootfs_build],
-        oe.spdx30.RelationshipType.hasOutput,
-        oe.spdx30.LifecycleScopeType.build,
-        [rootfs],
-    )
-
     files_by_hash = {}
     collect_build_package_inputs(d, objset, rootfs_build, packages, files_by_hash)
 
@@ -1416,14 +1523,20 @@ def create_rootfs_spdx(d):
                     )
                 )
 
-    if files:
-        objset.new_relationship(
-            [rootfs],
-            oe.spdx30.RelationshipType.contains,
-            sorted(list(files)),
-        )
+    rootfs = create_deploy_package(
+        d,
+        objset,
+        rootfs_build,
+        objset.new_spdxid("rootfs", image_basename),
+        image_basename,
+        None,
+        files,
+    )
+    rootfs.software_primaryPurpose = oe.spdx30.software_SoftwarePurpose.archive
 
-    oe.sbom30.write_recipe_jsonld_doc(d, objset, "rootfs", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, objset, "rootfs", deploydir, create_task_link=True
+    )
 
 
 def create_image_spdx(d):
@@ -1503,10 +1616,13 @@ def create_image_spdx(d):
                 set_timestamp_now(d, a, "builtTime")
 
         if artifacts:
-            objset.new_scoped_relationship(
-                [image_build],
-                oe.spdx30.RelationshipType.hasOutput,
-                oe.spdx30.LifecycleScopeType.build,
+            create_deploy_package(
+                d,
+                objset,
+                image_build,
+                objset.new_spdxid(taskname, "image", imagetype),
+                "image",
+                f"do_{taskname}",
                 artifacts,
             )
 
@@ -1527,7 +1643,9 @@ def create_image_spdx(d):
 
     objset.add_aliases()
     objset.link()
-    oe.sbom30.write_recipe_jsonld_doc(d, objset, "image", spdx_work_dir)
+    oe.sbom30.write_recipe_jsonld_doc(
+        d, objset, "image", spdx_work_dir, create_task_link=True
+    )
 
 
 def create_image_sbom_spdx(d):
@@ -1705,3 +1823,77 @@ def create_recipe_sbom(d, deploydir):
     objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
 
     oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
+
+
+def create_deploy_spdx(d, spdxdeploydir, artifactsdir, artifacts):
+    pn = d.getVar("PN")
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
+    recipe, recipe_objset = load_recipe_spdx(d)
+
+    if artifacts == "AUTO":
+        artifacts = []
+        for root, dirs, files in os.walk(artifactsdir):
+            for p in [Path(os.path.join(root, f)) for f in files]:
+                if p.is_file():
+                    artifacts.append(p)
+    else:
+        artifacts = [artifactsdir / p for p in artifacts.split()]
+
+    artifacts.sort(key=lambda p: (p.is_symlink(), p))
+
+    objset = oe.sbom30.ObjectSet.new_objset(d, f"{pn}-{current_task}-deploy")
+
+    build = objset.add_root(objset.new_task_build(current_task, "deploy"))
+    set_timestamp_now(d, build, "build_buildEndTime")
+    objset.set_is_native(get_is_native(d))
+
+    files = set()
+    for a in artifacts:
+        relpath = a.relative_to(artifactsdir)
+        f = objset.new_file(
+            objset.new_spdxid("deploy", str(relpath)),
+            a.name,
+            a,
+        )
+        files.add(f)
+
+    if not files:
+        bb.fatal(f"No deployed artifacts found in {artifactsdir}")
+        return
+
+    create_deploy_package(
+        d,
+        objset,
+        build,
+        objset.new_spdxid("deploy", pn, current_task),
+        pn,
+        current_task,
+        files,
+    )
+
+    # Create document
+    dest = oe.sbom30.write_recipe_jsonld_doc(
+        d,
+        objset,
+        "deploy",
+        spdxdeploydir,
+        create_task_link=True,
+    )
+
+
+def create_deploy_sbom(d, deploydir, deploy_tasks):
+    pn = d.getVar("PN")
+    sbom_name = f"{pn}-deploy-sbom"
+
+    objsets = []
+    for t in deploy_tasks:
+        o, _ = oe.sbom30.find_jsonld(d, "deploy", f"{pn}-{t}-deploy", required=True)
+        objsets.append(o)
+
+    root_objs = []
+    for o in objsets:
+        root_objs.extend(o.doc.rootElement)
+
+    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, root_objs, objsets)
+    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 6b1a409c40..0337d1deb5 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -113,7 +113,7 @@ def collect_direct_deps(d, dep_task):
         )
 
     for this_dep in taskdepdata.values():
-        if this_dep[0] == pn and this_dep[1] == current_task:
+        if this_dep.pn == pn and this_dep.taskname == current_task:
             break
     else:
         bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdata")
-- 
2.54.0


