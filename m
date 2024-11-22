Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B835BD75E2D
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:48:25 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.22114.1732276101934146015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPfQDTqY;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so327992066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 03:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732276100; x=1732880900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7NtQTco07syEGjGsctd12Mk2ZjpNfB3RH/k9nlQFWc=;
        b=fPfQDTqYJkCfVh0m7fC64fUWYYMOnSDUi3vTs25uexQEixcpdwBPoP6kp/cWS6yf+N
         0v2PRicPWO2dLb4wkkH0qH8ZFzfIS3ln987CGS9jtIS9FODNQi645GcCQWughm8Ii6wK
         2ORkL4YoC4pB2tlq+w6eEYt5BWkHEyGWedoBjpTNfTEn/BxkNsjtDsFqGpn6DM6lZe2f
         COce3TLBuLor0ibBqle3XPCwXlWyoAAmmHFxNpDS8D53mp1DFIjztFg9aAPBBWKrZWmz
         6GYB8XWmFnH2/hP8HPZS/BFDh/EW0Do1HrDxZLJSYwn7qK3CSRHYr449k9T57gaRRsJt
         jTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732276100; x=1732880900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7NtQTco07syEGjGsctd12Mk2ZjpNfB3RH/k9nlQFWc=;
        b=T5GA9qgOx7SRYz1h32Fo5sJi5hXxBD20bVEzQ2dQwlpAbEqmwmkbOmoB5LFnBx3Vf2
         B6QW+xSRT+Gwa+vSS24sMLUFNzPMuLKUhHzeNSxauDZ1nGvtfLRRBO7HDaxWhc8CVVpa
         Jk9ig8aQu/Um5mQ3kakUFXZ90E8yvDAfJho+ES74occDgLtjzGXE/tzsDKoiDuyHwHZA
         3tjNqZC8bXzuiCm4XhcYYOcktLgn6UE7MxglDZz0DTr5BkEG06T0szg7vs3zYTgNEjC1
         US0iyGr6h33TgZ9QKHzlTQz4LueqBHerth1Z0tCehqnntrVbZLO5oJ0fPr6c4WhnK+aY
         nnsg==
X-Gm-Message-State: AOJu0YxJ0ezzIcO0ouGgnGAT3FuIJ2lpeAu+GKk3XEsVxPSfoXloKDQI
	3R2ki4BEM4M55Z2vTVHNrsI34r+w55xHGRUaPhcHcxlRV9pjR+MUDHyV4w==
X-Gm-Gg: ASbGncsBEY5kWFf3waq+x1eeO8DJz7jr6Q2Y5G2t1R3EA3Q1buz+o+8wNoWZ40wQI3b
	sEeEKOf8yofXV8pLdTDAh7Id2ocKb82g/ad/l/759iihVypl7td6zxF0v49oRzmGdmLs9OPNvXn
	62LkaRDRUZK7iWBCIgn9Uao4JdEl7OJ96lQulEsKvSLv8abxuqSC7bPUBERr6gkCtHBWLnk1jt5
	urlqNUy8plTQgHR7hx8xlA2vLuojGtFovS9JDgGXjYmiRSF
X-Google-Smtp-Source: AGHT+IEpTZ+Hpg/ZoBDm0Z+6GJGJpThrfL21jzpnGwnmAJAbASlTwNG1vd+oPqyb0umjverw3zpmoA==
X-Received: by 2002:a17:906:2192:b0:aa5:1a39:943e with SMTP id a640c23a62f3a-aa51a399a68mr105402866b.14.1732276099918;
        Fri, 22 Nov 2024 03:48:19 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:640:1648:6dc:bcdc:d29d:d478])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28fe55sm89068966b.4.2024.11.22.03.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:48:19 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.22
Date: Fri, 22 Nov 2024 12:48:17 +0100
Message-ID: <20241122114817.71668-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207606

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.22 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 9054eb5f36..616330dfdc 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.21'
-DEFAULT_INSTALLER_VERSION = '4.0.21'
+DEFAULT_RELEASE = 'yocto-4.0.22'
+DEFAULT_INSTALLER_VERSION = '4.0.22'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


