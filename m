Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37138C61DE1
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3050.1787945899293395295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zucexOok;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso16805155e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945897; x=1788550697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GeParPKJYAGL+847JChsQPnmKMT8VcYQQv4m41wmL1k=;
        b=zucexOokkKuaM4leBpVRodfsTcDUNhqcRq7YYJVSy7sKxl35pHUS1mXeCXm8+xasV4
         9Yp3loF349oX5Yu9Ft4sRc7mosa6I+WOCjsbBa95pyriczQRTKcX6v1+8TqQqScbX/Uj
         vmtyp7JCBU7LT/Hi/n0LFY9zZNG3T1nQIIlL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945897; x=1788550697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GeParPKJYAGL+847JChsQPnmKMT8VcYQQv4m41wmL1k=;
        b=kfWNN0EGkkUuk1k6BuwXgLn/xhrpc/rnV5wSz7BDcwAPxMFVfUlYXAQxhq6J0DfL+6
         Gw4+s8ZiQJR9Px4LkW1FuSQWPtyArZRmysKF1hsTk3RkEBk/0ZzFnEtpm2DAD16rWGUX
         yOk61RawBzbiHyGrVLynAYWAVJZeJtx5zA05VugYODPlW4GYWyfKezRn0OONyuBFrTBh
         TRaxa9ra4GGwkIhuvLeZPpLpYr4TX6Mw90usRqeBaxuMMKiLZMzFtGWEwwwrCngcYRn2
         OIjf+Lq5YePr5Nmc2bMb6xGuEhrIbTzbGAgfYtSIW1gNNlj/jBVdRxbvwOb9GoRYQ1zJ
         1GkQ==
X-Gm-Message-State: AFuF++n8Bl01vzVdrzZBg8LPbMWqZkP+MhGSbFMqd/5iNs8/o1TT2aoz
	F+/jTqGcm7i+obDt3EhuoBAcPHfrl23QkcjOcBDd90zAuEDTjKEjKX1EvKvVq02TLkf73loH2As
	kstO1i9Y=
X-Gm-Gg: AR+sD10WY88DgUZfzNwlYS2tTUm794VHhqYlgLOCVcusBFHfBLeCB0jCgSucLNK3k3W
	WhlZXwIsRg/nhw3Whgw4P+tc6p+gwq6b7EyKogEGEW0xONgJ165ooWoOI2ME1l/Ob25Os012UOY
	iHGeDHgZHG8hJ6b/w4YsbZ54gsz9TX+EFiIBN+NsV0d//BuTVzGhG7IvfEklYXMfuWY4Yo4kmtL
	p+rNBrtlao6/a0X5URorVC9eltl4Ag98Gy4TXJ2PwV+3iXHHeR35yupzghIw8XtISKXRbDTV7Bi
	3aOXluV8yj5ZFTeFvzTEBllGSYvj5MWQvabOopXuvQJ266l7rE0CEpj3PzwxyjmSwkro9CWvOlv
	Bw7EbGyl9Zpn3IBtFUZb8mSZWrKVd1rR83j1oo7Dm63Ic15OWBnqJ5gmV6wcD+zGtaUef1IR7sD
	BYe/1eqN3fd1ry7zDVGsnriYbFMbt201lXu9cNxO3r5+1CD2ccW3Ij3L1VRvmdraz7yJzX90Wkq
	ArunyySKFZMEk48pezsC5cUiQ7ICdMjhMdI87H62eDI0H+4YrrdxqzjZW0jAERZ
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr122436445e9.1.1787945897427;
        Fri, 28 Aug 2026 12:38:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/56] gst-devtools: upgrade 1.28.2 -> 1.28.4
Date: Fri, 28 Aug 2026 21:35:33 +0200
Message-ID: <aa77657ed8d98495f5a18c3693683acae9633028.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244584

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4b7b0de6f53cf9e1aa12e008e7df50affc755cdd)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.28.2.bb => gst-devtools_1.28.4.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.2.bb => gst-devtools_1.28.4.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a4..a348624e490 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From bb36ab400ee8b84b8f604aa3314952b7df2aeda6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
index cbe488a0499..9641e42d386 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8e012bdcb55503f466d53f1f05e13e8993c69811b9db77cd16a8f6467723bf91"
+SRC_URI[sha256sum] = "11d4f1188639d3a9762039065bbb7b2c309b7a8ecc6fa4aed12245568bf00db3"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"

