Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5BBC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35223.1788788164155065280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rJprwiI8;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so2609711f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788162; x=1789392962; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1tdomWYWRCRpUy9fWq4QEfRsKWsA3sytjpkRYnudJY=;
        b=rJprwiI8QjTZ18QQrxIV6H/dBoOY1aN4dP9u3elRuxxtipAshPwWD0yX58rnlTIxpy
         lq3WUZxCa3p0ifpHZCbNepLpQGodxaIf9yvcbeXiqJsQzoIFquCHkL8jSPIY+XeaOuEw
         HUHA8Q+zZDmYDYxt3ULRMorfODvzFumX53Ilc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788162; x=1789392962;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1tdomWYWRCRpUy9fWq4QEfRsKWsA3sytjpkRYnudJY=;
        b=fZ18SE0v24s3VFSjTFHy0tSBQF2w36kVW5j1DMsynI9ewtdDdfv+a/Z+Ek9Aa1S12k
         PJv2zcycR3knxSPZsoO2E9+PQtpBEFYM86bfE0VGtS9qm7YRhKOytrpFNupD/h/eQJwt
         I3IbGW0fxKj9npz8UatnWDqo4/TNswkanbUXqRo20gBb1HoBreeXdvbtq36sawgly9Jk
         fTb5SLsmQrhniAs72r70OxKpqW7D5VnbA1ACyF/aIYLJ1EXX5Q9woeXYGrTx1lg6sf0+
         tw9aFODAqa76+wz+aSwRYxzHlL0Nvm2xdUtc+HRdpBkwsBNPeR42HxpFBNnJgqIa82EY
         djrw==
X-Gm-Message-State: AFuF++mZfQfM/S4ppPPFVp2yowinq65wI7WHDmapo5673RoNe01XYN8u
	5lQBlrOkeTxGikcmqcvcBQNQvgJaMlxO50Z6VB/r8lu9TMjwrKAYefTCASx/yVi2CcaCSpQPijq
	eR7Q7QYs=
X-Gm-Gg: AYBFou0p7ot5C1a/KOt9gL/ZByfIr8IEbVEpeUcZxziB3O0e87XdD48lOzGgH4SEU60
	3T/gw7axnfddIXXZTOmy6d7Msm57t48KgXjAs9G3zAXBeHU4+sQib42hBJgOvhyh6GRUW4W5KVL
	RE1sguJ4S1zHRohqavn+BrK6uq56qpaZjdyeR88skKX83jXRG5IAOtxX78P3cKsf4cYgGMWbNnB
	Zcp+yII0POGZyuwgSUPFQEvi/y63TwFUaaKK7s59JichXOjsQ7NmZ7aIAzWZN3B3erGljH2Krhj
	cuPotyGF1FwE4p8kKxm2znxBuKG58WJWadIczikvLmjh+giCOBAu1uaJ8znxUDma8qcABI7jn9Q
	RX0Va3oJoEKt1aNO2McsmHjKDqv36MeSkymdkRqMHWP5wb9k/06JILIxHAqqJdxajV9LY7Iqplh
	tOUUmirzVD+Lls4DaJ74XtSu6VG04kf10M9hTFeQJH6LeQ4xxlzyBRRbimZcubbtQyy0EiOhaot
	VAH43+pCQKvXvbWoqbo0Zq7pmS8XQalx7n8Aefk8wz87e5m9LpCrQjS/JrJ7JU4
X-Received: by 2002:a05:6000:2c05:b0:485:8c17:9771 with SMTP id ffacd0b85a97d-4858c179a47mr21795352f8f.51.1788788162366;
        Mon, 07 Sep 2026 06:36:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/35] python3-wheel: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:17 +0200
Message-ID: <6125825144dac3f5aea440307e4b6b7e76d5333a.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245279

From: Tim Orling <tim.orling@konsulko.com>

The proper CVE_PRODUCT is "wheel_project:wheel".

BEFORE: python:wheel -> 1 CVE
AFTER: wheel_project:wheel -> 2 CVEs

* Both are patched at 0.42.0.
  - CVE-2022-40898 — DoS in wheel CLI via malicious input. Affects <0.38.1.
  - CVE-2026-24049 — malicious wheel file can modify permissions of arbitrary
    files. Affects 0.40.0–<0.46.2; covered by the existing
    CVE-2026-24049.patch.

Note: The original commit targeted python3-wheel_0.47.0.bb. This is
adjusted for Scarthgap, where the recipe version is 0.42.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe55278e01bbe434452191109278b436bf008ebc)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-wheel_0.42.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
index 934f258a93d..b3e4a08d859 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7cee
 
 inherit python_flit_core pypi
 
+CVE_PRODUCT = "wheel_project:wheel"
+
 SRC_URI += "file://CVE-2026-24049.patch"
 
 BBCLASSEXTEND = "native nativesdk"

