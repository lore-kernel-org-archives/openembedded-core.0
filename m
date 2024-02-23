Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D84C54E49
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:16:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8415.1708686975162009039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 03:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0E0l6+Ht;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4128cfb6c1aso4597655e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 03:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708686973; x=1709291773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2pr3YWlSALPUfjdWH6GytsJ3WX/yjsS6qDMImqQMS4=;
        b=0E0l6+HtMgbvps/0v4yY9OE/KUJ8iN7iSAo+8oZLZS1GPXRG6HCABNirznraI9hX4+
         1Y4r4pDu4ma647VfWXkkpCT2RkZU+WfYvyhio3a6poaY1Y+0caRull7jX/ODN91OQtEw
         FbkJ2ZNerNXxWfGhyEA6x+ck56jd0URLWAHJxWgwUcPPAC1/u/vNzAbmn1H+VLkZYEqS
         FF54VLej3B23SkEtmvhBx3SVH5FvOiUvJ+NWdCMaNUyDRSBfhC3bOvN02k/BhnXz8cqa
         BjyTqyRP5PLVJGOSx9xiHU9B1iDPWPo2hcxCTcU2/ClC0sGpVhhd0LA5iXk0vZGpaoHP
         22Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686973; x=1709291773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2pr3YWlSALPUfjdWH6GytsJ3WX/yjsS6qDMImqQMS4=;
        b=Ry1i7u/0MR6xju+zh8bI3Vj8MNlOMJKTAAZL6ruhpDAVIjVD3bhH0W0/nkUfOr54uh
         Oi7EFYQAFCz7Lhbr1+yz2BOHfwPU9GzXs9nqJwXR7mhb9CDytyLTjxWtB3/eGP1sbGve
         opTr0MJiSVkkeRaNfDRsg8Fq+k0F7+OS5CM9GsCEhZczbIKhB26Km5efREd48jXN5sZw
         8Q3xD/BSl1ViF5ZGI/yMxkmOcrCgba80VRpuOAavhi8JEom1s9coYe6PMHJkvp5ft/sL
         UhFg/4ZfNYq+ry5tE8ZQonEgJdUXoWJDR/D5v5y7oYtT5p2Q3afyrKAZYBYKGvx+bI1O
         AxLQ==
X-Gm-Message-State: AOJu0YyxnIyqGCNXXHnPV9m+evwg4Cw4nDuC+EivL7zCagTKaTScbxCi
	Bkcvg9LxzCE5o/U4MSFcYm5bUzZ7ySny8SWiZdUc+eiNXiJXKR1IFvXcd1ywF3XT96UujA6l24b
	pOBk=
X-Google-Smtp-Source: AGHT+IEFy3QTl3htyMLkw4XD8hjkgVgpKSkuCsDVfEq/SL3/xYG/gDlZw5f/IHfMqW4xmefE/8sNLw==
X-Received: by 2002:a05:600c:350c:b0:410:78fb:bed2 with SMTP id h12-20020a05600c350c00b0041078fbbed2mr1548077wmq.19.1708686973518;
        Fri, 23 Feb 2024 03:16:13 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id jd17-20020a05600c68d100b004129335947fsm1895094wmb.8.2024.02.23.03.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 03:16:13 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v2 1/3] useradd.bbclass: Fix order of postinst-useradd-*
Date: Fri, 23 Feb 2024 11:16:02 +0000
Message-Id: <5ffe6e8ddd120cd6ac113fd2cf5d1e557974f64e.1708686845.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708686845.git.pidge@baylibre.com>
References: <cover.1708686845.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 11:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196057

From: Piotr Łobacz <p.lobacz@welotec.com>

postinst-useradd-* haven't been running in order of dependency.

This patch is reworked from Piotr Łobacz's patch and fixes:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15084
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13904

basepasswd_sysroot_postinst in base-passwd can install postinst-useradd-*
scripts with any order. Sometimes this means, for example a useradd postinst
will attempt to run without the corresponding group postinst causing errors.
This patch ensures that we first run groupadd, then useradd and then
group membership.

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


