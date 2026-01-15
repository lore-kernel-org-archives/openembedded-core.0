Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52CBD44C4A
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 13:27:43 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35619.1768483652858496971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 05:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Tso2INT8;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.51, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b7d213fd6so157007a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 05:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768483651; x=1769088451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OihijSsS0wS2EuaMoxqjjM2zUvhigrYenPLmS7MxhI=;
        b=Tso2INT8ovM7nO4eHIHo/49aeALU7MhYQ8yOKGE31KYfZiceuYNz87Rf6uZ/+UH6Q7
         pLZWwYixzQTZ6pkGR/TaT57mbRcp3CRgqBbtAOntvUofsWNYpo8h6AqgRReEqsZZ+uBd
         OB1/bE0OOOLe0X2K28IayxpFjcQEMVlsrKoNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483651; x=1769088451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OihijSsS0wS2EuaMoxqjjM2zUvhigrYenPLmS7MxhI=;
        b=i4wB4jNi+tGYuJOehrzhPkVLeMlyfPkaRsbB8/qeD+cKveKqEAPhMpIPz5B2jX2x6h
         R66nCzlcGttsQQvRvmdsmqHyusd3rLQ9oVVthzB7QcuEAGtc087oRQkkedZZR0Qv0OU2
         fFAhoch3byiAaZigAu/4oMHns3Zjao1nJeJgEqDxV2L5pa8vdZFJeTfAtQfAFd2DY/dh
         +A4w2lH2wrQu2ukwl2Aoqz3+MFMp69KherLnLH+/NT6zwEB/em8CEaB4amcwZtUgntP9
         QTZEtszjgOZFlJXJeOD1QH6PIK4zFt61X19zB/uO0naY/WrqxTQJyXLJKptgJMin5tkp
         xjbA==
X-Gm-Message-State: AOJu0YwTbyFwlEkkIZN0ADbMs++FdVUe3+AX+h1YRpXIWHAyYq+JnG3+
	gV5hw87u6XaZfK7ToBw6V3D2VeXoA9xkOm8ovBitpwFXTdaWgu66piBcM9ST9qLfCcQL0A2WXQD
	oNI1l
X-Gm-Gg: AY/fxX4U+H8ivIacSKWAPuIpK1+6K+FdEGevIcdsa308a+LSqZ35je2xn9BsyXaJ6Y+
	pPm9udSzLN3GYn7ErHwnAkpMkIOhQxXkkS5XS8g/8Ig41rZrRfnJFb5hqnepiG6xlWqFRZPhSrE
	AiSMan0oY9fheIgNYKu3mC8Ybt1eCuDhX02JkyOB3oPeLn+kcKv7X1gS9i5w/HTo93XusUtqPLW
	5Y5h/ZorOvF9ZpevyD0enj08MjfNvyP1V5LzFHOtd/aZbjbTntuL27ZJ+dTkahh8QBXYnJKH3GT
	qqdBeRCrO1MhvZ/hRtOVSv7Tp7sJDPqoO91JA6GEqesjQbRcjzd8RjwL6kvtxYdZQiI5zuYTfcg
	Q11UxBg4ahaETl5PL5CRU2iZx/oCeK/7GRhBGFRgfe+ObMmpvHe5pJh/Xp2zkTs1IJBslbZEEax
	V/nz4y+U05UIcy6nc8wnfwkwl9zQH5CRF/yZYRbM+TBmW3NjzJMDwrK2z32PyCG9dMHEyLCji+7
	zu6MY/FiI7Yh5JvcUTxtnk6gde/A5bbt5S2ItLgDlsZk56Lbhvb
X-Received: by 2002:a05:6402:1448:b0:649:9fef:5b14 with SMTP id 4fb4d7f45d1cf-653ebf79008mr2986969a12.0.1768483650907;
        Thu, 15 Jan 2026 05:27:30 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65412084054sm2533618a12.24.2026.01.15.05.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 05:27:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] systemd: upgrade from 258.1 to 258.3
Date: Thu, 15 Jan 2026 14:27:28 +0100
Message-ID: <20260115132728.3570868-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229409

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...ystemd-boot-native_258.1.bb => systemd-boot-native_258.3.bb} | 0
 .../systemd/{systemd-boot_258.1.bb => systemd-boot_258.3.bb}    | 0
 ...temctl-native_258.1.bb => systemd-systemctl-native_258.3.bb} | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_258.1.bb => systemd_258.3.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_258.1.bb => systemd-boot-native_258.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_258.1.bb => systemd-boot_258.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_258.1.bb => systemd-systemctl-native_258.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_258.1.bb => systemd_258.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_258.1.bb b/meta/recipes-core/systemd/systemd-boot-native_258.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_258.1.bb
rename to meta/recipes-core/systemd/systemd-boot-native_258.3.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_258.1.bb b/meta/recipes-core/systemd/systemd-boot_258.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_258.1.bb
rename to meta/recipes-core/systemd/systemd-boot_258.3.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb b/meta/recipes-core/systemd/systemd-systemctl-native_258.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_258.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index daf37060d7..50f62f38f5 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "67a1069b7269cc23c3d04a2fb0cf110abe7abf31"
+SRCREV = "56a85121cd3502e824ed368a6b06dda924932bcf"
 SRCBRANCH = "v258-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_258.1.bb
rename to meta/recipes-core/systemd/systemd_258.3.bb
-- 
2.52.0


