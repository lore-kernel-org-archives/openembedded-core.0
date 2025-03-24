Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B3AC36011
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.44219.1742834035158077180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSUhhPs4;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fd89d036so90362185ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834034; x=1743438834; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9okFVIViviiNjG0Ss1jlxtlAXDlN6cLSaAlwMBn1hgU=;
        b=NSUhhPs4lnrRRZ4MGuHitu61xYQqildV48hZskGFgAsOtkAXApOEVSDEQRBjAyqhk0
         zSyrOK4jhZV7wb9fKGAnjoO8gTlpSsYruecrvxdmxAUXFSdtxh3aQ+LQufLT8EQ2GypJ
         4u8F32XZTMpkqYudul9iZC1Mi/3EJ/tIscYef565F0YP9wMQQE0r8jod6CacQ44EBe79
         t6jwrSpekT6ozJIWRR8GsbcDJZoIxfxlzBAUESIYi1rw93g0AYpWYx6OYqW4pg0ynJpV
         bxqsJmM8lfVtu0lxKlcgffQ4/7nHwHj/0rXMNMqSZXbwCiONdTMlRTqqWx72ykCfczbl
         gD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834034; x=1743438834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9okFVIViviiNjG0Ss1jlxtlAXDlN6cLSaAlwMBn1hgU=;
        b=t2/vXzyMBE7hDZiL4EB3xElS0KbsLC4jq7vRNednTSdO9d4iwkdRhubCZS4klnng6q
         EIDoZQ6dYybj1cy24oCy35IK/EaPbSZjBq7a/mMIHfH2M9kdGpG66oJuRdHGvW8C+lR9
         j4AC0gnuSv0GZCn3F/hNZzt2oMwaNFjBL7N6Ne5n1VUqa+60H/0MdBzljh5Sfjma2Ne5
         1V2I7f4kAI8uS/4yh58ASztm3QS5Kftikv/5VjSsC73Dq9o+y39GujP72VmQX6Q27dqG
         XrzSZYoP2rI+lxhoUiiwfa377cJXhlB5tD5NqausnCIP+DO2tXWhym77KrTaL0PAYFiA
         GBIg==
X-Gm-Message-State: AOJu0Yy7OWJca5F5APer117Z84faPNIC6Y7h/0L6OaRJXs8FcRUronfM
	CY1fYo28e8xIIidSxmu7YMKYvXzI4amgAzaEP9R5Nfjl3M+RrbAlwsnm/RXK
X-Gm-Gg: ASbGncuXD35c34Tf3lWc0g6Khda0vQsmc5FQTR+7WQfNergoImJm9rbHuFJojuIaLYe
	o18dwqlIpDxPIeHk0w0i2+yceBrq9cdALx26I2YAqF6lcw/9rnpNUn377ANVqjiy6jUeD8HY9OD
	BzDDgu9BU3ybVBVYCQVeyhE5AVSYEbnTqGXrXU4dFzaztYacVWU9hisjG4tB5iTQGooMWEPeXTN
	pt9RVZHKc8ogQTBGu/EgMaql++xD5ffhulNbUNE+x9ih3UaP51kR49e2kDLCSNFn5g6AOBxFwjw
	OZJSn1YeWr/T3K6qWU4tjeXYrrXha7mIzK7m+6snbM6cg0I=
X-Google-Smtp-Source: AGHT+IFdWh5AzzDPLTfHoqkeJfKnZpXC1RjGhrbCoWVlPxHXKisbUXXGKbZhYFs7WmXpgPwCtGcIAw==
X-Received: by 2002:a05:6a20:d497:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-1fe43477bdcmr23530700637.40.1742834034142;
        Mon, 24 Mar 2025 09:33:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:34 -0700
Subject: [PATCH 13/21] alsa-tools: Fix build with gcc 15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-13-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213545

Fix reset_changes_boot() signature

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...retask-fix-reset_changes_boot-declaration.patch | 26 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb  |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-hdajackretask-fix-reset_changes_boot-declaration.patch b/meta/recipes-multimedia/alsa/alsa-tools/0001-hdajackretask-fix-reset_changes_boot-declaration.patch
new file mode 100644
index 0000000000000000000000000000000000000000..089295750781d2a3e583e1bb336e54b65097658f
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/0001-hdajackretask-fix-reset_changes_boot-declaration.patch
@@ -0,0 +1,26 @@
+From 2b666ccbd616e0e0215241cb69b65d69d5146c8c Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 27 Jan 2025 11:02:21 +0100
+Subject: [PATCH] hdajackretask: fix reset_changes_boot() declaration
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-tools/commit/5eaadd15bda4cf0424ee2470a6d304a0c2ce10cb]
+
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hdajackretask/apply-changes.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hdajackretask/apply-changes.h b/hdajackretask/apply-changes.h
+index e08d66d..e431a0d 100644
+--- a/hdajackretask/apply-changes.h
++++ b/hdajackretask/apply-changes.h
+@@ -9,7 +9,7 @@ gboolean apply_changes_reconfig(pin_configs_t* pins, int entries, int card, int
+ 
+ gboolean apply_changes_boot(pin_configs_t* pins, int entries, int card, int device, 
+     const char* model, const char* hints, GError** err);
+-gboolean reset_changes_boot();
++gboolean reset_changes_boot(GError ** err);
+ 
+ #endif
+ 
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
index 53868041c0951ab33ccdb7f0852ecbd694024cbd..0b884e2075361f8c9488202ab0bba9efd46ce039 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
                     file://ld10k1/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2 \
+           file://0001-hdajackretask-fix-reset_changes_boot-declaration.patch"
 
 SRC_URI[sha256sum] = "0915c9634a502fd3655ca9c574d259bc9e79983d91d45aeacff6f3c00f8ae3e9"
 

-- 
2.49.0


