Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83FCC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 12:57:07 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.14919.1748437020023120543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 05:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CGRgwYGY;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5532f6d184eso849332e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748437018; x=1749041818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FYh4leX8hSau2NnHS5n1H8sJG9v8V7x1HeJcwS+q+c=;
        b=CGRgwYGYgE5E1oPRb3SI8adNOidRYYd0L0JBUfuiiZNnVfipt+4Jgn6yWu3pbmQuOd
         pvyjh7RwklLMvsm+SHP+7mwgejlsaoe8Q60Z3CHbOVnBvIzJpQmSG9ydPK1Cw1jkLO9S
         B9OfIrNQ1Nru0msl8DqFzLtpWoH4ur8aKabDEkA9nfO2bZssvBEAFKibfY5saWqHxwPm
         HapnR0Ry3A5NN7toW6vp0wVYG28O/HZk6AlIytqtmALb+jIx2X+gDaoxstrTDLaHw5xd
         hJdC4Odj9m3/tjzqjWa8XMyanWYw0VYk6t63ONwlyqOj80vNPPdY9RcQxPdRvj2v2jlE
         5lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437018; x=1749041818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FYh4leX8hSau2NnHS5n1H8sJG9v8V7x1HeJcwS+q+c=;
        b=POqj2qdaJPIeRy71+bef2JB8mi8E76RGxeIjGX8E2N54YZXonZcbAZwvxDxj9Yir2q
         KWh4/iYT0tOdIb+N9/p+xgzjjup8ceMEtScmQHt+hJ/1Oabmd5HkZAAls9FdFzbFlX5T
         itsiqXujYtifFfPBzCpfdonIZLb97e5O8bVEYMn2SdXpF7GXTJ0eKT1nNUz+JUJEoaAF
         +ti+iSbMecT9E4ZMzkWDRlR3RSmvZYV2xkhX7eJlJF751dXVAlFq4ki/9WeKfX3tR9Qh
         4EZR0xVuqt39S3TcnD+Ya/2U5WiFPA1dJ74O/jBKPSMnu7dfBs8zGJ1vUGUgYXboLbDg
         oCJg==
X-Gm-Message-State: AOJu0Yye1wtSm3B/rDrY1q5dD3b9tWddK84Yxt/a/I0HxoWjb8/rIjhw
	7nzdrDbkjRrGRwhxajr+ZKDlElO7ki0PpmRLOQvzTh4W/51bWm03vFhdCoJFp+Up1AckI2q/Ccy
	tZfPnwNo=
X-Gm-Gg: ASbGnctJhTSJzceE3u325xZsYULLTo9OTw2xDATS06Ukz27oBI1AAklvc0+gWfMle+D
	G9GYzwXV/BxzYc+4NbrXy3H97XEZtWvJNVi1G6bgLrYdRzNKPxr6XNzUkye1KmXxQ5skWBUe8g/
	SNz8dj1f3h5nKps2WqM4HfqY9qNY5PBrW3db9t4Z3G516aYJ4yugp8RZq44NdOzN8UEXzZQQi7T
	eqY4ccbaqiureUfPe1dFWrerFbzzySCbC5vYWm2Ncyu59KnupxtjAf1kIFHnay50w63jPxO6lHl
	2JxzYuY06/B9QlGc4BvlOMwRn60cauqlvRywGA/G91DnWRf5Naum2eCgTFHSE1WzLXpaLAbpHAa
	mZaOR9aLCdNQktGfJAR90N1nGCU0p
X-Google-Smtp-Source: AGHT+IFsYkbZz2I5WaT87066hEeEUXP6xO8/j7nC30EwhS4gPB16JWlk0eigv3SMjpUJZK+SStQZMg==
X-Received: by 2002:a05:6512:4152:b0:553:23bf:bb26 with SMTP id 2adb3069b0e04-55323bfbca0mr2423033e87.11.1748437018091;
        Wed, 28 May 2025 05:56:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a504sm267869e87.146.2025.05.28.05.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:56:57 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 4/4] image_types_wic.bbclass: capture verbose wic output by default
Date: Wed, 28 May 2025 15:56:35 +0300
Message-ID: <20250528125635.684302-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528125635.684302-1-mikko.rapeli@linaro.org>
References: <20250528125635.684302-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217347

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

v5: no changes, v4 caused pseudo aborts on autobuilder
    but these are likely fixed now after path inclusion list changes

v4: https://lists.openembedded.org/g/openembedded-core/message/215221

v3: https://lists.openembedded.org/g/openembedded-core/message/214360

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index a64beda95e..7c6a6f2e23 100644
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


