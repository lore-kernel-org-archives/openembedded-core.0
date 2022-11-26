Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDC4C4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.70856.1669472173901123442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XZXCHC8D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d3so1315326plr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufBWw5TiBz8pXgVkStSmWkJcydhUUx1ZBBEx32+Iv9M=;
        b=XZXCHC8DezjZF1rc/sUIwYjTGgTAATslqWRF2rX42LKW1UJfvQql/4EMvqBm5Ylq8c
         d5u3CrJWLHjwcsrEFNCtpqCJhjcOQEOhptTFeQLREwqTDG14nzYQg28nC/pKEf6w8njM
         wTlL3JqDyG3Hg9X4jEDzxv/roFU7TxJFVKqwKTYuAC1I6hiOjz9jDQfXxFLyX96g/idB
         EbNdpwpUz60lSpyS6fnUnZmWUnRmt2mbbEEv+zOEehnR9RbhBWT+Tu9kuwTOkd7MFStx
         hDjHFHUsJl9QAyPV0uGpSpEx1Cg3I8nATt3L/gDhNXxe58CPwilbCY1gGqmu2Z5XhhGW
         jerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufBWw5TiBz8pXgVkStSmWkJcydhUUx1ZBBEx32+Iv9M=;
        b=4RAQvmkY2Ycd40tXk/rty13k5lNaDYMdKaOhgPtVHsujQG4bVP3fMZ8YdUV+R6IteJ
         IK3UKuvjdAjkonr5h3BjSxfV+WqsTBKSfTypNiPYhq/mFh+ifDxnKv49DyIQUYLZHzlR
         tSTyWI117JXFfjWnnTtrtOKeOoboMNhHDjpHjyoBb6CuSpJ3hy3vLT1K3+qNua0PU6G0
         ouQJl43q9HhFK/X9EYZjFV+yirgLEyknMiq/enii+k6xW+VgBFhQFcitxS9RK14E4wGt
         2OKQ4o1bDktWza2qr95kTZEE1zvULmYsC4LUWj0Gjc8TwnBH5DtZ+iNeDmtIu36apa4R
         Ig+A==
X-Gm-Message-State: ANoB5pnRFjzFAZmS+UUZJXlbv50nUznxno9BnUfa4tGonTk0Zsa/7Hrh
	Rjf/+TLWDZLyD9kMModixLg6mzxuZCpYQcg9ho4=
X-Google-Smtp-Source: AA0mqf6tItxBTu8ENphWxpSdbJKq/1P1WeTKSADe50Wo+fKGNysMd3sj/K9kWVz6m4Et3i0ab6OyXw==
X-Received: by 2002:a17:902:bc86:b0:189:6ab:a97c with SMTP id bb6-20020a170902bc8600b0018906aba97cmr23129195plb.39.1669472172968;
        Sat, 26 Nov 2022 06:16:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 33/37] sstate: Allow optimisation of do_deploy_archives task dependencies
Date: Sat, 26 Nov 2022 04:14:37 -1000
Message-Id: <1da259bc2df334271fc9c30ed49d4e86e872e872.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173826

From: Jose Quaresma <quaresma.jose@gmail.com>

do_deploy_archives tasks don't need their dependencies so we can optimistion
this as we do for some other tasks.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3dd9f6e398844380d3765c54d35afe0d2ccf82e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 2c8e7b8cc2..21959ff13b 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1097,7 +1097,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_deploy_archives"]
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
-- 
2.25.1


