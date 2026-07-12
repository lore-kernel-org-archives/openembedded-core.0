Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6442C44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14794.1783866583089881142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TvSyaRSd;
 spf=pass (domain: underview.tech, ip: 74.125.224.51, mailfrom: vince@underview.tech)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664db84f074so3717138d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866582; x=1784471382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbFY+D1ZBUrfgvpTYCBvCMbZbwi6J3rhxyQH4S9VS/s=;
        b=TvSyaRSdlen4YTtxph4YuOi/zerusjMwgxdmepRcFwVLdigEgfifPM85It4O7dRVFe
         7N3zGA6S9GCbS36PuPXljisWTueAUGTsXM5cMRHQ/M5eiD4oxK5UXKPcan0g5H6dRe9b
         SY+ZtjZYUue1AQZj3KT0fyNRFEB5L6IezyAMUJo1HZf0dhvWwuG0R6G2t1Ntv6c+BtN8
         DqQKBYed6+JIJY0pXCbeGmRe1giMU9cRfFFz8WMqfRxqAKcvFrBkYVHPIP/PMfT2IgbJ
         /3i7wOzJFKXjxIE5sq3lmeGINbIbxHnT91/bxFSIGr8TuyXPKJ5XdSGiIwPlT4KPNn1b
         jt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866582; x=1784471382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbFY+D1ZBUrfgvpTYCBvCMbZbwi6J3rhxyQH4S9VS/s=;
        b=knhoH7+M+sM9OAJjxavWCXmAlaVfU/U1gblxFmS8dC0uAyjLPjjejBG5/UWT2bUwNT
         SwznoTlWzTfzMnJ5dfN3YJAZMVraMbowGWybGphXNaK6Aek+uDjNDEr4+dazTtxg5ryT
         L8dg3ipurlrA1FkOM8azrzMeNO1vstbwn4LxCsNbpIde4AvYx5uwg/xRcd6hyVFkGrVq
         iIsiuMQhVIKJArHgrhEK5SoJa05ejlAjMWLsJ6vGzanK5BtaBM54xsKux2y20GME/Kd7
         WbP4J7jnBruwE/VblNTPL7FU4x7mxSUyD1AOY8flrheiRRfpCaXjwL6aFIt0/KG9AbUJ
         a4yA==
X-Gm-Message-State: AOJu0Yzeo1NYFuk+lwKxfOWy22Ru2J/CgXOBGStbA2xSs7p1FNuLg5dO
	Gi5rBmfBeyljRRjrdZTGyTzFuJ+owuyjEOme1wrm08dJkS8ZDwAP+i1g2Bjq0gzPCYe2Fhpmbwp
	cNC3FBuQ=
X-Gm-Gg: AfdE7cnI+CLP8hFtmrypKeoniKLmBiHaIhtS3vigequvjR8iS4ubW+stwYBefrhiGY/
	86ihpux5NZA22GjjOJoSCR4FtNbLGOp2kEhHYZMmfEJT1YWPWE9MZmyDQMdGfI6ybDRDGwLsH4i
	0ITeFMxQKEFAB1Ear7/xI0/CqUn8jb4OdkNVviBUbbd8GLgxS6EP6wwtFRCUmR1PF9JrP5EtP+L
	bxvIckhatCDEGwFy3smYXJZDY58UAMw+SccHePzhzTOGCwKeKQGme8diXuFubo0qy1SkM9Q2zlB
	q7KY0BgzIN+TGbQWo8MnlgoxC00dnZJxMuyeDJc3gTNTgE/CTu7SOmpBoDp0qZ9ttOdTwvq13HE
	izNdzhV8F0t691k3TE7DaQowK1jYr1awC2IV9lghk78g3OmgDMR5YMKeHaX7fBOXFvQni9P18Nr
	wuch1XPyl0fSnuUg==
X-Received: by 2002:a05:690c:d90:b0:80c:85e5:8736 with SMTP id 00721157ae682-81e902e8714mr41950347b3.68.1783866582200;
        Sun, 12 Jul 2026 07:29:42 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:41 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 20/24] parted: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:12 -0400
Message-ID: <20260712142916.2573370-20-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240786

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/parted/parted_3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.7.bb
index a669919dd7..4215cbf4a7 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.7.bb
@@ -52,7 +52,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest = "bash coreutils perl util-linux-losetup util-linux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-core dosfstools"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-scsi-debug ${KERNEL_PACKAGE_NAME}-module-loop ${KERNEL_PACKAGE_NAME}-module-vfat"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
         glibc-utils \
         locale-base-en-us \
-- 
2.43.0


