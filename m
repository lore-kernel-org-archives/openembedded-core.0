Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DE9C3ABCB
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:16:47 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.5817.1746735402669991090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 13:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tzb8IAO/;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so22151866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746735401; x=1747340201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJaWYC/RN1Pl9U+HINWQn65oVTKAG/7GIWm+I5KMbTo=;
        b=Tzb8IAO/9zUHFXLGk7RQh24yYSX80UxfndF8yKbVmXgC2/Zw/r+0BfkQMcwrRku97y
         dp9BwtabGM/PlhTuBlkAf1XudMBFA45RGhzvsDkQQ4VSHV3Y9IpDtDYejCnZnYzaWVGD
         r+d89IV6O7b7Vzqo6zh5OYjUX1YbZYLL33uRoQLAytbRSmkKEBOsmLskf7MumhXjDdrn
         Uzca34kAC5PPrpJwoyNzIiiNxm2Ul5MmkzlrssaGvvx+pUNPXHJgPnuBHAFMXI1G1uvq
         Jy/rtHCryy0rRkyZTEc21WrCOi2E35JHJWU1BASzvC5FU52oNfuIMTIUQPQo+oJHusdN
         AclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735401; x=1747340201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJaWYC/RN1Pl9U+HINWQn65oVTKAG/7GIWm+I5KMbTo=;
        b=bQoXf6Epc00v8VJEIPSOo4mpXHv+6SQa8ttjUNCXB3U7dZpTw9kWhuQI8zrfIyhx74
         ECUGG/liCyhw/2UXNjVNbjiv3a3aMNm9q44wfPm60ENkvPZbK5Nn88QiEbvVDGoMRk8Z
         G6TPrZ5lguPdqyMlN++J7aCn/Vd5IYXH1wcMj7RYrHQUvuYP/9QzPovMenOvij6wxGft
         RAdktbXGznt7pDgQkC90mpLl6/WLHXsu3F4No7OT8R1q7eo4ctYRHdJW/nCneuLERksv
         55IPB12IDI/fM1eTwsKwm09hTIDe7tjeQzaB2EU8FlzfzH+Q0Iu6hk61yiUpu65MBat6
         Rf7g==
X-Gm-Message-State: AOJu0Yx2uSxMUcqwfcZZXN0G4S5gzgrDmCuXEXlwE93/2BlNGLEY7f54
	yPf+Osx3u6/oVIwwHDIpkZaT+kjQi2/7UP/PLvz3nrokVNgq5+IOlXeSeg==
X-Gm-Gg: ASbGncuf8PbWCqUG+sY7/zEUKDaSGMYmGBBftUGo5tF4gYXo/4XWkhDXjoa3PI9BVu6
	ZFzJQJ2GDzAXR4MAazTYQpG7DPE2h6oeDQO8N6a+aYZtF452bu8w4XMU6wmjO3mbahYoNUWKNbj
	wORiQ3g5pltINVPCuTSPlKF670O68iZkHYoniIF4llXi9FdkHixiKIr4ji5roeG+vuRPZ4tp0lR
	lepPnYKo1ZyZK4RQMM535o9x9rKaLtkTA1ZmPqnk57fdGIpIvhqpeYRgP91ycsiMzV9GWdGiJUt
	QCRZ78x78xnB3AQWK1CTtE0zqjnb4Z5POAvZsXYwmm3+tM173g4=
X-Google-Smtp-Source: AGHT+IHxTfAQsnwiI0NcD12f3MOcaNZvSGtUYgoIZH7alpGjdZCEGCr0KuFv1tQk5tmsvtYu6rZ8zw==
X-Received: by 2002:a17:907:6d12:b0:ac6:cea2:6c7 with SMTP id a640c23a62f3a-ad2192a882amr102881066b.42.1746735400772;
        Thu, 08 May 2025 13:16:40 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:625:1800:c942:8429:98e4:61e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933f4e6sm37610866b.54.2025.05.08.13.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:16:40 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.2
Date: Thu,  8 May 2025 22:16:31 +0200
Message-ID: <20250508201633.44249-4-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508201633.44249-1-an010@live.com>
References: <20250508201633.44249-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 20:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216161

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 952da888ba..6750ffcbcc 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1.2'
-DEFAULT_INSTALLER_VERSION = '5.1.2'
+DEFAULT_RELEASE = 'yocto-5.2'
+DEFAULT_INSTALLER_VERSION = '5.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


