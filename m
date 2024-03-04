Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64994C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:30 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.101495.1709565807993781055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MMEtfC24;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-299e4b352cdso3014681a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565807; x=1710170607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFnHwK8joqKnJZBUZipiUuWA+Nd8hxF9ZBIQ8iJ7/hU=;
        b=MMEtfC24BjCzt8jZhyDJEjGbcjrLQBgLbmwDWw8rR33TLmy7TnlWUyL0uCAwVy2bSn
         u2QdBiFs89KvAe+nIFetaeoY0zWYafAOp7GwFNhLvta7D6E3uaCSA6lXvzZFvY+9bnto
         Jwixvxtt3QrNDSW/DOh/yPrg5mAM+9LAIY0WY5N5oOfF41llS04cXSV5r4ek7LEPvwBC
         acLaf1UfnCkzAFL2KPS4ehhlZtOID2XiYRmEFHK9FkYam3bSy8YPV+QXDqDwuPB2QC/T
         yCl4DplnGHepDIvWmJF4gbh1JARz7xL5doOIzoQ0fi7cGmU3oGT5OcdgETz6Cl6j4lqE
         Ah4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565807; x=1710170607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFnHwK8joqKnJZBUZipiUuWA+Nd8hxF9ZBIQ8iJ7/hU=;
        b=VJZzP6TDzJax/mNKbbvjY7wgN2Q262lovta1AL+YmcvtUW5s81p0MLKpU5TF/LDYZw
         FsTcNKyqwtUlMUUcrFdDPxgL/FTt8plzmw54FFnDabqQVzm5SFTQGLK4cj4hs4yk1mbL
         u0MZq8SrLUZc01ynheuzAO6JoQKSYrUM67MTl6yM70VNH1HqN7sMqWbP7en6Z3x+DfpA
         o4z+cpK41P2RL1Ddnb1BKFDiQsaRjZmvIoOjlBjL1tmdJKVc2toA/d4tV9vdYIksx0TO
         gKybq+CvmX76cCPUkH86tcjvHMVO7wJcHNiz0bR1tjxjQiazvSnj6ZoPdgkIZxd3/dkf
         dDGA==
X-Gm-Message-State: AOJu0YwTsO5atgC8lvav+7ziZmlInlsye91Cg/xsFDXxPaYa3fh6mD1g
	QoABUmLT2lWUvy/hiUmpQH4wzBz+dw2pLqy9uuzgVl5TkX/qFu9lsiXDovxRAP8w1uuiJpXlPOE
	q1to=
X-Google-Smtp-Source: AGHT+IGO24eu/u1o8Ml2+lkG0PBbmWz6kZIodntAtaFfYxA24hv1a586eBxS6JCbYT1qc/jqy+KmJA==
X-Received: by 2002:a17:90a:8a07:b0:29b:2c12:6b6f with SMTP id w7-20020a17090a8a0700b0029b2c126b6fmr6204795pjn.16.1709565807210;
        Mon, 04 Mar 2024 07:23:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] qemu: Fix for CVE-2024-24474
Date: Mon,  4 Mar 2024 05:23:08 -1000
Message-Id: <71600de72c602e6d1ae2c3b13af6c59440affdb6.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196601

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/qemu/qemu/commit/77668e4b9bca03a856c27ba899a2513ddf52bb52]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-24474.patch            | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-24474.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c5fb9b1eab..18752af274 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -103,6 +103,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2023-1544.patch \
 	   file://CVE-2023-5088.patch \
+	   file://CVE-2024-24474.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-24474.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-24474.patch
new file mode 100644
index 0000000000..e890fe56cf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-24474.patch
@@ -0,0 +1,44 @@
+From 77668e4b9bca03a856c27ba899a2513ddf52bb52 Mon Sep 17 00:00:00 2001
+From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Date: Wed, 13 Sep 2023 21:44:09 +0100
+Subject: [PATCH] esp: restrict non-DMA transfer length to that of available
+ data
+
+In the case where a SCSI layer transfer is incorrectly terminated, it is
+possible for a TI command to cause a SCSI buffer overflow due to the
+expected transfer data length being less than the available data in the
+FIFO. When this occurs the unsigned async_len variable underflows and
+becomes a large offset which writes past the end of the allocated SCSI
+buffer.
+
+Restrict the non-DMA transfer length to be the smallest of the expected
+transfer length and the available FIFO data to ensure that it is no longer
+possible for the SCSI buffer overflow to occur.
+
+Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1810
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-ID: <20230913204410.65650-3-mark.cave-ayland@ilande.co.uk>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/77668e4b9bca03a856c27ba899a2513ddf52bb52]
+CVE: CVE-2024-24474
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ hw/scsi/esp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
+index 4218a6a96054..9b11d8c5738a 100644
+--- a/hw/scsi/esp.c
++++ b/hw/scsi/esp.c
+@@ -759,7 +759,8 @@ static void esp_do_nodma(ESPState *s)
+     }
+ 
+     if (to_device) {
+-        len = MIN(fifo8_num_used(&s->fifo), ESP_FIFO_SZ);
++        len = MIN(s->async_len, ESP_FIFO_SZ);
++        len = MIN(len, fifo8_num_used(&s->fifo));
+         esp_fifo_pop_buf(&s->fifo, s->async_buf, len);
+         s->async_buf += len;
+         s->async_len -= len;
-- 
2.34.1


