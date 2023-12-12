Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B474C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 17:17:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2127.1702401437709104288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 09:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FrTL4G+b;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c41df5577so28754135e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 09:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702401436; x=1703006236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz5T0QU9mlG0kMbPtXkAc0KJmBeWJdDtXQAYPsiDKik=;
        b=FrTL4G+bES+/Z5jdJCsnBm7tgqC4sKf1HUSC4aLH0dtL0FyMegdRSHIOHBoVBElZgm
         8ZdjvTfnmek9RioVSYivsuxNMHFU3H180g/eaIq5g+6s9xRZ0lSuyil5iowkegawPSHU
         nqdw4V2q1/gTZ1hI67NIvtnZ7fSPSOnSaPGuQBKtI04P8iy+Uq1+v5WcN7mKpceyxjuh
         N7nC5z4iSK+vzF415nI26Kic8sbCvpSjSI7RYhAtUPSWrsLzRY7CmFzmnJ7L8ksEhBco
         8QQBms4x8ITDibW08X7cNFInGgCfJXegKzg23cggKlU8IS74lD5J08lrIVDPOYmZzZZT
         xzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702401436; x=1703006236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz5T0QU9mlG0kMbPtXkAc0KJmBeWJdDtXQAYPsiDKik=;
        b=uwkgf1uLe9H/7p7Fb6Y6hNntAP+r8OKv1mCuEbSpNAzpvO+mSkb/fYbNQYJjfCSPLr
         9l1wXqH/hjQDJjJDWGWwOlyfha63CTP/L/mAKWj7mUx5nTeQwzuhAP5Q3HxPhAwijLLT
         fmQxLiWE9bqNJDbEaUBl4HHp9zBGkFMS80x8HMy7g44YiGWadQT3HDn3d9BM0byvGXzV
         dZysdStE53wfb7I0CTtYh2+kye5vG2CKycFOWIE8hQE5zrixVxjpaoNdWrdyFLQjmHF1
         byFcGjc/d4x+pBuhvl0+NKKheW+HznZpx3FC9i4GwZszruCQv5hISsL55nL9eiVlv7yz
         GKpg==
X-Gm-Message-State: AOJu0YxLndnzoRd61xpyDy44eqHmNbi1Hm1R38TP8wEzhXqWVFyvsDDy
	DxHaSVGnm+eqowuBC9BOHrVvDjLriyKd121pQwbavQ==
X-Google-Smtp-Source: AGHT+IGcbFMoARHIDvdlyvQVOoJKtPGEfkG5bOSSUuLBXQFvRVdiPB/SUQmzzdLY03UMhCLi/3OSgA==
X-Received: by 2002:a05:600c:5106:b0:40c:2395:1faf with SMTP id o6-20020a05600c510600b0040c23951fafmr1783604wms.300.1702401435805;
        Tue, 12 Dec 2023 09:17:15 -0800 (PST)
Received: from localhost.localdomain ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c311100b0040c4535f1a2sm9286079wmo.39.2023.12.12.09.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 09:17:15 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 2/2] staging: ensure postinst-useradd is run in order
Date: Tue, 12 Dec 2023 17:17:11 +0000
Message-Id: <61e920d844db42f06c851db862e713fb6efd61d1.1702401361.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <add845338f015b4fce34a9e68a7be4ba304d74fa.1702401361.git.pidge@baylibre.com>
References: <add845338f015b4fce34a9e68a7be4ba304d74fa.1702401361.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 17:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192239

This patch is based off the work of Piotr Łobacz found here:
https://bugzilla.yoctoproject.org/attachment.cgi?id=4972&action=diff

The one issue with this is I'm not entirely certain that errors are
filtering up from postinsts, as the test for base-passwd's postinst
declares that if it's not found, we'll just call it later, but if so,
I'm not seeing where exactly that's happening.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/classes-global/staging.bbclass |  6 +--
 meta/classes/useradd.bbclass        | 74 ++++++++++++++++++-----------
 2 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index cf1e4600fd6..e879333aeb9 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -245,7 +245,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
                         continue
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
-    for p in postinsts:
+    for p in sorted(postinsts):
         subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
 
 #
@@ -629,9 +629,9 @@ python extend_recipe_sysroot() {
     for f in fixme:
         staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)
 
-    for p in postinsts:
+    for p in sorted(postinsts):
         subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
-
+        
     for dep in manifests:
         c = setscenedeps[dep][0]
         os.symlink(manifests[dep], depdir + "/" + c + ".complete")
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0997b3da7a5..b044b926d99 100644
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
+		exit 0
+	fi
 
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
-            script.write("#!/bin/sh\n")
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
@@ -235,7 +253,7 @@ fakeroot python populate_packages:prepend () {
         preinst = d.getVar('pkg_preinst:%s' % pkg) or d.getVar('pkg_preinst')
         if not preinst:
             preinst = '#!/bin/sh\n'
-        preinst += 'bbnote () {\n\techo "NOTE: $*"\n}\n'
+        preinst += 'set -e \n bbnote () {\n\techo "NOTE: $*"\n}\n'
         preinst += 'bbwarn () {\n\techo "WARNING: $*"\n}\n'
         preinst += 'bbfatal () {\n\techo "ERROR: $*"\n\texit 1\n}\n'
         preinst += 'perform_groupadd () {\n%s}\n' % d.getVar('perform_groupadd')
-- 
2.34.1


