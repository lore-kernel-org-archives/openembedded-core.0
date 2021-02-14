Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.21273.1613330329537513194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 11:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MhClPOOO;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id cv23so2459668pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYEYxirqhQbI9uXwv61PUbi9zrKlbUzoCuPvTN43OkE=;
        b=MhClPOOOlGPOUcNvVqx10/7cdhqWN382v7pkGo0dxHb5oG50KICu5V/K8dWH7wxRql
         oKLGaO21Ji5frjUUssCGL5UJvMzF9JIazCPqgQpDTywyMET2isv7A2p3iGWE3f/lvlWE
         mbQJyHxyOieDa2X8FUrtheWpCyhEAmA1oMwYoTGqbmBZpG33Y7s+hzoe9YkJc+wPZG+V
         kBSdQ8VgfuM0P7ElfHOEtcOJN26j8En57fxJsmqvUqjepbr6cHzTEJKxiWS6ElIooHnX
         FrvkdNVvaDheBYjPLNNgGq/Xhb7dZMgyYEGSzdE8vRSPMDh+EFiZFWNpbYCeYyppNKBr
         CaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYEYxirqhQbI9uXwv61PUbi9zrKlbUzoCuPvTN43OkE=;
        b=muB5uEzVqkjImDeo141ZGh1JW9mEjj043JCU5eGRRyOQ5K1kdslWb2aToHeqVuXeWZ
         i4uAq+RYoYAAxn0Z3LAcwuO6lpMef/FF2SOmrJFhZr/r6TaklxFkcrH3EPjS9SOj+CVy
         s+hX5Lzs45ok7UHewf67WE+UOrqz7JqBkS/mZr3xjrZZZ+ZC58B5X/Bz+MY7rYB4Dm8l
         KMR938Dk2qHPyFxQvC1CfbInxE640kt04J6wmfKipyEcu4rZ2ou06FJsAVFXWPIg0QpK
         WNWkyWLx0FrWInEJ7V27Feasmbm9nkgjO9nJmmYo6G/y6T4do1qIgUxlwk2ouwsAIP6a
         RNUw==
X-Gm-Message-State: AOAM532M5AQA79RPTjlqkk+g3LCWTE8k1wcdtsm+BsjCMe8o/U4zwC+l
	VfGvxedtttfIh1puwb86BuerGjSKRpc=
X-Google-Smtp-Source: ABdhPJxdx5AYsb66DS7C2mNbSYzQBS9hZj8d5X6CY08XygZdJK0K2ZlHxKARmr3ylnbJoVCiOrF4rA==
X-Received: by 2002:a17:90a:5601:: with SMTP id r1mr12578084pjf.236.1613330328807;
        Sun, 14 Feb 2021 11:18:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id d23sm14370880pje.6.2021.02.14.11.18.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 11:18:48 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [V2][PATCH] buildhistory.bbclass: add cloning
Date: Sun, 14 Feb 2021 19:18:47 +0000
Message-Id: <20210214191847.2043214-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a method to clone and push to a git repo
Provide a method to pre-populate buildhistory
Maybe remove the need for external scripts to do the same

Three new variables:
BUILDHISTORY_BRANCH - branch used for checkout and pushing
BUILDHISTORY_CLONE - git repo uri

example:
BUILDHISTORY_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
BUILDHISTORY_CLONE = "git@gitlab.com:akuster/oe-buildhistory"
BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"

Signed-off-by: Armin Kuster <akuster808@gmail.com>

----
[V2]
Use BUILDHISTORY_CLONE instead of BUILDHISTORY_REPO_URI

Simplified initial clone to one step
---
 meta/classes/buildhistory.bbclass | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 117a44eaf38..d0e918c3d8e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -44,6 +44,12 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 BUILDHISTORY_TAG ?= "build"
 
+# Branch for checkout
+BUILDHISTORY_BRANCH ?= ""
+
+# Clone previous buildhistory from repo
+BUILDHISTORY_CLONE ?= ""
+
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
 # We want to avoid influencing the signatures of sstate tasks - first the function itself:
 sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
@@ -858,6 +864,42 @@ END
 		fi) || true
 }
 
+python buildhistory_clone() {
+    import subprocess
+
+    histdir = d.getVar('BUILDHISTORY_DIR')
+    repo_uri = d.getVar("BUILDHISTORY_CLONE")
+    bh_branch = d.getVar("BUILDHISTORY_BRANCH")
+
+    if not bh_branch:
+        bb.note("BUILDHISTORY_BRANCH not set")
+        return
+
+    if not os.path.isdir(histdir):
+        cmd = ['git', 'clone', repo_uri, '-b', bh_branch, histdir]
+        ret = subprocess.call(cmd)
+        if ret != 0:
+            bb.error('Failed to clond %s!' % repo_uri)
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
@@ -874,6 +916,11 @@ python buildhistory_eventhandler() {
                 for entry in entries:
                     os.rename(os.path.join(rootdir, entry),
                               os.path.join(olddir, entry))
+
+            if e.data.getVar("BUILDHISTORY_CLONE") != "":
+                localdata = bb.data.createCopy(e.data)
+                bb.build.exec_func("buildhistory_clone", d)
+
         elif isinstance(e, bb.event.BuildCompleted):
             if reset:
                 import shutil
-- 
2.25.1

