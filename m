Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B86C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.3836.1690796657025769096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 02:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ezb1V9ju;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so4484968f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796655; x=1691401455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy3Smm1Q5Af/CEbfiEybD/9tyOLy7rcgJyqCPuqDFZA=;
        b=ezb1V9ju6cteWSFIt7L5OXHlWF4QIh4wsuzx81QyC5RYJ85VQImQx9nj5lPkrBtZDC
         sjuL/ANHtURJiLjs6JPuEzkMQG24BFYkFE8hSEng4Ha5azMFhvZons0U3Ol969jmY7h7
         68j+Ze8pqRsPDcnfKUFVBW4cxrBfI6jjrC4jrHpM6pZGUFnHkg3EC2LgvPQCFmPv1OAR
         imaYO9Wq/XbhsmQ0ZQCHcr1wIoptZoVQvRNjueOqgVYSobUntFd0iGwuhGmEEcrDKVd0
         +eGO2qFQ7Pf1z6BTEEZXGubTISWELMOd+yrNPSU47W0eg4iN8X51sYPdY+kr20CgZt8R
         Ocaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796655; x=1691401455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cy3Smm1Q5Af/CEbfiEybD/9tyOLy7rcgJyqCPuqDFZA=;
        b=W1qugEURWHt/ir8WuWJq4f0XMp8IO1VMisR73p7F86QxJhxv5praQTLa5+j/UYFXkB
         woiLYla5gQv/Bk/jMOgzN8UyjywBn2f7MtarWC6D1JV2CA4EVk6YGC8M/K9PP0rooZob
         K4GtPo+WvLGDlt8Wddc9ThzCv1xLpvZGpEjRd7S+wGisPr3+ds0ZKsR5EQ1P4yktZKvU
         TqUfUGnRem/m2jT4maoA5C0Ydp9Lyf40EfSMPfoU5mmS3J0ThUSfs/HQTersAnn0Ezf0
         qsiCPNUKby6pDRDTct4kk/ZUieo7byh0TRrnDB3dpOmmQoA6l7ERKL8ApmGgh9fVfWwW
         HY6A==
X-Gm-Message-State: ABy/qLZvhe5qbSBmhGz/Zt+wWqudEo2PIx/h4mWuzD+y5JCcVxUghZcJ
	z0JudltBaAQguOP83OeD70wiQB7vpdM=
X-Google-Smtp-Source: APBJJlFKP4l3rl3RLzc7HuCnprkXkdN5/bn0m7oL9rinWXhlmG1S8E97qPo+XdK3aYme2McUllOjbA==
X-Received: by 2002:adf:ff8e:0:b0:317:61af:d64a with SMTP id j14-20020adfff8e000000b0031761afd64amr7688360wrr.3.1690796654834;
        Mon, 31 Jul 2023 02:44:14 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:c4e8:ab56:aff:118a])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm12526610wrw.58.2023.07.31.02.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:44:14 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH 2/3] cargo_common.bbclass: Handle Cargo.lock modifications for git dependencies
Date: Mon, 31 Jul 2023 11:44:09 +0200
Message-Id: <3553fa6951145c0504e272b0c57eecbf109e7488.1690795930.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690795930.git.frederic.martinsons@gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 09:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185130

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Now we use --frozen, Cargo.lock cannot be modified by cargo build.
These patched git dependencies requires that the git url is removed
from Cargo.lock.

Fixes #15104

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index db54826ddb..01afb74640 100644
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
@@ -146,6 +148,44 @@ python cargo_common_do_patch_paths() {
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
+    newlines = []
+    with open(lockfile, "r") as f:
+        for line in f.readlines():
+            if not line.startswith("source = \"git"):
+                newlines.append(line)
+
+    lockfile_mod = lockfile + ".new"
+    with open(lockfile_mod, "w") as f:
+        f.writelines(newlines)
+
+    shutil.move(lockfile_mod, lockfile)
 }
 do_configure[postfuncs] += "cargo_common_do_patch_paths"
 
-- 
2.34.1


