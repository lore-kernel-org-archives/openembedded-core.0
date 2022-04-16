Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273A2C63704
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.21838.1650136511988211921
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IS2K+gyn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id v12so9522776plv.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YoPLADLpG1SpeRUV4MoyMGE6LFf0GADtmRf9eJG3NCw=;
        b=IS2K+gyniA4AfxOaL9IVFglg2KZ3Jh4HaDuKHLOLpkm9rEbmrbJ2pls8IWgtH1h/ar
         +ZeCBXHy7/DiFJuI8XxkXyU7K0Xkr2Pkrn8JnwTetnTgb+Z2Ks4G/UTgFWRUk8VWYBLV
         cxLRFcRvmauQ1OT7RcKHLo88C4ldY5ZzCG7wa/U7qfg5S2HPxnQkvQHhdX+/nAkSVZwk
         4Eo0zI8eyOqqze1wRYOEw7pN7nXvSJwIicmhky7VvapoKLdiipOb0RP48LUnBfnYSyO4
         dBUYZRYufdVUeT4uEfCutFWZPuftcrK0rRiDA682h08xKUAoMteR7ytPvfGxxlEwMiS2
         VRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YoPLADLpG1SpeRUV4MoyMGE6LFf0GADtmRf9eJG3NCw=;
        b=46m6PF69IC1n1PaXWL8lANpGk3/lR4h+SIR6Jy1LmRkabr92iWp0RShTuucvf55+xh
         BCa++Ovljim/rl40IkvxRqn6TAqT2qGC1H5YXmt9zU0vIL+d2BJntGKujaJjwAOGs6zt
         MiJ3lgOtR6VLtUqE4drLW2xtClesIJbvHAIVLvT1kqOtSKEB4WUNkdUL8hyIhszEAOji
         T96zfGeYqNLrM0jWe920yEpSSV2W8cE9j6FDT0gm+w+eI80ZSIFfdA26p7Vv5oRQ3BWX
         NenQfIwKHN/BMygdKtUxL9Z64qQ4qTbhktSHkjJXpXFL3aas2j3HyJsomVz9AmvbgP9I
         EsSQ==
X-Gm-Message-State: AOAM531UGUw6GqPAKZcTBpJUMOl5YJCsK1Olma7sDoAmf84dQZ+lOYXE
	rJ7SJudnOTL/13x/gDF2XgxiQNDAkbU3WxqQD0k=
X-Google-Smtp-Source: 
 ABdhPJw8GzYjsLlA1yl2VPlvMEUHM6zb86ewkHodZ/zk6PAZ57HFjuaY3cSRy+1qyuT3KSwuXYWWXg==
X-Received: by 2002:a17:902:8f94:b0:14f:d9b3:52c2 with SMTP id
 z20-20020a1709028f9400b0014fd9b352c2mr4363173plo.103.1650136511106;
        Sat, 16 Apr 2022 12:15:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.15.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:15:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] metadata_scm.bbclass: Use immediate
 expansion for the METADATA_* variables
Date: Sat, 16 Apr 2022 09:14:28 -1000
Message-Id: 
 <6f4a6940b647ecc77f653c7605397be067d415f3.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164556

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Define METADATA_BRANCH and METADATA_REVISION using immediate expansion.
This avoids running `git rev-parse HEAD` multiple times during recipe
parsing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34e1841ec14c545c73fbe03a9f946d43d65ab326)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/metadata_scm.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 2608a7ef7b..47cb969b8d 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,8 +1,3 @@
-METADATA_BRANCH ?= "${@base_detect_branch(d)}"
-METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
-METADATA_REVISION ?= "${@base_detect_revision(d)}"
-METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
-
 def base_detect_revision(d):
     path = base_get_scmbasepath(d)
     return base_get_metadata_git_revision(path, d)
@@ -42,3 +37,8 @@ def base_get_metadata_git_revision(path, d):
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
+
+METADATA_BRANCH := "${@base_detect_branch(d)}"
+METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
+METADATA_REVISION := "${@base_detect_revision(d)}"
+METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
-- 
2.25.1


