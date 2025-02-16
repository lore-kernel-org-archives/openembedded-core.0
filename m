Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A83C021A6
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 16:16:14 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.31622.1739722568852185882
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 08:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FjJo969s;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso583680866b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 08:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739722567; x=1740327367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn158uBw6XoHsMZrQRigBDiLEAPQS4kGvas/mPgiMw0=;
        b=FjJo969szOHtFeu/BBPolCpC7TE7otuqEj5e4BzATrRpoAHtkYzaluSuJSw6xJL1/S
         aC3WjhlBOTKEErcXDH2dVRO9aEZfHR/293Jsj2jLD3J9AFstn3e2eOVwcvVy6HR4O9hC
         3Up8gKcYUxwzEm4vQwMgpRzH9tCO9BEnPRLpq4ubnZJmgeQvq5OPcWS2zyfoHp/3outC
         4lw9EA6cSJsqJ1a0nDh2CxDF6Ry+GSl4e6wXXJwdRYTqkdHDGxVev09wuY4NB++ieOzR
         UMmM/LV/wNLngbI4MQXuNxAdfZllsakrvUz4I2JItvi5dAOrXZ2/HhBBci7ALfrIVCu0
         VcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739722567; x=1740327367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn158uBw6XoHsMZrQRigBDiLEAPQS4kGvas/mPgiMw0=;
        b=KeizCZRyx8O+a17nvBiPsUZ3xKFC0vTIsr6eQh3unc60OW+Vw9lGAqlUNydRw84jeB
         DQPtfXlyzsBW2hjCwQxqL3HSupGq9zwij+alhAs2vs9JhJPumbB2olF4FSFqBi7Qyi1s
         HT12acWT4th2pC1wk0aKYoLzHBqs4QDJqaxM4InM9WJ0T7IosUZlreWeWB/w227KVcQD
         Qv+0bku97cwzAmLdrY2xGMpvO9Ro+oea6i/XpfrjgnyEnX3rwo8eHVV4n7UcPtjfnA+o
         i+YjONwVdWWEmacmuGgUQJX8tHEIZ0s1SSNLgXbspviyhMITOVQEjaGbI02XfOOXJwM6
         bYaA==
X-Gm-Message-State: AOJu0Yy6s6aMrFN23aNp/l7tZlFqx8ZyxAt9tKgnLhuxPqUIHTTek4em
	1Lk+wYDk31VN6blGyoN4ZLd4yUwFcQ7cTf4atO61AWMVXvqiJOZSayCO3Cs6
X-Gm-Gg: ASbGnctQyrFYGySfsb/dAe18J9nhipJLyfTH1aifVZ0uwVIeYphcdOhkUuceFRnPWzG
	2tMjZYFyg9RdLNy751leLiODlimoFRRras5Spr/M0TSgKxVdhNdejbHGGm9kkQifHGlNg01ORZb
	Nji4BehK8h8IDP+WHoinfR+eK7KrmsiElSOqaumzjYpOY5IOF9QXSy4QFsdQEMKM/e69kLaHdcT
	39HTTWTecj33sG40clGGZdzQoi5OQ+rCjjTq1J9817r8BDFtYKEvpsuzI5eyAgkcQe0Df4otmF5
	uPK2DW0htkTB
X-Google-Smtp-Source: AGHT+IE4+ktRsU0jwDoMJ5EH7LkaEw1Mh2nOFeF58fk64pQoP/f3F/4yS5LeljCeEjLjsb1TIndEKA==
X-Received: by 2002:a17:906:314f:b0:abb:6b1a:7b22 with SMTP id a640c23a62f3a-abb70b3b6f4mr672728766b.29.1739722567051;
        Sun, 16 Feb 2025 08:16:07 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:5a3c:6621:dedc:472:571])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6e4df5basm357917966b.152.2025.02.16.08.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:16:06 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.7
Date: Sun, 16 Feb 2025 17:15:59 +0100
Message-ID: <20250216161600.406219-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216161600.406219-1-an010@live.com>
References: <20250216161600.406219-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 16:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211503

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.7 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 972671d50f..e4d472023d 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.6'
-DEFAULT_INSTALLER_VERSION = '5.0.6'
+DEFAULT_RELEASE = 'yocto-5.0.7'
+DEFAULT_INSTALLER_VERSION = '5.0.7'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


