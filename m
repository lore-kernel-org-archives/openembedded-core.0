Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2188EC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.84918.1747163310989567573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iWp9OUsK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22fa414c497so70100575ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163310; x=1747768110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2/1quisCc/uM8Q9xFAwIKTiCgTfl3Mce9ql36UvWd8=;
        b=iWp9OUsKN/EIk6FOvx+0CrA4T40lbGc+wE1W9LD3yv5tvTSwQvkdyxvU3fo5Xl0tst
         M9SQyUgu2o9ELhLRaUmtOX1ZY0Xc52mSs8/uVm/f30EDej6ow8Lh3yx9fQfoW7BM8PCC
         n0PgIvXhN4jSuB706XoKN2X7wqAOy8sGtHjl9DZ0OB1XHMjqegfpLUCPtZcq0twyxINl
         PXFrpWk9dEwayTNzM7orU+hmNccPZRGCjIeP3O9cbICM5VeKFYXOxMzmOVlXjE7rgsEr
         4oAUcQ1L1ZNFZDBrqZpBKIakWLkRMeMjzymKL4FNBpH5XsmkHZbktYOwtCKucTQ1LLv0
         QcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163310; x=1747768110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2/1quisCc/uM8Q9xFAwIKTiCgTfl3Mce9ql36UvWd8=;
        b=cS7a3HqrwVGyt7eSOKPG0GaFD5JfeQM6v4NRwPO1IwUeP6B432F19pd+8MrBd48u7o
         ZKFLXl+LyH6YQYVv50Niynhz9rVQQSdtVFtWon3YTctyVrrdoTvfpp09Wck6kLLpYJ9R
         mZbSH2sKqJTqqvznupZoj1NCB5lcT9KP/Bt2XPodbBf5/HnsZFoUkQjxdLxJT9mkaX/Y
         FlmUxWOBK54jJzCSVsGtgqLLTHQCvijVHBZgM64Sun1bKbhgcS+HakHCDhTEMQ7OhCpo
         LMuly4mn1EP96j1vFo4knPCTBpIcsN3/c8r3zV/rnsDdZ0B+BSrYwkpgX+NWHekD4aVr
         Jgug==
X-Gm-Message-State: AOJu0Yz3ioWa88iYBiAniB2VZaGJxO6Ei9MbD9P3bRs98qmdJYXxUWJr
	oEHy6FCqnzbctGMBPZwljXtY0MmNZq+DUQWCDoUgY42oh49ZlUJ0GBK+cEMmqMW4onJA0dW4kkn
	p
X-Gm-Gg: ASbGnctrLiLhrewzfFTEoFgq3SZrQW9HcRZQUqA0ocAQdBUa/qy6THGJflsFdaNluBj
	2txbOCNqQNeCW6/G6hjGeY07zGcOo8kub7upec0BVnJC56aeyGcuIRvtOnnxhCpQaJsqUYwUox0
	ZsdG8YgNbzgyBoZQlG/G4+kO4ZqiigCDc9LVzGwHiBzPuMIl3bMMzI0sSaDTPlZeM91R8OJVQv9
	ZpK7bjDeis1lo5T7v2e5Cjr2ToOfq8OsD0PLYj110zEv2hqF77+3sSKVCRfcIK0KN1KqfaRzeLk
	zNOCwv/S2H8PC/3YjyfUJhyO2PW7pg1HUFgrAIGhmArOee+qp3Go9w==
X-Google-Smtp-Source: AGHT+IHApkoO0PKQlOGjurRQKt9TAk3+2PixExTXUq5+6DHrc0MwbaewjwzT1Y08C2DoKOWmbVrq+Q==
X-Received: by 2002:a17:902:f681:b0:220:c86d:d7eb with SMTP id d9443c01a7336-2319819d73dmr8286115ad.36.1747163310276;
        Tue, 13 May 2025 12:08:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] libsoup: Fix CVE-2025-32909
Date: Tue, 13 May 2025 12:08:04 -0700
Message-ID: <491373828c1c66030fb41687f9a42b9e4deb010b.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216440

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/comm
it/ba4c3a6f988beff59e45801ab36067293d24ce92

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32909.patch      | 36 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch
new file mode 100644
index 0000000000..8982da58f1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch
@@ -0,0 +1,36 @@
+From ba4c3a6f988beff59e45801ab36067293d24ce92 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 8 Jan 2025 16:30:17 -0600
+Subject: [PATCH] content-sniffer: Handle sniffing resource shorter than 4
+ bytes
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ba4c3a6f988beff59e45801ab36067293d24ce92]
+CVE: CVE-2025-32909
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 5a181ff1..aeee2e25 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -243,9 +243,14 @@ sniff_mp4 (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	guint32 box_size = *((guint32*)resource);
++	guint32 box_size;
+ 	guint i;
+ 
++        if (resource_length < sizeof (guint32))
++                return FALSE;
++
++	box_size = *((guint32*)resource);
++
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ 	box_size = ((box_size >> 24) |
+ 		    ((box_size << 8) & 0x00FF0000) |
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index a5b6c2f039..4fa8fce1c4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-3.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-32909.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


