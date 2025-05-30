Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D57C5B559
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:25:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.4125.1748604334507521708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JpBQK72K;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5532a30ac45so2001223e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748604333; x=1749209133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26MNH3WGFPbjEpSznGaRaSeWRRgk7ILmF5ACGqf2lOk=;
        b=JpBQK72KBnbdbpZuV1RHowAFv2S0pDSzWN3xynsISWLW6LTBilmUnUNiLtvk1Z2MG0
         5z4mHWmL8iG7p9hRxEToFt8bRqcIBKsUN85FzjeoXnBikUBgwe3K9+oPAVD6fZHdb+4j
         nzhL3nMj+QcSzAgxp8gjM5mJyI5xtEBnhKcFIYh+EWmgZGr6qpAfmedN4jwCH41WVaW5
         7+YeB7nhon1G+Ocd2L2VHzNktzFrIpgQrVgqIsiB4MEWHj/ea6D34uFTzmatvLlmu2Wy
         BzHn6g6EpAFsEu71tct2b+Koi3vXB9v5tKwTfNNKFjZ2eE2rpNEsfo4AQU6s8O3hzQE4
         VVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604333; x=1749209133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26MNH3WGFPbjEpSznGaRaSeWRRgk7ILmF5ACGqf2lOk=;
        b=NFC/0e7tsIWj5KxeKZMTLriFy00uhTSQm4j+fs89V9cHiP20xofD2fQrqFxYEjLETF
         Zvi8JPKZCrEo1PFXP2S+cs7gqyjrg1mNcYfORaa6xh1z8kdF+ve7g1gRzBZvAoWWdcQQ
         k2TExjijvHE4J582mDNIRsh0umdHPfO+FMECuvtK4ovOYmiymOrVZ8ExIR854Il6XjWj
         k37dLiNiGhSZqTxoSL+kFEWVHHRcOTu7dfivaT+RcXrnR9smZSkKuR6H/gjUT3KzyP/o
         Hl4SJDbyRyHkq8Y8g3SM05C7ZHB/WwuNHk8f5cooskbFcqH30yLRcDmZ/+mPCwqbx6Mc
         E13g==
X-Gm-Message-State: AOJu0YxEJzRZPbDydUOb42/inkoQEQGk9Eh7KTqjyDagjHUYqIBI+VDL
	4DdWG9QqxifREbzJH8N3A45hYUeqbKZe2J1RLKS38ixcA3PEDtPsF5GYUl3Olo1/um6GwCXF7ch
	i94p47a8=
X-Gm-Gg: ASbGnctJnMTGQs1HHbDLPtrWYF5YdSncf5h5/gdHYx6qUWmfX5ejspJnIdbFgTyeQde
	hBteoEqKxKx45sbqqU5RktidrQOkfoP4N34oro3g/Jz6WsY67F5cWc/cXa0H30A+2+ahXwl9abM
	8HR3nM6KrJULYIw9RNLFRrCZwzvSyfqT7ml0GqH3N5nRXp9d0JoM2r6HYp512+6q9g3zhkLRpux
	qrKs7QRMxnVU7ZeU5oJkRudazlPeGuBez5WLzV0Ub74slgpy3mS5L4QRVzCvwuZYMYn1BTptGUi
	hC3LtbST+Kzpr9k7m0pzFUeWSypo/bvX+lgUhULKPGbEQ+FVYvIFyh5AWTRW6IUk2t6wP3GSGo7
	XnFLvlJrvxw8oU33TVsUal4XEUblnwccGFW2pLzs=
X-Google-Smtp-Source: AGHT+IEf5y8V8Reyo8rCMN+C3VvdLirwihBGvDLqAr4QpAu4hWpnK4avfrigCWQhE77ol8BNmnHrBQ==
X-Received: by 2002:a05:6512:31cd:b0:553:29cc:c49c with SMTP id 2adb3069b0e04-5533ba45922mr965733e87.7.1748604332584;
        Fri, 30 May 2025 04:25:32 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d35dsm667377e87.46.2025.05.30.04.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:25:32 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 4/5] image_types_wic.bbclass: capture verbose wic output by default
Date: Fri, 30 May 2025 14:24:58 +0300
Message-ID: <20250530112459.776330-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530112459.776330-1-mikko.rapeli@linaro.org>
References: <20250530112459.776330-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217495

Call wic with --debug to capture logs from wic internals
so that it's clear which partitions get created and which
files get copied where. wic plugins contain for example
race conditions which don't install files at all and thus
images fail to boot and it's not possible to debug these without
something in wic task logs.

As an example core-image-initramfs-boot do_image_wic
log is now 576 lines which is not excessive but very
important when debugging problems, especially race
conditions which are only hit in some builds in CI.

With all issues I have to deal within wic, I always
need to apply this change before I get to see any
details what wic and its plugins are doing. Thus I
strongly believe this verbose outuput should be the
default.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v6: no changes but this change helped to resolve issues in v5 series

v5: no changes, v4 caused pseudo aborts on autobuilder
    but these are likely fixed now after path inclusion list changes

v4: https://lists.openembedded.org/g/openembedded-core/message/215221

v3: https://lists.openembedded.org/g/openembedded-core/message/214360

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index a64beda95e5f..7c6a6f2e2307 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 
 	# look to see if the user specifies a custom imager
 	IMAGER=direct
-- 
2.43.0


