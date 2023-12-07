Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896CAC10F05
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:36:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.85711.1701959773155398541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 06:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=vqUAeI//;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-332c46d5988so1039900f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701959771; x=1702564571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfiVc2MKaS5cW844ETfhIGlWvofp8nKVnvJPp3prqEU=;
        b=vqUAeI//eDgr2iXI+Kgbzf9EsRgDDyHLFEamQpYSCynyNzRpBJ1vg3rOvPEEKwIQl0
         6PcR+USR3c1anJc2HLCobjrtAc4rGsNSF9updEaQ2onSReSk4lZ6qbBOFuLM/Wg7dw5V
         PnLRMOAek369fW3wMV9PXfC/pyS9weR9Q9hXq8np9gh72auPsTtNIMy4V95ElCt/soM/
         qTrvb6ygBbQsIOu+pt0COXZ1lOaIqLeLkiBkMwYcsQ5Cov7iN/JAVOM0VPS3QLpwxouT
         26r6Nteo/E424WziEqUhZwZ6QezvXJSPk38q+jFP2RbxEAeqprNFcjMf8sugDBV6wgwN
         BCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959771; x=1702564571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfiVc2MKaS5cW844ETfhIGlWvofp8nKVnvJPp3prqEU=;
        b=ca5qGx4d3ubZW97cR/ZCIViOB+Df9qSfrIdMNrQsr5RymY/V8D64LjJ4l+B5Zz0xB2
         Aoy3YPeV1EbYkSFed3lhukQIcQJsvkgDxhBirllSxHbd1k0HyF/bCiZXNOsokxIKwZS3
         1g/GOB9bS+8I6BKQNtf1TNKucmfzklcWXCSyEXYWvStdx7ZczX74UQGS05lXt0A+LpMI
         QAGp1+4eKmGhONrbXno/dpqCzkszjKHqvzvf+sghU99TYJQItYP6N9wkohORXLlV3yvN
         TEqZERy9MOUPhgGqysu8Yd6g/WJ8oW9WG+EU5SCEuHKzktq+UpT7fNS/pmvfzrlut3jm
         Vouw==
X-Gm-Message-State: AOJu0YzutlbRIauvchOCkKvPzAtInrU3dBdl9Xda25DXVCn2bbcCW7R/
	5K00DAoKGKtZzwO7GEMC9Esbj02s0A+kl5ZI0yD2Tg==
X-Google-Smtp-Source: AGHT+IGNAfonuC8yRVWgijVuwlHTXhgnamMFTtQgIv92WbqqrYr4SEucTfddrIOYd2iS3H6csr8q0w==
X-Received: by 2002:a05:600c:c15:b0:40c:2339:9cca with SMTP id fm21-20020a05600c0c1500b0040c23399ccamr1472442wmb.41.1701959771616;
        Thu, 07 Dec 2023 06:36:11 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040b47c53610sm2072570wmn.14.2023.12.07.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:36:11 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 2/4] python3-qemu-qmp: Add recipe
Date: Thu,  7 Dec 2023 14:36:05 +0000
Message-Id: <25d25aac54efcb8afe5a6d17f70800b57a0d0a21.1701959631.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701959631.git.pidge@baylibre.com>
References: <cover.1701959631.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191960

From: Ross Burton <ross.burton@arm.com>

Add a recipe for python QEMU Monitor Protocol. This will be needed for
qemu screendumps for qemu screendump testing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../python/python3-qemu-qmp_0.0.2.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb

diff --git a/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
new file mode 100644
index 00000000000..faa0cc69738
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "asyncio library for communicating with QEMU Monitor Protocol (QMP) servers"
+LICENSE = "LGPLv2+ & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4cf66a4984120007c9881cc871cf49db \
+                    file://LICENSE_GPL2;md5=441c28d2cf86e15a37fa47e15a72fbac"
+
+SRC_URI[sha256sum] = "c918e9e3ae09abdf70c7ece67637a93ac4583d940bbf48d24ff77987f74f1b8b"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "qemu.qmp"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


