Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613DCC87FCE
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:35:29 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.2654.1753385727437203414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bEHAejYR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3f7404710aso423598a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753385727; x=1753990527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hvo5vsVjKoOjscMm2OibQrM1vdRdkv7ItWY8D/ctRU=;
        b=bEHAejYR5oNa64lDUqabeT0mzCc/cNQ8MzArm91iUzb+dJ7XZ0Y96FiXLA73EX3biQ
         b8XJW/ZzA60S7agzKpm7LUa2xzMlNcBpNqWS+/VcJ0UvsPufkncY9G08++CCnhvb194S
         FUHt9pZQUYi7W0soC4McKalfNww8pFMBll+hXecoUoBeeQ8KaBvUoDi02WP0pJL8gl31
         xuswE/e3kE9A4j21qPupQioj7FCn/gq78zwbey2hrp9MbPm2r2YpFweCwLUbwP02+0ii
         YrISpxEaw5bjF+Kj3DI7uBTJixhunHn/DNYdSO96LKk9sHz/pg/RkLcN8Ne9uxNs1uU5
         UK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385727; x=1753990527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Hvo5vsVjKoOjscMm2OibQrM1vdRdkv7ItWY8D/ctRU=;
        b=amefaagh5voUiyWADlRLBocGGwKnKx0Iq/lGVENqHLz4CvzMKQsJrlTK09KzbdX49S
         hbp34iD6ESxBkyi2ZfaUP/HcSpUS12Mm+9+cPpeIUcMYNvYfXuOqBxq6QoXd1AGt6ERd
         JBYxGOd0C4Fyyw7o4kM8B1q0yUfmrpjgE78Wa48PjKEr/B6RNroO9vHUPc9Mi1BuQKQZ
         Tn54PXqFJWhU+i6TnOi9cJhjWjIe6oFtOUcD38qaSJDLj7WRM4qC1G7q+wSkgtJxvD7Y
         9fuEx5AcQheUnxB6WC7LOWXf7rquVtqmuahTxA4dzQIIpgzIdtdtRFW2k1Cv7V8ZWqhu
         TciA==
X-Gm-Message-State: AOJu0YwjEDHG09L0J1bMMvLOopq/z42D6sqCMnxXJXBMAP+7QJf+NdBn
	uIolFzuFqCq5/0PxFWWGgGmatBqSW0vY6s7orOablrBL8gcY6WoC/gZoLD5ronFHRJmM3ssj2pn
	VUJhc
X-Gm-Gg: ASbGncutscPWUf6brnKYphl566GNBkzjXeE6pEE2jSFGpMpUrWZbkb2rZu44j37MiQX
	zmRpC/DEA8uv7QAdwU+dwmPY4OkrD4KLsX3uFudBNgWsEQLMxNGIw7avfJfSwC8h4HBoDKyyt5r
	97P/El9vxL7urKF8K9I97zv2VvdYzcwpzS7wUVHKoDw17zqweZgSyIO8Erww4tuYsIgX3FwA8Je
	tX5m0AEQS40LbFylm/fHYaNtz9L4NU/ymOamdsscTYPHIJs80WphvBlPx2J3C04la1OX5BnID7Y
	ef3c8X4kt6Jv3DyZZNWgxZ0oZFk0L/7lDqRlJ6sAdQwdbXm35QPL5TwF9aeOXkZYPIL2JknABq3
	HLxSj0eaF4hm9+FS9s5dEdag=
X-Google-Smtp-Source: AGHT+IEmC2XNDmF94AOrYV7W2cqiwWy7t6Ee2BpAV7XCqzPVI9mM9LZj6NVa7pKbRxIbgPg48Qak0Q==
X-Received: by 2002:a17:90b:2d0e:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-31e5073f879mr13028972a91.7.1753385726495;
        Thu, 24 Jul 2025 12:35:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66267fa4sm1978524a91.5.2025.07.24.12.35.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:35:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/6] xserver-xorg: upgrade 21.1.6 -> 21.1.18
Date: Thu, 24 Jul 2025 12:35:08 -0700
Message-ID: <5cefb53aa0e19cceb35bcb46cdfee3cfa27b8e94.1753385563.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753385563.git.steve@sakoman.com>
References: <cover.1753385563.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220863

From: Vijay Anusuri <vanusuri@mvista.com>

xorg-server 21.1.17
This release contains the fixes for the issues reported in today's security
advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

   * CVE-2025-49175
   * CVE-2025-49176
   * CVE-2025-49177
   * CVE-2025-49178
   * CVE-2025-49179
   * CVE-2025-49180

Additionally, this release includes a fix for CVE-2022-49737 which was
issued after the fix was merged back in 2022 and several other various fixes.

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html

xorg-server 21.1.18
This release contains an additional fix for CVE-2025-49176 from June 17
security advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a59b385184fb3a548dc27310fd04d64351d8dfba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 38c81f2372..14c45be432 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


