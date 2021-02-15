Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.32095.1613399881652243322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kPFmUJyQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id o12so6178008ote.12
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IilND4UHrvwqLwg/n+uA0/gRj5taEYyQVDmbgXVmiu8=;
        b=kPFmUJyQbP+KpWf5TCzW7gCa9PLKvgLvPQkbKEjmNPAezTBZV3jJD6Bux6JTipu5av
         uCky6/IRjGWDPm0+3oj3FMQ10E6ZUU8ORgWHDPKnSD2LQbvVyf35Rw14/fhVVR8+izY9
         uDRyv32O5jMiD43bbx1nNCHCqnBL18gvRsqcSC7oxPPG/LtXtdErCsyhnKGPA5eIel/y
         m508ct1KgwD2Chn9pbJQXM5DV+wAPXct0HXqWgtPUcaVWREBOLenBJIvPIm1z0b64LCW
         7qbh91xNRuuLkXatcCT+mlzODT1id58v87TAK0Nk2DbEvFQOXX+e3EDR/sPKvjrH9PyS
         m6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IilND4UHrvwqLwg/n+uA0/gRj5taEYyQVDmbgXVmiu8=;
        b=q8vK/sZlecKpeW4BdwG/bM3ffaDg1BbGBUuxY+yDYmTXLdwvXLI7/a84dZXFkfTxAJ
         xp1HOdoSpAvirITt2wxNJhaoT1ay1odMw3VGMSflawaDy/xkf2XtzA+ljCk4Cr+1+lHZ
         WGmDUbxRAHhBsj6T/BTkVYfixG49n7PHY5guYOThxQMu5dOYzOkODNasvuCxbxCumKpc
         w1wO+5cU7nopdwN+RwcDLOqftjmJUr8ALtneXj+R5aS79iPx1MgfiFLEcgToRXijsSvW
         FpQVwSlm3aQsY48jvLfcNTpaRpn4atwtoWdUc6pEIKWUui6oHbMbNUlmLP89HwLWq95L
         ZAYw==
X-Gm-Message-State: AOAM531kqrAnmc3f8GuA5y7A1IPT8+hNtCnsdS/ElZje7og0/Czag0td
	WL0FJ9ljVDcVwrJ/w1Tl0KdK64UH9041PXNF
X-Google-Smtp-Source: ABdhPJyhDcf/P+rZ8rwnrph+ccADs8g1+9VuKPsLli/CagbiQUq4EgNWKVenJ0Rw0tlAcRX41eSltg==
X-Received: by 2002:a9d:7997:: with SMTP id h23mr11992525otm.296.1613399880510;
        Mon, 15 Feb 2021 06:38:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/17] image_types: Ensure tar archives are reproducible
Date: Mon, 15 Feb 2021 04:37:13 -1000
Message-Id: <6a474f77424bca84cbbb9226d045fbe4c6590b44.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The tar output seems to vary depending on the version of tar used and distro
configuration. Be explict about the output format to avoid this and be
determinstic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c56f3c9febc1732aa1302524c6c4da36f16bd1f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d81747527b..6de16d42b9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -126,7 +126,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.25.1

