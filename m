Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD4F7F1D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 08:19:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x15so47209738wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=49DGI5iFuD2Vksd4cWbdUJfbCCPBT2SSxQmnHbVDSOA=;
	b=CmlAYvMqUj4z/Zkmh8r27T+r7nqTxICrd0dVxMYW9Xyoxfih/Fk/hsuZZ6De2+tEdc
	wma6NygjesAYmeR4PQ0oao5jxpUdAvVWVpVvDX/HRewJZ8gTIei6vG2LZTc4bR7t/ywe
	kKe1GtOTIPcIIhlsrubGnA+a6dN3QPmHOVGnd0fH0UhZxFj1QGcCCWSD1Yb0SvwglSPg
	hla8BcpjwuJT6xZJpINnmNxPWgAjuznG8xkEy1W4g0kpkhzQE4cnbXes089GW232keiY
	ZnFjtFmFpeJTSGuG1ZBZDGlsgbcPO2Ag39uz16OL1CB54w+ZqlxfnEJmL6vzpZbQ40ul
	akWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=49DGI5iFuD2Vksd4cWbdUJfbCCPBT2SSxQmnHbVDSOA=;
	b=GrGRqI9b0XTj8d+iEZQHBDSUKMf3OmCEwm8TuQUH3gtNMlSHun+d3vreO7No1vd3hr
	SaRw3CmkTz9cfCrcdswShFyL7fPLjMtD/nT2b0nevQj/CT2scupMKm2zkICB2yT90XpA
	k4SXLewP5CNs7ltY5oQsYptmFHntENk/dllzfKnIjy/Zs29wIUj2Vhrn7u8UMMKRiDzt
	avuG/P6bKm0LvqIOVu6wPaYSHC8wF9Mx4UkE6uw64jLO5af2Zu2Te/Suft17Mr7ir4Jo
	44CcHVuP8TO2Aidvs6wQzM5Xztx5p+TNvxiCZoBIGTLyrzunnOSTgM00sfEOIH1Nr+qp
	B3iw==
X-Gm-Message-State: APjAAAUfDzspsHLk/ieotkHliL++rN3LGwzTLL0wKuN1XmxZeDya6Fiq
	E6kWUfm6ria8IYSiSWNR3C0va6BNtFM=
X-Google-Smtp-Source: APXvYqzx+WZbV0+rfI2wp6e234HyjJyRB8DdeGdl01RU7XniBUMUHOwq0AfyCuBWbBpRy/hxJ3XriQ==
X-Received: by 2002:a1c:4c1a:: with SMTP id z26mr82230625wmf.2.1564129158738; 
	Fri, 26 Jul 2019 01:19:18 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it.
	[217.133.17.98]) by smtp.gmail.com with ESMTPSA id
	g19sm94806266wrb.52.2019.07.26.01.19.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 01:19:18 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 10:18:57 +0200
Message-Id: <20190726081857.27834-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] image_types.bbclass: make gzipped images rsyncable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jul 2019 08:19:18 -0000
Content-Transfer-Encoding: 8bit

Both gzip and pigz implement the --rsyncable option, allowing small changes to
images to save a lot of data when they are transferred using rsync. This patch
enables --rsyncable by default.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 617aa4ccd8..2eeffbb366 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -284,7 +284,7 @@ COMPRESSIONTYPES ?= ""
 
 CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_gz = "gzip -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
+CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
-- 
2.21.0


