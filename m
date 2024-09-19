Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3345CCE8D6E
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:01:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.15924.1726740095549294113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lqv1Tbr/;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so5762285e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726740094; x=1727344894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYpCMJDGJfaAIW/C1TBUa08liIja3syGdWOjAvNeKqY=;
        b=Lqv1Tbr/Rma8zr8ymB8FA7bECTWJoQJR/07x828a/peqPZdtK+wHNh5TymMxr7KkL0
         2DldbKOzHkCsKMZIVGPakm2v5x203zEdxdaRTiKBRbqxYf/rWhaj8VKrxO9OOuCnFKhj
         2p2wAWD8JWebJB9hqtBcjfAji1/+SoMzcB0f43LTAF3K+b9CxufujwTZcoN1xGlLrW1M
         FStoDr+iVzLD44+VKmIRpjOMEjNKUkKWZ4DJtSHH+Q70OlB2atBYmXMgg14DAkP7z327
         JadhqQv5YSNvM0cpB1JqTQty+3nnwfwWWy9IY6ClMYrfEDwHsc8wXStckAKlVFJhD2jD
         X5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740094; x=1727344894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYpCMJDGJfaAIW/C1TBUa08liIja3syGdWOjAvNeKqY=;
        b=XHMdpz7xRIfO4UmYMmANnicK/nxchR9KKR3XK9q6lo6LcBcJeNp0daJwr+boGyc7hI
         2L7/OkrkACmrIOkGWm7QJflg1rkDm2ZblZpT6v4R/DB8ZPm5mLNNTQbqNMFlqwTCyjBB
         CtYc05b1U/Pt5Q1VkF5EnxCf7DlmWMD7qB2Zs9S0NWJnjftvtqHRM0BA3Dk6DCocjwM7
         taT2xpi4w4m7vb3xl+RY/NoqAMQieoN2j4ZVR7fCbmTFBIjJ8g87eAST9yZpOE6t7Gy3
         /2Wx4eefPt8xEMEUorFv3Y+mgKIRhazXuWUwji8oIg5gg4IPrTGb+9VZJ0BZm+vDdL5Z
         m9/w==
X-Gm-Message-State: AOJu0YzPcWSJu+GOcl68LZRn0bL4/mYYl7vaFX5PGfWQRPG4pwZLJDFd
	kFFN4S1C1vwqsSy7P3+1a5kfVJsW23WSsFJEzXW0vrjk7joSJM7nM3KbfU+j
X-Google-Smtp-Source: AGHT+IHFq5TylDqLlCMgnPE5jyEOTxgmJbYPDPk0YE6z+qTyDXzUbmzRUSHHb8jIJUuIl1y1uZPSaA==
X-Received: by 2002:a05:600c:4ecb:b0:42c:b3e5:f688 with SMTP id 5b1f17b1804b1-42cdb511c3fmr167482065e9.4.1726740093735;
        Thu, 19 Sep 2024 03:01:33 -0700 (PDT)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75452b8esm17679405e9.28.2024.09.19.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:01:33 -0700 (PDT)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v3 3/3] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Thu, 19 Sep 2024 11:01:27 +0100
Message-Id: <20240919100127.2857748-3-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919100127.2857748-1-pmi183@gmail.com>
References: <20240919100127.2857748-1-pmi183@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204664

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
---
 meta/classes/buildhistory.bbclass | 39 +++++++++++++++----------------
 meta/classes/sstate.bbclass       |  5 +++-
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8adb44eba5..83993f5752 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -45,11 +45,18 @@ BUILDHISTORY_PUSH_REPO ?= ""
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
@@ -89,27 +96,15 @@ buildhistory_emit_sysroot() {
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
 
@@ -619,6 +614,10 @@ buildhistory_list_files_no_owners() {
 }
 
 buildhistory_list_pkg_files() {
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'package', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
 	# Create individual files-in-package for each recipe's package
 	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
 	for pkgdir in $pkgdirlist; do
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index dd6cf12920..91d42665c1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -156,7 +156,10 @@ python () {
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
-- 
2.34.1


