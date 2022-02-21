Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1787C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 09:28:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.8964.1645435699994156529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 01:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1tRqq0w;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id p14so31489205ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xVTHx/yAkp4sPcI33DEDjuKa91Y2/oT0Ez4Pmsa8o+k=;
        b=E1tRqq0wIhqE3JSaWFWuHuotj5WlB+wkhyLgutdoizH61rAGWLxNMgItc/NEyRWtQw
         OAdiruEfWR80NajyG98gPA6/nUBxbnvY5gzLkbttWvJgDai9UicgRHYziOnOSR6kWKps
         FQxLcm37NyzTm6afbZazZBEtuRI4Sozu7HiQVmPb0gS1PLaBZ6gzbB0OOMjhxT8wL9y/
         cITnjMCVTKtkMdNUfZp+VhZkhI6mYnR++Ykrt63pZIrbFJiCK/uHwEH0N3oNY/zd0dYT
         Jmkhj3iX/BergtZDtXZey4yHYKTl8cHPaymw9MINAJwAgfnfdS/11LvaMpYfyc6PNSjK
         vsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xVTHx/yAkp4sPcI33DEDjuKa91Y2/oT0Ez4Pmsa8o+k=;
        b=BO9XfRHNU4qfpbGMX5W/r/WQaQi2SiCsIP9+cZIwOkt4dNduD/I2jUUHAnNuj1YAHz
         vqoR1logimwHsS71P/aLRYDpyCKUqELiRnLLVqpG3dZYCnJ+sZx34BrFfR5cWmI+95qx
         MS4hFaMh6hZogGxCCvXbGa4f0F5Ssrd+rRaUNVcaBp1VN9gIxiCgfWwOBDJMrwyZVYdx
         3k+geswiOxGVsGLVjSbNCGB4wV0Fyhe5ZpaC5H9I08wCq+GDfxVPGTjXwbOwWprFkUSm
         V06BYdgQpiyzAxGxTNEX7J058vpSbQE9a2/xITOZe3N9cDnKUj4pf426OOpjvUlJIpkh
         lLsA==
X-Gm-Message-State: AOAM533Iyec8a1u3yGxXJPz9rn8NufcOX4cz4h7Zf/64ZQ+Oe82geZQd
	YIQv+qxIQOjXM2/kxaedLgvu4dy99FE=
X-Google-Smtp-Source: 
 ABdhPJwNb6a07byNe6mjKsiaCdjTEJ1sH6Yg49QLyyZvaxLp6qzAYbekOVZ/GZuSk2hbuf/1/d45Kw==
X-Received: by 2002:a17:906:2ec6:b0:69f:286a:66ab with SMTP id
 s6-20020a1709062ec600b0069f286a66abmr15431416eji.684.1645435698361;
        Mon, 21 Feb 2022 01:28:18 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm6895220eda.106.2022.02.21.01.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 01:28:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] devtool: explicitly set main or master branches in
 upgrades when available
Date: Mon, 21 Feb 2022 10:28:12 +0100
Message-Id: <20220221092812.3332815-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220221092812.3332815-1-alex@linutronix.de>
References: <20220221092812.3332815-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 09:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162022

In particular this resolves devtool's inability to pick a branch
when the same tagged commit is avaiable in main and in a release maintenance
branch.

Thanks to Peter Kjellerstedt for the suggestion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 826a3f955f..0357ec07bf 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -192,14 +192,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             get_branch = [x.strip() for x in check_branch.splitlines()]
             # Remove HEAD reference point and drop remote prefix
             get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
-            if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=master' as this is default.
-                # Even with the case where get_branch has multiple objects, if 'master' is one
-                # of them, we should default take from 'master'
-                srcbranch = ''
-            elif len(get_branch) == 1:
-                # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
+            if len(get_branch) == 1:
+                # If srcrev is on only ONE branch, then use that branch
                 srcbranch = get_branch[0]
+            elif 'main' in get_branch:
+                # If srcrev is on multiple branches, then choose 'main' if it is one of them
+                srcbranch = 'main'
+            elif 'master' in get_branch:
+                # Otherwise choose 'master' if it is one of the branches
+                srcbranch = 'master'
             else:
                 # If get_branch contains more than one objects, then display error and exit.
                 mbrch = '\n  ' + '\n  '.join(get_branch)
-- 
2.20.1


