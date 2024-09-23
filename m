Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA6ACF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:42:22 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.32876.1727084539690984717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzgdGGA6;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so6025842a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727084538; x=1727689338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//H4CTEfM/4w4tuKBZrtIbT0IlmeFpzW46auVEvOYkI=;
        b=fzgdGGA6FuqhebU/6vosDBrGKOVilRvlmNGY+PjSBxV429UQrfwrs0/xcI+crbcl2K
         47zZ9+JhcL1q9yic+QbGU+MZDeALB/nUXpX/V4AXzY/BqsgNqLTA3M3K18UCMnFVU7bq
         DGROGlAyw8w4HEMakh+huRTUQgVNT2rW1sIEl2ZSxmbWIww+2a5UHPJq3YublEYaD4R4
         6vhHiqzg/WE7PPss+yzYPQVlLZSs6GYyrbtCh12rAyFm6dRcIAL1z+C4laBJKki5l0em
         vBs4uquyQ6ML2WbyPYKqFbnjjyQhIqUIC69+XXwDGpk/tsHJjknSRB7H4mMG90Eo4i1L
         SV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727084538; x=1727689338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//H4CTEfM/4w4tuKBZrtIbT0IlmeFpzW46auVEvOYkI=;
        b=Lu1xGAYO2GIM0XkCS2nvaXmbDRTU1lNNzx07je9/7IFVuUkjcUMoFDCiOTtjqUOgmT
         1zjONbTIIZGZETGzVmbiYVPc2RV3S+FmRJjHwhCDfiieia3wCCX1zt4lGcfcbyyueRbQ
         YRHRFXMMCh1YjcFSrpKkSN0l5SS991XBeSHzn4KVsTio2+5aCccmp7CF454q6QyUupHu
         GtRoiX+ON9suHqeK5tmz5V8CUP4sQrZApjNdKNi7vnqO4HJKNRn5YByCw3i6Q3jcQz5a
         cs2YOIsvTAKaE1+kTMy1H/duNzfq9yiSXk3P3+7ch1xXB6C/DuloeqA4t1CK8nNwrBFi
         InWw==
X-Gm-Message-State: AOJu0YxN85SailZglqpYhWyP8SEJqDfc3bn8/Lg2/O/NDIb4W/Xjc/be
	ChwHID4HGBl79pyzM4smXXzv/g/DuTgosvXovn8UqooxOP0uD1aisFy/WWfHR2M=
X-Google-Smtp-Source: AGHT+IHxHpOigMQ4kEdH4dAGHKaaVS5mV0MYIs3IRQ2aBiZFrwTFPwKpQ3agCLDrELa9uqDTW/hv0Q==
X-Received: by 2002:a17:906:99c5:b0:a8a:8a31:c481 with SMTP id a640c23a62f3a-a90d5127752mr1152479566b.42.1727084537960;
        Mon, 23 Sep 2024 02:42:17 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3877sm1183903066b.112.2024.09.23.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:42:17 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH 4/4] scripts/install-buildtools: Update to 5.0.3
Date: Mon, 23 Sep 2024 11:41:59 +0200
Message-Id: <20240923094159.51274-4-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923094159.51274-1-an010@live.com>
References: <20240923094159.51274-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204804

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to the 5.0.3 release of the 5.0 series for buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c922ca720a0c3b7b4d3d3187539e7cf77d93d457)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5b86c13077..92a4c9dfb1 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.1'
-DEFAULT_INSTALLER_VERSION = '5.0.1'
+DEFAULT_RELEASE = 'yocto-5.0.3'
+DEFAULT_INSTALLER_VERSION = '5.0.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


