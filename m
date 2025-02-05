Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81585C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 21:24:40 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.24534.1738790675208465004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 13:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QwigvTYB;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71e2764aa46so190991a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 13:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738790673; x=1739395473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pd+vlZEDwgm3zrRY4c3hon35bEy2SG3LnRaKwXYRkk=;
        b=QwigvTYB8NcJPBDPuARj0uSMxUsUMOkkEDVlrkfTueCx4qSjdPp4hkOGS84HOI5/zB
         j2uf6/tFzPqOLxA/ZUIIsRdDuioiUzz2mxQ7DJ+gxjDJ0ESgKCg2yIIQMAhTOJ0zrSHV
         19wrFPIs6zbJ4/bHkM8ZY2mlaLcxrJ08bGlGgqCjH/X5zhaHSiZtkRI09un99uwOQoOp
         s6TW5WzAgYAMaoPtNtlDF1/ED4DjbZbdGv6JXlCrXG601y4V0LPQeT5K9TWHdniQSYtL
         aJrzRlSBz8YrZAyjSTFqA7O2ksIQ3qX1LAUVISvnvRWgTgw9EH4Gl8mUnBUKfwoB3kP1
         mGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738790673; x=1739395473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pd+vlZEDwgm3zrRY4c3hon35bEy2SG3LnRaKwXYRkk=;
        b=lloTl8VZ6IFflKrTtbcMBw8Li3q0sz0zNxGOxbFfMYHhJBum6h+9Frnv5LiPTDXMvi
         jRDr8SgDi0qnYtJLcQzQRAZ8hL4AfP+x2ItZKQf34tha3p7XoS9y3iDR6mCgbqPUGG0p
         rZnRV81ItDe4k7s4vL/zteKML9mxFMkc9b35DpXns/4xd2Ww7xjr8G6Qzeh7TcuXsprh
         6uLmeng2rph0GG8YTNnoDTlPUNWcisLGKPCRacNTs2x0PLgEWV3hgppscjlG53Jv3bTT
         3JcmP8SnX+78Vd4YtKEh9Hc5f3HrWC7elW8K7O1v9Hue3M3SX+28H0cn80WUcmkCQnym
         LWCQ==
X-Gm-Message-State: AOJu0YyrDzgy9TXYhg5QhBhd+tMiS8GsY+vdv+l3qpSimxehwRTBWkdN
	2TcN5lbrUduEr38YCmmmGsFg11EWbB1wAS9DOZfLY4t2/ms/pr2pORt1JHIo
X-Gm-Gg: ASbGncuVRUzILPgWuX4RuxImy/SP1RVF+NRqH6LRrViAhPNJix5o8tHW4rpteEbYBUU
	naFRxedFkINTkfr9prKRkU/pdaXN6dTCyoZz4BbVsLGrHRVaq6Z2Q+Dif4KjXiiwJfLsXyxxCMY
	yVGP2mqpnyyLnG8tYV1XKZdmqjgK6xcuf6YF1O4TlI0maWYma7l3nkwaTSzt3dxXpxSXmCs6C3r
	KepPY+gE9pyPysppV4+TT2+t/djkJViXaxZRPkfcaJCiOuOxxa4jiac7npa7W2/Am9vwWaFfJ1X
	1K/WLu12XaxXJw==
X-Google-Smtp-Source: AGHT+IEA/OxKsM5UcAWUD+vk7/YSdSxzzHzkB9EzSv04g96b+JqNUvLWFiRbSY0bthjtxpei4/N2fA==
X-Received: by 2002:a05:6830:6189:b0:71d:f4e8:f5ce with SMTP id 46e09a7af769-726a4237049mr3045290a34.18.1738790673260;
        Wed, 05 Feb 2025 13:24:33 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d619])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726617de955sm4077131a34.28.2025.02.05.13.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:24:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
Date: Wed,  5 Feb 2025 14:24:27 -0700
Message-ID: <20250205212427.2044310-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210875

Per some usability assessment and offline discussion, one of the useful
use cases of config fragments is that they allow the "default"
configuration for some device to be committed to source control and
easily selected and used by the end users. However, when doing this,
there is still the desire that the user can "override" the provided
fragments for their local builds in local.conf

As a practical example, the configuration for a product can be capture
as a config fragment, and an empty local.conf will reproduce the
standard build for the product. If the user wants to make "tweaks" to
the standard build, they can do so in local.conf

As such, move the config fragments to be loaded before local.conf

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b607088c6e..d0154044f5a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -826,12 +826,13 @@ FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
 require conf/abi_version.conf
 include conf/site.conf
 include conf/auto.conf
-include conf/local.conf
 
 OE_FRAGMENTS_PREFIX ?= "conf/fragments"
 OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
 addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
 
+include conf/local.conf
+
 require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT_MC}" != "" else ""}
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
-- 
2.47.1


