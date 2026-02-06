Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B56EE209A
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:29:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10452.1770380968638237962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 04:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VA/jiM2u;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1331964f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 04:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380967; x=1770985767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3Y3MxAJFwTJpsOD80tx0UAfUAdZbLWSvnJEC5HaXmA=;
        b=VA/jiM2u1NfOa+YPSe6zq6ofozy0BM2inRDwcBY4Ckxdnk5CDuox3R81AvLNF52mzc
         XETUKkf7h/3u5UG30cIiuANOkZaaFQga3xaAijgX3x78UZgm6Bd1TZiDY6Nxp3thpjtm
         GWPxyhE6qgoneIUo5QyVu3u+o+6dvp8J/Z68p4DtGeiuhAqa7vknLXEZn9RjSsho6nuo
         Etd4HoTPsGPsMJfhhomoAfeLiDHKQNijb6OzKb/xBCaYSS/cU8axN/H9lECeBo/lxrCQ
         VnJo/pXDKOm7gwWcgKCjvazHp/866vyZmulY3EnRp33DEhIeoyqqLrxI4b0IF0b5Q44b
         oEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380967; x=1770985767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Y3MxAJFwTJpsOD80tx0UAfUAdZbLWSvnJEC5HaXmA=;
        b=V67mp72pZ5Idlyjgiatd0J6BIS5A3npOBh6H26yNMU8AJx9Kv6K+quBCCdh9ECiv0d
         QAsWWJSkbGFr21U0m6BzzJHghE/dZ/BbAawGpL4t7pjgprcUGYa+j//KiB9Sx6fMK3qr
         N+olxM89vy6q6mbHKB8eq/ufIO05m8kEq2TzWkParbjO4O1ogg/1AEr4xaOfmFDuwLsu
         I9vfUxhIOYbp2aQA+hNDoLXt1Ub+q0Y6JfvoGrucKy3KJKEDOWFcUKFeRw6+H0X2OO8o
         0rCGNnxkEkGicOm6SP5gjLmdD3VUcLjzoIG1BCUSEv7rSDb9FNIp78621EK2y3Xv2cNK
         n25g==
X-Gm-Message-State: AOJu0YwKMt8sKH8iRHgZzQNw/DwQm9saoRq3dpU3g/Aqyza/tlbmOMwb
	Xo7Pcw5jk8P/yU57NUNHlboU/aoSRA5SVAvdSaCBA4lEJvyq8l/i+ta7YsX4LA==
X-Gm-Gg: AZuq6aJlExGOKGfL+YE1LCQ3cZw6Co/ImD7KeLkaNtDoxlVE5K/g7+p17DOQAhQijWN
	GeHlVThIy1sO65pbcuGFvtCqfqRqJwUmgMJX4xGNqm8GgPo0/0Z7lP9MVOee+tRrc+ZC+KQpA4l
	w9RNturxWGggDU/05gqoow7EvdNGow5NAow5JmFrhRnfWHG69bk94b70H7D5BpWqOUKqJ2t9sok
	Kb1vgkuKgQnCjkj55+yo9+tRVdj/OenmWOe8sb2zkJeHkEoOd/lVZKh4FNyiBfR08bpRhy6cKLe
	dSw+7TbxaesH69hSKUECbN699GIxE2NMmCc+ZzY5bdeTvRWVUPWTtqLXRI4EbOpNkn7uUJJ7JTT
	DAy9fKIeFlEt4DAlZnMRG3VThqfTH/pnOkzG4x0zSs9QOPkaIvEqQWRXzkH2bLAmKK2gZrKKO8/
	Cm3K44bHjPhOROlmeRDOpGO+jc+O84q+aOvxegan8Unan6IqwuOK4kFoHUu3NCHhXNmQ==
X-Received: by 2002:a05:6000:4381:b0:430:f7dc:7e8e with SMTP id ffacd0b85a97d-43629388a44mr4047296f8f.34.1770380966751;
        Fri, 06 Feb 2026 04:29:26 -0800 (PST)
Received: from acert-swift3.. (ip5f5ac382.dynamic.kabel-deutschland.de. [95.90.195.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd1c9sm5163723f8f.15.2026.02.06.04.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:29:26 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [PATCH] scripts/install-buildtools: Update to 5.3.1
Date: Fri,  6 Feb 2026 13:27:27 +0100
Message-ID: <20260206122727.1918018-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230619

Update to the 5.3.1 release of the 5.3 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 93f3e2d678..c3f257ff93 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.3'
-DEFAULT_INSTALLER_VERSION = '5.2.3'
+DEFAULT_RELEASE = 'yocto-5.3.1'
+DEFAULT_INSTALLER_VERSION = '5.3.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


