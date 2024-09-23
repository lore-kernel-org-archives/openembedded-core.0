Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1685ACF9C7A
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:24 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.36186.1727097261652709643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GUVB8DPK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71798661a52so3178011b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097261; x=1727702061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4s6TJGXaq5aHV7P0kBjnaXyXHOgWtWdlOyV/EjQ0SE=;
        b=GUVB8DPKjp65K4/hZro94XY10o1E/YDw0PumnSwhVnUuujdztQWogI8+Nw2rW+9m0K
         V2tkXHiTEvXLppqlEJ+sE0xLyLLw5uZNisdWPmbZX8VD2xNOL7V5VNuu5S773Rk33XHf
         QsllHr1yoRmab6G/uwlmbfj3uR70eJzoSSVG7U+zr7roX4HeYHVaV74wqgN8/2ym1jSX
         5eXE0otGyjWzyhGzjwxDuC7+fVv+h5JEYgrplS622xZgKMYf6h7ZUXY13px9AV/u/NtN
         F9oPfnsJ3WOVy4vFsiJVeV+s8c1yyXNJq+nd1+mxE9kTBMPm3Lh8tMqbBDNaO8PvA3qH
         zQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097261; x=1727702061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4s6TJGXaq5aHV7P0kBjnaXyXHOgWtWdlOyV/EjQ0SE=;
        b=ozqk+c7HkmkPGoGgyax8OSVybm4kN0bePfnkVbFd2P9MobTeGpVQgA6/dMpZRkiLxw
         rPgEBFi7QcjcaG+pAg3TZpmC+hRIJQdc5dYOoP/ERmkLR4Dp++fkQjgL4QB3Xg+j6mMF
         3zIGCvMnK/NFZqqucCuhv9KvBdnzs5Tca2E4Rdnij/+lfFRxSvBTZ3LSA+mLAxjeiAiW
         S5XOCDQzowKudqCDQldvl1ChGsxaova56p/xmr0CB+k7cmopMfWsdx9YIrlOjtQ87+oo
         jInTKrQAoi0aQSNm5v0r/KFvcPJ2HVDE8kxoovBIELtVj5kOVmu+lN76cTaDMVSg+kny
         P6PQ==
X-Gm-Message-State: AOJu0YyXluiOyqp49Hnyl+LjgOAQAEaC6WQcOi65/kO68wbj0Mc+UnG2
	3IPvw+AayBOLcM2XJM99yNA8/K4w469CKKSjxN80ailXwAXE2aphZuZ7huktAwJVD7cSNIahdJl
	W8UM=
X-Google-Smtp-Source: AGHT+IEyAZuGCstfJq6fvRreY+15dqtz05VDqK+d0FjhomoLm8QGbKLQlT1lf3UjWftHPV1573PDzQ==
X-Received: by 2002:a05:6a00:9292:b0:707:fa61:1c6a with SMTP id d2e1a72fcca58-7199b12a28amr18142947b3a.10.1727097260814;
        Mon, 23 Sep 2024 06:14:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Mon, 23 Sep 2024 06:13:52 -0700
Message-Id: <78ca086441b21dedd9c471a3d3200c24fd9ec8d2.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204817

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


