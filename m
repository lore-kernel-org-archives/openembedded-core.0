Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29658CA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5171.1791319453134653876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uvX3KIRM;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a17baef589so7602315e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319451; x=1791924251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xCRhsY71gjJ5dAgtOVLKWNP4MsZKd0z+wCZ+mR6CTlQ=;
        b=uvX3KIRMUuC6M4S3P2RgVKJjjluSt7Oyelw598fYvoEeks4ox03BVtNMDzZabMPzqc
         VvIrw8Yr0J14JU2zQSxMEC5rUSDT7tKtnwsPzFaKFi0cv5Blt9y3rN6Auo/eTuIrqdJq
         Tzdp4ey7IrjnPKrEAmBk55io1zw+hWgV7LLHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319451; x=1791924251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xCRhsY71gjJ5dAgtOVLKWNP4MsZKd0z+wCZ+mR6CTlQ=;
        b=YADdhs+SxYfrdjP1UgiwoI6LyX/boHW621WXIsjn0bVlrpl5Cc50ZZE7tWaMM/5n57
         I0Olm/NazvaP0IT1UyOwL24J6My1HJLxGwZWU+B7gdU9H24XmoBRr493pjPQcTBxNqI/
         WkWZe2viV7fOfNgsmH7cfAor4dlXtpGnYYRrsiRbqrRmdypvHtWRCAmnx/dISryBzaMJ
         mrmVTSw4jbB/LqxSI4leESrEaIlnvey+w6aOmDD9x0lWyrTu4jcVIEu/oSkWpROgQT4X
         oTAWGZdxc6YP9WTsww4rqUHEW0xFypAdecP/q07i7DDaaB5COvTwJyn8MQbjq0ezrgFk
         A3YQ==
X-Gm-Message-State: AFuF++lsLeBTOu25QdE/b+/gB99+z3b/028J3xtXOe3danql3tya2Fuc
	IL3dENulSVg1jmvCE2Jgb7r36kIl3ZAOPoqk9rWzEi+1gZCIGzwJ8jq7B89fK0MB7pn3h95Ukvk
	F48wLB7w=
X-Gm-Gg: AYBFou0t9NUtXzdt/GoldMlbuemJHu1/usP/mtOKdTG3IJfi9WKmcmUgN7eeZN1U6v3
	wwxBa3ur7DKf2g7a0nL3b7wVxCYAT+PIW3LN9s6RDwUbgWEAeW/trFpetTl7wTqzTaZT2PutGz0
	r0xi/eIlKpnhKlDQ9RRqZNi0/q9DAQFOd/zW8Ed61Cn/4N61q6Yjfg7J1PRGlOyzxO06Uin+TVh
	4SUfQpNvNArlH7V2KiCcKdprRmt4RysripPqtPO161aS5FxHaOxbV7DcMAlWnbh7RXGTkyim+LN
	dLv+V5c3ey12fu7FWzPLdum7tjihXeEtrlECyFFYEoqw64ImR5Wyzv5YYN+AOQTaOyttRWKkxLP
	Cj5sMbfQc3gYEb+6nzq5KehgFIotjAE4UGF+NJX35c6mSRe47ur8POe8G2xcPXyWoyRFp9y5E24
	bGKoFvVq/vThOXQJcjVpCZ5dbHKTQaz8btXDXXCvNr9uBAU6B1RkACTpWo9bHkBy3zdxahMzh0C
	rY3D6h83qioofWIwTUb9fVRgbZfbcX0qjAQgqbymmIIUMAzaG1MeLG3AXiFvwu9IECX2mCuo8cl
	xA==
X-Received: by 2002:a05:600c:34d5:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18064cf50mr483505e9.17.1791319451260;
        Tue, 06 Oct 2026 13:44:11 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 01/18] alsa-lib: patch CVE-2026-90781
Date: Tue,  6 Oct 2026 22:43:36 +0200
Message-ID: <59fdb500b23e3cb1b167935c82092bd43a535dce.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247338

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-90781

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37d0e17fbb7848340169ba00ca8dee2567a68462)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-90781.patch        | 41 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.16.1.bb                 |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
new file mode 100644
index 00000000000..57883b81694
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
@@ -0,0 +1,41 @@
+From f84cd4ced7b36fddb8e4ee24404cf7c091d27020 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sun, 30 Aug 2026 20:20:30 +0200
+Subject: [PATCH] control: ctlparse - another fix for one-byte overrrun in
+ __snd_ctl_ascii_elem_id_parse
+
+Follows 1e27d63ef6d1dcf7d1f1a1e1eca3ea779e7de377 .
+
+Link: https://lore.kernel.org/alsa-devel/CACBQ=P2FhO3M6dkv3cWuKb6Qhs92ouV+FJ3SJZ_PVBSSdJWRAQ@mail.gmail.com/
+Reported-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-90781
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f84cd4ced7b36fddb8e4ee24404cf7c091d27020]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/control/ctlparse.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/control/ctlparse.c b/src/control/ctlparse.c
+index c40de2bd..7132210e 100644
+--- a/src/control/ctlparse.c
++++ b/src/control/ctlparse.c
+@@ -219,7 +219,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 			if (*str == '\'' || *str == '\"') {
+ 				c = *str++;
+ 				while (*str && *str != c) {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
+@@ -229,7 +229,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 					str++;
+ 			} else {
+ 				while (*str && *str != ',') {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 10332502044..685f06c7268 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://CVE-2026-90781.patch \
+           "
 SRC_URI[sha256sum] = "f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e"
 
 inherit autotools pkgconfig

