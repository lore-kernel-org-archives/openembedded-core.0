Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083D0C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:15 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.6297.1636603754450533730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U2lgJjXG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id m26so4515693pff.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZUhYGs0ggyIOtcsnpEjRhSjfXuy1aSDSWN2dZFh6L54=;
        b=U2lgJjXGqCNt///+JMN3AsBevWfpSNBXdcbS6l538Fj0mQ3nnnjaIUFZch/5FUoJ8j
         BBHDZivGkl4DmudP73CCOOD2JcV5D5zs3E099JkDMcGi4kamGyiyx0Bicdzmumq1ZQh+
         0cXLI73j6Elr/6Z/PEJtlcbtpc3Tiy82AKkywTOzsrtJVjS3149QVD8znW/rWWlp43Wv
         +To9U5j33NBMZAvEX54WuzgNsPsE3mvS/6N94nEL7/GtOlXhovp9Zu5FKiR1iLNhY3Ij
         KLOqRrzndQLYD5rnzeD37xRGgAp46LHS2v80sB5XldQO+c9SHNkSkggLY5MI+atsGFOT
         HOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUhYGs0ggyIOtcsnpEjRhSjfXuy1aSDSWN2dZFh6L54=;
        b=ek7NoPG+spsK0uCCIgkaQGYMweavVnGkVKsybcCHqbM12hwhS/M0wSBf56TS/3ryNT
         dTMa0QOjOi3T4kUtd42RmToWL8Hw2fu/LhUk+LhL8NA1Sv4ZP1iO2CqtGCiAyGlGEr1e
         mQdtIKOl+OX25OJdBP4ZTa5wQ5KG49nHL/3lSY8FTooF8PX8afT4ts/opnRnDFSOaD/B
         Jf4wHbbipuHrYVpOROPoFOC3BufR0blhydIJ7/hmyUCSls7/2itpyWFjcwfOUZx5jw2R
         bVYYsAMHmTw/JGpcrZmt5m0bNTLVKkmI5IRyEh5o7FH+uGGjlUPgRyx1TNtQGm+qNLwq
         pMlA==
X-Gm-Message-State: AOAM532bSfQ9azvFR0/7otAA48x0h9lutzP1J8CsL2we3sKnD2LZqaYz
	2dDk2C1e4gOf6UGrLnBtF3dkeGuoiE6PbXrrvkE=
X-Google-Smtp-Source: 
 ABdhPJz1Ho1FTHa02/JXqYW6Y1vhxqZh0pyd8BjD22HvAciYLBl6CQ/oG+xloSUMHPblBbokUcmlpw==
X-Received: by 2002:aa7:98dd:0:b0:49f:bab8:3b67 with SMTP id
 e29-20020aa798dd000000b0049fbab83b67mr4191012pfm.86.1636603753526;
        Wed, 10 Nov 2021 20:09:13 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] pseudo: Add in ability to flush database
 with shutdown request
Date: Wed, 10 Nov 2021 18:08:31 -1000
Message-Id: 
 <649333a0d1bd5be4d5fb8a494e06686e08d291be.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158138

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:
  pseudo_db: Flush DB if there is a shutdown request
  fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ (test fix)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0882095d608ce3abbcc9814517434c21ea549063)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index f36dfa589f..6779db16d2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "21ff2fb690efbe57e7dd867c39aff36ab72a6ac5"
+SRCREV = "0cda3ba5f94aed8d50652a99ee9c502975aa2926"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1


