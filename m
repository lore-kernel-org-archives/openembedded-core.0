Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7518C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:48:49 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.13806.1702993721272658569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JPu/tZZ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d87eadc43fso1248632b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702993720; x=1703598520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zre2KRfSLfhnrlH2755rNgQzv6uEmqqGo1zbDIQtZCI=;
        b=JPu/tZZ10EvWxvjeyUyTH5tWZZOsUWsrJu11UG1a4X5CViYQ4KdEqoB2yEqrtYPajq
         VJNkANzANBvuuisM1Q1GXcGfWor9PQu+9C3dEcwEcU7qFsHdlFB5SiA/VohXk+KnNzcL
         SYO+SUDtPJ1XvXu/6/vCvc1oifLP6Mg7wkfS/dufAYi7Q9NpX0ZJSBY0w6eH8PWRiprV
         wWe3Ex5UbSTcHkQL1Uzv45e0BMZ1VipkY4z2W3RE4v5PwM6vOFeucq0EeBkexJHCVetj
         gfpautR6uKslkoyMSmmyBo57+Wcv8qPaYGTLVWUMOI8GnVkVceiW7nLkUOOLJiHcZ2G2
         DsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993720; x=1703598520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zre2KRfSLfhnrlH2755rNgQzv6uEmqqGo1zbDIQtZCI=;
        b=vFxERtw1/1MTsr4RJduZwxvarH56ya/bpb91qitEn9QIYngGjd2kzumEMVOLFdajG/
         b3jKS57qj6r2dkV5yeF1rAoFQ+WVxw9kz9gDroseOSbeK8cgYrUorXu14txw9gSPAaln
         wi6rrEaud9remBQQ9VQTrxO5bfhsaypjASLpdiuLlICM64vRGzF2plwBPKsCPmiNpt/h
         9bqdI7BNwFZ1zKjqGiZ83zD4ZGLQyAgm9eRFwufoPZ8C1SZvsBbDWGL7HCvIFXE8gCaF
         F7eUfw4ZO26czSl3Oc0q+GIcOXRgE2nysZqJ7x3auKVHbD4JdygiYG05sjH7h81HZVJe
         egAQ==
X-Gm-Message-State: AOJu0Yy9n4JwXQm7QtoQS2slFe1nAK2vkOw/1M/fzN+V2tbRTgy4abO/
	Yoz9oHC7HQhL05WX2F/zDGy4nKqNJ7A2qeGAgK33aw==
X-Google-Smtp-Source: AGHT+IEBGEfxaKVtdRrY6SrBKG4pFetWF6Qu1MYgMthILjO+J9C50YRRvIBqKsWn3c+xdELjMrB4JQ==
X-Received: by 2002:a05:6a20:728f:b0:190:a06:ddf1 with SMTP id o15-20020a056a20728f00b001900a06ddf1mr10650110pzk.66.1702993720176;
        Tue, 19 Dec 2023 05:48:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h4-20020a655184000000b0059d6f5196fasm16815398pgq.78.2023.12.19.05.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:48:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] libsndfile: fix CVE-2021-4156 heap out-of-bounds read in src/flac.c in flac_buffer_copy
Date: Tue, 19 Dec 2023 03:48:22 -1000
Message-Id: <d922a288f79834d8f1120a4454b97803290e5c36.1702993573.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702993573.git.steve@sakoman.com>
References: <cover.1702993573.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192736

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://github.com/libsndfile/libsndfile/commit/ced91d7b971be6173b604154c39279ce90ad87cc

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile1/CVE-2021-4156.patch           | 30 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
new file mode 100644
index 0000000000..f7ae82588f
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
@@ -0,0 +1,30 @@
+From ced91d7b971be6173b604154c39279ce90ad87cc Mon Sep 17 00:00:00 2001
+From: yuan <ssspeed00@gmail.com>
+Date: Tue, 20 Apr 2021 16:16:32 +0800
+Subject: [PATCH] flac: Fix improper buffer reusing (#732)
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/ced91d7b971be6173b604154c39279ce90ad87cc]
+CVE: CVE-2021-4156
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/flac.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/flac.c b/src/flac.c
+index 0be82ac..4fa5cfa 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -952,7 +952,11 @@ flac_read_loop (SF_PRIVATE *psf, unsigned len)
+	/* Decode some more. */
+	while (pflac->pos < pflac->len)
+	{	if (FLAC__stream_decoder_process_single (pflac->fsd) == 0)
++		{	psf_log_printf (psf, "FLAC__stream_decoder_process_single returned false\n") ;
++			/* Current frame is busted, so NULL the pointer. */
++			pflac->frame = NULL ;
+			break ;
++			} ;
+		state = FLAC__stream_decoder_get_state (pflac->fsd) ;
+		if (state >= FLAC__STREAM_DECODER_END_OF_STREAM)
+		{	psf_log_printf (psf, "FLAC__stream_decoder_get_state returned %s\n", FLAC__StreamDecoderStateString [state]) ;
+--
+2.40.1
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 32b678ce90..fb7d94ab75 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2021-3246_1.patch \
            file://CVE-2021-3246_2.patch \
            file://CVE-2022-33065.patch \
+           file://CVE-2021-4156.patch \
            "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.34.1


