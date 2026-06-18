Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BEFCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:50:47 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24330.1781801439345593785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GVgZCiaL;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1048524a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801438; x=1782406238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQCKW8afwcAv+YtjmIMjDljbMzvW2SV26QGVFsGbe4M=;
        b=GVgZCiaL5y6i8SjQ4maDJ2KEep9cjnux3qu9ii2ttAqc5mqCnFaYFENehuetd3t6NB
         I7YxcQwe/9Fu/0arowCqw9jzwqvWZ+qWtDOJdRU/0qQAlmALVYNPka8ou8P3lFtsUfVi
         gMuMLRcQ4KfpSArxgbCw9fVTqBALYuFpgLKTE+eHOQK7fhEQD8HnJF2sLxr2urc4+4v1
         vPvAkNue2pupGnfLmD9A+yp7NC76z/wM6JowRHRgVdF9+yWZETn1xjNGt5gKOgkRxLsz
         Hap+wn/kb8UHLKpQmtqmjCX5Ov15pk3IXrOQeAHbJL/VM6a9QDzYwnPEJwKoj7cSUKgr
         oTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801438; x=1782406238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WQCKW8afwcAv+YtjmIMjDljbMzvW2SV26QGVFsGbe4M=;
        b=bMPcxcpW8/9EjaiKBIoDrKozanrgmhEa3TGbpaNRsGOY9V4k1HFe6jhMXGuigxTBJ7
         2cobLhi31wfI7dCvwtt1SHzSnuta2PpKjjCN+CMH33561QV2YP3eySd1FI4WHMpiWFiv
         5ZQ708MpyDEuq8auVovIsayo9DB1FKZtHL3cBhDdmvqclf8XTgJU7ulRe7Ui3G4hHfR0
         coAoK+Q4FbLbjPIilzIeVtujdOTXBwtIKcyf/EK3dpVrSzZ5RjMe1NeCkbOfC1x7iRx2
         0yEkVh2LWvEkbQecOxPzKEzI0ZYyFcoB9Ag9SmYNrZ/Wav7xpy7+JXbc7BSpy+a8FpeH
         as/Q==
X-Gm-Message-State: AOJu0Yzw9wrtWiCHAsvTalNtluTdmjd8kI4dflFepXdB0BsztGrpPdju
	W6AvFkwmiYHN8ZYhBFKX9YqTwFHAHg8ba051Phqwc49OGySSQ4NTN+xEvwfCcw==
X-Gm-Gg: AfdE7cnlhJcBF+qShZI+NX84gJZ/NoB00VSNfEwk7TI7YvWyM2jQiod2gRDOYvXl2w5
	/Qj652WL245OlP7yAgik2HZwxgrwH8Vx1LmStfz/jYzRanw921n/8xilKg07FZJI38XO90sl5ey
	WcDTQ9Hc53WZubRb0jNGpqxEDvmUC21dssJxNYKVmQOMIPAfy5Ks8U2kf+mKEMW/tmfanuNoVWC
	Eq/uoFFhGWOePLmLA2+KYIEeqV3G8wXX/7IQpFY9O6drzmrEAaBRf+jvsHDDu/1hCWdXMdbhZWr
	huS+8WBSETtJU7mFMTtJIXmff5R7q2HKrXrVM9EM1k43eXafZcE8v6HpDx9qNAGyN7Oj17wGzi5
	QLhXSazym3byKpOIkhafCgnjjeKiy+/oiG/JtxErfjjWPRST9HaPZYbCdtvvnnegh4SEbso4Zfq
	QKMFgzRggWyw==
X-Received: by 2002:a05:6808:c3cc:b0:479:faf5:ef4c with SMTP id 5614622812f47-4896ac58f84mr134651b6e.32.1781801438488;
        Thu, 18 Jun 2026 09:50:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::8b4b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dda5ee5sm8732987b6e.2.2026.06.18.09.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:50:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 2/5] classes-global/sstate: Keep SPDX generating setscene dependencies
Date: Thu, 18 Jun 2026 09:38:42 -0600
Message-ID: <20260618165032.347436-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618165032.347436-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260618165032.347436-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239092

Tasks that create SPDX documents can reference SPDX ids from documents
created by any task they depend on. When it comes time to create the
final SBoM, these referenced SPDX ids must be present so that they can
be merged into the SBoM. Specifically, when a task that restores from
sstate (a setscene task) is one that can create an SPDX document, and
that task is depended on by at least one other task that can create an
SPDX document, it must always be restored.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/sstate.bbclass | 38 ++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 50dd0e51c4..833b78b870 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1115,11 +1115,28 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_create_recipe_spdx", "do_deploy_archives"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_deploy_archives"]
+
+    # SPDX tasks are only needed if depended on directly, unless they are
+    # needed by another task that is creating SPDX documents
+    SPDX_TASKS = {"do_create_spdx", "do_create_recipe_spdx", "do_create_package_spdx"}
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
 
+    def isSpdxTask(key):
+        taskname = taskdependees[key][1]
+        # Tasks that start with "do_deploy" might be included in
+        # SPDX_DEPLOY_TASKS and should be kept
+        if taskname.startswith("do_deploy"):
+            return True
+
+        # Tasks that are don't start with do_deploy, but still deploy SPDX data
+        if taskname in {"do_image_complete", "do_populate_sdk", "do_populate_sdk_ext"}:
+            return True
+
+        return taskname in SPDX_TASKS
+
     # We only need to trigger deploy_source_date_epoch through direct dependencies
     if taskdependees[task][1] in directtasks:
         return True
@@ -1132,6 +1149,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
                 return False
         return True
 
+    spdx_deps = []
+
     for dep in taskdependees:
         logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
         if task == dep:
@@ -1188,12 +1207,27 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # Target populate_sysroot need their dependencies
             return False
 
-        if taskdependees[dep][1] in directtasks:
+        # Collect dependees that create SPDX documents
+        if isSpdxTask(dep):
+            spdx_deps.append(dep)
+            continue
+
+        if taskdependees[dep][1] in directtasks or taskdependees[dep][1] in SPDX_TASKS:
             continue
 
         # Safe fallthrough default
         logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
         return False
+
+    # SPDX generating tasks can refer to the SPDXID from the SPDX output of
+    # their dependencies. Therefore if the current task can generate SPDX and
+    # is depended on by another SPDX generating task, it must be kept so that
+    # the IDs can be correctly resolved when merging SPDX output into a
+    # complete SBoM
+    if spdx_deps and isSpdxTask(task):
+        logit(f"Keeping SPDX task {taskdependees[task]} needed by SPDX task(s) {', '.join(str(taskdependees[k]) for k in spdx_deps)}", log)
+        return False
+
     return True
 
 addhandler sstate_eventhandler
-- 
2.54.0


