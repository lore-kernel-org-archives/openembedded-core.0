Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.160.1584984494264899213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=JNMYc2I/;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id b12so266715wmj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pK23YncSecOFBppJ0K3bPm3+xiDRRZqUh//iU1ZZphk=;
        b=JNMYc2I/EC+owj/CVHsJQ8PSfELT4KtsqYLVOO8zQbReqnBUG/FUk0jkUvMH4PNSCO
         HmYysvQQNx0OVvpmBdiHbtguJ0/9gMKLmRRoB/oux2UkhXR6kGW4FhUUqYx/4gTuOc6n
         DgNfCxmyu05A2+H3flSftCegi4Pd/B18Wo+1ddUWGzhiDrnP6Uy4RTGwmiA+fx4EnKBy
         e/6GberS/ehrZeuqcSxwA9gBKFE+xNleI5Ws1zuyt7hnaEgOVrHOEbQZZSALOGezCsOU
         Ka7hlgK53rJY6x9ZWJQPHta/mgrEq0TyExn51wIqGkk5YUqB8cE8Y/WvcS9+/Z+/LR5S
         I8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pK23YncSecOFBppJ0K3bPm3+xiDRRZqUh//iU1ZZphk=;
        b=VKbYz2LRGsFnhQLN1JGN13U/6l584NAYiaWm6tzdMwEuCVGjZUH41869FJ7rXSv4NG
         Heu9xk/YnFShXO34Z8lp4N5ulSnusnnCGG9ZgIucRIJ0p8eyC/7mV0mXCtRdc0kplJQt
         NzRnFfcUrqBZFXyB9fr4zsNmePiJoT7l4kQ/GLcYSL68A4YFJn3PAwmJOqNXmbbaoY+L
         ZZqPBH3YuVm8mrMoO0Wbpdg+Txhps24c0ibGJF00gN9KX6kNJl4LWsGcvgQJiXnIxO3e
         YrnI67qtLWRGn3nAWv6GtggReNE0+/vV9ccEf0lfb/UI9KX2qIsg6oc//VnqXwjoDhCa
         yqYQ==
X-Gm-Message-State: ANhLgQ1Ru8/j6Tw2bhoQkWzjHws0QenqbdAT8zoZSvnMb7T2t4CpULYR
	ei/nI4SZJ57pg81f8TLdzYYj/drsxIA=
X-Google-Smtp-Source: ADFU+vt6ai+2DUve+tTQsHXvmF8aDeatOQtGGM1ruRhso6gxocbU7Yed02Xkze6J/2W5f/QFkHtFlw==
X-Received: by 2002:a05:600c:2f1a:: with SMTP id r26mr367296wmn.11.1584984492724;
        Mon, 23 Mar 2020 10:28:12 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id a16sm303574wmm.20.2020.03.23.10.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:28:12 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][RFC PATCH 1/2] qemuboot.bbclass: don't redefine IMGDEPLOYDIR
Date: Mon, 23 Mar 2020 18:28:07 +0100
Message-Id: <20200323172808.26338-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200323172808.26338-1-brgl@bgdev.pl>
References: <20200323172808.26338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This variable is already defined in image.bbclass and there's not need
to redefine it here.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/classes/qemuboot.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 54044c38da..68f7a03619 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -83,7 +83,6 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
-IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.19.1

