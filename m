Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CF1CE8D6E
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:10:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16172.1726740630059991033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Op4x3iAT;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: pmi183@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374c6187b6eso376939f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726740628; x=1727345428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUTrk3qIyFABeMP99l5bBd4fQiQcm41OjwIo5qXzeh0=;
        b=Op4x3iATLLUz8P6chZcDMMxEobNcyOBX2rJ6MSGGYOrsfxSYa7XyH1W+GO5QAAJm5/
         BwBM1FdDg/0HLg5wh2KyjhJIYL8OEEvWfYlVy7VHTFvdG3px8a7sULWF43MtLkEGOcva
         L2FFMzTpa+tvPz1hL5c4oSETcXU76iWAguugNNKOcaubOsOz93Z7ajJPeU9lCwj2oESN
         gWnK9OM0RDwUs3K4bSjbZxIati3o2QNN8gk7aasc0tRJV0n2LWWIi3Y+JDdERcPVcPoD
         1IgXNwD2WuOtYKtIqUVYc5zNDXf5q3UVRZgIiuNPlqVcrJEu2sFoFuHSeFSzWIBmuzNq
         jZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740628; x=1727345428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUTrk3qIyFABeMP99l5bBd4fQiQcm41OjwIo5qXzeh0=;
        b=fmfGGAo1QvO56xdoB+DvLuBTCxuqi12tsrVeZtlTJRMYmi24gCAwL5aEUIITY2H9uR
         Hjq3c0qJ7+nbzCqfuu5P6FwTf2QlgGN8ZuucweEqmZKeddm8yNiwLC9WL9VTvOncAZuZ
         lKbAD6ZyqXJJ/T/gDg9e8JQk0f8BSKGpSb0Fe3MGFoiWiN/SsW65gvd0Z1+EzcDBpm8+
         fVCkQ+bh/yK5IoP5ag6feIT9kzpkklIORAQUlsfJc2+Q7Z7bGBmmqo8kPwXMi0jIsDxv
         xMOZkguvGlfs4ldYkRFNMET4o+F3JgNyST+jXVIe+vtp1l3k/8cR/pc7x5YXy++RXOT1
         nrUQ==
X-Gm-Message-State: AOJu0Yzy1I6ILjczY9351DqTApzcc0qZue0VT6T8NiNbSEVSwNqTwESq
	DTujlTVAGpxI9ZMFstq0nKMGYzzNNLGGfsdBVrZ9SaK8gtIe92bYCwGZZg==
X-Google-Smtp-Source: AGHT+IEIXE0RX2su3QeNeFI0hFbJD3q6JC/BdDoVeKm985nsES0XYPqlxCyxA2S9jA29Lf8hIPvfpg==
X-Received: by 2002:adf:cd8b:0:b0:371:8cc3:3995 with SMTP id ffacd0b85a97d-378c2d12497mr15257955f8f.34.1726740628298;
        Thu, 19 Sep 2024 03:10:28 -0700 (PDT)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7805193sm14561716f8f.98.2024.09.19.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:10:27 -0700 (PDT)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v3 3/3] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Thu, 19 Sep 2024 11:10:20 +0100
Message-Id: <20240919101020.2858204-3-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919101020.2858204-1-pmi183@gmail.com>
References: <20240919101020.2858204-1-pmi183@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204669

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


