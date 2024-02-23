Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7658DC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 00:55:53 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web10.763.1708649746490164053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 16:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeNw4nEr;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4c857f1c18cso82250e0c.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 16:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708649744; x=1709254544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3C5GbW6565wWnLfH8UnV5YL2JPTAqqjYwAQ9r5Hh3o=;
        b=NeNw4nErme0E0321ygB0p/9NRwdJixRj2VnoVYP7DlxFFTv7BQGMtf1jLZiIn5ykrr
         UNgObaMlWENPGKjBy4RwFtGCin5Co35bqJKNNk2YPxUrH+F5ZeWJmvdqk+6nwqUaplVY
         EZ35OqKfXt9YLXwYAAUxOQGJV0ZoPu1AF+5gDpuG/pf0NMeNcPeJmcR4rnEESG06dDhi
         UdfxSxv51TE/VkEu7FVxRtFZMc3VYMHArgj7yIaIlhAGrYQhJhGXRdgJSfUSJ5Mo7qY2
         kMIlFyhg/ycQRvdZ6h+nS+IDIgiSCdHG6HM/SLX6iJ8wpDSoUewve7rLAOmk8SMJP4pa
         uSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708649744; x=1709254544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3C5GbW6565wWnLfH8UnV5YL2JPTAqqjYwAQ9r5Hh3o=;
        b=imBRvHsplKQT3vs0Vwe6wsA2t0lSkvx3iZ/kCU9jfoyo9Fjyg77v8PYXZYXaH2/bYH
         hb08QWUyGM67KJBTVRvPDz2poHNcf+2q9ohNtRoUsxw+/Y1SeRDtFDfl0r0Dsuegdm52
         3SQb/JA7ucA2ZDbP6YntuqTYEyk0Nbn+MB7psLXBsOg4etjII6+Dq6SHQpWRAXnTnSHZ
         dhhbtmM9PzUmG7nrbOubck0wX9cu5zo9JTmgSlc76UaSoGHliTyXutd8lj6iCx+YTSJc
         vAb0yUykYnpt5CjFqtgS959mYUuQrolLXf7k/O0AJPwBswEPzv8miGBI2qgFwwm2HGt1
         VJ6g==
X-Gm-Message-State: AOJu0YxuhJN0e7DYCqM2ozdb32xeH9TFxTHCP3vxAPsGc+52inuT1m4g
	u8O8nboBcc7ON/80ouHBBmRyHNP2DPHwibYNRxxKGYSTQRzd7aItc2XT1Jre
X-Google-Smtp-Source: AGHT+IEDyLEU9ggg7Hp4Asr6RjGF+/zUzsITAW0v1gkd7wxBtxWXYmHOjFlcO9hRgutf+RrUSTRcUw==
X-Received: by 2002:a1f:eb03:0:b0:4c8:5c3b:d476 with SMTP id j3-20020a1feb03000000b004c85c3bd476mr795321vkh.6.1708649744255;
        Thu, 22 Feb 2024 16:55:44 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c8-20020ac86608000000b0042c630aa70bsm5895934qtp.61.2024.02.22.16.55.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 16:55:43 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: allow imager-specific filename extensions
Date: Thu, 22 Feb 2024 19:55:27 -0500
Message-ID: <20240223005527.21577-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.43.0.76.g1a87c842ece3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 00:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196046

Currently there is only one defined imager as part of oe-core's wic
implementation: 'direct'. However, having a highly plugin-based design,
wic allows users to define their own imagers (and sources).

Therefore don't hard-code the filename extension of the imager output to
be 'direct' (i.e. the default imager). Allow the extension to follow the
name of the imager being used.

A user can specify a custom imager via the WIC_CREATE_EXTRA_ARGS variable.
If the user does not specify an imager, then 'direct' is assumed.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 00620fdc9d1f..ce7125f6f18f 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -71,7 +71,24 @@ IMAGE_CMD:wic () {
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
 	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
-	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out.wic"
+
+	# look to see if the user specifies a custom imager
+	IMAGER=direct
+	eval set -- "${WIC_CREATE_EXTRA_ARGS} --"
+	while [ 1 ]; do
+		case "$1" in
+			--imager|-i)
+				shift
+				IMAGER=$1
+				;;
+			--)
+				shift
+				break
+				;;
+		esac
+		shift
+	done
+	mv "$build_wic/$(basename "${wks%.wks}")"*.${IMAGER} "$out.wic"
 }
 IMAGE_CMD:wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
 do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
-- 
2.43.0.76.g1a87c842ece3


