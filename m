Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89BEC79FBB
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6446.1788939014176373321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kdGo/UcZ;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so355965f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939012; x=1789543812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/xz70x1STo52SYgPosnRhG/RARHHskdXc5ZJKEox3dU=;
        b=kdGo/UcZUKmRdxduM+QZXP/FPu3Z4iUi9ULHkF9/EO//huuRcoLiochH2HqkSbUAdr
         j5kWQOZs6us+YiQx1kUtXVDFkcKSZSRklxm0Xw0uwKG+Ftex1NIwnqupPt+6VQ2LTu4y
         ApVjPqKOeIIWSdsF1OWMXTKlFc0Q55yCCftzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939012; x=1789543812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/xz70x1STo52SYgPosnRhG/RARHHskdXc5ZJKEox3dU=;
        b=U42KJ5F2qz65vjIsnoF90P+60bv3XfXly2cWYq3cBbJF7f2I3Uf7mKiS60xodt8SKo
         /ICOogWRy5La0V2VTt6+8XE2OE7XJRnmtv6Ew/5rpwRnxaZsMPvQYxu0neNpC2dVR/Jx
         moDHuqbTdhYmUmjTzPva6SSc/I8toNBGgQBhKFaRhHoQ3lDaxcrh5S0WGIZKW66f20k6
         7cpTOIfCIvlEmzHhVYDy+5oX3zYPg12Qr0vyaDgPoaynTjPwVE6ujeRsFEhARxPhS3QX
         kuT1qOAI/whiNAaL2S6sQYZn9+1tuWTxS9EhQXCkROoRQsaj5/3Uaj3WI85LCC9/L+/7
         CeoA==
X-Gm-Message-State: AFuF++nNYCSGJtSFETAOlbBGjebtl10bJ5mG/oSLXZofTnhpeB7U/s1/
	4adLbJ2y5gf+HPmq0WwpH1c8PiABo+FBinAunXu1TLmPiEvugPrDxRaHekkaSL6NzkcyHqezILZ
	tSqoXUmU=
X-Gm-Gg: AYBFou2xjy/2Zrw7/1na6f6VZnBSlbuyJm85aS1/caXareGiNfADJKBXZksv0Xm0mIQ
	p9kej+cW5drqxIP8TciQoI4KCJos/LHorPA4HSwM7kYHecECZNOzF3o+6senAVqiiYQ5yUsFeuI
	F2YqYyEPtVsfTuNKF6TBwQFW7BwDxk6Q44PVjg8RvCvcbCTZ+yQ2RcVXx7nQatvo/oz6tT+IovN
	VIlsHAtjoDHni8KR8YWklYzlw0U1Zc55aTR3qLzZ8O2gpZWpGJP27utL90V3TmKXgx+Fq2SdY8o
	FqXBIJBk1GqURqy/Ao+D7H2nmJ5MOGbdOIUrfBXofXBf42s7x+GTNbygg6R7FOLlUQ46sV/FWer
	xMBK+Gx3YOCKy/T5PMipKXxMyYPcfItu4GVcRyJhggMg7hOAsVZW31dO7FUXk401SLjYYjuZxyH
	zuAf/pbbZKcu14suisPNhXzRiCNcixmdjkw4Dw3eDn731pYhC53vXPBJnlf3QYhEYcWX8lyp/kP
	hkoTQbjVK67xAEkobaXB1r9aKUC5ssL5PmBz7DLAhk9+oA70OzBzCZkFbD/Grg0QfDn90Cs6fjt
	sMSmFSZT/Q==
X-Received: by 2002:a05:6000:41c8:b0:485:8d27:dbe7 with SMTP id ffacd0b85a97d-485aad9ec9amr8991233f8f.10.1788939012315;
        Wed, 09 Sep 2026 00:30:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/38] u-boot-tools: Ignore CVE-2026-29007
Date: Wed,  9 Sep 2026 09:29:26 +0200
Message-ID: <3d02f9f0f0ac74275633f2f9eff9c568e351457d.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245436

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD identifies the vulnerable code as net/tcp.c when
  CONFIG_PROT_TCP is enabled [1].
- tools-only_defconfig disables networking, so this code is not built
  into u-boot-tools [2].
- Hence ignoring the CVE for this recipe.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29007
[2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 7eaf721ca83..0e57bb88849 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -1,2 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."

