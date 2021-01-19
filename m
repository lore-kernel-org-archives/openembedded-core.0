Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.13635.1611073580199265661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 08:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SO1osn4D;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id v15so16683128wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 08:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mvoEAv5G93J06x7ebcGwCRqMVDCYtVtCop9Muf37Q6k=;
        b=SO1osn4DRk+E63CZE2tKfLF6uAXdROT2z0qbXIojnkRWWoxaGSP7tYFzK3hWnSoYZV
         XLY5sVqLsh7gtU2rIThNxczypoG9cnByt/x39KeSzvl/5jFaWB76wdz4+iqdGUo98opd
         LyyYNCF3roGgW/4bLpg9Hp1VCADbRmkTL0ovE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mvoEAv5G93J06x7ebcGwCRqMVDCYtVtCop9Muf37Q6k=;
        b=PfsPQZLmX8x8YJPllzUUS8IOQohMsuhczbTo+EFwD80pBIvUN2jxfWDEbqEqUoAtbw
         zciK0m2n9hVPbFgvMQc5jOD9hcXW1S7mwYclhE6vyvd+1nefTh1lCbGKqHj2vcbLE4vA
         fomQnrqP9IVpbsN/AGtyWNrRr01MsgONxTQJiRS35iOsf84j/6KsPK1aia5qLSlydTzq
         JShS2eKBllYdEyzsl8TYMZ4tGooXvnbeN5z9a0XR2cZoLWcm6X0jV7JiKfy/ZZhSDjDC
         qHF9ZUkG1Cw9hl4hpx/x2tk8BUYXNsJQ06W0r0/wv7F5aL8HasH3yD+BLEyq78UWeAJ2
         +g/A==
X-Gm-Message-State: AOAM532538Bt5eSXI6CRAkyYYtuLBXPoJNYAludZKHs5DwkI4+929qhU
	kB5QNuZI36e16eOPmq3ytLJm0Wv+zmeBDw==
X-Google-Smtp-Source: ABdhPJxw6nRFCtJdy7plWVvLeb3PMYaDzCgL0jraCbva4T0Rr8rGSQ4Zt9qCbFZiqq5vYTo3aAV9Qw==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr5346165wrt.404.1611073578534;
        Tue, 19 Jan 2021 08:26:18 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id d85sm9223754wmd.2.2021.01.19.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 08:26:17 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 2/5] image_types_wic: Move wic working directory
Date: Tue, 19 Jan 2021 16:26:07 +0000
Message-Id: <20210119162610.13104-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119162610.13104-1-pbarker@konsulko.com>
References: <20210119162610.13104-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default the wic working directory is placed under the output
directory. When invoking wic under bitbake, the wic output directory is
added to PSEUDO_PATHS_IGNORE to avoid issues with files being removed
from outside a pseudo environment (see oe-core commit ad8f5532ff).

However, wic will copy the rootfs directory into its working directory
if it needs to add or remove content before creating a filesystem image.
This copy of the rootfs directory must be tracked by pseudo in order to
keep the permissions correct in the resulting image. So we can't have
the wic working directory under a path in PSEUDO_PATHS_IGNORE unless
we like broken permissions.

To fix this the new '-w' argument to wic is used to move the working
directory away from the output directory.

Note that wic deletes the temporary working directory automatically
when it finishes creating an image so users won't normally see the
'tmp-wic' directory under WORKDIR.

Fixes [Yocto #14129]

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/image_types_wic.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 000ee4249f..49be1da77a 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -29,11 +29,17 @@ WIC_CREATE_EXTRA_ARGS ?= ""
 IMAGE_CMD_wic () {
 	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
 	build_wic="${WORKDIR}/build-wic"
+	tmp_wic="${WORKDIR}/tmp-wic"
 	wks="${WKS_FULL_PATH}"
+	if [ -e "$tmp_wic" ]; then
+		# Ensure we don't have any junk leftover from a previously interrupted
+		# do_image_wic execution
+		rm -rf "$tmp_wic"
+	fi
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
-- 
2.26.2

