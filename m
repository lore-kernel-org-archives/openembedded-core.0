Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.32276.1610361177599073118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KlT/GCAZ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id a12so15801564wrv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U8+91DSwkD8jL+DFsIUIbjdVLg749Og6DD8nzlHbzmA=;
        b=KlT/GCAZ8917z9zLNsbZCwTQD6B+DjSIu+yO+UGJbzv8vGSDUzvH10x/v0QhSfq5gQ
         8XaI4G+8Cmu4yBDl4+3DnANQOwzMimLptStuQvpgH3n1h70AKgbF8D42eFk3mnC+41+X
         0/lHSDgRABd7OMpMivwgE0JqfJ9CfTRQg6tVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U8+91DSwkD8jL+DFsIUIbjdVLg749Og6DD8nzlHbzmA=;
        b=kxVAcpYFnrqXJM3016ux3mZVng2D4fwlGiGm79qnBhmQCDWrN+Oqulf/AJYjTCgZnH
         fo3KpYgmq4kmrI7gOS+QFYO3evlsQ629ZIviGYBqVFLsCg9MSqfMhAX4HXLJEW94/Jfq
         +wYIh8pNXBKSVdFBLTLIkHOR+VUd6AqwG3nVRRKr5tWcqdr0oan1/VsHhdu3ubA/RqNC
         nD7jzgEM4RAhKgmJNBGVkqw67lFZ1ntfcpbVFkpnd3VCFB1XTqeeAlPtaVXv2JrevKCt
         2F2GiiO1tTwND+bakvC8g5iWlvjS8kK9yTi2UWGOaFIsFYwyWdqkIYLAxIVRBxmR3N21
         k4LQ==
X-Gm-Message-State: AOAM532mPYlXy+nG66d4SP6HWBpxWvD+w/Vu5oU7gnwc9twXwZXOOJ/3
	6+muczFBAlSs+7OQ5xeLv8ofVb3WZguMtQ==
X-Google-Smtp-Source: ABdhPJwmdYr0hLHhuK8QpRqYgR+MtODgG2KUVqbLLWD9GvcSeK7fbllHDIwR3oCej7x+5xcRBtr30Q==
X-Received: by 2002:a5d:400c:: with SMTP id n12mr15723118wrp.218.1610361175953;
        Mon, 11 Jan 2021 02:32:55 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id a13sm23536969wrt.96.2021.01.11.02.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 02:32:55 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 2/6] image_types_wic: Move wic working directory
Date: Mon, 11 Jan 2021 10:32:43 +0000
Message-Id: <20210111103247.11685-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111103247.11685-1-pbarker@konsulko.com>
References: <20210111103247.11685-1-pbarker@konsulko.com>
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
 meta/classes/image_types_wic.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 286e0f5d54..a5ed780ceb 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -29,15 +29,16 @@ WIC_CREATE_EXTRA_ARGS ?= ""
 IMAGE_CMD_wic () {
 	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
 	build_wic="${WORKDIR}/build-wic"
+	tmp_wic="${WORKDIR}/tmp-wic"
 	wks="${WKS_FULL_PATH}"
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
-do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
+do_image_wic[cleandirs] = "${WORKDIR}/build-wic ${WORKDIR}/tmp-wic"
 
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/build-wic"
 
-- 
2.26.2

