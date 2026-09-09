Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5416C79FBC
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6331.1788939015749062391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mPhuKP6u;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0d2d37ceso19280755e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939014; x=1789543814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kfp8lqJ3JstFipffuTIP1j8eENGdtTGif0xjP5C84bk=;
        b=mPhuKP6un7F0tN4omJ35+UG24jppzlTT1xcKB/gw0bj9xYGsjRZRf+2v+tRPP9TzBi
         3LfnRmJZshR+gLq+ldxW6sObv8OY8Ois5EBRPjYj20cZ0jk20qMly4S/zbaVzquNjcqM
         gguwbz1Rb02/EC8QYb5pKDBG/XsmkXs2dL6G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939014; x=1789543814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kfp8lqJ3JstFipffuTIP1j8eENGdtTGif0xjP5C84bk=;
        b=tOaYRZKlXjuRg2YUVBOMGkLGT1Ru/dDJ5tMbVdlMTcx/XRWmLZRdBmNnvpJ4wyGVMU
         UNiN7j32jsa2wpzYGVEddjBTX0doCgWp91LpZZsgCHuX6Ifawhf6Pf79naZQmuxaxxU9
         RqheVK910X0C9yX8IjueEMLcHXKkmXaWK/DUebS/bJuJHkf8VBtIUCN9Oc8eI7QWtupP
         MEXkgSUop6f1Ux+yVO3DNIsfeNpnbcdnGI+etYauacmALYWSzG4vTArs6m/xLZ2QMNF9
         sOttHXMrlO6rPIfkh1mem8CHSQiG+KnNTKJnW5W4JLarcjJmb2Pi0w1BYgGM0LnmBXWc
         /CGQ==
X-Gm-Message-State: AFuF++l1gTozQL1hHqYCyojYeeEeTr5SBdy6yramQqeE6V0k/K/oIuMF
	p+FNkvgfMyC3bt0PgmzIuy6Kxg8XF90Mr8eMaXcno7e0aCw2/pph8b3+SaFyd68iFF32f7w9CCT
	Ejk9/PiE=
X-Gm-Gg: AYBFou16lmJ7QKXURPzzHOV9iNumoowsVdzOMFYcSD26pOJRnVn50swFqkI1/fFpkfq
	/Ye7T4xAQngj3sjpphB2arXXvjhfjYnJoI30e6eIZ7pt6+cW3n79l1MH8ktmRlAV3lYp2/2xxrb
	fqkAB52yBNN5dwXGK086ohEXpBXydH9xVWeFQJYXKwGXBK2MJ6RypsqECJkqLLk0ZWNtek1EGZB
	fZ5UMy6PYSnJKZhninalipUc5ifb2j/3Ir1N5rZWByfYPmXstDzDemuz2amNtBAjp6SVaQNfLGg
	ymCNv6xOBA4eIJQ0LROYgKRsZvhvEzfMaW+JDYwfYT8kNzOrZir6Z09RZ4KPK1KYZHPoMCoYBmN
	yzMdubVZ3+lq0fS9dCU17LQRbpAcd+IppaMiuAflRQM6kJgi2+vDZRTBHD6Pz8JKisCaonUlpGf
	RQ/MmjGC420yorHVfiocsPttgwQom8bp9+7HhPKQdjCsOfFpQFvXddBLiSAWJ3s47zMUZUZGhI1
	5TiL7cnQTKPbVQcqA3oEvuX9J+tO0JkugQQetE+1COkU3QrS7a0qzRG5EHMGb46Q1psIaxWr0GQ
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr336208455e9.4.1788939013912;
        Wed, 09 Sep 2026 00:30:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/38] u-boot-tools: Ignore CVE-2026-29009
Date: Wed,  9 Sep 2026 09:29:28 +0200
Message-ID: <f9b3a060fe24d6282aa561c690800b34b4ebaae7.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245438

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD identifies the vulnerable code as the NFS client implementation
  enabled by CONFIG_CMD_NFS [1].
- tools-only_defconfig disables networking, so net/nfs.c is not built
  into u-boot-tools [2].
- Hence ignoring the CVE for this recipe.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29009
[2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 6b28718c54a..5e2ed063868 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -3,3 +3,4 @@ require u-boot-tools.inc
 
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
 CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
+CVE_STATUS[CVE-2026-29009] = "not-applicable-config: tools-only_defconfig disables networking; net/nfs.c is not compiled into u-boot-tools."

