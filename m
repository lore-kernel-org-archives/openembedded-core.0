Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5347CEDDA9
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:02:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5901.1728630137038937019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=CuZY5xGx;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso14495285e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728630134; x=1729234934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbxbtO+lD13aA9N4GjV9v9+IfjwO57Bw/SHUXwoATxg=;
        b=CuZY5xGxPj/99iMWaP9NmbHg+14Il2QXAZjdyHF0PNgLAjOIsq7XF21RrDzN0U7Mo/
         CkqbAzNEHZb13zUgg/gRMBNKDL5AJc5QD74/wAaG4CQCtCadSVsqgIlq3Yvku2ZY62Qm
         KO0lsRTe28hVrHWyk4gW2NBV552SbgsfzuIYGtFvV8ETFNpDDLUlVhBT+IZ8ra6XK0/7
         X0GUqnXtkBpYhLOPIssJPQw3rDJ8tD1ivQ/b6+DivxLoL1/J2dokXWpwNPjfmAnPQTSU
         2RI87FFPeJy2Uj89TRAPwTxnWv2iIguGj3Mnn391dRgeBQyjGVC4eiCRolD3PmadyTwm
         LvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630134; x=1729234934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbxbtO+lD13aA9N4GjV9v9+IfjwO57Bw/SHUXwoATxg=;
        b=NUJqpxJQZ2ByEFo2RmbOA1Ju0vYNnN6Ry43URhHpbRJBStzNS3CONtp5/yqQ3w/XxO
         J0v+1M9Ab3I9ShwdbBh0slyGNmJFoV3KTEYM54IOEbIjWdFowOC0IqpGKIo0QVS8UsO2
         NcTH6LwQovwfNA2UPfdsFZLQ1Yav/ofabKy3LNKZ6TzjEDb0iO5QkZGS4mTk6/xYn/qQ
         /dyIm7LR9wrND/B+7QN5y3NsuefNkRI3CHH5TUcJefxT/TqgPgevCmOyV1kGE84WAEd2
         QD35cDQcHVynrkC2skZ+cv2djmqirzdJFVvWjKyH7MMQS3rBObI2qAZHv8i0dxxBAOOy
         hzxw==
X-Gm-Message-State: AOJu0YyscEW8CpUXH14a90LBc5FuXkn7emTqkvHLHV6qrdl9w6vzMfwJ
	TYwla9QJO30zsQFuwI7Kzya28s2t+GyAQCG6utESAjsvs/yRfb/kAE7/hybiJuW5xZt5lWlnZ3q
	i
X-Google-Smtp-Source: AGHT+IGBcD3ndeyRfE6ty74nCOtaFTBE/G70dRQzpC24VW1z8LDont4JDUAEqQyrZw6Wmml6P7wvmQ==
X-Received: by 2002:a05:600c:4e46:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-4311df5644amr12832975e9.32.1728630134055;
        Fri, 11 Oct 2024 00:02:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:68b8:bef:b7eb:538f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d78dcsm34546855e9.5.2024.10.11.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][RESEND PATCH] python3-pip: add missing RDEPENDS
Date: Fri, 11 Oct 2024 09:02:04 +0200
Message-ID: <20241011070204.7276-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 07:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205659

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pip3 package is missing the runtime dependency on tomllib. Add
python3-modules to the recipe's RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Resending with correct tag.

 meta/recipes-devtools/python/python3-pip_24.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
index 5e1a467990..3019996f07 100644
--- a/meta/recipes-devtools/python/python3-pip_24.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN} = "\
   python3-io \
   python3-html \
   python3-json \
+  python3-modules \
   python3-multiprocessing \
   python3-netserver \
   python3-setuptools \
-- 
2.43.0


