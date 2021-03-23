Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.7544.1616499614112359647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 04:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hg1UrL5r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id g25so10897132wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9ef4vniw41/6eRC92hJXT7JIlAIUgsyCiTt/wLGNg8=;
        b=Hg1UrL5rwlyWH3gWf7Q6xZfSlecKodTyC1AjF907nCj7E2JEP80fzESgVZbKEtNzxA
         n/m+xbSBkHxe441kV3zC/j9PiAL3hgmCsMNRWTy3E5wv0y10+EDevMGPFB849z0DzCFs
         X3klDE89bK1h6w+LzSpYvnFQabydxxw/vTRiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9ef4vniw41/6eRC92hJXT7JIlAIUgsyCiTt/wLGNg8=;
        b=LLMWf9igL5N4AB95apKxwkEVnvSJVIIf1sKmc8AoIxmiHdVTyEtYHKbmgQA7jzl0AG
         8qxgXGG7Lb352K3SgJEfRBU84eWytmku9DlUxqYGNcwYQLaJbXa8+8ubVFtfpS5mNqAO
         zNgwsKdSo9Ip1kuUegZQ6+QEnSNuoKbXGhOEqDrBC/Zj1ZuEkQXfsZ5r41PzqtNLRsMd
         BVlN7vZ+fwYiDXYyjT1NxjG4nBryMzad1xkOmj/KdldtORVokboscgn3eVY9F1ZeFLmL
         J7VQsNWRtqUA+xWkwpUs+0ERLaNUn+T8RRzMfOZ7oxgcDpQTV+Vhha3e5rjmcv/BZ65N
         fVUw==
X-Gm-Message-State: AOAM5329DgOzJ9OiiCcXWA0Qnn07MmfRB5fcjjiGjPKawE3XpEtEtibV
	6H/GJgEZpKY9mZjTydNKHZE01HvooS/bgA==
X-Google-Smtp-Source: ABdhPJxdDfpps5TZQcAwriunSHBBCujkK5451L1C5qb4zQez7ynY7H+ApKcb6sCNyoLd8Ch2L0JT+w==
X-Received: by 2002:a7b:c24f:: with SMTP id b15mr2898353wmj.59.1616499612211;
        Tue, 23 Mar 2021 04:40:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d9d1:ce9a:66bd:fc35])
        by smtp.gmail.com with ESMTPSA id n23sm24734063wra.71.2021.03.23.04.40.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 04:40:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Add documentation for eventhandlers and tweak naming
Date: Tue, 23 Mar 2021 11:40:10 +0000
Message-Id: <20210323114010.334341-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1fa8a63d174..8e8efd18d58 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1146,14 +1146,18 @@ python sstate_eventhandler() {
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
 
-# Event handler which removes manifests and stamps file for
-# recipes which are no longer reachable in a build where they
-# once were.
+#
+# Event handler which removes manifests and stamps file for recipes which are no
+# longer 'reachable' in a build where they once were. 'Reachable' refers to
+# whether a recipe is parsed so recipes in a layer which was removed would no
+# longer be reachable. Switching between systemd and sysvinit where recipes
+# became skipped would be another example.
+#
 # Also optionally removes the workdir of those tasks/recipes
 #
-addhandler sstate_eventhandler2
-sstate_eventhandler2[eventmask] = "bb.event.ReachableStamps"
-python sstate_eventhandler2() {
+addhandler sstate_eventhandler_reachablestamps
+sstate_eventhandler_reachablestamps[eventmask] = "bb.event.ReachableStamps"
+python sstate_eventhandler_reachablestamps() {
     import glob
     d = e.data
     stamps = e.stamps.values()
@@ -1224,6 +1228,17 @@ python sstate_eventhandler2() {
         os.remove(preservestampfile)
 }
 
+
+#
+# Bitbake can generate an event showing which setscene tasks are 'stale',
+# i.e. which ones will be rerun. These are ones where a stamp file is present but
+# it is stable (e.g. taskhash doesn't match). With that list we can go through
+# the manifests for matching tasks and "uninstall" those manifests now. We do
+# this now rather than mid build since the distribution of files between sstate
+# objects may have changed, new tasks may run first and if those new tasks overlap
+# with the stale tasks, we'd see overlapping files messages and failures. Thankfully
+# removing these files is fast.
+#
 addhandler sstate_eventhandler_stalesstate
 sstate_eventhandler_stalesstate[eventmask] = "bb.event.StaleSetSceneTasks"
 python sstate_eventhandler_stalesstate() {
-- 
2.30.2

