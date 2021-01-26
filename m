Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.13115.1611672246135843433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ggTGQ3t9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id m6so10535077pfm.6
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y5PDglzkczrF6srFXcCYSDNNAjfpnUNQKdLrvgdzWLk=;
        b=ggTGQ3t905SyS57KkaaZC8xnaY8V9cTojT/jBneKpjtWzl4eDcS6o32VhKbOsWgNI6
         c4lnDPc2V9bq6tY9FVctS+1F3FqtAlu2V47C0TsJZ/IX13R6/qTj56s/f1cELDdv7aal
         xAUmo+v0hqf0r2gnyuHGr/eC/Kdth1Ou9rxuyi0FAYCCD+UQcJO9MAyHhtO7lzmTLoUV
         jj2EqPqy8Nt+pNFy4VkdqXa1Ice4XkfIKTH08Xb1YJuJATXm3COnKiZrxlWnLr1JB7+4
         zefYd5b+A0HHoj/S+2UCa/D+8Cj2zY+V28ZfMsV7HEmbFxTl2IOdGuQhhWwy1q8bQ2R9
         e4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5PDglzkczrF6srFXcCYSDNNAjfpnUNQKdLrvgdzWLk=;
        b=bEBCqfBO7dEVpPRZaur4x2WTKkfdwIPkgoTFL5aUwiNDixErpAm4dYGCoydVRQf97D
         0FumvMnMi3Bxd04p+j4lCpGspzrpcSOUAsifkkhJiC33559V6OUzXePYXVom/xCkdmpR
         w2sa2pJBauEr9F5jiwtY+p40f0S5E1VjrfSM04yAGHKuVQ9KjvY3V1I5pC3IJcSDQ68h
         YPMjKQ5EGRHSjzkMcgEuVSmIFa324VaQNzemyYypJd1I7rSE06kg1k/AH3lb4mynq1K7
         8K8HDUqAtb7F/8kleHKFBYBO0gtjM9b2ALW30D6n9/nln8+jGZFqK2nhjR1hlTFVGuZh
         LASw==
X-Gm-Message-State: AOAM533/fgLWIp8eufjZuBGW61Sdu1S1+iRb9PNE86g1diBrlOhEDg16
	o3LeJN86OWIh45JmixtvD4/rpmOcBE/MEBX0vrk=
X-Google-Smtp-Source: ABdhPJzxZDqkiXd2UUqLtKx1EkQELdxGmJLsivAuxg8xKZzvlaigq6I1gkS9XXCzLBpte6d27K7+aQ==
X-Received: by 2002:a65:6290:: with SMTP id f16mr5947331pgv.69.1611672245134;
        Tue, 26 Jan 2021 06:44:05 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.44.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:44:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 42/46] image_types_wic: Move wic working directory
Date: Tue, 26 Jan 2021 04:41:53 -1000
Message-Id: <4bf6c789556e375e6808e50a236908fb02bed28b.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

