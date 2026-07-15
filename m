Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE10AC4451A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12398.1784134073053089046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JF4RAGNO;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-455ca262ccbso2445313fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134072; x=1784738872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVKYgZMn2YW3UXizd9MBZQFO2yYMxvtWcDky6NE6Vog=;
        b=JF4RAGNOFjANuvJTI9vsZYDu6e4p7nNeVM1vFzHGcfPED5l9pQFWjC2nXOXxMn4l+F
         mSjSu5ecWkDueMBdfRCWbHUeqvqap0e9KJ7qkPsHvs2iFO+fjUyTbdYVz9YB2wdq2l/G
         fmgdppB+P5FAk4IE0YhpfMax97IRZc2smuPhBo3C5ncSuADG5mFheI5LTS+vpog+ekV9
         tZAgDMo5Y8Kk052fgIQKbhV4ZFStnfpP0+njxGtP6x+k0Tuz2Io4iLUKKh7v4CJKwWbi
         uYsb3ZLC9ATIRykkCKDw4/DwDN3skchdZGazlo50aTSG0bp4Z1vCWoCg4dQVguXrR75V
         /XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134072; x=1784738872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVKYgZMn2YW3UXizd9MBZQFO2yYMxvtWcDky6NE6Vog=;
        b=KsiYxx0mdcJetaRERpeZCrr0+MKSfml1JxqRrr0sYtQSDGXDhcHmf097emKY/ia5If
         3kEeU8jfp0UYrXFiBWNGjP0NJOHoFUJwB2l8l+nEnEsNJesg0HTr138r0Kkd7YLNm27G
         mQVhTnif9hgn6Swqa8GL2NOyR7plxABVFB8RVSTgYhr76r0GJu/pxwz0CevD86XqW2oG
         g2oV9IHbtqKJP26f/FXZaFMsjiGZ+3G2scTJD6mkqAqxaq12YHZyflvV75E0BBuf5c97
         8CtnyagGNUWyN76iX4fcDr4nYpIwN+K++38B9Bwst1AdN/wmqJXT2lQQ8gJv+jC9vViu
         SiIg==
X-Gm-Message-State: AOJu0YzB9Sw8DGd1xo4YalADYcO4tCQm8zZoSloabDEylKHsXT4nm3kg
	rmP3GgT6cWKBEiVg/CReWRyqU2yvWKvSM7B+NI8L30WA5F/PDUEadtRzr4YxCg==
X-Gm-Gg: AfdE7cmzeEQ6hGu2uIYxJy+Kde0ecZXSTDVAcud8dA3E6TaFgxsil76WxGgwpIiWgTc
	Hxv8HnoOKoyYNVQm9U3V58dh5OZbhgnwjhIUoBQz9ishhAYNZMh9BiPS+JlpcNlA2mSGM6hdXz0
	909cvMLUp1uidVzdyo7osdGdPDZjp/QHWS2PDxlE9S0LTqGBxLQ0wRbav4RL60Tz3xtQGKmtP+W
	mBXR2Vvrf5EUhQpRnlKka3st0JhfkBxU5QzUq2JzdNdHJg0bk1hnG+dRMpGhqpiCrKtZOUAcPT8
	PFdMSAdew9wq10F7QXmD9UeYEUyAVoz03UiMllZV4+a1EzYUfzt+cV15Cb0B9KZTIOI1y3nb+jZ
	GpcBXVZ1KA9PdRROlzwxC/fMW4zzpAVkiqqPVg0HACLKiQREHXb4xk9W3nkJr68oTnWCdLjL7YU
	/w//S9XGXY
X-Received: by 2002:a05:6871:470b:b0:455:ac39:9909 with SMTP id 586e51a60fabf-4562b7cc8e5mr2197101fac.37.1784134072174;
        Wed, 15 Jul 2026 09:47:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 14/25] flac: Replace deprecated SPDX identifier
Date: Wed, 15 Jul 2026 10:45:10 -0600
Message-ID: <20260715164739.364323-15-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241007

GFDL-1.3 is a deprecated SPDX license identifier. Replace it with
"GFDL-1.3-no-invariants-or-later".

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index d55e157a9d..d982825f7f 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compr
 HOMEPAGE = "https://xiph.org/flac/"
 BUGTRACKER = "https://github.com/xiph/flac/issues"
 SECTION = "libs"
-LICENSE = "GFDL-1.3 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
+LICENSE = "GFDL-1.3-no-invariants-or-later AND GPL-2.0-or-later AND LGPL-2.1-or-later AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=802e79e394e372d01e863e3f4058cf40 \
                     file://src/Makefile.am;beginline=1;endline=17;md5=9c882153132df8f3a1cb1a8ca1f2350f \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.54.0


