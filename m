Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068AAC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 14:11:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.8578.1634134291968556055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bzdw+Ztm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id k7so8766988wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LZtqC6FRi2JkEmtSBl/G0WOuIoOS6nMU5isyNfmFXCI=;
        b=Bzdw+Ztm3b+zGQbIa+eXWFBP0Zdo6iwr2fH0dmWB/NxBzfTlVdVRZSihP1HfZmfnC3
         2V4LAm7TUP9ePyIP5Wc6ZUKU8QD2y5gjgx2m2Jy25k4++fwZjLtpaevRLjQC/NArjNG/
         WGFxTibE7doJpbTYiG3D+rN0zrB1wcZBs7pK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LZtqC6FRi2JkEmtSBl/G0WOuIoOS6nMU5isyNfmFXCI=;
        b=vXTX6WYEIe7JikZ5MYrfkVPaHrBlYa550sjy7sY4mbUbEDAljyJit5ZOO/7i+7+XvM
         ITjvL9T6Cc/7HDud8pYarw9TzWvUAYbrINP25EVWOYoXzAw+UzViUbGUhPzbzyEfrjrA
         aE6dibkh/tZ/YzCm7mxd7uSw5PZ1zw78+sJ24KYwQNLYeatnhH7sewvLV3lDRIg4QVA9
         A47IPvBGBVyV/XX3/oYA7EjHfgNDX88Ke3YJyKCG/AwhAZVnt8OI5OpMWOlAcoar1V9S
         dso3l7JR/kRByNwapQyFzNX/nDZxFFWH9fk+FVxRBhGzVmH8GgHBESj8UVgiQOTy38++
         P1hA==
X-Gm-Message-State: AOAM533z52gCU+D2l7cycEHx4ghghh3dhZYveXR0qv+wknyvUZxPxCM1
	sZnlC1ObgHXA2Im2GSubeMmKMi6mOfqNvQ==
X-Google-Smtp-Source: 
 ABdhPJyDNlYvr6kuYrWO3RI2VoSYibIE2gnpTHBllFsHPmQE2hIi6AmQK1+7c4PUwnUS2FnMgXp0XA==
X-Received: by 2002:a05:6000:1689:: with SMTP id
 y9mr40766167wrd.52.1634134290064;
        Wed, 13 Oct 2021 07:11:30 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:65b2:89df:e6ae:44c4])
        by smtp.gmail.com with ESMTPSA id
 l6sm5912830wmg.10.2021.10.13.07.11.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:11:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] bitbake.conf: Add BB_CURRENTTASK to BB_HASHEXCLUDE
Date: Wed, 13 Oct 2021 15:11:27 +0100
Message-Id: <20211013141127.2870066-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013141127.2870066-1-richard.purdie@linuxfoundation.org>
References: <20211013141127.2870066-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 14:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156912

Tasks shouldn't vary dependning on the value of BB_CURRENTTASK. They
happen not to due to when bitbake sets this but to fix other issues,
bitbake needs to set it earlier. Therefore exclude from hashes
globally.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 030d29b0975..e20b8ef2311 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -906,7 +906,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
-    OMP_NUM_THREADS"
+    OMP_NUM_THREADS BB_CURRENTTASK"
 BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR SSTATE_DIR "
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
-- 
2.32.0


