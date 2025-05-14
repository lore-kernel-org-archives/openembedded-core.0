Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E781C54754
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.106292.1747238289159160040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J01r1G1c;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7423df563d6so43119b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238288; x=1747843088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1yiL/wtQOcIYJbOu7ePJK6JnDXMfmt4WGNFIJANGgs=;
        b=J01r1G1cOcCPjgXL72Fr+dPCg/dAaOsbxJ6nl7GX0BZAiBct0iyPz9gv2lg5U+orMc
         W3t+PLpWbzKB0N99ZAQTlVmkdUZQUy0lIEq8RIx4U2dvPF6fZENTWq6Zs09DmMSK0MGg
         e87lAhBvRwgbluA5DA+1AOdrLy6GWtcUWuf8MdDxLwXco7AtMqj0tXNMsPdccySGsqFd
         9tGDquzCZ+DV0sq9vXAtDKsYeaz5byM0lqtQraoYwhLnxddlF5ofN5JulN69yjPEcYZl
         Uptz2LGWR0RgATNbgLuGijwWikCRlS4AxDPQbCXeNSYDfsCcgeebysZWNaSQJ7qQ6fv+
         DLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238288; x=1747843088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1yiL/wtQOcIYJbOu7ePJK6JnDXMfmt4WGNFIJANGgs=;
        b=CXYWDsI9hQSA2OVyHNgQuE60x8URSYxcL/3B8c3iXfLmPEB7Bvlgk2G/REj2y8m1fQ
         FgeFHrKSLokYjnchkftjnJ21Q7hBB73CjVYjwnRszNFioHoO2StZoLz2OMi7kZlAmGiH
         FRxLy6vqDxXSCUsJa6nD3yztawicxQB8TofGkboM9M1vaD4x3f7FwAer6IKdPct2hpUx
         2+S3lavDIlyy8sIc7fo15O3ox1FxyfBASIKhygAtfoWvJJk7EftTxPjixO/JGyXDIaZG
         KZorbZrvtJUe0cFP3ko5wUG+nWMBZX/83qKMk/NMjwznkEZ6Tp6vOAmtqtjl7Y8txyBs
         Meiw==
X-Gm-Message-State: AOJu0Yxf/oZHHoWmoJhLt7s1mEwXmJKfQDF9c3NM8xCxrojcVCz8TyJP
	ViDHe+vD00+uNm2+/AZtmGOBrwELZpePFG6ID0KbUgacoPG/uUPUZRQ3eQMZQsLRqft6V4pniqr
	S
X-Gm-Gg: ASbGncsz8M1S/OghsZuO3IXI9uhOdoXwyTiSShJyQE1c2e2E/4d0u4F05UZtmoKwBm6
	c3xgqDEjggaST30f8ukkpGteLNAKPHBspYxOo/upE309KNNU8pztilnWbmiQpgKndqO8H2i2z0H
	dKQ1jDMsTF6ZvX+zu8nSx/l0dhBu4m3Si7aad/z/5xFVlYU9VvXBGbR23yb2IIR3UxoA/BmMN5i
	1ZXQ7VY8WFvszVyd1lnzi1BQjafHYzeK2AKKT2gJNdxy9QtSKr2Fq56FQveWYnWDc3W7NchSH7I
	Xz2i4Pm9iRPVRfefJ7deE0CXn2GIFfPcZQPDNuMc
X-Google-Smtp-Source: AGHT+IFFPjeem8y84budWEESeoF7mHNik2R2pk019IJA0/nZ0SCcuXXw6pZLw6CtWCxp7ntBCcJgHQ==
X-Received: by 2002:a17:902:e552:b0:224:78e:4eb4 with SMTP id d9443c01a7336-231981453c7mr48457405ad.39.1747238288134;
        Wed, 14 May 2025 08:58:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/12] ffmpeg: fix CVE-2025-22921
Date: Wed, 14 May 2025 08:57:49 -0700
Message-ID: <0c6561cc7a5ca9e82ce3f17a9d0e68a7c1c88c84.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216505

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git-master,N-113007-g8d24a28d06 was discovered to contain a segmentation
violation via the component /libavcodec/jpeg2000dec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
new file mode 100644
index 0000000000..20fac68d01
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
@@ -0,0 +1,34 @@
+From 7f9c7f9849a2155224711f0ff57ecdac6e4bfb57 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 1 Jan 2025 23:58:39 -0300
+Subject: [PATCH] avcodec/jpeg2000dec: clear array length when freeing it
+
+Fixes NULL pointer dereferences.
+Fixes ticket #11393.
+
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-22921
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/7f9c7f9849a2155224711f0ff57ecdac6e4bfb57]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/jpeg2000dec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavcodec/jpeg2000dec.c b/libavcodec/jpeg2000dec.c
+index 691cfbd..b56902c 100644
+--- a/libavcodec/jpeg2000dec.c
++++ b/libavcodec/jpeg2000dec.c
+@@ -1223,6 +1223,7 @@ static int jpeg2000_decode_packet(Jpeg2000DecoderContext *s, Jpeg2000Tile *tile,
+                 }
+             }
+             av_freep(&cblk->lengthinc);
++            cblk->nb_lengthinc = 0;
+         }
+     }
+     // Save state of stream
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
index 4314ab9f31..d5252bfbdd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://CVE-2025-22921.patch \
+          "
 
 SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
 
-- 
2.43.0


