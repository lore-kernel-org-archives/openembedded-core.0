Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6652AC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:54:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.14487.1708613649939340084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BAOIB+dc;
 spf=pass (domain: baylibre.com, ip: 209.85.216.48, mailfrom: pidge@baylibre.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-299dba8fd24so2371469a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708613649; x=1709218449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbSbCnHGoa9s9Kx3mlCOrxXN31Y3UBWwiF72ad7qz04=;
        b=BAOIB+dcz6q/TXQtUcKB/yejsaD0BcNJ0oXRSckfIC6kTE9NNMghZtB3hCgV0O1HfU
         x/ku3h3EdaTHv637DUFSfIjYCtNKmRKD3NTRXM7yjSpTRtNsnCHGhbsd9z9XT1naJcz0
         /16a2L23mS0mWtfbognv56dIbp9MPm4SrrBxahb8H6MqBPj1AtaDchqDLkFhJc4bR7Co
         849xRIU/UG8tMwOZ4bnGVIcInfQFk7qR0dfQ2WSnmN8TUMm6VdFr2nXtMu3NuNJYXTbI
         CQp7Oysgz07SBOUMWXhDOUtGI56fzMufbo29qa7CvxlqmkTtMlFsKCAXg71YCH1G9LaC
         6Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708613649; x=1709218449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbSbCnHGoa9s9Kx3mlCOrxXN31Y3UBWwiF72ad7qz04=;
        b=F+14IQvkOrX2o63Kcn0+O0vwwHvGyd3iMTWnsAGhtCuTPz55ELgj3I+H3xu3zIlLh3
         9LquYMYkHGpXs2XhzcdKtpyBfTBdZhDQAPiIvOi6m5b4wKZa47McNJE2RMEcZgqAwhZO
         UMary6Eq1r0wOcqTlL0Yb0N3mrGtlpgsa2BzO3/fF8xl7rdLn/77hM6xBjG94zIUGU0B
         UjIsi5VQ6n9SGA4A5oP/Jdhv+Jc9esBImk9yee011zPsSwImvisMcQdXgZxEkHTx/9SA
         2g1hyL7QyiJV5OEZWTC4nleD8lV5wVBUcft0pv8nFRNeuOK4RrVKRRjZHItufQTQU+eX
         8GVg==
X-Gm-Message-State: AOJu0Yy8lYgmDnqYjq9D/rNeDrbEJJpoStHYc7hrWslBqDg2a75K8QKe
	vDAYaDb//S/i4JXgDEV03yceX1OHHnQARw395L60TmObDBa3eB7AXAMv6QNohhGqphXD3E0fs3X
	EkL4=
X-Google-Smtp-Source: AGHT+IGIYbEfvP08ccOXeij9u2DSC4jlFuekx7YbTccNwpq+895qTV89berrhiOjMP8GUCbhxVJniQ==
X-Received: by 2002:a17:90a:3482:b0:299:3990:4e11 with SMTP id p2-20020a17090a348200b0029939904e11mr16107157pjb.34.1708613649388;
        Thu, 22 Feb 2024 06:54:09 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id sz5-20020a17090b2d4500b00298cc4c56cdsm4067410pjb.22.2024.02.22.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:54:09 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 1/3] useradd.bbclass: Fix order of postinst-useradd-*
Date: Thu, 22 Feb 2024 14:53:54 +0000
Message-Id: <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708613381.git.pidge@baylibre.com>
References: <cover.1708613381.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196031

From: Piotr Łobacz <p.lobacz@welotec.com>

postinst-useradd-* haven't been running in order of dependency.

This patch is reworked from Piotr Łobacz's patch and fixes:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15084
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13904

It ensures that groups, users and groupmems are all run in the correct order.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/classes-global/staging.bbclass |  7 +--
 meta/classes/useradd.bbclass        | 72 ++++++++++++++++++-----------
 2 files changed, 49 insertions(+), 30 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index ab3e1d71b5..6c21510377 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -245,8 +245,9 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
                         continue
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
-    for p in postinsts:
-        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
+    bb.warn(sorted(postinsts))
+    for p in sorted(postinsts):
+        bb.warn("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
 #
 # Manifests here are complicated. The main sysroot area has the unpacked sstate
@@ -629,7 +630,7 @@ python extend_recipe_sysroot() {
     for f in fixme:
         staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)
 
-    for p in postinsts:
+    for p in sorted(postinsts):
         bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
     for dep in manifests:
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a58f8287c9..924eeadf9c 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -103,6 +103,18 @@ fi
 }
 
 useradd_sysroot () {
+	user_group_groupmems_add_sysroot user
+}
+
+groupadd_sysroot () {
+	user_group_groupmems_add_sysroot group
+}
+
+groupmemsadd_sysroot () {
+	user_group_groupmems_add_sysroot groupmems
+}
+
+user_group_groupmems_add_sysroot () {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_setscene) be running 
 	# at this point so we're explicit about the environment so pseudo can load if 
 	# not already present.
@@ -130,10 +142,19 @@ useradd_sysroot () {
 		exit 0
 	fi
 
-	# Add groups and users defined for all recipe packages
-	GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
-	USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
-	GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
+ 	# Add groups and users defined for all recipe packages
+	if test "x$1" = "xgroup"; then
+		GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
+	fi
+	if test "x$1" = "xuser"; then
+		USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
+	fi
+	if test "x$1" = "xgroupmems"; then
+		GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
+	fi
+	if test "x$1" = "x"; then
+		bbwarn "missing type of passwd db action"
+    fi		
 
 	# Tell the system to use the environment vars
 	UA_SYSROOT=1
@@ -148,29 +169,26 @@ useradd_sysroot () {
 EXTRA_STAGING_FIXMES += "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
 
 python useradd_sysroot_sstate () {
-    scriptfile = None
-    task = d.getVar("BB_CURRENTTASK")
-    if task == "package_setscene":
-        bb.build.exec_func("useradd_sysroot", d)
-    elif task == "prepare_recipe_sysroot":
-        # Used to update this recipe's own sysroot so the user/groups are available to do_install
-
-        # If do_populate_sysroot is triggered and we write the file here, there would be an overlapping
-        # files. See usergrouptests.UserGroupTests.test_add_task_between_p_sysroot_and_package
-        scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}-recipedebug")
-
-        bb.build.exec_func("useradd_sysroot", d)
-    elif task == "populate_sysroot":
-        # Used when installed in dependent task sysroots
-        scriptfile = d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-useradd-${PN}")
-
-    if scriptfile:
-        bb.utils.mkdirhier(os.path.dirname(scriptfile))
-        with open(scriptfile, 'w') as script:
-            script.write("#!/bin/sh -e\n")
-            bb.data.emit_func("useradd_sysroot", script, d)
-            script.write("useradd_sysroot\n")
-        os.chmod(scriptfile, 0o755)
+    for type, sort_prefix in [("group", "01"), ("user", "02"), ("groupmems", "03")]:
+        scriptfile = None
+        task = d.getVar("BB_CURRENTTASK")
+        if task == "package_setscene":
+            bb.build.exec_func(f"{type}add_sysroot", d)
+        elif task == "prepare_recipe_sysroot":
+            # Used to update this recipe's own sysroot so the user/groups are available to do_install
+            scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/" f"postinst-useradd-{sort_prefix}{type}" "-${PN}")
+            bb.build.exec_func(f"{type}add_sysroot", d)
+        elif task == "populate_sysroot":
+            # Used when installed in dependent task sysroots
+            scriptfile = d.expand("${SYSROOT_DESTDIR}${bindir}/" f"postinst-useradd-{sort_prefix}{type}" "-${PN}")
+    
+        if scriptfile:
+            bb.utils.mkdirhier(os.path.dirname(scriptfile))
+            with open(scriptfile, 'w') as script:
+                script.write("#!/bin/sh\n")
+                bb.data.emit_func(f"{type}add_sysroot", script, d)
+                script.write(f"{type}add_sysroot\n")
+            os.chmod(scriptfile, 0o755)
 }
 
 do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
-- 
2.34.1


