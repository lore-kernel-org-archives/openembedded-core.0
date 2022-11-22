Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CDCC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 10:21:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.15294.1669112472143136278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 02:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KOl//9qz;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ft34so34606862ejc.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcVaIYgmYBPia6ET7y0gAZKlKu99qLNYlyFp26q/HiA=;
        b=KOl//9qzkifUoq3qi7qMnpV2X8UpdliMYXFwicgsWH/RcLXJjsOgZa/MgVjf+Q1FL8
         +W/5dTL62oUtmQMkGJKjtCKJAwmW+KT+ulS9Chzs295/wVMt75Da8w1540gxP00aeVEy
         054poyOugrcJBj1po/HdMQOtrG/arT0nVgzZPM36mBUbvIZdDrMmZ5dKZ91timijiyqP
         aNhuU9bcuPdaS9BOu0GbmltyKspYMv07oGfMTswcitsbnDvUq8Mw/29eUCDrKLdN9Kj3
         lDZ5CnDb67JdPqa/RinBiumDu2Rui3tcY4xfznno78ssC2E8QlcOTKr2r84nQGoG88yb
         2bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcVaIYgmYBPia6ET7y0gAZKlKu99qLNYlyFp26q/HiA=;
        b=Y0N3OCysnJXGvBllPSDaEqXwGtG2vjMDAil20D7HAl2BY3Aza+JG0Ry18a7IRuNvbU
         1NV5B29gTF8D+x8q3TLEwOjLxvWx5fxL4Qu15hJsWpgLcqXYM2uD1BOQBpNpNa+f0+Eo
         BGZ+CVs8hvcqWPlIWgCnmjY/bmXlfBTlrQkzHhhozWf0Ew25b8f7N4NoBGvz2FparYr4
         ztK5n8G9aO0eL1F04WUp4OpB12fegyDuR3MfH2NttOX8ACGVaTsj/whHxtsUYSdy5iX5
         Woe7JXz2ruwJg/NkqHOAKSujdnes4r1Ee/5ssZg6OCtbFYduOOfbNgsYBx0RDNt89kyP
         dZSQ==
X-Gm-Message-State: ANoB5pm7pKnIPzM1pdhWWjop53JMcwUixLSaVmPNCh+qjWynnE2wkp+j
	4pGLX5FPeLUbzpbXZaOZ+HI9kIANEng=
X-Google-Smtp-Source: AA0mqf4nZBq/1rk/8/uUSTxiW9cuSjI1jFcxBt8TJHjk9khfSlb3AlHnxoxohfdqrIpEhVtF9fTJpQ==
X-Received: by 2002:a17:906:cf85:b0:78d:b66d:749f with SMTP id um5-20020a170906cf8500b0078db66d749fmr18340618ejb.566.1669112470372;
        Tue, 22 Nov 2022 02:21:10 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id eg51-20020a05640228b300b0045b4b67156fsm6232458edb.45.2022.11.22.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:21:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone] libsndfile1: Backport fix for CVE-2021-4156
Date: Tue, 22 Nov 2022 11:21:03 +0100
Message-Id: <20221122102103.141658-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173671

CVE: CVE-2021-4156

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...flac-Fix-improper-buffer-reusing-732.patch | 29 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-flac-Fix-improper-buffer-reusing-732.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-flac-Fix-improper-buffer-reusing-732.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-flac-Fix-improper-buffer-reusing-732.patch
new file mode 100644
index 0000000000..ede696180a
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-flac-Fix-improper-buffer-reusing-732.patch
@@ -0,0 +1,29 @@
+From 9e4e9224c39195bde8ec14d1295944f713adb79a Mon Sep 17 00:00:00 2001
+From: yuan <ssspeed00@gmail.com>
+Date: Tue, 20 Apr 2021 16:16:32 +0800
+Subject: [PATCH] flac: Fix improper buffer reusing (#732)
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/ced91d7b971be6173b604154c39279ce90ad87cc]
+CVE: CVE-2021-4156
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/flac.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/flac.c b/src/flac.c
+index 64d0172e..e3320450 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -948,7 +948,11 @@ flac_read_loop (SF_PRIVATE *psf, unsigned len)
+ 	/* Decode some more. */
+ 	while (pflac->pos < pflac->len)
+ 	{	if (FLAC__stream_decoder_process_single (pflac->fsd) == 0)
++		{	psf_log_printf (psf, "FLAC__stream_decoder_process_single returned false\n") ;
++			/* Current frame is busted, so NULL the pointer. */
++			pflac->frame = NULL ;
+ 			break ;
++			} ;
+ 		state = FLAC__stream_decoder_get_state (pflac->fsd) ;
+ 		if (state >= FLAC__STREAM_DECODER_END_OF_STREAM)
+ 		{	psf_log_printf (psf, "FLAC__stream_decoder_get_state returned %s\n", FLAC__StreamDecoderStateString [state]) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index ea14fe29cb..f6ea585e34 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -10,6 +10,7 @@ LICENSE = "LGPL-2.1-only"
 
 SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
            file://noopus.patch \
+           file://0001-flac-Fix-improper-buffer-reusing-732.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.38.1


