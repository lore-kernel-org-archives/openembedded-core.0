Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC42EC001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:16:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.14665.1690982191964157932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Wu9bFInC;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso6282712f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690982190; x=1691586990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NF0pv8k7hGO9nLYwlw08qIcEqwY8gl97EEPJ49imMU=;
        b=Wu9bFInC2Z3PRX+E7xz+ensqj7PEBNjXtxlfhvj/cxpy+BDiELfIxD9dTbWXI6wAhs
         mj88Zfk153oTW/x7J6IzAq9tg42W8v3eYwp4dO/YN8KollOV/v3stcyc2nMZnJvHl1Iu
         ZIyGrFhVJg9/uNIL3s4dulLCUydN5qsm7zRB6SgYud5dUrjMZXow1ZKKvDx/h1PwTScl
         +4sU4JxZeZ772ogT2W7EqYmeM3AzGETVnZ/MIX5szKYdMP+oOZpu5mOKGw0HJyFQjwZ8
         nVvVCwcjgRDn+K8hjhgi5ohBDcJ5FGCcoeW1ewe09YctxXdVLlboS3DnyETbMZ/8FqfG
         77Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982190; x=1691586990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NF0pv8k7hGO9nLYwlw08qIcEqwY8gl97EEPJ49imMU=;
        b=epvdKRvHDIwE0vGBU5koOk5jVC0zk3wJXKhZX+X5PmKfeGokBqA/EocCO2JoFkdoRj
         ojT0cLzafIS61g0Ok29jUylijVp1M2dLJmPMDlg9c/oCRwHu2KOf5xWGLIUusCDxWNNm
         2ZcQctnvtcdcXr6gZO5/Wfc5J59npPTbETitdvQX5/eCoz9rZuK2+uSL3YIy0iZIZ3Uh
         JjEYgcknFTWa8l1KJNziPFEoffxIW1xuOuxTHx7X6eQK3GaskZ78YwNRAEtv8FxyjPGg
         tNyCc7g6HssatNhy9xYTzQm3lqE7h+1E9HyqyfTfXkohwd/UeVX7uyMxVIuzuw6yyTnv
         Fcpw==
X-Gm-Message-State: ABy/qLYenlkDx+mERfRoFKbIGV1dh6/zpR8mu8V12qOtkLCJGLeYmLpP
	GXpycT0sAf8NBU07JjRHKocO0/flX24=
X-Google-Smtp-Source: APBJJlFAN/Glt9oaJmbMmcG4ZwnlPmLXiVrlNJFCQOfhMwPMn3i1dmW83bM6Mp9X2TgNrlgnB5Eufw==
X-Received: by 2002:a05:6000:108b:b0:314:1560:cc68 with SMTP id y11-20020a056000108b00b003141560cc68mr4548571wrw.56.1690982189897;
        Wed, 02 Aug 2023 06:16:29 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:ab32:1451:bfe8:2a0f])
        by smtp.gmail.com with ESMTPSA id l18-20020adfe9d2000000b003112f836d4esm18951248wrn.85.2023.08.02.06.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:16:29 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH 2/3] cargo_common.bbclass: Handle Cargo.lock modifications for git dependencies
Date: Wed,  2 Aug 2023 15:16:04 +0200
Message-Id: <51dae2aea3c591d6f96aa91af4b467332433b28e.1690981978.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690981978.git.frederic.martinsons@gmail.com>
References: <cover.1690981978.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185394

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Now we use --frozen, Cargo.lock cannot be modified by cargo build.
These patched git dependencies requires that the git url is removed
from Cargo.lock.

Fixes #15104

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index db54826ddb..b732a1bd95 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -117,6 +117,8 @@ cargo_common_do_configure () {
 }
 
 python cargo_common_do_patch_paths() {
+    import shutil
+
     cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config")
     if not os.path.exists(cargo_config):
         return
@@ -146,6 +148,45 @@ python cargo_common_do_patch_paths() {
             print('\n[patch."%s"]' % k, file=config)
             for name in v:
                 print(name, file=config)
+
+    if not patches:
+        return
+
+    # Cargo.lock file is needed for to be sure that artifacts
+    # downloaded by the fetch steps are those expected by the
+    # project and that the possible patches are correctly applied.
+    # Moreover since we do not want any modification
+    # of this file (for reproducibility purpose), we prevent it by
+    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
+    # here is better than letting cargo tell (in case the file is missing)
+    # "Cargo.lock should be modified but --frozen was given"
+
+    manifest_path = d.getVar("MANIFEST_PATH", True)
+    lockfile = os.path.join(os.path.dirname(manifest_path), "Cargo.lock")
+    if not os.path.exists(lockfile):
+        bb.fatal(f"{lockfile} file doesn't exist")
+
+    # There are patched files and so Cargo.lock should be modified but we use
+    # --frozen so let's handle that modifications here.
+    #
+    # Note that a "better" (more elegant ?) would have been to use cargo update for
+    # patched packages:
+    #  cargo update --offline -p package_1 -p package_2
+    # But this is not possible since it requires that cargo local git db
+    # to be populated and this is not the case as we fetch git repo ourself.
+
+    lockfile_orig = lockfile + ".orig"
+    if not os.path.exists(lockfile_orig):
+        shutil.copy(lockfile, lockfile_orig)
+
+    newlines = []
+    with open(lockfile_orig, "r") as f:
+        for line in f.readlines():
+            if not line.startswith("source = \"git"):
+                newlines.append(line)
+
+    with open(lockfile, "w") as f:
+        f.writelines(newlines)
 }
 do_configure[postfuncs] += "cargo_common_do_patch_paths"
 
-- 
2.34.1


