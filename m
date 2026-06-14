Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440D6CD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105028.1781424194071740884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T5IDXx2+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46013161068so1059336f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424192; x=1782028992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOZ7XcN2FN0INeGRnBQTq4W/S4zn5oT9nYDmXdIzRzU=;
        b=T5IDXx2+tJzKOn5IDpKwNQSRZW4TQvJjNslMaYn1WvT8+LXQTS2DCbmOJqfuWsaRAc
         ObyeAj4PuxVxmyGILWP7snWbTFEe9ZHGV0lx4tB9Vk4YFpfkkAlPAYpxGMdhKsaS6Jis
         urmBKt2RKEz/3peS0br7306obuqyw6znGJ77U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424192; x=1782028992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOZ7XcN2FN0INeGRnBQTq4W/S4zn5oT9nYDmXdIzRzU=;
        b=dp2c4ncLLkYpQY4BxpmWOIEBOLvI2OcVYGQs/agWJhWhlolAP4fjnnvUs2cHxHUrWm
         x+juf46rEbDvZynboIImznjr6a0iN58B1LOYXEH6UNZ4klZPZaiVI26+8MB9p5CQ9Ed5
         eWArBl+uAFsxSiWSQBbmlllxPV7IsMP8ViTDECm9bAtUIK2Q8q46YOmE84saPJk4kbGA
         xnPgsr5B8LAa3ilJpkyszXhbFG1QOjLOFy2Xr81Rm8v09bkrdEX2CysYnz8R81OrPwP2
         VCsfSVMqWE6zpWWGHYU69aDZ0HVwFWDFTe2FDgPslk3ujUQ89Y8S7PEN1BcEAeYm/YY5
         2sDQ==
X-Gm-Message-State: AOJu0YwlfjcMHl53KwnXkuoh0KEoDThjp/yFXXJ2VPZPniZxmuiEQbEG
	B/Sb8tqDRFQrNoxavl1ceFE5mosKJMv2PFnVMfuC+WR24FL+fiu78XZacDCjn7xKSI+QLqVH9ON
	4uUiJ
X-Gm-Gg: Acq92OF3R3Z19VzIrgcuD+CPu2TSOZXrg+8LXHF37un+OB03Kl7CPLRejTS+oNrCXbt
	JBmU+heX48n8gllfjLd23y9EtKj9w5Twy6cQYXWblYnTSKmdL02v6S4XW2GhvJuruoqY7ls9x3I
	uXqXy3d53lQEy9t83aPlkhm3NSHLYIx4UWNOgVwoTNp0GngBJ31uL+l2FhqF4S1HDypsp3G5r/Z
	tjNDDu8vrrr3Iq2AI8n4ZuUHOCNX6ycLowvGNtiOsZouFCuIDp/To7FmL0XtsCfqlfyR+4+3gSw
	+yQnoVkS+8VWNpaaB854jG65mRIiIbmvF7107VM0T5hXmxqu5KpTRaU9rB4dCqN95I4FIed0/mB
	MieYju+zHsu2yuEuaJdLYqo9h61w72wEKbSSaTQoOFcDuGS4w7ND/Hp3XMJ4oscXLQ1DvAtbUfU
	gZhgdTQqg93VdN27dDRSZX3UD2cL3adcBreql171ebPXJHSmFSCqlxC3YXPZtM8jI=
X-Received: by 2002:a05:600c:c177:b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-490ec51f18dmr121433075e9.34.1781424192249;
        Sun, 14 Jun 2026 01:03:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/56] gst-devtools: upgrade 1.28.2 -> 1.28.4
Date: Sun, 14 Jun 2026 09:02:13 +0100
Message-ID: <20260614080307.4017177-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238686

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

