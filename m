Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFCFC4708A
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:33 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.91906.1669557386116582259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tYH4ynO/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id f3so7728732pgc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngmz0GTg77UNdnJiDj1SoSGcxn7BLQVrt/+zveXaCkQ=;
        b=tYH4ynO/170FPnipp/rQRQA4S986xt0ji3zNtTMOGjul68GffoqHwLvaunZx4v7Sw9
         1Iw9rIz85NwPO9Om2xF9gkm9HrJHFRW8u+9oiOOmqvpHSCw6oYGJ30gnSgYcP2QZtlbB
         Sl6JKIeLib4kAEYwKPxTzSw64Jj5zXtITsZmdsrnoRmyKWxa5nl5kt3FGNAILkXLoY2y
         fa6DedZjErM+8haLGPgv6/rMlSaFbs69NkgSGCnHVi8WWtjvbfTszPpDA1PJZUdYjmK3
         kSY8Jk1ZxAsVDkxIUkA30V4UNzfr02Z6j89aagx38exSwNheI5ibU2aIwW5ZVq6KFD3i
         8hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngmz0GTg77UNdnJiDj1SoSGcxn7BLQVrt/+zveXaCkQ=;
        b=hvVQFNKfKVtR3qwnNAVfpyHnoHU/9ueGBRNJ24frFrf829nU8fKqKVteelsMYY22LK
         GJZlhbpDBaqqkimW5n/baUVI6K82u+L6ZAdavKWHsExlbFVu4rgk/5ZIzGtvqG9J3B3D
         bMMiUZy1g+dKTJwbFEl+z9BqnRJBSw2CTmkyuzNAjkyGMtLTIF2AnhXPjwUouIqS+mKR
         dSVlJ58JI45cpi7SYj34QaL6NHYwp/uAE7fudtWCT1kix86H8Q5mKWZmHr3YAkjRlj93
         OkmF6o0N4rEoXstGTPf/Qqu58K1kr2pPDQbzm7UgZQ3z5LJ1Ospv3/W5SD6NQ/v2eA8d
         WhoA==
X-Gm-Message-State: ANoB5pkIapkg/hg7dqTcc1iIoM7r56AC2Y+V9hLU8YEVrkcujwkk43bb
	G0Q132zDF4z0DzwipPVRfmVg4e/LKwx2UncXeiw=
X-Google-Smtp-Source: AA0mqf5VZrWMIHH4pX0x9n0tBugmRdTNK/mxWq4PU5I1XDNZrF6iyH0k4owCefj9W8emi2VF4NCTiQ==
X-Received: by 2002:a63:230d:0:b0:476:aad3:9122 with SMTP id j13-20020a63230d000000b00476aad39122mr23714165pgj.402.1669557385163;
        Sun, 27 Nov 2022 05:56:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/31] sstate: Allow optimisation of do_deploy_archives task dependencies
Date: Sun, 27 Nov 2022 03:55:13 -1000
Message-Id: <1e32ad0849f06aee92fe844e8eaee73c5935bfb0.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173872

From: Jose Quaresma <quaresma.jose@gmail.com>

do_deploy_archives tasks don't need their dependencies so we can optimistion
this as we do for some other tasks.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3dd9f6e398844380d3765c54d35afe0d2ccf82e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3513269bca..dd6cf12920 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1084,7 +1084,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
-    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx"]
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir", "do_create_spdx", "do_deploy_archives"]
 
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
-- 
2.25.1


