Return-Path: <marcus.flyckt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EB2E92FEC
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 06:24:06 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.6940.1696573444695228137
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 23:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+cXyG0P;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: marcus.flyckt@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50437c618b4so2193364e87.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 23:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696573442; x=1697178242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw0k7RQTI8hCYGwsnvfdibq6SC02QbxG4X1wT5P4rtY=;
        b=I+cXyG0P4sEqy2/G4A7JZYXyr3MPNJG6+ANEdmLkcYfK+QibubUM+sPe85g0Xcf9Gz
         q9sakFgfMZHcrPMLtu/mjKrGwF2kZYo1CLnyqn7GZ8rP/p165lWWH3Oiomd0ba6N090d
         ACtMpLRcxwAyk6yj64oKKNOR72TVC5hSFgUZPKPVQuGAWb3n6QlUIKzGHI98erm+ri6v
         Vdse/NoSx36W0XoFfpseDK6O7ZgOGkG7bcDepR8Ir29OQyr09GNDNZSK39a1Xdl6xASH
         HkFpbh1cYVYzK3AZ3aAL4/yWP92BrVFbM4YmXQADFvR4i25/JKZI6AjmiER5jnu+DYNp
         0XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696573442; x=1697178242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw0k7RQTI8hCYGwsnvfdibq6SC02QbxG4X1wT5P4rtY=;
        b=jtVjhyRFNLqkx4qJYhzGMHuwLBD2yaWlIKjZQ5kVyY6Jpf3fYggyV8kiwAl6Nz9poz
         xt2FobypHhL0K1hxWcQ7BXQGb0ZM0Y1prYoLPLOFJYvKVvJCpu40NsrkVrLajDKL76RR
         Xg+CmZwma0QvSTAsDwW/gdjdDGl9VPhqR/pgDsnPHn7UUU16tfxK7ALaGm4DDgE/o2nS
         uCL8rto0DFmp4h+n6KcWrJtT1ihxnPHfVqg9lNR07YXupLD4CkLLxGu2Budb4DSs28vb
         DTGgN+mSeB1p/XwPKEGfxctSxX3P/7qHYSjpDmeOozIV2+Cj1TLG/mBTcrAvah+b15b7
         c/og==
X-Gm-Message-State: AOJu0YxR483ucCjx5LWknWJbCCo4P2OrH3jK0RX+9iUxdN/OJoA5stza
	qFZLqXCGD1kJZYaxtpbKQnT3PQLdaSFNnQ==
X-Google-Smtp-Source: AGHT+IGQwIk+deqhiupz/N/UvTapzo6uFR8a6G+XawwdRqIflOWddt2DtsYTNwe41B31bh9Sj3LC1A==
X-Received: by 2002:a19:910d:0:b0:501:ba04:f34b with SMTP id t13-20020a19910d000000b00501ba04f34bmr5840814lfd.44.1696573442141;
        Thu, 05 Oct 2023 23:24:02 -0700 (PDT)
Received: from Flyckt-Ubuntu.kvaser.se (83-233-136-242.cust.bredband2.com. [83.233.136.242])
        by smtp.gmail.com with ESMTPSA id c11-20020ac2530b000000b005057372589dsm170800lfh.256.2023.10.05.23.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 23:24:01 -0700 (PDT)
From: Marcus Flyckt <marcus.flyckt@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Marcus Flyckt <marcus.flyckt@gmail.com>
Subject: [PATCH] devtool/upgrade: check all git config locations
Date: Fri,  6 Oct 2023 08:23:57 +0200
Message-Id: <20231006062357.15867-1-marcus.flyckt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 06:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188745

Fixes [YOCTO #15222]

In some situations its more practical to keep git configuration
at `/etc/gitconfig` instead of `$HOME/.gitconfig` (e.g., when mounting
git configuration into a docker container).

This change makes `devtool upgrade` consider any available
git configuration instead of only checking `--global`.

Signed-off-by: Marcus Flyckt <marcus.flyckt@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 487308912f..9cd50be3a2 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -442,7 +442,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
 def _check_git_config():
     def getconfig(name):
         try:
-            value = bb.process.run('git config --global %s' % name)[0].strip()
+            value = bb.process.run('git config %s' % name)[0].strip()
         except bb.process.ExecutionError as e:
             if e.exitcode == 1:
                 value = None
-- 
2.34.1


