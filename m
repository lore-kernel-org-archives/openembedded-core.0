Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825C6C47422
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:52 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.15727.1704990464517735232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YDXJ8KgW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3e84fded7so31235105ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990463; x=1705595263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRY9s2fX7OkMWU9xOlt/nkMoqWBpCtw6hvPWk4LPlIE=;
        b=YDXJ8KgWtPAomT6F5DtN6eaWTEKHAiIp+GxlhsVYKPBJcVM5KWxWzkqT9x1ePJ3mCx
         forbNzo9GI8yO9f25dmu1d8WYQDqC33ZY1IjX8VFEsvlTBxN1XXxhtLiKwDRroJFjAfd
         DOscdD+Dxe3QZzfO0ykPIkHfFEIBwFGZXYNnUEI2Vlba07AWGncWJbowaQYKD5DNLGAg
         WMkneWlrbptwIVLTWxA/yVwLdA+oBaZRJcdK4a8H/dsZjw8v5a7Zn/ZSnmf9X9rtLbbm
         OQG53qUuKA0o6NC79Z7TN+PNpH7kH8Ne32ALng/yxppv4tWGWropJ+0+O0wQ9+06HIbG
         JqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990463; x=1705595263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRY9s2fX7OkMWU9xOlt/nkMoqWBpCtw6hvPWk4LPlIE=;
        b=J4jrebYNgZdpQ4iDZmI4N8C7V/eLNMnjPb/Jzv7dqugTiaUqCu6A750PnVjlCRZAYA
         kP/bFKVpG35l4fgxe2TwQotgTclidPpu9STFrIdR7cHTUfczpaNF9yt8ey637hRka5tq
         CEYWuzsJ9cd8zRKtzIcjCJsJtCdZ2sFIpk1orpg84PMJNS9O0/Wl0nrbfrWhNOVSK6ma
         EL4I8bfkpo9iGCkzGJOCGLFKosaWuruAZcVRzizOGnydPkPJfyivOff9wOTo7Nq6ymte
         pninWkiFawmxzkZyLI9936RomnVX2xBAUjg/UCBZzpQViM8EJGIgE2Ki3GQjMm+Z+pJS
         ADxw==
X-Gm-Message-State: AOJu0Ywf2O+cVwYyMMUCZfJDkARWs+FlKdHux7c/P4PLs102EhIAk7za
	aq2b9EBYcpQdC09NdQSe2NUgzB+ZxMS2utiHI6t6G5ZjhIbKDw==
X-Google-Smtp-Source: AGHT+IEK9o8BWcJg7yn115KSOity0/ceGhPQ1QC8tQe0Jxv2SxJjFg5JnESKiD+8repQk5AkdysQ0Q==
X-Received: by 2002:a17:902:c642:b0:1d4:3872:30a2 with SMTP id s2-20020a170902c64200b001d4387230a2mr1123345pls.57.1704990463706;
        Thu, 11 Jan 2024 08:27:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/12] linux-firmware: Create bnx2x subpackage
Date: Thu, 11 Jan 2024 06:27:20 -1000
Message-Id: <bb9eeafb13a69fe71919832b89a01ef8b561f7d7.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193555

From: Jason Andryuk <jandryuk@gmail.com>

bnx2x is another broadcom ethernet adapter with its own firmware.  Place
it into its own subpackage.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 414f71bb692da7ca1899b07ebb689edeb53f8e0d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20231030.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index a1229e4827..6667f00612 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -341,6 +341,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2 \
+             ${PN}-bnx2x \
              ${PN}-liquidio \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
@@ -1104,6 +1105,12 @@ FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 RDEPENDS:${PN}-bnx2 += "${PN}-whence-license"
 RPROVIDES:${PN}-bnx2 = "${PN}-bnx2-mips"
 
+LICENSE:${PN}-bnx2x = "WHENCE"
+
+FILES:${PN}-bnx2x = "${nonarch_base_libdir}/firmware/bnx2x/bnx2x*.fw"
+
+RDEPENDS:${PN}-bnx2x += "${PN}-whence-license"
+
 # For cirrus
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
 LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
-- 
2.34.1


