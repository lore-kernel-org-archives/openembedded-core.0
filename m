Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E968C79FA9
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34921.1788788158656077410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OSzqX9+i;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so35013995e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788157; x=1789392957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLBvTd0pSoKjNKRcjCXhBuwa5ER4z6N9VpJSmtBA9mY=;
        b=OSzqX9+iyG8FH7IuxE49voTUe5xmyEiBl/jv/A+HXs7Uy2eHNnKaVa3DGd6q5E6svJ
         2MrTrRUDUFvyQddaOmzkbdtCte4UV9UzyfpL5O7GbrOgGWZ9Msv3JHxIbaHBRL4JgpJI
         yVFr8XDu03DuC6rTZj/9Yi5wLrj48GjV4LZjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788157; x=1789392957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TLBvTd0pSoKjNKRcjCXhBuwa5ER4z6N9VpJSmtBA9mY=;
        b=dx1S5NTuNQO4Pfe6L9dtYfr3YUxM7XrFYR9wq/P1dz8YdtPJTXISgcoqNERYTpU+Qx
         kiA4XIe5A2VOKI5MlYxpYw6KkiPnFV7F/kLN1zwhVpNCaGNhA4ASuhr3JUrsZb3m5LuS
         lHlCW9tFm29de6HNpcQ3fTnCnMwaCeeEC8x4zKc5aO8l5cwkfQ+7aIxNniTnGlHfl+Re
         1UobxTVMwsyXnaaDQmav7NT0l7skFFF8T4I4Ms1QTcDWK4wM32D8WnnW07iA5KsiDW0v
         BF1MjcuV7yQaHChFE7Rtb1gV/bH5wsiOEu99LNyT0iKMa/WrhvLzYbAwdAVPgYGJDqvf
         aJmA==
X-Gm-Message-State: AFuF++nbW9whJjOV67jo4XIh4mSE0BcC1SRlCFyu6it6djCE+t692fll
	W4skgB52BZB3IOJoUEhyQdgC6inYJxoSJwozVAmO28YUNLVk46C5thtsHuNTMUuhHWUNyDx/nq9
	sQYKhzRI=
X-Gm-Gg: AYBFou0DXijQ1TjN1IS+vtjJ6Qb0e2PNPU9ZLhiKrEovbPBKNF/BqpTEBM9Lp8Tc9eK
	4J7Ywf83/vVt7rDrBobMMRviaN485bnarwNJ/5L3MlkvgGmd5ULeis7tG+05WVWAchaZjbHpr1J
	Qrwt9PAOVyKi/ZcZjjTRuS032p1HPEjj94j2nf5N90k1d5lFRcEgiExxQmseKdoZ+ug7B9CcZej
	UyZRKUFVjMLoICcF3yAxyS+Ks2oKhyzhKp4TCZqfEAci/iQ5MbvRW4UdxfIsquEedrbiNHxjlhI
	r2qBK+tyTTkk4x89l9zrz5WPcumzJ9pRc/bh8rfrkQcwV6CpBCYfBDZCyX+24WYRrrk238A7Onw
	LZgtKjQvBJPn/QEmaiLOuET4bcOYvixhlTRn6j02NsjDaBuVfb8+gGRLR1rIPFh4wLhaD0x9hOE
	eZloV5kyzJIswbWMQh1GabaGAg5v1lEYcCCD695eOexKpy4Z0mSH0WK0zhsToBtwLOw6ab6oqTF
	a9RZPr4CtBRGR9d4rhOSoz2WptuxUIQ5Gi5Zpe0ziNfmxG9RNI8GOE6GuX58O6w
X-Received: by 2002:a05:600c:6214:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cf825115bmr464814815e9.13.1788788156784;
        Mon, 07 Sep 2026 06:35:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/35] libevent: set status for CVE-2026-63380
Date: Mon,  7 Sep 2026 15:35:07 +0200
Message-ID: <7447b6ffb1ef18cecd7d45d2e397018dfa54c78d.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245269

From: Peter Marko <peter.marko@siemens.com>

Per [1] this only affects 2.2.1-alpha.
Also [2] markes their versions as not-affected.

[1] https://github.com/libevent/libevent/security/advisories/GHSA-3rpf-frgx-xq34
[2] https://security-tracker.debian.org/tracker/CVE-2026-63380

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libevent/libevent_2.1.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevent/libevent_2.1.13.bb b/meta/recipes-support/libevent/libevent_2.1.13.bb
index b0de8637390..22894cc3bea 100644
--- a/meta/recipes-support/libevent/libevent_2.1.13.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -55,3 +55,5 @@ do_install_ptest() {
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
+
+CVE_STATUS[CVE-2026-63380] = "fixed-version: only affects 2.2.1-alpha"

