Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.343.1611586421900470809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f/6HX8U4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id jx18so3356045pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y5PDglzkczrF6srFXcCYSDNNAjfpnUNQKdLrvgdzWLk=;
        b=f/6HX8U4xhfMaJyPpfgFbHYEnRKjebZqeMaEKIwFZFzqGAMC/mE4thXsysJomBD4e2
         jy37qGkwIPnbq9STbeAKrY07knMeXXf4ZlRl2lYaAttClFHlGxxEwv9hz+WUSrvP00Hp
         2F0AkRB2dwYiSmuv96Nsi5knC7zz7gIhM5AvoNopWJ00mFcfDJs7aVceGv/5RhUvgMHE
         JDRBDsiQggEQQRkRqPXetD3UF543mxEEqT55uqPrhfjI7OH+ot6aPIC+JyVe64r1UZvd
         0JuaMledvBf7RLPykyBnuMYgs6eWlylMy5Xx9NiQA8vhLj/zLxx8fjrcTNsRTODnAk5t
         c7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5PDglzkczrF6srFXcCYSDNNAjfpnUNQKdLrvgdzWLk=;
        b=jcjc1pCo0JChxO70R9FtxS2d+B5corDVYDrhSy1cVhrrKRRiJJNZ/m4VGNqd/ihcST
         BXvg5Ud5pT0kC282KXXiLvfYk0yh+veWI86rx5HMgD3W9dc/ojWFAHDuZipK/1qutpBR
         i+bUkPYILz/03AIDoZ8qgvo+gXxs9vsZk9uTYjsO/MNnmnUA6FS/Q26E43W6FO8l0CbU
         y38c0sueVuuQr1qNi3AD/f2eHfRdjGE1mbv7QhelgZjddtn/TTLTxY6OCfUfnqvsOlER
         zcxDv7L0sBUCmfDZzMmfto21e8vH4qxbdULcrse1ttKvcW+j5RdRVG/48VpMJK0ZN3wV
         EmJg==
X-Gm-Message-State: AOAM533M/1zUGNbgYsYGY9Ua5WyxHizidhoA8bLDDEMXeiOx2/LFtcX2
	WPpylm0esb0jtGA/7Q9O9RPSJOI4i2ynyOo9Ago=
X-Google-Smtp-Source: ABdhPJzNxLha3fNQZXuWQgmu5spwB42TfwoJpIsfKRAyCmTqrpWe/65NbPA6qySnF6XqBLnJkXojuw==
X-Received: by 2002:a17:902:e750:b029:de:8c17:fd64 with SMTP id p16-20020a170902e750b02900de8c17fd64mr1033399plf.54.1611586420943;
        Mon, 25 Jan 2021 06:53:40 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 43/47] image_types_wic: Move wic working directory
Date: Mon, 25 Jan 2021 04:51:15 -1000
Message-Id: <e24e5662971a90630c01b4ac338f1cbc1db48160.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d07169499c47fa9dc759e6f81843416a6dc25c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 640603f5fa..f6c8d8995e 100644
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
2.25.1

