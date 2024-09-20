Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFCAC7884A
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.18280.1726839577460006727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P02OPNhI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71971d20a95so1496057b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839577; x=1727444377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFNrE0Hp08ElZR2987IkLV12YVZ/iCMoGcgURpo+qGE=;
        b=P02OPNhIKgrB86OPCkWpzzpIx2WWd3PKgbBoCx8DifSCMUeqgBOmu0xMvthIXfrJSg
         HS3GsM4y3gdJtBYnmDEOxqiW7V2FGpbgvoRl0OfbF/TgZVIuxPy/+/IZF1mHIzCX04Ta
         hMbs57167VkpfWv+qUlK1k40QIHHWzFZIaAuYgCjB7MoQI1lWCbiqznBq0IWiCZ9S+6n
         TZj6MLOiK2Pw9koXcBDaM3pLNlysD9kxvAwpnW2ReOILN5t0tvMq2k55GEWFO45AcxpT
         3h5PtFEXdzuAPDftbNdu7VGEg4NLyShnSwv6VUAiJY1/nBG/WXdDhUhAnSeGNvPGfzC4
         omfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839577; x=1727444377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFNrE0Hp08ElZR2987IkLV12YVZ/iCMoGcgURpo+qGE=;
        b=KWQKY0vWF8cTlw7ZKX04vIjmyyn8wYdTUlAT9WUmhX+xQLVK36W0YT62eq6Z4nB3P3
         Q0Gy5UVOk5POvtODMrdKTpQlU80VE48v78WgCxQdECn1BJSThuoFkGzW8QE8ccy1emkj
         JThT423eNnNgiWL5vJqkh4gkXYc3EnPe7AKoDY+z73LLIZLJgv3voJhCV1tw9tCcOTsH
         Icw1aoRQCrLAEaORu/YSwkd0VSFakl/arERZXcWCBnNncXyu7AEkIkC5Z6HjQpjskmMy
         HyFr9uw5FUlWR/ASpbsEpZJY8vD1Q6nD7Reda53Y0eRwHCMcHQ2g7XTK8GHiw16nZ2nO
         pyHQ==
X-Gm-Message-State: AOJu0Ywfyh2xPQ1vFeCppSnYmn+Cw9A7Tmo4Ge3/zn02Ta5MCC72r1yM
	ux8kow8IYsFhnuZpOltbgCQQYU5DzovbbzyrFmbX4LSPn5MEdk0ahCHhe/RenDYQtycwZ5uZ3c+
	o
X-Google-Smtp-Source: AGHT+IH2WPMggJgu0mLw/1AkYHD1MS12kEt0DRJncuyd3UNMeqnrpD54ZAVhJR7/x/dlfeywmBCV2Q==
X-Received: by 2002:a05:6a00:c82:b0:714:173f:7e6b with SMTP id d2e1a72fcca58-7199c9395d7mr4083660b3a.2.1726839576580;
        Fri, 20 Sep 2024 06:39:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/16] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Fri, 20 Sep 2024 06:39:07 -0700
Message-Id: <466c505b779dec2ba790f4e6cde7fbb35037f4ef.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204748

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We planned to drop SSTATEPOSTINSTFUNC some time ago with the introduction of
postfuncs. Finally get around to doing that which should make the buildhistory
code a little more readable.

Unfortunately ordering the buildhistory function calls after the sstate ones is
difficult without coding that into the sstate class. This patch does that to
ensure everything functions as expected until we can find a better way. This is
still likely preferable than the generic sstate postfuncs support since the function
flow is much more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9e2a8fa2f0305ef1247ec405555612326f798f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass |  5 +++-
 meta/classes/buildhistory.bbclass  | 39 +++++++++++++++---------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 76a7b59636..93df5fa9e6 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -161,7 +161,10 @@ python () {
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
     for task in unique_tasks:
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
-        d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
+        # Generally sstate should be last, execpt for buildhistory functions
+        postfuncs = (d.getVarFlag(task, 'postfuncs') or "").split()
+        newpostfuncs = [p for p in postfuncs if "buildhistory" not in p] + ["sstate_task_postfunc"] + [p for p in postfuncs if "buildhistory" in p]
+        d.setVarFlag(task, 'postfuncs', " ".join(newpostfuncs))
         d.setVarFlag(task, 'network', '1')
         d.setVarFlag(task + "_setscene", 'network', '1')
 }
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 08970aafea..0b1bd518fe 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -47,11 +47,18 @@ BUILDHISTORY_PUSH_REPO ?= ""
 BUILDHISTORY_TAG ?= "build"
 BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
 
-SSTATEPOSTINSTFUNCS:append = " buildhistory_emit_pkghistory"
-# We want to avoid influencing the signatures of sstate tasks - first the function itself:
-sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
-# then the value added to SSTATEPOSTINSTFUNCS:
-SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
+# We want to avoid influencing the signatures of the task so use vardepsexclude
+do_populate_sysroot[postfuncs] += "buildhistory_emit_sysroot"
+do_populate_sysroot_setscene[postfuncs] += "buildhistory_emit_sysroot"
+do_populate_sysroot[vardepsexclude] += "buildhistory_emit_sysroot"
+
+do_package[postfuncs] += "buildhistory_list_pkg_files"
+do_package_setscene[postfuncs] += "buildhistory_list_pkg_files"
+do_package[vardepsexclude] += "buildhistory_list_pkg_files"
+
+do_packagedata[postfuncs] += "buildhistory_emit_pkghistory"
+do_packagedata_setscene[postfuncs] += "buildhistory_emit_pkghistory"
+do_packagedata[vardepsexclude] += "buildhistory_emit_pkghistory"
 
 # Similarly for our function that gets the output signatures
 SSTATEPOSTUNPACKFUNCS:append = " buildhistory_emit_outputsigs"
@@ -91,27 +98,15 @@ buildhistory_emit_sysroot() {
 # Write out metadata about this package for comparison when writing future packages
 #
 python buildhistory_emit_pkghistory() {
-    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
-        bb.build.exec_func("buildhistory_emit_sysroot", d)
-        return 0
-
-    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
-        return 0
-
-    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
-        # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
-        bb.build.exec_func("buildhistory_list_pkg_files", d)
-        return 0
-
-    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
-        return 0
-
     import re
     import json
     import shlex
     import errno
     import shutil
 
+    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
+        return 0
+
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
 
@@ -621,6 +616,10 @@ buildhistory_list_files_no_owners() {
 }
 
 buildhistory_list_pkg_files() {
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'package', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
 	# Create individual files-in-package for each recipe's package
 	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
 	for pkgdir in $pkgdirlist; do
-- 
2.34.1


