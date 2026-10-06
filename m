Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37CCCA6007
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5173.1791319454928753161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M223AIyE;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a17b4c6133so11119275e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319453; x=1791924253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJmsW4/qLQD3iHvvmA+EvNv1nf4l+rok2jBKSufzwL4=;
        b=M223AIyE+qfl/yUvOXAm4MU9LWEmkqM1dyNA5mayXoSYJfoXz7To92l4nRftqTKXqp
         402lxih18isTTsTeo6uigau7qgGFFfpJqkSDASj5XnmkaPNFnAZAgWOvnXY0FSJgpGGh
         Gqf86SPAIsIvR12Xols+XhH4M4cieqqU34brE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319453; x=1791924253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GJmsW4/qLQD3iHvvmA+EvNv1nf4l+rok2jBKSufzwL4=;
        b=PIOSfpVBx8WhoemhT66OMgGHyR8k5UG0xwB0sFSFi3hrvodCQ+lBtQ+ceDTcf3Q7t5
         6/kG2cpf0QivzYSlx1NLL/HoM3DgFnWtMIsL/BIPG2p+LTFq1G9iMreNq6l2WsfFU8d7
         D+H1MhfNF1CAqzXxbTv04zJ6hYetZELQ/EtFkV0hCTt96QQrDwrXbExtuBqLfYrRPfYI
         f7joYIdvLe+rXVBm/m7+xADifLZY1klFO8jFvod9MCsg7zIBdeD5s4w0IZbJIxGaeSpy
         k4HnQ/7UznT9XYRH2nIcSM9S3u+YHUcQMK3XGBz98VcXszQfmAdQXZnDQofZGHEKw3/B
         u4Vg==
X-Gm-Message-State: AFuF++l3fVVnzlUm4JU67huk7fazHNVqOysJwJFUT6re9VxVsPAi3Br/
	Lc8nMjNaehDgC9xhxlnrkFNgeI8Q/n4X7lwwlAZWFWSKjGhF7wSgKT8VlqNivuoftmIxEFEgGM5
	H9T3jKp4=
X-Gm-Gg: AYBFou28ZpMrheSd4vQkx6roRJk2aoOU5Amgb8Ky1b53Sb/d3pmm9qwzoKnvywtP/aT
	IzdkfqB2ZVRoJXJwRgwzdnuYKQDm3I19iHapX/0dxywEFxc2mki74/v8kd1LAJGZt+80yBbwDqd
	pRqEH/VNU76XU1M/THclN8asVylgBXGyGqoUpdivqCBEjyEf6Lmw0SmRvlM3MIuedIMjgVxg43E
	W1wc3F5vxkGOlpAxkq5c3x//86oBPz7tWsRYy8ELJF22C9/xiAO5IdpruJk5Ukqo4RW1KZTW7qS
	DKrmHdaQI2WqPPTZl8Xom1YD1VOA6a6W5hVCwHoV34+eVIUSOYbsAzEx60eD5IlDo+xnubhPgVD
	aP3FiD7YM7jfdp2G0WXmHzVeVyAp/ncjyqEH9LdtNJZkvlA8gatS4QG42M9i94lYjSdBJI2jEu6
	7we7CqUyAZaWRfIejjzN6YQj6Qnj4dSaz4W0iemiZ2ZNjI/NdPZuCJ6ZKN0UvZQHC2Bs27ETidl
	Pb5I8NUMirKC+bUbc7VlY0jRVhJAtLpvuRJEzMZrf/jW/AHF5woa0+WQLzDhm0biXI=
X-Received: by 2002:a05:600c:154a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18043b5fcmr533635e9.16.1791319453170;
        Tue, 06 Oct 2026 13:44:13 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 04/18] bluez5: fix obexd/pbap u128_to_string skipping data[4]
Date: Tue,  6 Oct 2026 22:43:39 +0200
Message-ID: <b694cd0daf227a4ed6521ef1d056bd7fbe2ccde5.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247341

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

u128_to_string() uses data[3] twice, causing data[4] to be skipped and
DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
be printed with wrong values.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57c9aead1d913a56b115f0cffdc73e4a1baa9b42)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 67bdb6017f7..22d50bc23f9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
+           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
new file mode 100644
index 00000000000..13adce3aa2e
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
@@ -0,0 +1,33 @@
+From 8b4a4176063831476bc9244d20f43b552e4b5554 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Wed, 23 Sep 2026 11:29:57 +0800
+Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
+
+u128_to_string uses data[3] twice causing data[4] to be skipped and
+DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
+be printed with wrong values.
+
+Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
+Assisted-by: opencode:claude-sonnet-5
+Upstream-Status: Backport [commit 8b4a4176063831476bc9244d20f43b552e4b5554]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/client/pbap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index ce5e6cd5d..1970d3357 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -1099,7 +1099,7 @@ static int u128_to_string(uint8_t *data, char *str, size_t len)
+ 	return snprintf(str, len, "%02X%02X%02X%02X%02X%02X%02X%02X"
+ 					"%02X%02X%02X%02X%02X%02X%02X%02X",
+ 					data[0], data[1], data[2], data[3],
+-					data[3], data[5], data[6], data[7],
++					data[4], data[5], data[6], data[7],
+ 					data[8], data[9], data[10], data[11],
+ 					data[12], data[13], data[14], data[15]);
+ }
+-- 
+2.34.1
+

