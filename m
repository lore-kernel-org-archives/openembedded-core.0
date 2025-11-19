Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB7ACF3189
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:20:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3564.1763547602128648505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGEL5hHw;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b427cda88so4660489f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763547600; x=1764152400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4NQ0dqiHMYFDy2rlY55Vo3JSWgKlmhnJg95Nrig6zQ=;
        b=WGEL5hHwRvWPSus+OUMGcyAKlzK3TIc3Ea3svEPkBP86oa0K8agPaZ1Dl0gayWbbkq
         5uG+pu3+O8IcQ5WEKcGCuSPZ6bmNOGBkGFPphOZOQfuCZ4WHSSZSPSEqCTuRGC8yhnEN
         SsdOH5t7gWvT5P78cHhWq2T6zrnOW7x7mGlsW84g08ahyoWTDqI8ob0x+KN0Mp/SHmzi
         sQOkWk05w1pNgnuIRQOrFQhc7Pd8mLFSKT+pgeN7VBkZlzJvkfAL/HaUE60FDFvFg+cG
         Oq4tH4IWjGLh4Tmakc8CiKsqb0dxoZN1pqeD17wKpjCsVETxSGeMsKU9b/YDVvRi+tgv
         02UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763547600; x=1764152400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4NQ0dqiHMYFDy2rlY55Vo3JSWgKlmhnJg95Nrig6zQ=;
        b=jHgZTHkHTDxnvz+V3GnlfIE5MYsmwriIzz3ViPGoKwF5L2wfeCTfjR7n84j97KoFsh
         NUmKrq7X2RHbsIVraRU0PwgsDWW3IUUrOhAM0lBuLPcEKbXY8NtqZKF9J8EtPc8bqUUP
         TaCXQgP8FSV77twJq3EOOahWByBmC9dx8cf9cqPtY9Nga6Syc1AqJcOHGfuLqhRJSNd3
         gRjJ5fgJtHtJgJQsLT00RElPLXhLnwla8lTR+Q9in3wggI1md0HaST1Bb1kz8uiwFtZS
         pcQsA3Q1FZpcIsppouTxWEQe9mnhtX1kJxF8DDxXJdoD4J6JAWQga+eXzyh8l3PCrZ9g
         kSBg==
X-Gm-Message-State: AOJu0Yyou3yuKbyBPuy+AMVG6/m0UCfNf7Xl0wflvwY05zcrNSlEO+rT
	mSZheTODWLBW9J4l+NkpzAR1aPRkw6j6iVYVaEc4ZckgYYH7ONHYDvVAA+eAfQue
X-Gm-Gg: ASbGncsIBzLQDbVksJUrfKFbkFvt6DikjAsHPev9tIqburWH2wpmTt/Wud7JBPnGHKc
	JyZDquVThPSxsuWkAkTxqBcKN1PcTK8biTvzh+Zy3xNMeoihUux3dolcuXPquetN2U8aOvKmxBX
	iQBENHbXbSMMnxt94cnZowSXQtqy12x18OMl+yALR9fpzGB1qqPd7EDk2eV8VIKQaDGrovUIjYn
	2qeTAVPZNfbJnO2U7hB0I3xNfpcL2zsxhEGWm+GO++QRgGXUDECYo1CdQW0A0vGjERohqkb62Rv
	g6n8ezcBpbWDOw54AkLWAW9K0P7S+/Z+x6WccL/LLbunhuN7JLoHoUL9h96av4kUkhwQKUzg4Dr
	Nxx99XOd8U5jlr8FmzoNjV0CE+nBeAytVnOM1R404s2NjczrNnsfZ2zr44gMPK4v0vfojn9T/Gy
	u4AHPIcCO2
X-Google-Smtp-Source: AGHT+IHnRd7oiBoCvzjTaSyB9aXILuHqe7GB9j2IKGrtsRLknAXjRGdoifR4+nux0NmHWGUp+3aHPQ==
X-Received: by 2002:a05:6000:26c2:b0:42b:487c:d7cb with SMTP id ffacd0b85a97d-42b59367903mr17850516f8f.34.1763547600275;
        Wed, 19 Nov 2025 02:20:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm38190598f8f.19.2025.11.19.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:19:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bitbake.conf: add canon-prefix-map to DEBUG_PREFIX_MAP
Date: Wed, 19 Nov 2025 11:19:59 +0100
Message-ID: <20251119101959.2603691-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 10:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226545

When the debug-prefix-map and macro-prefix-map compiler flags
were change to file-prefix-map[1] the -fcanon-prefix-map
flag was removed, most likely accidentally.

Due to this the file paths were not canonicalized before
substituting them, so they did not always match the corresponding keys.

E.g. relative pathes were not converted to absolute ones:
../../sources/foo.cpp doesn't match ${S}/foo.cpp, and due to
this some debug sources were missed.

This patch adds back the -fcanon-prefix-map flag.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 52ceb76bbb..f789b8e326 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "\
+DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
  -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
  -ffile-prefix-map=${STAGING_DIR_HOST}= \

