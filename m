Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.18504.1613317988422860856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 07:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0qRopsJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id o7so2867261pgl.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 07:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYX5aztryjH30Qevd7ovMhIkWoZKPHjGf3qq1qARLak=;
        b=L0qRopsJYV0q6jFxcyv0cCA8/ZNHzVa9Hz3Thts36atzu2DWovHjgsqaMwL8Cji6XY
         WlctspmSfxaIMQ8YEYiIiq/SY+WUJ/r6hCyRtzli7edawDJSwA4uhj9MFI6kyu6ZPZVk
         Da7OpkuuSehJpNJjluScACMpm+7bZCANvhKCQQAakSjG2E5IGaOVngvYXOtWVnf7pDFn
         0chf2KteY0ctSbgyK9ob6kUg520BSPq2U97IqBEc4mSyK3iDp5nYIRYifCNHUBbSfUsv
         Uv6A4POHuTFbdqGRTkgXe6DAllraIannWDp8bEcZipPMM7YsLZw425cNQWJ9XISH7AIo
         MJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYX5aztryjH30Qevd7ovMhIkWoZKPHjGf3qq1qARLak=;
        b=LaMtQN26AiyZbyYQXP7J+u/Z1u08wrWxfrkvi43nrDdfErX3ycIKT8Q/4C8S4+JcXZ
         qf2y2OgB9y8JV2c1xQZDqLkSvx5V3aoEABmQdmQTOItoC9TwM6chPgry8jWUhAUdUGsj
         OAb6rEJwntks+EdeyyYHeBNH5D3400789iWH2Z2A54SqqkbdlJTkTtTYoU2SxpSpAJIv
         TQXZAAc1jHzB9DHs3x0V7YMJ9326wEQOIUrb0YRI1LE5mTW/o3rfFGJtzBUSbMMnSuHW
         QmN+c5om15fCfuS2EsraFvNFVSodvYQyw/257ys3scywoKRdmexFn6LzqIHjCTDPh8h4
         S7Aw==
X-Gm-Message-State: AOAM5318teBX7SgfH8p8t+TqbXJEGhpdLlNLtcdb+InztpphbafkI8aC
	3v2yFC/PTbIfqWJsbZ7RNjy4jFFQl9Y=
X-Google-Smtp-Source: ABdhPJwNwitHCX1fQWpOzBbsephMbAkmV0kmt8xvt9D6mNuInUHdk2s7Ag4+3f7UmGFXYxQjyWfblA==
X-Received: by 2002:a05:6a00:1a03:b029:1d3:1fa3:4a5d with SMTP id g3-20020a056a001a03b02901d31fa34a5dmr11692614pfv.1.1613317987512;
        Sun, 14 Feb 2021 07:53:07 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id me5sm13162597pjb.19.2021.02.14.07.53.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 07:53:06 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory.bbclass: add cloning
Date: Sun, 14 Feb 2021 15:53:05 +0000
Message-Id: <20210214155305.1797370-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a method to clone and push to a git repo
Provide a method to pre-populate buildhistory
Maybe remove the need for external scripts to do the same

Three new variables:
BUILDHISTORY_CLONE - Enable the cloning function
BUILDHISTORY_BRANCH - branch used for checkout and pushing
BUILDHISTORY_REPO_URI - git repo uri

example:
BUILDHISTORY_CLONE = "1"
BUILDHISTORY_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
BUILDHISTORY_REPO_URI = "git@gitlab.com:akuster/oe-buildhistory"
BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/buildhistory.bbclass | 59 +++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 117a44eaf38..8ed420174e9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -44,6 +44,15 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 BUILDHISTORY_TAG ?= "build"
 
+# Branch for checkout
+BUILDHISTORY_BRANCH ?= ""
+
+# git uri to clone and push too
+BUILDHISTORY_REPO_URI ?= ""
+
+# Clone previous buildhistory from repo
+BUILDHISTORY_CLONE ?= ""
+
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
 # We want to avoid influencing the signatures of sstate tasks - first the function itself:
 sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
@@ -858,6 +867,51 @@ END
 		fi) || true
 }
 
+python buildhistory_clone() {
+    import subprocess
+
+    histdir = d.getVar('BUILDHISTORY_DIR')
+    repo_uri = d.getVar("BUILDHISTORY_REPO_URI")
+    bh_branch = d.getVar("BUILDHISTORY_BRANCH")
+
+    if not repo_uri:
+        bb.note("BUILDHISTORY_REPO_URI not set")
+        return
+
+    if not bh_branch:
+        bb.note("BUILDHISTORY_BRANCH not set")
+        return
+
+    if not os.path.isdir(histdir):
+        cmd = ['git', 'clone', repo_uri, histdir]
+        ret = subprocess.call(cmd)
+        if ret != 0:
+            bb.error('Failed to clond %s!' % repo_uri)
+
+        cmd = ['git', '-C', histdir, 'checkout','-b', bh_branch]
+        ret = subprocess.call(cmd)
+        if ret != 0:
+            bb.error('Failed to checkout branch %s!' % bh_branch)
+
+    if not os.path.isdir(histdir):
+       rerturn
+
+    if os.path.isdir(os.path.join(histdir, '.git')):
+        cmd =['git', '-C', histdir, 'config', '--get', 'remote.origin.url']
+        hasurl = subprocess.call(cmd, shell=True)
+        if hasurl:
+            cmd = ['git', '-C', histdir, 'remote', 'add', '-f', '-t', bh_branch, '-m', bh_branch, 'origin', repo_uri]
+            subprocess.call(cmd)
+
+            cmd = ['git', '-C', histdir, 'checkout', bh_branch]
+            ret = subprocess.call(cmd)
+            if ret != 0:
+                bb.error('Failed to checkout branch %s' % bh_branch)
+
+            cmd = ['git', '-C', histdir, 'branch', '--set-upstream-to=origin/%s' % bh_branch]
+            subprocess.call(cmd)
+}
+
 python buildhistory_eventhandler() {
     if (e.data.getVar('BUILDHISTORY_FEATURES') or "").strip():
         reset = e.data.getVar("BUILDHISTORY_RESET")
@@ -874,6 +928,11 @@ python buildhistory_eventhandler() {
                 for entry in entries:
                     os.rename(os.path.join(rootdir, entry),
                               os.path.join(olddir, entry))
+
+            if e.data.getVar("BUILDHISTORY_CLONE") == "1":
+                localdata = bb.data.createCopy(e.data)
+                bb.build.exec_func("buildhistory_clone", d)
+
         elif isinstance(e, bb.event.BuildCompleted):
             if reset:
                 import shutil
-- 
2.25.1

