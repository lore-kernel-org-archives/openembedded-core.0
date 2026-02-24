Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F1DE9B27F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21673.1771943583798013058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GMSNYhTW;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso63362575e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943582; x=1772548382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNsoU2ML92EGChbdALC9tukHlov5WUNc41WJ0IQ/rx8=;
        b=GMSNYhTWVUwssL+KGNwV+ZuHbArMVyJTqKkLchQlbo4QPSSKJg0++On10AUOAZRvzj
         FOU88WB0jdOPTDb0mTO7/ogqe2LuNpVQPUGUQS0+uRNK+GbBRXT/Hr/qzxzaxyoMdtIY
         Yfjn7fQ1QEsPug+EDHBsSp53I8hVz2dZdzOHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943582; x=1772548382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNsoU2ML92EGChbdALC9tukHlov5WUNc41WJ0IQ/rx8=;
        b=gvmv1CE83HKseTbW7FFyog4Y18KxEeptl2TdicuUKh3RHNG2rHplwSHwyToxd819ol
         gC5tgzm99qODvEyv3npAbqYbju4DOWHv5CQ8PXFCufnhIjj9DJtCuPjSIpC4Fk4vziuy
         2stwR39efep22MT6nMdznluSg00UhcWGIR3pGxe/d5HnzH2P1wF0abxL5ZAZtoSi216A
         66Wsx01QQ4JxlIbwu560OE/s8xUbBjrbF3HIKwk8JpYoMQVbDPOCCT7nMUGfy3Zhuq9l
         9gYm5cBwKP5EpCPV6V1hWPeDj9SEmyqm5HHH9WSThrreTF67xT2MN2CmnKY6Bb/tm2mT
         nBgg==
X-Gm-Message-State: AOJu0YyMlJYDG5UUgcn9GmnSpdJsEBIFPJ2ElLOkaKWkZ6qqLMghxpfe
	ra6l46j3w9in/wSUbse5Kcnn/UFyNOX7zOGGDcTZ2ll1AITWDoZlNlvuGEC7OdUCtjrdK6FUvFf
	XXtql
X-Gm-Gg: AZuq6aKjFpzRR2lpjcDJmrJ4e+ELT3C/F3QiQPvvGe/rggchAoa8FUUDDsuweQ+Pf4q
	EKHVtl2QA2y2HqszjuZuMmSGoBocsC0p2v3qD3l8yv8YnaA6NnZHugPNNDze0S2nlEIu1D5zMHq
	FmxvhVqn9x38IXiz3M+aXSym/F60T2ElUWUdPrjahNmoaCDVlueIVmyVzeVLoIEhMyUc0CCcnhz
	JoanDHOMucRrgmaeRVNsBmYIr37c1tIaZCiokm+APTvONEh/Kwaeg2f1pteyA7U5x5tnA7ukhqW
	JX502bRguB6WLVIJjGl7DyGUyAYILzu/Gy2iutCYgiAKUrxYR9vGICgARb7u++RHB6kh27OUsVm
	KcTVd2V/7eTCS/hBx+mcFkwoUm+wblNZPIRJFQzF67NMfWbFsPWafxhuBpc5rl0OevHCTxnjS0j
	eKAKIL0jRD0Q8jD9Mi16uIvmsx80rFPNbYouHn8LrLSUP9CFu5zlBk6ysBo5ydsk7f5qr2GECAw
	gW6tOMPqRAfyoDl29UlN0tQXyzyxWaHcA==
X-Received: by 2002:a05:600c:3b10:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-483a963d603mr185657315e9.33.1771943581929;
        Tue, 24 Feb 2026 06:33:01 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/44] libevent: merge inherit statements
Date: Tue, 24 Feb 2026 15:31:47 +0100
Message-ID: <fffa7711be946bc5d8b95a6f5460411dc00bf4fc.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231826

From: Pratik Farkase <pratik.farkase@est.tech>

Merge the separate inherit statements into a single one for
improved readability and consistency with OE style.

No functional change intended.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99792ab6ba188a7623804e587edf8de23690ad3f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 25388fb4d7f..58502edc32c 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -28,13 +28,11 @@ S = "${WORKDIR}/${BPN}-${PV}-stable"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
-inherit autotools github-releases
+inherit autotools github-releases ptest multilib_header
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.1.so"
 
-inherit ptest multilib_header
-
 DEPENDS = "zlib"
 
 PACKAGES_DYNAMIC = "^${PN}-.*$"

