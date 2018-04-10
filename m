Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id AED04747F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:35:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b127so26774820wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3LkKfcS5Uy618o32GoM9tozgVZf+7qG65HA/AyXArPU=;
	b=gpusi+cQDE1K5NuwRsdfgJKC57oHPMJZ6zJNDJBxUVHUhkUAz3p1StYySAuduDBXqp
	KicxPPHI8p7gyqqUspRI3OpmCBedaFOmne768yi8luoO5os4Q0vAcyEyUu9Pk6S5HSy4
	i39DruTFhVNw5bCgL84SpKk3I4wdpapPkl4sgS6p6i05gm1APLP0Jx937RAM3UuxSYcG
	E2izgHdSbg42Bj+GbshgHZTDTNXPlpgwJzf92Dq6qQcVnYaBZmNUOgVnpeTSrX0hysFf
	0mF+mYwA5PUfikA3tfniOCkLR1lpswI8UqnIv2DLfukVrd7ObuDk8zxREit2JbAQDz8Y
	0keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3LkKfcS5Uy618o32GoM9tozgVZf+7qG65HA/AyXArPU=;
	b=UJlkWc0AGVtd4zrexse7Pc3NDVZvUsjPrrWffNL3y8SQCYWLKfuE1+vZ0VYKvg67+d
	Wo4E6pMsFeu3ztOq6Zf/6uaUi5x98KF0hNrxqQXkCFBod4D+pndlbKm3v5REcAzH+atZ
	90lvA5B4KtUJmrBU6+L5v9RRIYqPaRCFE9B0s37wlojEzVmbupMtVJO15lcAJ1QteE3o
	h6bXYHgVzVLYXdkssNohlpL3AFQPvOSN3KEJKtwAxZge5gfctLz5KzAAA2ZIapl7G0Ny
	ab35fTBqZAnSg8pZW1u/IhfiPYnqDe+/QDpnqtqyo9exdJpUFT+FMuFCssurrZ4AhcfU
	9QRA==
X-Gm-Message-State: ALQs6tBDjuk2Mq/ErCZNliOv7KFmwoszuUBhShA/pWi/EPPOrws/bnAM
	1HpyxhR1I2p8MoK1r4abtUoKCDMj
X-Google-Smtp-Source: AIpwx49PwWp1mbba58+BY5j0Y2jB12GXEIJI4KeNv/YxiWbONuITcQ0E1iG1DDkDxmsh1+3KuBjdzw==
X-Received: by 10.28.152.6 with SMTP id a6mr1885880wme.119.1523370934882;
	Tue, 10 Apr 2018 07:35:34 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q20sm2409722wmf.39.2018.04.10.07.35.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Apr 2018 07:35:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:35:32 +0100
Message-Id: <20180410143532.31916-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] image_types: use pigz to create .gz files
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
X-List-Received-Date: Tue, 10 Apr 2018 14:35:34 -0000

Since pigz is no longer a drop-in replacement for gzip (oe-core 1624b7b) the
image creation has been using gzip instead of pigz, despite still depending on
pigz-native.  Fix this by invoking pigz explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index e872ae20982..00a00d318f4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -281,7 +281,7 @@ COMPRESSIONTYPES ?= ""
 
 CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_gz = "gzip -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
+CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
-- 
2.11.0


