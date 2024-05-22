Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB7AC25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:28:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.5832.1716370100765728480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QlkjNNjo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41fd5dc0480so39059685e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716370099; x=1716974899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HO2u5ASUXtbMB1XvwpcMhkfDOsPmjeV2MAbIoEifP6w=;
        b=QlkjNNjoSuLGJUWIRdZ+hVBOgutRUAqSBpkgiwXUKQ166rBKvGs+kLcEb8+S+0/yp7
         mYtqGSs5hoOVxOyHhaLKC6j6gsNwMU+jmqsmy7RizPIcVMltQWYccSFaVpo3AujYVE+w
         ir547XuV/BonHP/0332x6D4nYjOSF5AaQeeO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370099; x=1716974899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HO2u5ASUXtbMB1XvwpcMhkfDOsPmjeV2MAbIoEifP6w=;
        b=fKgkOJZ8wId3leMlZ2Fw0kJvD0DKhk3v+uLN6RvEKgL3v6DNkp+xF05AeUEVgmGSZx
         eghqQqlOsQeghzrG7Aph7Xv4CpInU2vWuPfph9mFb7mLi0aOJJrRfDY4/mXB6LM3X4cu
         vydTemAkqYJDx+a2O1YLGJa372mehOdtSXv+YzgCTPzdMqi5fbFE+nyjtuIcO5glQ1PJ
         raSFhRszwMpkfHmbkmI1bDwmgMr3Di/0NCjhm3W5ZG/J+h6O30HNrG7rWgYvUTw8SlHm
         7Hl4BFySfHtu4OBWqRDe7gdjbWrwYFRxIbUkAZ3ovXYxQrBEqnpzZBL2h3C3KXWWNKu2
         1frw==
X-Gm-Message-State: AOJu0YxdEhOmQdLJTKNJAfo5k5TV2WBi/i4dLNNFlvPStRfzk/WfNeN0
	7mZQEa3CvJKtbXSKIXMwKLBtKdiJ11E8hMv2mEaGK4aVNs5oD3+/Ehkr5tG+fRjjCXxmTyp2z2o
	Lklk=
X-Google-Smtp-Source: AGHT+IG+hcwkJRrFkOpvRf+l64afSJ2yjZ3wCWpCRXRN7JBab1Lv0JEB5sjkfLJxkK2dVD2pYfAYVw==
X-Received: by 2002:a7b:cb44:0:b0:41b:ab72:3f4d with SMTP id 5b1f17b1804b1-420fd2d6eb5mr10033105e9.1.1716370098693;
        Wed, 22 May 2024 02:28:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe36f373fsm470058385e9.20.2024.05.22.02.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 02:28:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] base: Switch UNPACKDIR to a subdir of WORKDIR
Date: Wed, 22 May 2024 10:28:15 +0100
Message-Id: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199738

Change do_unpack to unpack files to a subdirectory of WORKDIR instead of WORKDIR
itself. There are several good reasons for this but it is mainly about being able
to isolate the output of the unpack task and tell the files apart from other things
which are created in workdir (logs, sysroots, temp dirs and more).

This means that when the do_unpack task reruns, we can clean UNPACKDIR and know
we have a standard point to start builds from.

It also makes code in tools like devtool and recipetool easier.

To reduce the impact to users, if a subdirectory under UNPACKDIR matches
the first subdirectory under WORKDIR of S, that directory is moved into position
inside WORKDIR. This preserves the behaviour of S = "${WORKDIR}/git",
S = "${WORKDIR}/${BPN}" and other commonly used source directory setups.

The directory is moved since sadly many autotools based projects can't cope with
symlinks in their paths.

The patch also updates reproducible and SOURCE_DATE_EPOCH handling to
match the new potential source locations. We can get rid of the horrible
list of hardcoded directories in WORKDIR to ignore from that code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 28 +++++++++++++++++++++++-----
 meta/conf/bitbake.conf           |  2 +-
 meta/lib/oe/reproducible.py      | 19 ++++++++++---------
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 066f3848f7c..13e91b24a3b 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -153,20 +153,38 @@ python base_do_fetch() {
 }
 
 addtask unpack after do_fetch
-do_unpack[dirs] = "${UNPACKDIR}"
-
-do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
+do_unpack[cleandirs] = "${UNPACKDIR}"
 
 python base_do_unpack() {
+    import shutil
+
+    sourcedir = d.getVar('S')
+    # Intentionally keep SOURCE_BASEDIR internal to the task just for SDE
+    d.setVar("SOURCE_BASEDIR", sourcedir)
+
     src_uri = (d.getVar('SRC_URI') or "").split()
     if not src_uri:
         return
 
+    basedir = None
+    unpackdir = d.getVar('UNPACKDIR')
+    workdir = d.getVar('WORKDIR')
+    if sourcedir.startswith(workdir) and not sourcedir.startswith(unpackdir):
+        basedir = sourcedir.replace(workdir, '').strip("/").split('/')[0]
+        if basedir:
+            bb.utils.remove(workdir + '/' + basedir, True)
+            d.setVar("SOURCE_BASEDIR", workdir + '/' + basedir)
+
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('UNPACKDIR'))
     except bb.fetch2.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
+
+    if basedir and os.path.exists(unpackdir + '/' + basedir):
+        # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${BP}
+        # as often used in S work as expected.
+        shutil.move(unpackdir + '/' + basedir, workdir + '/' + basedir)
 }
 
 SSTATETASKS += "do_deploy_source_date_epoch"
@@ -199,8 +217,8 @@ addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
 python create_source_date_epoch_stamp() {
-    # Version: 1
-    source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
+    # Version: 2
+    source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('SOURCE_BASEDIR') or d.getVar('S'))
     oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
 }
 do_unpack[postfuncs] += "create_source_date_epoch_stamp"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b2c500d8739..75c850760f6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -405,7 +405,7 @@ STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
-UNPACKDIR ??= "${WORKDIR}"
+UNPACKDIR ??= "${WORKDIR}/sources-unpack"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index a9f717159e3..1957c974347 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -75,10 +75,10 @@ def get_source_date_epoch_from_known_files(d, sourcedir):
     return source_date_epoch
 
 def find_git_folder(d, sourcedir):
-    # First guess: WORKDIR/git
+    # First guess: UNPACKDIR/git
     # This is the default git fetcher unpack path
-    workdir = d.getVar('WORKDIR')
-    gitpath = os.path.join(workdir, "git/.git")
+    unpackdir = d.getVar('UNPACKDIR')
+    gitpath = os.path.join(unpackdir, "git/.git")
     if os.path.isdir(gitpath):
         return gitpath
 
@@ -88,15 +88,16 @@ def find_git_folder(d, sourcedir):
         return gitpath
 
     # Perhaps there was a subpath or destsuffix specified.
-    # Go looking in the WORKDIR
-    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
-                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
-    for root, dirs, files in os.walk(workdir, topdown=True):
-        dirs[:] = [d for d in dirs if d not in exclude]
+    # Go looking in the UNPACKDIR
+    for root, dirs, files in os.walk(unpackdir, topdown=True):
         if '.git' in dirs:
             return os.path.join(root, ".git")
 
-    bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
+    for root, dirs, files in os.walk(sourcedir, topdown=True):
+        if '.git' in dirs:
+            return os.path.join(root, ".git")
+
+    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackdir)
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-- 
2.40.1


