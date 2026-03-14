Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B2910706F0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 18:02:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14774.1773511320180231332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 11:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aKXwS8Gv;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439afc58ac7so3760643f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773511318; x=1774116118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0Wk57qeLQFX51DpqSq9eIbftnDbh6OUeG2ga4SHVJk=;
        b=aKXwS8GvuhKSiSuKi6nHhPOT0ROmfASC+kYl/IsHnQHx+rBRF2iDtlL4cyOrciIF7z
         aMl/bSIbpFeIXUjweAVqKw8V0b8KXnxpjkwfN3p7l5YfRacUh1BmqEy/pXoN7YOB1bMI
         A/t0EDsyg9/sgmlKaD37x6tw/YwDSzBMmj5S2qyHPOMcwZ0SuT22M05h57jaItKpsnR8
         CDV7qXjGaWDkD8jur/jmR6TLuR9TjelzDQEqhhs9n6cVFQlFOoZmbtXN1TsJ0z65lh52
         yrwMGN3A641e1YUa+B8btyRctuHMmpcli6j3LdflbAAyT1RPVBRiYdSchWXznoUg9H7h
         81iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773511318; x=1774116118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0Wk57qeLQFX51DpqSq9eIbftnDbh6OUeG2ga4SHVJk=;
        b=XNBN5hroTkB0zrGyQn9m6wCwF2z/mWr3eAkeQeaOsRIQxvPGElz67sbdd31hwzNkoF
         UQkdw3RMLxHFuwCZY+4EBGuVMnC0QKnOS2P443A9E3jGmJMYD9hyJAXzaRdaIV50OB4v
         /IbCbEUFhv2KBShyEoNfudZLrSicNYB6o9tY/n+5vzmkfWsM9MZUNl+pDu3smiVCcHio
         PiRcbHDh2FFwUK6oi58c3ijJRUhZ45KIuq1WXpyngdxbjAxhAAiQ2Nxzt+0AvBezf4Rr
         YsVxiA+82u+7qve+RJgN1/ZM1gIhwj2b9ai3eD5woWJS8o2ufJ77QV6h8k4CsnRr+NDK
         9NIw==
X-Gm-Message-State: AOJu0YwMGIcsjuQXsTEDn66Y5kQWpdvvwaiIQiJkO0c8A3x2HTeYqx0N
	+Pl779OPsrRegsZL06vvL8V2ujxgnJB/Enh4Hvs7/+HT/a/jfNxP3kSlf+68lg==
X-Gm-Gg: ATEYQzxi81MqNHtqYXDtHNCxPRy1gQq7ka8KtBs6o9pbA+6Y1WDZO444CDk0NoPiVob
	Eh40+cc9CnxDvSSKj4+nsPxBL9ogwxzIt3YuBJrpWR+fYH13QYzGVaJPiy4nHlccPud+U1fTCM1
	d1Ua0NehtpXaWbCocwnhgnxzHX/kyVmSvJXUayHcCSqwF4hj+Wk8Va4mB3VeCj3s3bLVBONhjUI
	heuxMut/pp9MemifBalEuglUcxURJ3MnguMO2eI/4yJ3Ijfu4uqq8Ync2UsTwHR/o8aiYIJqz1U
	jKApJVWkuWOGva2SMtHRNwnGP2Onpi71GBhIIlXytpZUzOLu596byO/kenovVsca1xi4CpUiMNS
	yQiwsTszPgV90h50qu8fj+hYKrGZk8GId4bKc6zMchZDndQMHiYIClDztvk2HYZUvf4GVYhmUSS
	CG3QyjIRMNU/8qNmmNH6sJj9LiLgg1cPDMlHQZ7FgGpupUC/GOym4T5Wr1Md7JYgouVtLwDi0oG
	aYSr2E=
X-Received: by 2002:a05:600c:c1c8:10b0:485:3a8a:5df5 with SMTP id 5b1f17b1804b1-485566cfcdbmr92508115e9.13.1773511318059;
        Sat, 14 Mar 2026 11:01:58 -0700 (PDT)
Received: from acert-swift3.. (178-221-163-183.dynamic.isp.telekom.rs. [178.221.163.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66e3f8sm285902825e9.14.2026.03.14.11.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:01:56 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [PATCH] scripts/install-buildtools: Update to 5.3.2
Date: Sat, 14 Mar 2026 19:01:50 +0100
Message-ID: <20260314180151.43501-2-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
References: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 18:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233094

Update to the 5.3.2 release of the 5.3 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c3f257ff93..b9c008a2ec 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.1'
-DEFAULT_INSTALLER_VERSION = '5.3.1'
+DEFAULT_RELEASE = 'yocto-5.3.2'
+DEFAULT_INSTALLER_VERSION = '5.3.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


