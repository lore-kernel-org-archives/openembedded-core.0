Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90256C35FF4
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:17 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.4559.1741809375884490500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rM+1/9g8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3011737dda0so517936a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809375; x=1742414175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5igRJZmNKCmHGf3VIiHpHjwWCllLCz7YQ2NSZntBNs=;
        b=rM+1/9g8XApJwKilKt08TTE1Vdl2EebjJ/kGa7Ro0QhL0vlhOb+SozhBf6T7J844cX
         7QsreO26hv6vu88Kv6Y5hlTR64FYNCSpKQzERJeSH2p6PbCkviwj5u8+BxEpo8mztH5I
         wHPcZY6ZD7fKJkZz8NtLh6V5g2/OOqqY8OjVAaOuZwCEpKg4QvA1LKiwOUVomWCY2rvN
         MQRxd8jeHLguUFAWh7fyZIM5DSmD+fxC1e+CqO9gSNccORtkiCYmqxALaGSH9Yw/J9pf
         fbNxD5WFG0hqaOGAH4Q+2UHk/m2nFs8yo7TxJn+nI8x61dfv32+HOwaEI9mcUYWSipi2
         Lnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809375; x=1742414175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5igRJZmNKCmHGf3VIiHpHjwWCllLCz7YQ2NSZntBNs=;
        b=YorZBY4vK2nqfBf0qqKvWM3gwcll0AtDZZIdjX8avzusOQfFBfEfHsoEehynUYsLMt
         flTbR8jVQyRlO8iasi9IpBCRdZ2UyZH3Wc0iZ8ZrpnDEq68t3cEhT0QfFHm4YaFYyFr9
         c3ifHpt2+B+3sXKCpGT9Nh1uVs3v8nAvYW7mOk5uNiGoXpPDgGWLFWU8c1mx76wEcfRp
         X0JjCF9KivT5+g82udzUtuEKMxDBcV/j9rYYo55UCu+Rrs/vp0lLXGQmVMinJWG8qlMX
         U9g2aHvnvJ4x6BP3Bni3zm6vCicgEyka3DXcIB0/b7tDp7xY7VvrhMSrWKLxzApgclYj
         uTKA==
X-Gm-Message-State: AOJu0Yx3xMt+34YID+A9uLwT8iPi2JVNsHOL8nEE05IiYdDOOAqvpxUj
	YL+8YoJRxpnL8eEKbO8VZa5Yo71qN+BFbh5MPGle4nO6UdWnK0O3ecp21tK2sGA8osn2nWXm6I7
	q
X-Gm-Gg: ASbGncvgtmzc+rPRQYUFVHhNIOIXJBhkW2MnbK1Sr7wXQNsa00yzYCq3yKHdvNIfS22
	ZJG8gAgW9Bunqan5diciuEt5BtZAgCNjY6ERcD7hVlc5bfPnuORqnsP9U+WEL7AeyqH0RCySda0
	xIOLahFND4eeB42LIGzP9H3tzhY3VZWzsQ0bTM7WLsI4z0NcOVPlI5+on5E+wKi5eedK9G04BDS
	HkNN4/9T714s4wGMl26qtJjj5cTelaio/8mw394t7OuIopUQhGzscOHtllQHcSXPv7yU++3NkDi
	Cf4WPliMDuZ7DkP3u0P6hYNmttTcGlNe++w=
X-Google-Smtp-Source: AGHT+IGjsJr+Nd66gRWBwuH6rnvRwfkWD9p45XIreAC8jK2kYmNK+6eUNdFRjSLZt6B/AsiaAm+kYg==
X-Received: by 2002:a05:6a21:2d86:b0:1f5:852a:dd8a with SMTP id adf61e73a8af0-1f5852ae201mr17665483637.28.1741809375147;
        Wed, 12 Mar 2025 12:56:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/28] grub: patch CVE-2024-45774
Date: Wed, 12 Mar 2025 12:55:33 -0700
Message-ID: <f24f2dc0b7504508357cbe5d5f7a577639a6548e.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212706

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45774.patch           | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45774.patch b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
new file mode 100644
index 0000000000..55aecc17d7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
@@ -0,0 +1,37 @@
+From 2c34af908ebf4856051ed29e46d88abd2b20387f Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 8 Mar 2024 22:47:20 +1100
+Subject: [PATCH] video/readers/jpeg: Do not permit duplicate SOF0 markers in
+ JPEG
+
+Otherwise a subsequent header could change the height and width
+allowing future OOB writes.
+
+Fixes: CVE-2024-45774
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45774
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2c34af908ebf4856051ed29e46d88abd2b20387f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/video/readers/jpeg.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index ae634fd41..631a89356 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -339,6 +339,10 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
+   if (grub_errno != GRUB_ERR_NONE)
+     return grub_errno;
+ 
++  if (data->image_height != 0 || data->image_width != 0)
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: cannot have duplicate SOF0 markers");
++
+   if (grub_jpeg_get_byte (data) != 8)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: only 8-bit precision is supported");
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 9e037e953e..4e13b0eb43 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
            file://CVE-2025-0624.patch \
+           file://CVE-2024-45774.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


