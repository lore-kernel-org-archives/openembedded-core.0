Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57955C352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.91876.1669557332859051283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Pbc7wzb7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so11595858pjh.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzoNvTyrWf7STFig1Bfwi8Xp+6V39KCXh/fo2cOjHBg=;
        b=Pbc7wzb7/gp4eDAi+EemExG6Mgc/6SLgcAr6OWZ4BwliOsRn4rB1VEh0rZYFptPaMt
         smyHzH1igdml2NnVe9JzITlB9H2rmU+UUPaBjodUbqWilQAJKfOf28JftJuHkelBqdTw
         o4vl0YG1oMHUoeb246OaGtMBaXujNAMQfjg39MYTpTVbR2kjS1FKjTkbsHesa4UWDCA3
         NmOoVcfjqc/hZBFi26lbv2aNvs/gKqC8RTr9vQXUQFsYzG7EZQaZKY21tCrs0bm5mRTI
         McD7k8Gfvnm4KnyRBMqjTpwkHJdGPozc1sO+dQ8E2iIvHogl7YSMBlRiHqo9/IwNxxN7
         ncuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzoNvTyrWf7STFig1Bfwi8Xp+6V39KCXh/fo2cOjHBg=;
        b=Zy2y7TNPkivkOF/4QmMwSoX6QgNZOSwf/4+BiXZRG0pInfyMGNSj17F8JAufu1fwCa
         k64WB+Yc4AoMJacxAPM+zyalgQ2BBow/DY/0jOyu1Sam85jzijXm4G4wpkMi2sUcac5r
         ZxkrRXcoBu6tzTBOLt3N+3boXRUybyzkzVUfB8e4iqPfN+gHAEEXAbedAtS+4tR92gh9
         7xumdrIMsHNesYz8py8D20RMCLLhi0GiELFAchdYfffmyHPJmfFDU6bu9jXSgMS5nVe5
         5gWfJYmOIWFhZilftAa3T5K5Pr8qKJA9l4BmCnJrqNxXUhS58H7CkgWUuZg9/1bxaWbu
         4gSw==
X-Gm-Message-State: ANoB5pm7duhpEK4/w8OCqGDmnbef8hiYAcKnyy/Y+tLuvKqEwNOWZnXX
	BIQRYREOFMGl8tyaQCrY2aHvE+ThlVpe1Eg8rQw=
X-Google-Smtp-Source: AA0mqf6z9lZibf10yHA05heVCXiMX7Gm/1Ih35d0SjCMlhVPeCqJfjxrbFyXDkmBIEtlv7ZdMX/sBA==
X-Received: by 2002:a17:902:cf0e:b0:186:6723:9217 with SMTP id i14-20020a170902cf0e00b0018667239217mr27578443plg.160.1669557331714;
        Sun, 27 Nov 2022 05:55:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/31] libsndfile1: Backport fix for CVE-2021-4156
Date: Sun, 27 Nov 2022 03:54:47 -1000
Message-Id: <174e79299d815f0a7dbef0668dc488ce10e89d3d.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173846

From: Martin Jansa <martin.jansa@gmail.com>

CVE: CVE-2021-4156

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


