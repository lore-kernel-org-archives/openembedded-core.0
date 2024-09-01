Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E19C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 14:30:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.17397.1725201047828845817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 07:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ViKuywCD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c2b0707fso517622f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725201045; x=1725805845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sozMA1Z6B7C+sZqVN1ihL/E0BCDKt60w/349dSsxnLY=;
        b=ViKuywCDiSn4wSt+ChML3XDdU8FhrVT7/wzTkMYIkszP9F0oMMVz1hL+rCTF9KrfR7
         vb1czsUaXwRUVF3O3MuwMu8cCvF8ud4qXgr3emhrXppLxOiULgPATt+nYbYbGlXlzE0j
         zTrtfZJ9I5ysvI8o7uPcDeQwR80tU7H3I4Z5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725201045; x=1725805845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sozMA1Z6B7C+sZqVN1ihL/E0BCDKt60w/349dSsxnLY=;
        b=w9qMvo9IZ9I+Nwxw9Q8eVianc08OTnLBxHSg7NsyaYS7O+XxmsqfeeeWWfgDCsf5+k
         +ofrt95s91VSKUS4FLO0b/zeSf2CE2weUWRQZiZzw54LdEyzKIVfKXa+Bw/aKEW/zk9Q
         3nh3aaM1KlcddfXtyq/dNMTGM0vfb39VAQLi9QvRXgHoh4sP/dnCYvzsEAamIRl6vrrP
         /u2zD3fpw4URcMbNGiEZq0+dCbS42B9/uIgRCj7GPWBC/JY9Sqp/FG9e7aS4XwrII9OE
         4Qht7FWUVfaE5Bgn8tk2mdKfed5dGRSsQnLl3wxbhsN+WPeIG9LVNSmlnJAzqZqhZOUF
         NBtg==
X-Gm-Message-State: AOJu0YwrZc+scMqlPzY7Z2BKT6qvmMoSjpOtofQwn3gAZlhF3unYeLmD
	a3a/GUbwjyGY0HVic/v9v/q20EolSBbrwNb+cxaIeasAPmvtUbjwPsIeoGBB11zJAbgB4jrIm2z
	W
X-Google-Smtp-Source: AGHT+IH7wIJTUgdoOV07HfMT/aATN2b0EQZzr6qs0eLU7sS0zL01/REWObpSR6P1zPNJJQcjFrX+LQ==
X-Received: by 2002:a05:6000:d8b:b0:374:c3a3:1f4f with SMTP id ffacd0b85a97d-374c945c72bmr685383f8f.24.1725201045048;
        Sun, 01 Sep 2024 07:30:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d8a8:ecc:6edb:f5dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1cc8163sm3564487f8f.100.2024.09.01.07.30.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 07:30:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Sun,  1 Sep 2024 15:30:42 +0100
Message-ID: <20240901143043.172081-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 14:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204048

We planned to drop SSTATEPOSTINSTFUNC some time ago with the introduction of
postfuncs. Finally get around to doing that which should make the buildhistory
code a little more readable.

Unfortunately ordering the buildhistory function calls after the sstate ones is
difficult without coding that into the sstate class. This patch does that to
ensure everything functions as expected until we can find a better way. This is
still likely preferable than the generic sstate postfuncs support since the function
flow is much more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass |  5 +++-
 meta/classes/buildhistory.bbclass  | 39 +++++++++++++++---------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index fdd529ee4e8..586757afbd5 100644
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
index bac2abdab0f..ce3abaa69d4 100644
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

