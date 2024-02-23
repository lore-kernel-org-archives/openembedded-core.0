Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6764C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:25:47 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.10422.1708694739765506944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1Kyhjbxt;
 spf=pass (domain: baylibre.com, ip: 209.85.221.48, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33d26da3e15so267163f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 05:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708694738; x=1709299538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aph5P/Kv2AO23irQf6D2+R9rjXILBwXIKJcdwrJOByA=;
        b=1KyhjbxtDlun2Hoj6UydhbZCvDf9VKgqpvpyHn0wGZAtGcOg+eop+TR4hE/fy3yrJg
         8Ts4y1V8b9Q5MlqGAkTE7pBhyMLrU/UGb4DsoYKt6DEWE3fNhjDeclxdYdWaZV4yXwWy
         /WFEP0ZwUz9pSHHb5iH0lymn/nE7mvHGu5uKiS7tF887WHcpEJGgmwuFY9ZrRc5grdAk
         3hhTPG/f275zNgpLhPSdS08OrPScsV0VhajW0vUMDGmI1F+wyEpvPNSlgKQPncC1k7v6
         A65KoahAR+Vf6JBolgt3RlY2IDhQs4b+XEswk5AbjG+fPQXlm3I6s/t6z/cBk6s4vrGZ
         esPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708694738; x=1709299538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aph5P/Kv2AO23irQf6D2+R9rjXILBwXIKJcdwrJOByA=;
        b=BrVsqu9Uriuu0CjfHpB/3ca87zv8eKqQey2t0eQq90P8XDwFl2ltHlxVgERvOywsUD
         lzKY00kksx9edzvaOlZduCfqAKX2Y4dfbb4yOafu9605/XOKM654DTFcjghKcZI+Cf9x
         CX634ApboR/at/JFd4tG4xs2ZQD+IHfCwk1opdV1hB1l9ocwhdYZ7OrtXLw6iKyNknt5
         /zwW7TQtBGhyb+DIWqSsb9Fahbgth+XnB3M1oKuNfCUhEmyctdF3rmq2HhOdsi2MxSLO
         WMT771uHd4IsAuGKoTTP/9y6sJjzx9+7z07xOnbZRYw8TK70F2u2Tax261LOhIpEyHHA
         oFUw==
X-Gm-Message-State: AOJu0Yz7RkaOLgMJmQ7twl7GlqBd0g1dYDEDlPwUoaKcHxwvNya1FWfS
	pgY35nxBoVBCQu+Fw3F2SMqSW6eP7Th/9xMVQa8M0OYpwH1JpYpXp18Xgp3UDVLgaqbHwjY9rMb
	2i7Y=
X-Google-Smtp-Source: AGHT+IFHXGcMeGM8MnpOTAf0Q/igJf6bndHTc0caGoT017A3WgLKxpH8V0FpgKLGNECFyc6ZB8rR7A==
X-Received: by 2002:adf:e792:0:b0:33d:3896:be55 with SMTP id n18-20020adfe792000000b0033d3896be55mr1874144wrm.5.1708694738115;
        Fri, 23 Feb 2024 05:25:38 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b0033d3b8820f8sm2793450wrb.109.2024.02.23.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:25:37 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>,
	=?UTF-8?q?Jan=20G=C3=B3rski?= <j.gorski@welotec.com>
Subject: [PATCH v3 1/3] useradd.bbclass: Fix order of postinst-useradd-*
Date: Fri, 23 Feb 2024 13:25:20 +0000
Message-Id: <07eb596dd4e8cfc319add777a3069d6e50d33e56.1708694024.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708694024.git.pidge@baylibre.com>
References: <cover.1708694024.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196076

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
Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
Signed-off-by: Jan Górski <j.gorski@welotec.com>
---
 meta/classes-global/staging.bbclass |  4 +-
 meta/classes/useradd.bbclass        | 67 ++++++++++++++++++-----------
 2 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index ab3e1d71b52..3678a1b4415 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -245,7 +245,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
                         continue
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
-    for p in postinsts:
+    for p in sorted(postinsts):
         bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
 #
@@ -629,7 +629,7 @@ python extend_recipe_sysroot() {
     for f in fixme:
         staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)
 
-    for p in postinsts:
+    for p in sorted(postinsts):
         bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
     for dep in manifests:
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index f0ec0809203..198be82228b 100644
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
@@ -131,9 +143,15 @@ useradd_sysroot () {
 	fi
 
 	# Add groups and users defined for all recipe packages
-	GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
-	USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
-	GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
+	if test "$1" = "group"; then
+		GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
+	elif test "$1" = "user"; then
+		USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
+	elif test "$1" = "groupmems"; then
+		GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
+	elif test "x$1" = "x"; then
+		bbwarn "missing type of passwd db action"
+	fi
 
 	# Tell the system to use the environment vars
 	UA_SYSROOT=1
@@ -148,29 +166,26 @@ useradd_sysroot () {
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


