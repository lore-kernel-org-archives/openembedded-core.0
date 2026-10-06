Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A35CA6006
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5183.1791319475813742258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xLgPUkh0;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486e70f2457so1520774f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319474; x=1791924274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P6YwkdRt+tx3jZw9v0GfcUpUDFRDNtuky/G/gmwrtGs=;
        b=xLgPUkh0x7NOX1+cOHmUlqahtyAo870thvx/4nLpR8YkaCAkGbM2De3mW9GVkwvB89
         pcDEAi3C+6QfmCB/hI7P06LplyeAfjcW9/7m5T4zocXxXhsANk783q8JOLx1OHNYnzXp
         mo4aK2BG5IiD/x400LaUu+xfyhMQV77C357a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319474; x=1791924274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P6YwkdRt+tx3jZw9v0GfcUpUDFRDNtuky/G/gmwrtGs=;
        b=EL0Rz+8ul4y0uUurRv2tmCATPcq2DQoPvhTRqe4REOoaheZUjaSHY4byvoNyLVT2XI
         cXPnU89m+ltnnEjDSmDuKHojLe62O5JoUWjdcBq2/d8O53WL5UzpO8zkfT9FeEmM3u9+
         SIWG4Vf5n0Q0Dc4HzQxDHc9PAj5bEf11vZgjxpeH4ln53EJmnWvDLz4+ZA5iGvF7OgD8
         JRJpFP5b7nOnS7KLIHtFPMQsNJQnGzKYj0OvG/ZsImgf4FN+V6BD+h0N6zE2vkZCljZj
         QG0+y1pJBvYKry7Tz0rf50V2AZ1icF7b4xpA4fa28Or4FB6++i4sUBqOghDg6LyGEKFE
         NNaQ==
X-Gm-Message-State: AFq9FYI5fk349x3Zm4Qz3S7rM0m9Rmfb1GWK0erNk+RR9NowSZGNp0a5
	lJRl2GrRc5tcg+gQKCN+juQfrjnMQd8n/9IP9a8LObVnRnS1v0ZIJk+Wx52o0PNow/MgIKGfDOW
	xd7fZw7M=
X-Gm-Gg: AYBFou1yYWEBGT4KyrW7EhNJsIya/mo2W2JpdJOmi6q4A6Gpq/55RIvBqdgTgRaW7OB
	3GQ3PciRGdjvbsKq+iSyv8S8AOS7meyvJvrWeKJADibbFXJUon5p0F8aFflTfLF/REtv0CqPPof
	A40h1XzsO6f2t2KPtD1L8/O+HYzstcRqapTW0vvEq3VduI5NRlmdWeQK/IqEOcfIZcX3tNI1LHH
	HC/5QyQYeMIp6RH2MKsb1iC9zWoxiSw63kegc4pCZnoSLDKIynxJEcFB1R8cjOBE4p7o29RpJoH
	0ve8UtQMHIBMJYIZ2n4dPG3dvCw1rOEXIOfZsGw2pf84xL5lkrLtuL+MQuRWoGcXR/N5v5i4E+Q
	PmS9ltk3sBylDAjlij2J2XKbPnbdB6oyXebKMMc7uXsqBeFWm2P65i3QBihTaLhCRNAxHmqGPcD
	rPwJPkxhwud25zihZ1J8nDtsiO1ZiFjIkAkArZfsVYCu7mUCHc2DMZONY7pquIGl/lFXm5PViEN
	zr1Y2Llv0AMNhzRsT5Jz6l4Cxtc8do/65cz/8MFXNigxGDhOJoyaHILoyN35BqiQd8=
X-Received: by 2002:a05:6000:98f:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48c728963f7mr1032945f8f.34.1791319474115;
        Tue, 06 Oct 2026 13:44:34 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 16/18] python3-hypothesis: upgrade 6.168.0 -> 6.168.1
Date: Tue,  6 Oct 2026 22:43:51 +0200
Message-ID: <e64355cfe2c9b120466d549d9401991cc5dbf7a4.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247353

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8ba62ee7b86114cffc25a349573bf48eafaa361)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...hon3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
index ec75251e705..7386f26afa4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "72af51087b7b5ab21c49f0d502f803c20897678652835596bd2a8b169a39135e"
+SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

