Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768DDC35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.4754.1741809365133914127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bNquIi77;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2232aead377so5022735ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809364; x=1742414164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wmyz566HmCyCnmaJp0xxPYc2og8s+PAO2UsFt0yrEGE=;
        b=bNquIi77ZERF3GQ9Me4++UHtWqbvut6eorSqNqyt25Dtw68ezIMMPqvAEeZr9fvCTK
         Vc/MMdRFvHeBW3BTDQ9ABypTRpgw39GSUybU6fecD+jSmL5/XxQk2yv2n5GJkU3fAMbA
         UZRlGF5xxsVGcKyukxLCH5f1LlxQ/6L/Cr5xRRVDTR6KS8LgT8oCadWzoV4PPqKjJGOG
         yw6uVwGgKbdL1WvjZxorbn1abHpy0PGhw8Y6cmlvMZuX7vPMq49l3XyCh8nOPaMrfSGZ
         0WB/vxLw7aWQif4kxkDydN31lTaLBQEodSOLWEpU+hLasuADAcgJiJ2SuHOLpJZGkTPN
         /E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809364; x=1742414164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmyz566HmCyCnmaJp0xxPYc2og8s+PAO2UsFt0yrEGE=;
        b=rgzyPr9ut7xNZy0xRAOLQJIJZXXQ1uWEpGmRhk9hEVg/X+awJivzrrsLyQVYOzSGw/
         u4w2OF9PpkC8YP7pctyl5Y3fjvEmiFomWT2EC8lghx6zOJLxoruL3U3mEjaHFOi/mmmv
         JzoWtInwRX4ccnwwvJHkdDoy/HvEA3P+SYNZt5NbcY61aXDX3PWRX9NbwCcZ8iiv0xtE
         ++pNzr9NbSlwWTwP9Xt7Lw80j4pQHA8xOcIHipUox0rQdpnShiOirR1iJlkNmsCB5Qu8
         AQLY4JeRxsmBku4QHuW8xR2CqD7Z5Cm8MBPmqZpmlGyfOTC3uah4ZLqxDZBJgKq4OR0a
         wmVw==
X-Gm-Message-State: AOJu0YxPFV3s8aCBPxfIbWdIEjfuSOmJ3BlBcULJSG4G+wpYSbZbjb9a
	cFr739cG3ytmtK2VaGYwV7QBkNQZMZZtpYP0ADe/sfnPfzL08Sj7luPe7h3N//+lSeQhEKqsVmZ
	q
X-Gm-Gg: ASbGncuoZKWk00Dbos8ZY0PbRPSlFxjcCjDNCpbNazdVprLQVUGntqnpIofb17Wfyae
	GRI2Y2ES8St4Yno3GAZj5V/R7iIhepHMIzw/TCGUZZqDOYJ1/BhV7KklvZ8TIya2U6sNEuouOY3
	ojrJwNtqDt3hbgdWljWU2NhNOveB4oQhQbqL66G+Y8VC/4yzbAX6Q/VvFDJuz+Jdut795aXlJK9
	ccOCS2cdb59T4w2V8kryALgdy5DUuAmqyJywUO6kaaIKNVESJ7yWpOyUas7sw9hvAY+eEUgwkJk
	ddxQDd6HdciPtkoekK1uC42NsGwkoP4pPL8=
X-Google-Smtp-Source: AGHT+IF48L7O0aaNZPNjgBrr3LaOh+DvJOSRujc9mlQa5jHUw/xX8XHU6w3PZ/H6oOmQtTJE03r/pQ==
X-Received: by 2002:a05:6a20:244f:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-1f544b1864dmr33252702637.25.1741809364355;
        Wed, 12 Mar 2025 12:56:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/28] grub: drop obsolete CVE statuses
Date: Wed, 12 Mar 2025 12:55:26 -0700
Message-ID: <fab492f32a8630a353d307119dd4109dac81ad45.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212699

From: Peter Marko <peter.marko@siemens.com>

CVE-2021-46705 was needed only with 2.06
CVE-2023-4692 and CVE-2023-4693 were fixed in NVD DB meanwhile

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 54c0e9bdd5..c160d15717 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,11 +24,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
-CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
-CVE_STATUS[CVE-2023-4692]  = "cpe-incorrect: Fixed in version 2.12 already"
-CVE_STATUS[CVE-2023-4693]  = "cpe-incorrect: Fixed in version 2.12 already"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.43.0


