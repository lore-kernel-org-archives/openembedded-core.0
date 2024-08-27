Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C80C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.71684.1724736258108330473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rkg1A9D4;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8695cc91c8so536012666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736256; x=1725341056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOZYRvpx2x1I9MMTDzsdVF81jBFRgi/CKbY34P5aw6k=;
        b=Rkg1A9D4OFwwiPiXmEh3IvTPRZ80q2miwXKWvnpp0Ov7dEqSlsFNt6r+xMmnGi4BwQ
         t/MaV9Tufbx3JzXWPVh6asd5orPZf1mbTUJi2+mYbMqelaVVgXkR1J/9rXw9a4aj2txN
         hOy1c7dwKwxHHMkMPcQh+cK9rIb/FQbBlz1lfq3P8nJ9IYa+T/KaadLydlPcsQ8wtBrU
         vP/59dvxZ/1j0pTEsjRLvbgoJfmK+nR+lvCyhXbsDW2xRPhTmEZqDFaFgLay9ln0yC32
         WVcp12Clb4OxXx2UY5gJPfy/rcO7foe2d3RizrD8QrzfJERmMvaV5El2ZGBufh3elSus
         dwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736256; x=1725341056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOZYRvpx2x1I9MMTDzsdVF81jBFRgi/CKbY34P5aw6k=;
        b=HirQ2ZYd923TtkX78eUcFiIhMMqlODVEnZg1Ar6UmtuVzJDEk1iYVh1NckqEu2DIRM
         tn90IrC0EEJGyUClVmc41B85ZVVbUSXhlDcjNF5GmJkzx0n9NUPXV5j32dKia1qrSzJy
         Et92wcr41P9GpAYqcKua4j3TEfwi32NWd485FQZEkFsg4W3KhQV93OvlRdE1d2arX2uU
         ilrnt76Ov1Q8bgB5Xu2UxDns9kytuqglTAw4uNYqApBX9Veaa7aZCinu41IOkJhYpwC+
         YcWLQuA4FT5are2tx/3BRjQ2udLvumNNVfBexioMA6Vqq8uzAgGKW9VHFtdFRA2hwtAc
         22wQ==
X-Gm-Message-State: AOJu0YyZ2yVzkGaHD8Ihax4/oH7UKUbKoLil6NyIQ5OpWBFXLNQj30cF
	u9+3ys+lMk6ASeg/mSjGKjujUYGu6gLTTGQwvmRW7umBDJeAAkyctJ8ttQ==
X-Google-Smtp-Source: AGHT+IH6Xx9Ql/yCBDaeQ4hq0jQHr6vk2ZkGmMsU0SZ/oYDbcESQfkdh6MqUkWPQcnhjJ6JqaOS5Og==
X-Received: by 2002:a17:907:7205:b0:a7a:a4be:2f95 with SMTP id a640c23a62f3a-a86e397f5c2mr144876866b.5.1724736256217;
        Mon, 26 Aug 2024 22:24:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/34] lz4: upgrade 1.9.4 -> 1.10.0
Date: Tue, 27 Aug 2024 07:23:52 +0200
Message-Id: <20240827052354.1319810-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203808

From: Alexander Kanavin <alex@linutronix.de>

Drop most EXTRA_OEMAKE settings as no longer necessary.
(makefiles use weak assignments and shell variables then
take precedence).

License-Update: clarification that it's gpl2-or-later.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lz4/{lz4_1.9.4.bb => lz4_1.10.0.bb}                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/lz4/{lz4_1.9.4.bb => lz4_1.10.0.bb} (74%)

diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
similarity index 74%
rename from meta/recipes-support/lz4/lz4_1.9.4.bb
rename to meta/recipes-support/lz4/lz4_1.10.0.bb
index 51a854d44a4..40768fb2925 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -2,15 +2,15 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 HOMEPAGE = "https://github.com/lz4/lz4"
 
-LICENSE = "BSD-2-Clause | GPL-2.0-only"
+LICENSE = "BSD-2-Clause | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
-                    file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE;md5=c5cc3cd6f9274b4d32988096df9c3ec3 \
+                    file://programs/COPYING;md5=492daf447d6db0e5eb344a7922e7ec25 \
+                    file://LICENSE;md5=c111c47e301c2ffe8776729b40b44477 \
                     "
 
 PE = "1"
 
-SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
+SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
 	   file://run-ptest \
@@ -23,7 +23,7 @@ inherit ptest
 
 CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version."
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
+EXTRA_OEMAKE = "DESTDIR=${D}"
 
 do_install() {
 	oe_runmake install
-- 
2.39.2


