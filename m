Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB2AC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 12:25:08 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.10248.1644323107795482351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVWIJfsq;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bkylerussell@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id b22so13470365qkk.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swW8jWHMnyB28778yzRX8b1YkKGhE8u1v2/UN2fnZFs=;
        b=hVWIJfsqmFhP/4E7/C0Wnp2Wo+L8xnGp4u2dLNWmfr4yoVPEgBylsN7OitF7MMJvsS
         pXF7wszYASa64rhEhTF8fFG24sDLV6Sd19aXRuHJWGsfYi6v6V4E71hh0VTKPVkmstOr
         04iYk+Uw9miUqs0c1yxykihz1fC2gJbMpJimON6ICLkkTxnIJHRm+yJIxUjyxntCMsGn
         nAuM/1Xil2WjOYblls9mHT2m1eYINtkq6hzyL5toSktu0twvoWlDOzqs69Qed/Cprl6/
         gSC5VjgcWwUYHp/J3p1ShM4nI6DitGaqARBj//AMzRMG54LuAbaITX1/FjaWn4S0jsMv
         p3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swW8jWHMnyB28778yzRX8b1YkKGhE8u1v2/UN2fnZFs=;
        b=nUvOyjulZetjAqn8A4SG2quZbxWI3xS3YCsAh6hANQetBwnK8yfMdJ9XnB41deHO3G
         ccysOqlU3RAgim+Rkn5P/AjV18KGxnaqgdjTTMcyrrlL2Ap/azF9U88uwh7CDNjuvHxG
         2l2a6OA9IIekkF3OvQVNB2iZhqaX4epeG1DCoNpZ/jojZ4Ku2b2OrJk4HH6ceIWh2uDH
         YcVw6Evh/mmLSCI3TPZv5aWFsY7I3/dIuCDgbZQD2Uiy8CPlgVTQmhr0eJD5UlanFneh
         tpebnQQ23rqimQZxMOznRIrarGG/EnpJ9PisBuOw5HZcSr4nTZNRqzJt3lndx0y3fgLG
         CXaw==
X-Gm-Message-State: AOAM530caliAL3lzcV9cV0ZbjztuxWg+U+cj5a6SZ/ULIv4mrfQg4sEA
	cG2caXOLBZkRvXr2uP+bkVo/TgpfbZE1jw==
X-Google-Smtp-Source: 
 ABdhPJy0JsYhood5eEirlAcC2hKawM7plIWJjs8AutfkgYXjgbRgistI8FME2oSInHGntscOvQOC+g==
X-Received: by 2002:a37:a04c:: with SMTP id j73mr2393120qke.65.1644323106734;
        Tue, 08 Feb 2022 04:25:06 -0800 (PST)
Received: from hercule.localdomain (cpe-74-138-104-174.kya.res.rr.com.
 [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id
 i12sm6768591qko.105.2022.02.08.04.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:25:06 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH v2 1/2] devtool: get hooks directory path from git rev-parse
Date: Tue,  8 Feb 2022 07:24:59 -0500
Message-Id: <20220208122500.429218-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 12:25:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161503

Ask git rev-parse to provide the path to the repo's hooks directory.

This allows devtool to support git submodules, where only the
superproject contains a .git directory.

git submodules contain .git files pointing to their parent repo,
which confuses devtool when it tries to modify the commit hooks by
a manually constructed path.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..076018271e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -510,7 +510,7 @@ class GitApplyTree(PatchTree):
         reporoot = (runcmd("git rev-parse --show-toplevel".split(), self.dir) or '').strip()
         if not reporoot:
             raise Exception("Cannot get repository root for directory %s" % self.dir)
-        hooks_dir = os.path.join(reporoot, '.git', 'hooks')
+        hooks_dir = runcmd("git rev-parse --git-path hooks".split(), self.dir)
         hooks_dir_backup = hooks_dir + '.devtool-orig'
         if os.path.lexists(hooks_dir_backup):
             raise Exception("Git hooks backup directory already exists: %s" % hooks_dir_backup)
-- 
2.25.1


