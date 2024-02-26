Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B65CC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 07:03:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.15583.1708931004326578351
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 23:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cTJbndzX;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso1333601b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 23:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708931003; x=1709535803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qyVkFRc+NLsxt+OAFkUgck+Sra4M0AWuFEQJcU6iAg=;
        b=cTJbndzXY6DaYwsdqQNrj34hSRr2Co6YD+29IQhZwud1u/tQz+tRh+VhmZNQ5qARrE
         opZ+5/rZjTykLjzMsafAWqdTWdOFSLaq1VZ83t5QK8P4/vFhPjFZliOEgwXq8BNjp4QD
         cjMXm5Fgm6na9d6CMIiQe5mA9VSI3XKxPVFUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708931003; x=1709535803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qyVkFRc+NLsxt+OAFkUgck+Sra4M0AWuFEQJcU6iAg=;
        b=cf9F7WrtIOSTQ67oCBrRLYGH8ELV5H0d9DNgxLaqeR3e6nx2tG9UoTI6TYGu5FjDs1
         vq156lL5Ko87Nc5pV0gsDRB0cdqXzvBUMeTbNRtGaYRHrFTLJx2n4Lka7s321gfRv5+A
         3uihAeh1MnK2jCtIvnx2qHsk1LhJ5dXU6z4Pe+IuQUrw+Vlclr/2Pd3Z8+mvmA8UZRLb
         CnPsQkUflOOC4nZwxOBob0or78CjpfFyhz0lFpJYxK9KScbj/3i4XAKKNT+riU58f2MN
         onuhgQgGqGqUa+TgEsrnBQfhxnD+6L5ECv43sVPoUUkiluJSaF/Wh1I5buBw6puRgZpz
         FAmQ==
X-Gm-Message-State: AOJu0YytM8Y/8I4zpbToyBsMD8cgMEoGuYUew6E/d2qjxnJkVob79gco
	uipZQhW1Jpk/IIZr/Pxhhm0du/SLJWHapwcAzGHnguskUJFSR+9zdbapjwZLHCzv03B7DeqTE3c
	P
X-Google-Smtp-Source: AGHT+IGNDSmxk9ue6IgIQ9DGK94TnuKZR4KaKI+4GrIMM704v+311sUq88pbJjJf1pfCN6SS9RYNVg==
X-Received: by 2002:a05:6a21:3a82:b0:1a0:f4d2:31b8 with SMTP id zv2-20020a056a213a8200b001a0f4d231b8mr3037433pzb.28.1708931002896;
        Sun, 25 Feb 2024 23:03:22 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:781c:f5d0:9dd9:b81d:8cf])
        by smtp.gmail.com with ESMTPSA id lm12-20020a056a003c8c00b006e06aaf5e58sm3302413pfb.34.2024.02.25.23.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 23:03:22 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] qemu: Fix for CVE-2024-24474
Date: Mon, 26 Feb 2024 12:33:09 +0530
Message-Id: <20240226070309.9813-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 07:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196182

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/qemu/qemu/commit/77668e4b9bca03a856c27ba899a2513ddf52bb52]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


