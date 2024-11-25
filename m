Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B05CD5806F
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:33 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.17200.1732536092234683603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWZENHwE;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f6e1f756so4828347e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536090; x=1733140890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBKSDKH/ShXVdBHxr4G6pZHACiqT5l4bbGnDEMKtSpc=;
        b=UWZENHwE+qTIsxdc9EsrNRP5K7ttENRVkbXVPb0Laem9+gOEfVX2/lwnDMkSbkJh7N
         hTjOihr3kSaX9ELvU34RPPFrcVn9cJvCoQ0HVQ9+2oVIU7I0TuEEUkfbjx5RfXfFtKOH
         CXiWM5XiqvZjVpwjHV4TaPJIIUfqOeo9CslOeVM3kJQgykVkr91Qsmex2O/0ET10aQJ7
         F4DPtns3tPdBd6oitTrDa2Pwu/msF724ZX2ce7Euer1kxmZikYbVnuuVtPcgpHnLDcwO
         aLlsXr56bKafrb1bQfpYDE8hL+kYH+zKX7e8w8/5VqSprtivCqFCVQuettpT56fY6Kzh
         0D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536090; x=1733140890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBKSDKH/ShXVdBHxr4G6pZHACiqT5l4bbGnDEMKtSpc=;
        b=sXXMfbluX9U4UPPBPJsetrTbLLv06+TCCM7pKeUU+NAyvwzemclM0s/BW9lwLYAWue
         FekveKU2zcCmngjIsHwm+0P6G5V30VJT2nQaeew5VyCRUmbS/IkL489WDvoDilW6QVeG
         8lTeIy7xUjCJFBPHroVNDEIog+Hx/tk9NnRGMwjPx8mD0o1QkmZmiZRJ/E+VD0c1EZRl
         U1sCNyBcNOGWIHpmdY9WXlneLQ0eApq+QgJh8DHiVg1uzj8dE6csYvrzzeKtCF0hgSZ5
         1CJauzDIqEnbZ5cm7E8Q6wDwTB2qJ0IrKTSV3D7JlD17UFSVWBMfSwk7M/2o7SwA+f6p
         2MJw==
X-Gm-Message-State: AOJu0YwdUdEBrg5/xMrTN4EOGD1IsZmKzhOLGdTrZ0yMUELkcfF8Xrhs
	zZrOfcbU/OafaC6avNcbdAKXioqgGhAX3Yb83xx7o+Dt2JQg+FEk/6wZeQ==
X-Gm-Gg: ASbGncvfI7NRF0CXgbj6RC70HLRvQTWiLqyq6M5c1kE9dqouts+PsrhWIdg6jNlcK+E
	OsWyuyOO2/5bhzQuYRTYWejq3v+HPN5ntKJghYO1ZZ/2yV3kFBOH6/A+EwTp+sKDFSNF6IPQctp
	xbrJLcq+XTxxTCP78hxwTtStRHs/NpHs5L831enspksnFrlPCwoURsjOqM7CCkcoXixWE+qTcS7
	p11YsnRrIHkELhd3PheGRp1dVs59jSd44BMDDWzmX5fYyLP09RLns1YOb6Q+/B0zFFJgNuUtRmL
	IW38NMzHWiU=
X-Google-Smtp-Source: AGHT+IFgU0mFyW0cu4O8/XY+TKNEukd3JBGUblQht5NqnBdi7vwlhcpKVVIxN7yp7r7zqxpu8ED4IQ==
X-Received: by 2002:a05:6512:308f:b0:53d:de11:7749 with SMTP id 2adb3069b0e04-53dde117bb4mr2282211e87.2.1732536089896;
        Mon, 25 Nov 2024 04:01:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/35] alsa: upgrade 1.2.12 -> 1.2.13
Date: Mon, 25 Nov 2024 13:00:53 +0100
Message-Id: <20241125120127.2205232-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207748

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-lib_1.2.12.bb => alsa-lib_1.2.13.bb}           | 2 +-
 .../alsa/{alsa-ucm-conf_1.2.12.bb => alsa-ucm-conf_1.2.13.bb} | 2 +-
 .../alsa/{alsa-utils_1.2.12.bb => alsa-utils_1.2.13.bb}       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.12.bb => alsa-lib_1.2.13.bb} (94%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.12.bb => alsa-ucm-conf_1.2.13.bb} (89%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.12.bb => alsa-utils_1.2.13.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb
index d9136052b74..4572eff97fe 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2"
+SRC_URI[sha256sum] = "8c4ff37553cbe89618e187e4c779f71a9bb2a8b27b91f87ed40987cc9233d8f6"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
index 88b43c345b9..1cba08b97a2 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "168e7c0549b7bf8991092fa2bfb903631df779dc4c43ee8f4277fcb772d8c035"
+SRC_URI[sha256sum] = "4483b6e3983cca08fd326a73fbae449b5036e444fb1a07c0dee74b504b7ab5af"
 # Something went wrong at upstream tarballing
 
 inherit allarch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
index 380140861c7..b681922bbf8 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
            "
-SRC_URI[sha256sum] = "98bc6677d0c0074006679051822324a0ab0879aea558a8f68b511780d30cd924"
+SRC_URI[sha256sum] = "1702a6b1cdf9ba3e996ecbc1ddcf9171e6808f5961d503d0f27e80ee162f1daa"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -70,7 +70,7 @@ FILES:alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfe
 FILES:alsa-utils-amixer      = "${bindir}/amixer"
 FILES:alsa-utils-alsamixer   = "${bindir}/alsamixer"
 FILES:alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
-FILES:alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
+FILES:alsa-utils-midi        = "${bindir}/aplaymidi* ${bindir}/arecordmidi* ${bindir}/amidi"
 FILES:alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES:alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES:alsa-utils-aseqsend    = "${bindir}/aseqsend"
-- 
2.39.5


