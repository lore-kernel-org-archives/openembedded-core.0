Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7B4E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 23:46:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.7685.1733874389694652052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 15:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CmXPxO/w;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7104680e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874387; x=1734479187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1UyQ3ar7a4nqkmIDmK8uktOz3HRTZ2q7sEZOEWUqmo=;
        b=CmXPxO/w4pMvsqJ7jygrTT9+UM4pPAXV8kKFMfMckcsL5xYdiYWoRHWDA5ByqWWoNB
         VoNNTG5n1VgSTsjn3l5YIHRoufxw51PykULandj0ciBKqU8hnrsyhq0Io8L+erbLteiP
         riHS9uPDCICDcfJal1m2ZgcGQDs9b0qqg8mVjftrhuaooCgOKzAM7NsFNf/K8w4Q3UAU
         DyMLygo7tdlZmY3D9yp9k1/iwVIzgb0J4oPTepz7zD1SK0EXvMaD+WQMTfkSYecMCegu
         QsQ2OmwPHS46WgrF/LoFzWTuhbCAmC2XGVGao4p9dqAt4IuF8larLCP/gyhh3c8XNrOi
         SuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874387; x=1734479187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1UyQ3ar7a4nqkmIDmK8uktOz3HRTZ2q7sEZOEWUqmo=;
        b=WycHQDcIPd4YcOr8Nro7a1gWAdB7zWU0PLSdAn/JJ7FnZYzbgZjUjs50DeHetbBwXA
         /+Gwmmu0a6h3BOXiNuAN8Tf8gyQ9SI8QPSXF9HRAiUIDBnLdpql9t2QX8qfDaaVr7vWM
         AlzFTo9f4TxX0cBOJRZnZ3uzynbPHClyWZ1ssCSCbFym9QCgY/0J4qJ2j+j6T3FODSlB
         FYHyyiy/jo1cqnS8TfLGmIbmIt0jFnIjtBpEvzIVFRuuzNdaqUpXNrYkga/Zq/hwrGZv
         vpl/2GGOQFpkLq9U+Bh45/PY3iFRgjVc+tt8bOKuCwANEH2UYsI7flJZ3Dgtp+o5DOAU
         LXow==
X-Gm-Message-State: AOJu0Ywi8vBfftbvjT5epUtmo/9hNU4Pi22qG4ul+NaMveHdcrYyIlp1
	jVF1P/0g4X26DPQUQ2xYka1qaVt3CqtvxgfQTDTxHnQFSk/ytOUJBFim2j2hZEkUqc7+Rxdxgxv
	5IFU=
X-Gm-Gg: ASbGncugTwcNXP8f5dnHfFekfgg4WJ/w5BVGZFdcRmOvPZUmArZNFoAHRuz9Gc/bgbU
	TecpIHTZ9IYA67x47Kcofl1L1ZWipLbagy5czqEYttJQCpr2F3osUC4xw7UdYfoXFwSzWJOpTYm
	kmBocaipO2BvwHwJfdrEIAMS0pPKMwNttTxzQuw/pvYaEQPOMAVtYLY1bS4WujSWkb6CqWoADxm
	n1VEkXm3qmBQTTxSAOe+ihNRy43vfT/yzV37wkOT+bPcRI1EOMmH4puV149ralHEt46vg==
X-Google-Smtp-Source: AGHT+IFVf3ZstBFhLsbASMRyjJDpXi1U79TDvPbd9zsmNqxKNr4LGBtodXRYikytI8mYWGA2WIPuYg==
X-Received: by 2002:a05:6512:2215:b0:53e:362e:ed6 with SMTP id 2adb3069b0e04-5402a60be85mr174696e87.50.1733874387069;
        Tue, 10 Dec 2024 15:46:27 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402955eeb7sm128851e87.203.2024.12.10.15.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:46:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: upgrade 20241110 -> 20241210
Date: Wed, 11 Dec 2024 01:46:23 +0200
Message-Id: <20241210234624.1650171-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 23:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208566

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20241110.bb => linux-firmware_20241210.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241110.bb => linux-firmware_20241210.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index 7b23f989e569..b3be4452ca97 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "cc90b04cb170ac983b67b00f4ec8f73d"
+WHENCE_CHKSUM  = "0b30c661e226decdac3acd31d83517e0"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "32e6d3eb5c7fcb69fe5d58976c6deafa0d6552719c6e74835064aff049d25bd7"
+SRC_URI[sha256sum] = "2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5"
 
 inherit allarch
 
-- 
2.39.5


