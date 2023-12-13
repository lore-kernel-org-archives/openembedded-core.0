Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43977C41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:30:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.47320.1702499423037257817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Z+BUKg30;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c2a444311so71294245e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702499421; x=1703104221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfiVc2MKaS5cW844ETfhIGlWvofp8nKVnvJPp3prqEU=;
        b=Z+BUKg30Zcx3eznQN5v2lZ5F1UN3Cn8bqt2bHjMeUPnN3AFBtyDbMc8QBjw4pfdGDk
         gTME9G9P4ZYcrt0u9UAJ9gZwDIPMvfHgas2Zk9UWF7zKrUcDP8eto6skFL5GTGySn8RU
         mA8YA67zHaw2EqffwMPUmpq+AgXeRpJWyRRqUFtBsdpKZBwYBmaXh5GG4cYJzfmbVdky
         2yy+wuAv6hWLRVGGRRFcXcxzJt5oJukZafATI4kxF7IX2QMv68jsKwgLYpa6fZwJLB6e
         dxPor5Qu7Xb9ITo5OE8IaUMVEqytUoI6oJui7ePQ5VfPqgP3DCflB0dyMM9KOMmix/Bx
         g67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499421; x=1703104221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfiVc2MKaS5cW844ETfhIGlWvofp8nKVnvJPp3prqEU=;
        b=Ex+JI6A1PwFo9euSe8WNrI14cS2garfWz9EsKpFN0JRGSU6n2CzzCK0veiaEARz7dd
         +WqB1opSBATfvv+8a6xj9Q28a91bKvcfDy2Qc4vXtt7IBbSt9ZnEi7qb9J88ifxncFVq
         zhEcl9sGpisC0I5i9KX97k8pIPO6uv1lvobyFp3xorxRxH9ohXDihOWpc4w/56c/fHB9
         uEo4uOoB5TAzRGYkW59Cn2ddICZtO/QleEv0ZSpywNYLMFiZkiYURS90Kqcku54YkSZK
         X/kfMCrhqYycN0zZDqIvyQvECHZAk6DB/7WBMcW/ZX59pe0jG4MtCflmZ+bxlVZ6xH0y
         HRgA==
X-Gm-Message-State: AOJu0YyumTiEz63xQdtZc+/9ewpO3gSQjtLZ/ySwtrC+vtekkd5pzK1y
	7xJhQON+UoGGzYz00671x6k7EHx/AfksMWySyrO/uw==
X-Google-Smtp-Source: AGHT+IFe07HuaXA+6hsiedXrnmH0fvS6F+uAyzHOpyD5AW3NnU0+AnOMDzdm5h8nP4lQDXhZVDmy0Q==
X-Received: by 2002:a05:600c:44e:b0:40b:5e22:2e0 with SMTP id s14-20020a05600c044e00b0040b5e2202e0mr2254879wmb.76.1702499421268;
        Wed, 13 Dec 2023 12:30:21 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d444a000000b00336371fafe6sm2945312wrr.16.2023.12.13.12.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:30:20 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCHv2 2/4] python3-qemu-qmp: Add recipe
Date: Wed, 13 Dec 2023 20:30:13 +0000
Message-Id: <e7c107503fb1a3cb60b8f91b1150099f8377ca86.1702499299.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702499299.git.pidge@baylibre.com>
References: <cover.1702499299.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192314

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


