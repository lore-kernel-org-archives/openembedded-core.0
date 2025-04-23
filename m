Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F5AC369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:42:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.8119.1745413372837647684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RFl3qPUA;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: patryk.seregiet@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7041406e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745413371; x=1746018171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t3Elxvdg+8i6WPi8VOMErVokZqUh8QduZmnVsA+sSE=;
        b=RFl3qPUApPp93+WVzipnwnfOkd3RU6y0UnsmJPzr+mkkwk2cVFFwpi5Bjhd1NsUVhd
         EiLFlQHHi4iKXRAcLvyykjgG+7yyVgMwbYqhhl64tlUbVQVwc8+mdKSZ/IkoYXHI+CZ6
         1DVKIdN/mQeAFTyyvF8xt4Pqk2L683bcg9NJB0+sE99Oxnt9P+aZ9hdtfKTcPYeOMZ/W
         HUSA6x5W/4hBAmSFJrjDD0SYmIFo6jnjuus9nPOF5U4KBWu9yjb+rSEPG73sXvF1KGjl
         80qEuksf6SvLHDIkGFZePVruqa1pzcl7DvSnpAYV8/e5bvLebcVfxCVYvQ/ZPNkISl83
         waIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413371; x=1746018171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7t3Elxvdg+8i6WPi8VOMErVokZqUh8QduZmnVsA+sSE=;
        b=VykPip40P4YmtC4YPnhj0Mr69OYpFvKnoW5CeVOmxyAylZQszdPwgwo6QWWNRZ1Q0J
         OZsQMSq6V7Ipc55YKrVknYhhC95ZXw1Mfrc006Xzm4PDBBw4Hr1cA3JEfXO3lOI5pQme
         4Kuha0hJgBtssLQwkKnAyrqW345EMzG9wJ4eCZO9jkwfzinJ00PjP7dGxtrACa5RMedR
         4xjLa4pHhdcIMyPa3XPuNN+Qp3mNQvbfR8vZxPaj4TII0/12SxGqv9n91yQ7Wi9m7MTu
         Ju5INie50WNNjUQhcNnxxBh66DrTeY2mQuOfhNIz4IKR9wh311WlNjuM0XitufJMn248
         kSmw==
X-Gm-Message-State: AOJu0YxDVTJIMBVGFNeu8gxp+oRZ/gMNPOgQrkRK+NjKi5aIiM34WOUg
	BzvIO1U8k2Kl35Yyzuxtvn4omIbmiZ/KpAocgrhxUCiOjAa/pP/aL1+/L2D4eDtj4Q==
X-Gm-Gg: ASbGncuBmYyRSNI0KIUVV8+VY3JIRxyCW3pBIgHOWXjyWX3SMo6J560L5sCA5s1MGzq
	UOIFv7gHdQd+w0U4/LGesnhkH8BCGM4+bC9Fj95mHLtdzS7GZfsMhwzaow4jnFIQ/1J8y37JvMs
	EBrbCf3qWPFO6+8PUkoh6aEKL5ouLc69P5XQuKKcYhEW3/uDIcJ0mOQq+l8/v31Oaflnc2ngDmI
	cq3vTpq218PP5U4Wh+Xte4mmsCOvRiphyMCay/uZSWPV+vGnfwts8kXdkB/2yExzr50cNfLxJlj
	jU57AsL2VmsrV6Q1uvj5REtITOwYQiAp2zQFraCLbWJ4iNyvW2DoT92qtmEnusueYXhG0bVr0cg
	YZ+Kg82aUKNmdy4Co8i5JtwgZ
X-Google-Smtp-Source: AGHT+IFCx31+Ud4u/6i0nzcXo4WZ3Juw0J+r7z966GKcqgSpIs0yl6BSLiLoinLLp2v2LrH3bCairQ==
X-Received: by 2002:a05:6512:1245:b0:54d:68bd:2856 with SMTP id 2adb3069b0e04-54d6e62b91amr6520979e87.24.1745413370215;
        Wed, 23 Apr 2025 06:02:50 -0700 (PDT)
Received: from localhost.localdomain (83-168-79-193.static.ipv4.korbank.pl. [83.168.79.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e793ca14csm120305e87.196.2025.04.23.06.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:02:49 -0700 (PDT)
From: patryk.seregiet@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Patryk Seregiet <patryk.seregiet@gmail.com>
Subject: [PATCH v3] linux-firmware: fix FILES to drop RDEPENDS on full package
Date: Wed, 23 Apr 2025 15:02:45 +0200
Message-ID: <20250423130245.118635-1-patryk.seregiet@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215315

From: Patryk Seregiet <patryk.seregiet@gmail.com>

linux-firmware-rtl8723 and linux-firmware-adsp-sst
contain symlinks to files that were previously
packaged only in the main linux-firmware package.
This caused both subpackages to inherit an unintended
RDEPENDS on the full package. This change resolves the
issue by ensuring all required files are correctly
included in their respective subpackages.

Thanks to Peter Kjellerstedt for figuring out the rootcause.

Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
---
 .../linux-firmware/linux-firmware_20250410.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
index f12bb2c6d3..ffc738ad8a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
@@ -1257,6 +1257,7 @@ FILES:${PN}-rtl8723 = " \
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
@@ -1760,7 +1761,10 @@ RDEPENDS:${PN}-ice      = "${PN}-ice-license"
 FILES:${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE:${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE:${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES:${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
+FILES:${PN}-adsp-sst              = "\
+    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
+    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
+"
 RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For QAT
-- 
2.49.0


