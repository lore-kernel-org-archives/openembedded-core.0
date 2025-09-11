Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36DCCAC59A
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.41404.1757580699338004494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=duwrUkl0;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3dea538b826so444639f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580698; x=1758185498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Zw5/gKQ2d4A+gg+7YutOIbEiLpcjYdwlchBk8mk+uU=;
        b=duwrUkl0YrVyxkToT+rwn6VJIJbkAurbcXFGOazDnYqlo10PUsyu7b1BfuDErrOxih
         8FdFiO5gRkLkIzD1eI7RnSIAUTS/ezuzyg+zSjJ4l3uelZBPlfcfXsN46r7Gra89n3L9
         /PmotHQiR89DdLPir1ZvJHwCAvIq22l6FA2So3HjbceIRzP4yChlGp4a/cqbGxRUuUla
         841h2T6nNA7b/0q2Nsoq/ldCRfaLr/x0PcFOeDrehEQJ5dQ3BALmmyLmiZ/UGNXCZPuM
         kjGfx7yaQbTDkE4F5ev6I5fetINAJCGimUYf8vLp3rxc33tydApOAYnX5cQyzJBxyHy6
         tgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580698; x=1758185498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Zw5/gKQ2d4A+gg+7YutOIbEiLpcjYdwlchBk8mk+uU=;
        b=KXvBQ1/XclknfAGxAFKS4XQ4IQxI2lxUNrVVl1yqqP7xF1Mmex+14lgBo36URLVD41
         hJpHzhULE/Atm4W/fRwHLfHC3Ldva+fFSGV1qAluy37l/g1EqxgIadVk+M1iYJPPHitX
         BmVvA2fSHAOjxIMTKKOLB2nCnFa451UKDGpSJMu6hndPQapvLETGleuqff4uticowj1L
         0adFdi3LTn7NIpNKlfYhI/bhc8qDkXPM1WzKAkJgMM0TzCT+v24ufgiyi2wrISO3Mlr4
         VFibA8HnXE7OMjLKCmdMIjPhKtGHwraPWAVrQTosUqifRenMUVFor8qqzH/AyJRCBKRT
         334w==
X-Gm-Message-State: AOJu0Yx/0qUnKmY0xGfo+zvOgo+nBVG+vixQ+xIOXjG+XFYrSvRmSlBg
	1L6DBEEebP9L8cQ674L+OMcpXJvpqZflaaZTuAmh+csrBpo+03u6dK7jUXY1sw==
X-Gm-Gg: ASbGncvm16fdcv6OIO8J0t+7Wrj4nrBBeWPNHEvVN6vqKkINuW5fEZGHB03Ei991KEl
	vfgz34xzkLOjMqLEnu6lY0wSY+EQNgDLZGMRD9g7ib26lC4n1ozvx/Yqb0+vXUHkkFSmSAvZy9S
	AlFbT7ewL33IdJGMnXr/omBFEO0lhtbDa2/ICo3zQdbqsjWtugzGAFou53YzueRCYjmoWVl+ecN
	54sO0CvT1rXnzuK8AtRbFEPb1C4ODlDZWeLZl+T2vBD5VWnoBTTz7bhX4sGZ4ypkr3JrykbJeNS
	5Yv6nFOKtoIWU7Ht1ey3QNVGABsvxAFzLMoeb4OauTphParSuEbam8toXiYJljy/xkyJ4XV0/gF
	NLjgjdrYuVwrHK8cLl4OslKA5Gy2cI49nmhIDD1u/UAWTI4MQEDmBueKwrGmW+oH6g56o+WK2WU
	X42QAhmLCS3J4s7oXwgp/9dXER8R5Qnl5fujY5FwbKT0kPvL2Hofq7Cnxd0w==
X-Google-Smtp-Source: AGHT+IGsKVAxQTmU0193hamlHrJj9IMhy+KQkUdl3kt7NWyH0WRV4x0eoC70t4+6R8J2nVtoOXwPGw==
X-Received: by 2002:a05:6000:2281:b0:3e7:4c93:18bc with SMTP id ffacd0b85a97d-3e74c931a00mr9034974f8f.49.1757580697547;
        Thu, 11 Sep 2025 01:51:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/16] python3-booleanpy: update 4.0 -> 5.0
Date: Thu, 11 Sep 2025 10:51:13 +0200
Message-Id: <20250911085123.1551425-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223253

From: Alexander Kanavin <alex@linutronix.de>

pypi's inability to make up its mind regarding separators goes on
(and on and on).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-booleanpy_4.0.bb => python3-booleanpy_5.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-booleanpy_4.0.bb => python3-booleanpy_5.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-booleanpy_4.0.bb b/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-booleanpy_4.0.bb
rename to meta/recipes-devtools/python/python3-booleanpy_5.0.bb
index 4563cb8c4bd..e51ad9d2c16 100644
--- a/meta/recipes-devtools/python/python3-booleanpy_4.0.bb
+++ b/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/bastikr/boolean.py"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d118b5feceee598ebeca76e13395c2bd"
 
-SRC_URI[sha256sum] = "17b9a181630e43dde1851d42bef546d616d5d9b4480357514597e78b203d06e4"
+SRC_URI[sha256sum] = "60cbc4bad079753721d32649545505362c754e121570ada4658b852a3a318d95"
 
-PYPI_PACKAGE = "boolean.py"
+PYPI_PACKAGE = "boolean_py"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
-- 
2.39.5


