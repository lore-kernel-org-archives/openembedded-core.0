Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F58C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 11:26:07 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.19811.1702553163257785149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 03:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q2BnJ9BE;
 spf=pass (domain: mvista.com, ip: 209.85.161.49, mailfrom: vkumbhar@mvista.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-590a2a963baso3752207eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702553161; x=1703157961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhmaNPHMplzoQNInp81qE5K+ZUzeBU5B+JJBSe9Ddl8=;
        b=Q2BnJ9BEi4g6ATuvQCnuE2xy/cjvnJkXMykm2ubylJpjCkMR2mo8f7rGb56ojMcwQL
         aGG3YbHlEmQsF809WXz5fZ4EMXJ2Q4oxfi1SFzCn/CFdVEyEqKmcHTl3kkW5PTKeOEzo
         7C0h7RxxcKy81aBMQ9hucmW5QoQFOFSsrNVNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702553161; x=1703157961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhmaNPHMplzoQNInp81qE5K+ZUzeBU5B+JJBSe9Ddl8=;
        b=LxK7uUomwdCr6a7U30CvVBQwZABYmBTxo2WkArTAmTOmRDTtfvBcjlc6GnG6DU8EIu
         B91efVYNBYA7ML50RtkKiR4J0wBkwapmCvGDnWJ6AFCyZJyOG4nTldjvCxRHq+nCheta
         xURGSvOinYcwrHms80RF5lBWaoH9ebYjaim7xrWApkasVp/q0ug4H5kyE3h1rFRJbZZZ
         SX1McXy4NrIAyHLNPkCrls3bbEKf9/tJyqmcqCLXO2WDBp6vs/AunHBBX3ra/3KrBgsr
         taj+YGThyVmvbwCgWGb1XE3aDfFr8szCd4pWbSJu8vmmtL9n8anIBCo8V3efq75vdzeO
         1lYw==
X-Gm-Message-State: AOJu0YzXwGYFlF/HgNCWXFeVEfkLnbnZKCln6+TKL2MlA0LUIvIatCGq
	g31U1CdMrvMpIk/boaFtFDhyE8dTEt2DHKalF4U=
X-Google-Smtp-Source: AGHT+IESIaUhE2TGT+RwkAJBLW+37kmqHuUyjwOJ8lFJs1eq2tOFy94xsMghvouSVzo4M4ABQpWZ6Q==
X-Received: by 2002:a05:6359:2d02:b0:16e:29eb:98c8 with SMTP id rl2-20020a0563592d0200b0016e29eb98c8mr4834821rwb.30.1702553161411;
        Thu, 14 Dec 2023 03:26:01 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.74.133.107])
        by smtp.gmail.com with ESMTPSA id w23-20020a170902a71700b001d0c418174fsm6435780plq.117.2023.12.14.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:26:00 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] libsndfile: fix CVE-2021-4156 heap out-of-bounds read in src/flac.c in flac_buffer_copy
Date: Thu, 14 Dec 2023 16:55:42 +0530
Message-Id: <20231214112542.165571-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192353

Upstream-Status: Backport from https://github.com/libsndfile/libsndfile/commit/ced91d7b971be6173b604154c39279ce90ad87cc

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.40.1


