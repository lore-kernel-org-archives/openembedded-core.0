Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AD5C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.12350.1664898666806710067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=txQNRwcd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id x6so7738167pll.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=+C4J3RP4hC8WAbsNOTHlmzS2sJeyhb8VSwvRNYxI0m4=;
        b=txQNRwcdV/i2+F8IA84E1ZB3boxxMv1er5ziTytt6OrEnDP9xXCtQrN9BUMR81R7GE
         sWwPe/jbeYJchPTWgPpLyvZLQxWYe/HVADYo9A+GNJ1iWgELIf+FY5zVQo7Y8GJ4/0DA
         o7p8BiMXWns+ZkjGeUqVu1jv11Rh1MCP2D78a6MOrcV9xk6oDv4ITM2yhbyOGm+bIfzp
         p33VBf/lG6a1wZ4gAUOSD2t6G0EtlRHznoYIS8oy7lQHi5mH3IZJQUHfgHDLjDmjLoIP
         6aLSIU/AO5Fsbg8acrhVfTGTdFj9M9VyURAg3gGdm2Yl3HAl6Z34ayaR5y36vv3pCuod
         9Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+C4J3RP4hC8WAbsNOTHlmzS2sJeyhb8VSwvRNYxI0m4=;
        b=pzOChmv+CYOsr2w4mpMna8O4b5STzaD/x5r1g/Rkb7tTaoZfRoI4Hncpf/H4DYVkCr
         cTFnTKgNyAOUnHPKWqIQZ9apb5wPYjhx2AtcoNnMNliusubSxqQpP/ZIqE0f23/rryv3
         UiBfZjC4GcUK/7YtTsF87cnqkNAJp2Tge04Gd45h7bkR0LgT4kAIKgZMWUQYkJlo5pGu
         Vj45JpDCY5NYDLoJ5e8EIa2chaOJY2G3a93FxNNJwExmGQZ6vOZ57TfFZeEVDqOCsxxY
         iYaH9755przALPKO/uCbfnVScMRh/Rp3Olwa2mNGItx0lG+Z4VX8C6GpdGmtEIi21NoE
         +FGQ==
X-Gm-Message-State: ACrzQf3kSN+8ylP+MZvhcLw5N537r0db+gNkiKgFrI5H7cRMpbUl/0vZ
	bA5M+4/tBE5wR6hbi6cuPubW2iSWmgZzp9ob
X-Google-Smtp-Source: 
 AMsMyM5j3f6JJi0A0mUz+/62+R4ETJw7xH7tWuHQziTltG98ZMJJu8g2i2tOQN9JWoJZvpN95kjw9A==
X-Received: by 2002:a17:902:c412:b0:17f:127b:fc30 with SMTP id
 k18-20020a170902c41200b0017f127bfc30mr12218836plk.93.1664898665818;
        Tue, 04 Oct 2022 08:51:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/18] vim: Upgrade 9.0.0541 -> 9.0.0598
Date: Tue,  4 Oct 2022 05:50:31 -1000
Message-Id: 
 <9837a62cc42de4120794d4ae8d0264109b8308dc.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171409

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2022-3278.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98c40271692147873a622e168e8b2e90a9fcc54c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5ff60f8495..cbc370100b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0541"
-SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
+PV .= ".0598"
+SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


