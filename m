Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A19CCFA13
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:13 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19625.1762267689051773641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2Xu4SICB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-340c1c05feeso2871481a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267688; x=1762872488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kndNTxsoT9SsCaFZSnH1wkftk4E9tGZkfxUWsbbKK1Y=;
        b=2Xu4SICB4xwWhSgV+KbQkWuxPdqYm0VchdvJeXrsOYClHSU9HHS6Sew0XWZGWyxWXL
         nboY7lL1M/6oX+M5C0k1Ior4086GWAR7/Zns82F1UfiXhjqXAfAUkAQdx5uUe5Y/yWgL
         RJ6rwMYWTY7i9O2EpqpfVx4aGl210ZTIfbN/Bz6gnJO0SRh7YVeebUplVjKG80K/Rus1
         0NIdZs4I0618QFnrqjLCQs2SzNwGYUF4S3h+cXujyO412YYPsp+yUjygpDqzKNlwjIIm
         L09MqaP/yfaCq89vkWMvJNIGvrAuJhu0+X5C5ocevfCEWwLAultTf874bbmzpUP9hI2y
         POlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267688; x=1762872488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kndNTxsoT9SsCaFZSnH1wkftk4E9tGZkfxUWsbbKK1Y=;
        b=MepmYSNzDhJTb+V9zAi46YQvQ/MWkQLGaSbNZgenMF/VBmt2Xb6xyjeCpt5/z7ru3n
         rdJX0iE08+qvWbDbn2TJL4mASJs4w8TOsqXowahaObZMzNjHvcpGclkYDQa6fohXHa7J
         gjLaf3oUzqxV29A+umliAF1O3o1iwWHGqwsFEmxUnqpxRbBu6RKAdgY3RdixnrGSnDCx
         8K+5Ic44vLr0SCFN5/FRXPzSvwPOSlm1VZYB1m4tkGQNvB8iFCtYc6RcmCylRU1aypUA
         OAGMJ/se7huazltn8hZIjF3Zinzj6Gwna8PFr883ZF9jgkKkv1CxIJjHg+CQn7jUMLzu
         aNHQ==
X-Gm-Message-State: AOJu0YxtOJFMcLy6AJaH+i5IJ4xqZnDuuy1QBuDFCttTbXu3ynkTpzPS
	0KkiLQ+2R6Y7bnHC8f74ehvSLWn+M6Q55d3fQ1/rTBiEB7kPCm/choxjUsz6zq/kzC08Y9ecexI
	up1F9TZQ=
X-Gm-Gg: ASbGnctDjlKlxQaeIzDnur4SOz8sBPcRa8Qs6FzefzCnCcU/JaUsuNcDWI86AtQnOvz
	PVhkDwtutB+yD5qg8dTZHwPG4AXT7TbLh3Ih9eGh2eJwLGiGrW+Kop+3cP+HlcRmoXu7sjN0hns
	QtgW8n3SMpNk26m1UEaBWxEQhhnByMH2XmJolWhtBoaZ6CtyexSiF5PW12Gm7dy7gqcfeWhugHF
	ManXw4NQdf54tHNBU17CZcgigCb1esn6ATKgsV4LOJ4cyUZdKGydPeqL2DnFE9CfmOsHGk/w199
	BT7Mz49XHpQJ1q/oTF9+LIDbsk2F12cLAOLlCAOj+J1ITF30SzmW/oQ8zH8Crm5eiG1NjbR/2ml
	y53OC7D7LvUQnMP+e5xZB6PCATL2H+EiAdrAqQXLrlA9S3Ujej1ZdbS4Alh8WYf+M6eU=
X-Google-Smtp-Source: AGHT+IGHJFdOOodO/O+4a8EVUgMIa+H+zBefBy6JiJy68Onq3BZCSMucEeaiVGE6pPSd9iBer78Y1w==
X-Received: by 2002:a17:90b:2b45:b0:341:2141:d809 with SMTP id 98e67ed59e1d1-3412141d8bemr9310617a91.26.1762267688348;
        Tue, 04 Nov 2025 06:48:08 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/7] binutils: patch CVE-2025-11412
Date: Tue,  4 Nov 2025 06:47:54 -0800
Message-ID: <fdbcbb0fe92a862a993108609eb4107e34eeeed2.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225729

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

(From OE-Core rev: 6b94ff6c584a31d2b1e06d1e1dc19392d759b4b7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-11412.patch    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 21f0f7e3a7..b13c31717d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -64,5 +64,6 @@ SRC_URI = "\
      file://0026-CVE-2025-11081.patch \
      file://0027-CVE-2025-8225.patch \
      file://CVE-2025-11414.patch \
+     file://CVE-2025-11412.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
new file mode 100644
index 0000000000..e2a2b10c18
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
@@ -0,0 +1,35 @@
+From 047435dd988a3975d40c6626a8f739a0b2e154bc Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 25 Sep 2025 08:22:24 +0930
+Subject: [PATCH] PR 33452 SEGV in bfd_elf_gc_record_vtentry
+
+Limit addends on vtentry relocs, otherwise ld might attempt to
+allocate a stupidly large array.  This also fixes the expression
+overflow leading to pr33452.  A vtable of 33M entries on a 64-bit
+host is surely large enough, especially considering that VTINHERIT
+and VTENTRY relocations are to support -fvtable-gc that disappeared
+from gcc over 20 years ago.
+
+	PR ld/33452
+	* elflink.c (bfd_elf_gc_record_vtentry): Sanity check addend.
+
+CVE: CVE-2025-11412
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=047435dd988a3975d40c6626a8f739a0b2e154bc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 54f0d6e957e..0a0456177c2 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14613,7 +14613,7 @@ bfd_elf_gc_record_vtentry (bfd *abfd, asection *sec,
+   const struct elf_backend_data *bed = get_elf_backend_data (abfd);
+   unsigned int log_file_align = bed->s->log_file_align;
+ 
+-  if (!h)
++  if (!h || addend > 1u << 28)
+     {
+       /* xgettext:c-format */
+       _bfd_error_handler (_("%pB: section '%pA': corrupt VTENTRY entry"),
-- 
2.43.0


