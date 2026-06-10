Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFE3CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:47:42 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25391.1781110060713301310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aP0H+YYh;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5174a3d9598so60128181cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110060; x=1781714860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGBR6qUOFr+S8Ajz1NPMCIlp3Q/aCdRyZuvG8I7C/6I=;
        b=aP0H+YYhN4TovXHScYAa+eYB9LsE2r/WvczlPgWROI6wwJnbUh3g3KgipHlIgE4s4U
         17P5Na8kP16VXV2rRnKMSp0Mv5KLzoWDpY5r+OGRgc8h88yl4otoNZHtJ5iQ68yg/KLZ
         T/Oea3o1y+sTj6BaHlHlkSx//QEO30JpgHmmLgsle0CYipWvYJbufNeG7wVdeOZn2gTW
         Zrqz3w9Tf10ACdffiPgkJmq5P2RWj0Ae/tlVxIKtMnFSH9YoUH6aIf+0xN8x5f58ubD0
         9S+TAyzykm15rvJOUY4eei8cNIwvVuHP6gXB6nBz347coXrSyYAu8OFHPLe29Niae0mN
         xg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110060; x=1781714860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGBR6qUOFr+S8Ajz1NPMCIlp3Q/aCdRyZuvG8I7C/6I=;
        b=ENuZkqdjFDX+Wp0Gt0Ev1J+gxwq1ZLueZQBIQNIVDAFpEiWINcqkEZYSzcy6fwWLBh
         gHM3E7me5DnVMAj7wTXnSVPPJ+2LxYLzp73RH8qXbAzgg6GXJMLUCU6leJibpaocIexH
         Gt31CSQ4OhEyqPjtXkG9KWN25R2FEWK+kRY4uAiSdX90ux0+37k+OxptFCfb9WzE3VQd
         Ik93aoh2nPN3eC/z4UNFmv9Yh3kXyCWn1RgN5/QkA37dpQyXjlefgpGyWhl/V3iOiXEA
         fnxYSLIpb9ZZnKwnLNKux+QzjDYJDmzE41p2S219tbwHpVbnzcl2+LnWLnswt5K3UbBe
         zlXQ==
X-Gm-Message-State: AOJu0YzRsOYziGTH0wa+i7AdF1yY6AdqSjpRkDPhE1jUlxtMxwQsbX7F
	ZK3e6QtgOi+H+Ph/J5kocrt1pAWtgqlGwOW4HSh+OKUYt+/TjiBlewiu
X-Gm-Gg: Acq92OF89Hg4HaQGF/j388gNdPbYWIGr9oJeKmBcZrTb/wNV3bbW46D5bUhxVWtlbxz
	DcgtbDMJPgabldcnyieBqKy1FYsmU/oMajYFVkH0vK+pMTdgLIioV0sNZljhYKqHnloNhCFN++U
	LhjFU0D5dBeJs+SG56droiUwbO90FVZ6gBdXGLKpLHpPSwjEx0c4UirIVgHOsuoE+wWcfcyxdVG
	GBMci0kn9AQMRW9rE5aWwpsnopUW6fKy+XXfoZeqItim89ywMiu6+yK0AfRg/1ak16gnhMIbIHu
	6/cfWqCWHxtEttLYK9z95b5lQEzJk16DG5gTtoJJuJWUYwUkjm3HStzSPFwc2kRHe9r+/vRJlnW
	F8gSDdPXotZPUUxa0bt0aGZ58ZYdhhoZIpKNE+nyAPQEOw+4ssghHrc96VrZ6V07GkVM7nXQ8jH
	pnEYiDul293pOXdEvyvshKNs/DY3KIEF8xQGEARrouKMCyFpXpA/+TQdECp8l53XEo6LJE5aoOq
	stYvF96dHNArF/Z2B9u7gcoOav9sOahrQls3MiZc5d7SSW92ISe9saQgbK/uqzUVj6OrRu/GMIE
	C/YO9Ta0ZUD/X+8BRrAjP9ZX7la5XjJXRZF4VkQxPjB3we0go6PkUew=
X-Received: by 2002:a05:622a:1482:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-517ea74bf18mr890591cf.13.1781110059680;
        Wed, 10 Jun 2026 09:47:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d9efa1sm214422401cf.20.2026.06.10.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:47:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: -stable updates
Date: Wed, 10 Jun 2026 12:47:33 -0400
Message-ID: <20260610164737.1869790-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238372

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Just clearing out a couple of -stable bumps for 6.18 before I start
merging some development patches and other series for master.

Cheers,

Bruce

openembedded-core (2):
  linux-yocto/6.18: update to v6.18.34
  linux-yocto/6.18: update to v6.18.35

meta-yocto (2):
  yocto-bsps: update to v6.18.34
  yocto-bsps: update to v6.18.35

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

