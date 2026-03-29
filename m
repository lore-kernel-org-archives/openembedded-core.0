Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D06BFF4929
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38492.1774824391739343713
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lo0KOjNV;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-487035181a7so24943755e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824390; x=1775429190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Z5P92f/WBPWltkhEdKSyzPt4B8v/iLjxe5CiaZdZIQ=;
        b=lo0KOjNVBYNHrgFxphXP5NyeqCMC6n2u0rcRG1rZIa2eeyFmCxmlEp6h/mfcJPqaBN
         IWMNiuj5JhtE1mLTURUMifxHWoqod10mvMgUbIlO8Z35xidryrcdol+Cxr5CBVyF9vw/
         ijAIuty7rF1LroMx4Xm/+2bWyhF8FTg3Dmhyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824390; x=1775429190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Z5P92f/WBPWltkhEdKSyzPt4B8v/iLjxe5CiaZdZIQ=;
        b=V7bbWUTyx2FIjNy3wNRHPX4kdmocOlqPkXOQFtiS2XZXgar0c2r736sDspgLzgTOwQ
         Q/mQFi44NIKpNrWLfgCw4cFCMspBpBDJinJ7IsHgi4I0xSI/cxoqLwkqltFXK0WP9vXY
         2Q8yb75aTmuoBYTwbVwmxipQhWzHmVmlM2VcT6cNvPchzBhDDRxDvmlzHeS1l0Sn1CLS
         HIiHh8qzI1sIWVsp+6SePfxycQ7NSMRX39oKKTyIRdVDPHLm6TU7pLBcYU+q8LEETad+
         OJkQauxOVHRt/V4teOAMZGit9Etpb7KSLR6N3i6XOj6hI9xE9gSQqIQ6kCnA+S260wwJ
         1ZNA==
X-Gm-Message-State: AOJu0YyTvOjC4Aowh+REuXMefTzgAtdsT6KqX58snrj0XRVxULLoAiYY
	iE1FffnZewsxkYCD94s6aQ6dtzLVyw6sWA+iGP+XCxi8t0nQuDYRO8Ez+9eCaK2P0H/+lMBgcTW
	zY7fzXCs=
X-Gm-Gg: ATEYQzz64jAetrL3ro5aAMcOYknc84oSYBmSTRKYIHnQPTz5VPBnMDdHbNb7tjWySu5
	LLmg4rhLGpFByMI6LvejA/48rEinqcHyir8yky5jeHUjGEIJBjN+sAo15lP3zZFGii1oDQrBL+U
	NAx/rEhJ59UNzcOjOtsgQzB5PeGhd+zNscN9PK3z8OIEKbOiU5k448OIBot8YLcsWYzvcyhhRTq
	N+8BO6UEl86wsNsGiHlHAtUPw43thGwcb8RQjoUxOO8yRzTgHgCnH7kLM6JjtCeB85hWMZ/g9QA
	6f1v9ggeYCfTai+8EfSntPnWSyTjFRy3j9+cgrrM10O6I7VTvFaKOe3igFoHpV8aMWxvv4UoxHt
	yl9teoYMtfcZhglmIU007MrnlkzEOub6B4D6AqdPnLNrL2NUXudXLzw7kFbgtR0I+2XpwIU776l
	BDuyIFhMvPG3FuA0UZ7PPyegvGFla5Iyh5JPXyHwqV//ElQHrq8Bok6B/UVu8fBRP8N43WA/q/H
	gOMNUhRmr5s+OvDQUhEFX9EaNI=
X-Received: by 2002:a05:600c:a408:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48727d735a7mr132021845e9.8.1774824389710;
        Sun, 29 Mar 2026 15:46:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Mon, 30 Mar 2026 00:46:08 +0200
Message-ID: <7255b0ff315367abb5f0c6f00974bf30f7861d1b.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234182

From: Paul Barker <paul@pbarker.dev>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f21bedf4fc5..35f22d5a15a 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

