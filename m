Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A43E6402B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.10684.1732226077456386990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wTgfhzHT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso1154052a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226077; x=1732830877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbKafYvSqWztvcyKY92BV3nwvsmqtdhRnLChRR6oEUU=;
        b=wTgfhzHT2edR4kvjWdyMdrKIJPmu4GrKoprVOV0AM4rapC9K574O6iZSeRzptXJxSm
         vpn2n/PoWFFWGHoiWFeWvbwSbVhfWP1Emnpwt44IMFpmEt8uT2UpIWLQgTzlrp6d8e0k
         Sei8TSMgFKs/uvLeat/0gAapk4L1PrGPtNqh8bPEcQvr6S+Shpdi7fUwJwNQ9Scc2KaV
         3Mjfs0HE5EPdJtileX3MzNsemVSmCV38+eJHDoMD3CXS69WzoefVT+iK65IfYjSY8RYp
         Hra0z0/eXT2QJpWOWGYtzvSHeje1dFjp8ispdyD0zsQsoC6v1lfVmO+VkMziQA85oUUp
         CQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226077; x=1732830877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbKafYvSqWztvcyKY92BV3nwvsmqtdhRnLChRR6oEUU=;
        b=RINNLiHLtHECnZVRP19AsUwp1kOdDpLi+25+Y6tGylljSs0ifOc1z2BLuDwGVl51JJ
         QyGXST1vAYxUMtvtTn/wVi1HRpJrvKOiz/T0qhaHMDrRi9Ea0upIw/SVJOnNNnZBHzNU
         +4O4lTs/maKqvGL1fnjlKP9MQyiBadl3LzZxhKKhpOiwBHVi5Q6kd5WxUW6WvGTd8UIK
         84uj953bHMTrel/FQQ3j+vCijSa+aoKn44bTJQMq8uU5ouFpTCX+uUmG0WHB4bWJkE4S
         iaLQ8kpesGNw99FqdE5xLAhQR9hbUdckftZYLZ7bq9PPcSHdnTNWwqBvJZ3l6nzqp4Rx
         I3gw==
X-Gm-Message-State: AOJu0YzAsfdcsIQMadWn8Wsmz2DDVraGqHU1/LIWQHtDVguGjtxQkmwY
	pi46tHaGBb9q693nZskq2JU6DVW6Mfh5wxM8cWdCo2woifMrkBkviye2Ke04+MACabyQS/3Ibuj
	U
X-Gm-Gg: ASbGnctk3fKu0BAlFecr0xw0Cs3lzMOBJ+e4bwUd3pYJNxp/KcjnX6nvAsCXCmD8gaZ
	ONSgevtsFSKDqDHIBO8rhi2hT+pl4OakJruVeECj71dmgmmx1wqa6mdN73ErcNYxihs5LJ+dCAF
	TS/JrFGf5gzepsyF7csBGGFUOwbLo48aEyBGjdvBYiRslG/deDjB1RekWqEB6ajXIVgKrCx+rWK
	0kg9Sw05of6i0RddlxWsfqF3sDyV0TpAk5/F1Q=
X-Google-Smtp-Source: AGHT+IGdcyow4l/agGeaRD8hnjuH98wcv6jyhCTCQNVVETWcZ1orPXuCKIegnSeOthpULeSCwfyGfA==
X-Received: by 2002:a05:6a20:394b:b0:1d9:386d:9441 with SMTP id adf61e73a8af0-1e09e3ee1efmr623061637.10.1732226076714;
        Thu, 21 Nov 2024 13:54:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/27] shared-mime-info: drop itstool-native from DEPENDS
Date: Thu, 21 Nov 2024 13:54:00 -0800
Message-Id: <ac5eef73e96a2e2d3a2383f17db3742114b428e3.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207565

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

itstool was dropped as a dependency in shared-mime-info
release v2.2 (2022-03-27)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index ef5df44ad6..b8a377e2b2 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
+DEPENDS = "libxml2 glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-- 
2.34.1


