Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C1AC28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 13:01:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.29511.1743339667092468177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 06:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbW2ytXU;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so32117865e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743339665; x=1743944465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rglqeGi5F+4R4MkHqSoUwvXL8wJn++KJ6G3hrrvWS2Q=;
        b=lbW2ytXUqrbGrIsaxSw01DBd/IJjzj90acc8hlFkdSqgtkVW6o32qgeeF8UUPdKkuJ
         wN9Pf7qPtXg7ac55YOt7PvDhHyqET90nbylUTC6okLaFqirLmnXk3gPKUHHAMQjFFLr2
         XZWM4VYw1uKl5nFcRFo0KU0/88+fSobXtmEnd0G3HwLnL5jA6NgE/xUGgMEW1V73o0ne
         atFT/9MYVzEFJO1NmI21q9e6nC5ALWF93dmYZ03G5eiMc8OjklGqI7lPlOMvgx4YuAuT
         qr4XzvAZNXYypUpb9YM+BHyADbuU5R9yFfQlFSALk2X04oetQsoYxgsZMkzYMDjdtAQE
         wOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743339665; x=1743944465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rglqeGi5F+4R4MkHqSoUwvXL8wJn++KJ6G3hrrvWS2Q=;
        b=bGvDETz8TF5kN2jpxG9LCbgne/lYSVCgyvyA9b1rGDl0LJtBVRZYcUv30WS8IKU3ja
         cWTWx+Khnkh9g7wn3WFq8s4hY9TzVpSUYnDkW4bVxRhMnpKut0zFejS+wlAD5syAlkko
         cdbxKpKJC62tnxSDadrhSbfctN1ZPcCPjvI5DAIdTUSKrSVdE0UKdfXBTpz5CJeujSat
         RDeh8ZtBWaKTDAGpwYnsLAmmTWy/f4f2N9QJvoYXGLtc77cbg6yF9zPq8zjd5oNImHFS
         6/zH7kL2GZWrmgbz7Vvs7trvQpQ2dzY7EgDJR8WLwoOviBrHhsecVbzPLND8n0litMly
         J8UQ==
X-Gm-Message-State: AOJu0Yz7Z0ocg6MGwn/vjrkvdWiFYiLF/os8YnT7FFiCfkLCrNgDI38q
	SnFM3TBfR4SAMouMOeud7A+JaGwDgzymxbE74ylh4kvRBktBeR+cmS4BQA==
X-Gm-Gg: ASbGnctCm+nvVdN0brsffcFx/7DP8QU0bFrjDS8ECaOsmdZI8HyZExkXea5QTvISA+V
	yoxzrieewGbm2F1I03PlAoujVDBa193gCeqg+K5x7KmIZQmlWvCKNJ+v0/sj/yQZduCt3jkC2RX
	6WaayXg/0BWd1Byi/lzeo66Cam16GQkFsEzZX1VS6yu0q6MHnamS4DsM+k96sjK4KyPku83qcON
	nTKRME8ArFgvIFMKva0XLv59+NhrKgl+AeFUwfa3EzanPuHlflKfo9/PxxK9um5ZLnrKVxsVRq8
	PlnkO6PVS3jjmrvJLZ71/+eqvnkcZfhlogIW7eI9n6C48htCDK9qsyhx+mm2/5Bn09Z8kEMbL4i
	nt8aBhbpTADvljTQalsvq5b4av9KXuVcCKP+zX97HTQ5P2JkkFyfviNVS77PtgA==
X-Google-Smtp-Source: AGHT+IFTyD2iXTl1IZtJ8q63yLBOYgG3qErVR5u/FBZCq6E52VhhRWv6lg0ZihxEuP/x71qho9NBYg==
X-Received: by 2002:a05:600c:699b:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-43db62c034bmr52132915e9.24.1743339665013;
        Sun, 30 Mar 2025 06:01:05 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba3ee4sm93108255e9.8.2025.03.30.06.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:01:04 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-exhale: new recipe (0.3.7)
Date: Sun, 30 Mar 2025 15:00:52 +0200
Message-Id: <20250330130052.2664988-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 13:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213917

Automatic C++ library API documentation generator using Doxygen, Sphinx, and Breathe.
Exhale revives Doxygen's class, file, and page hierarchies in reStructuredText documents
to make these hierarchies available in Sphinx documented projects.

No pytests are distributed in the pypi package.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-exhale_0.3.7.bb               | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-exhale_0.3.7.bb

diff --git a/meta/recipes-devtools/python/python3-exhale_0.3.7.bb b/meta/recipes-devtools/python/python3-exhale_0.3.7.bb
new file mode 100644
index 0000000000..6168c3d2b3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-exhale_0.3.7.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Automatic C++ library api documentation generation: breathe doxygen in and exhale it out. "
+DESCRIPTION = "\
+    Automatic C++ library API documentation generator using Doxygen, Sphinx, and Breathe. \
+    Exhale revives Doxygen's class, file, and page hierarchies in reStructuredText documents \
+    to make these hierarchies available in Sphinx documented projects."
+HOMEPAGE = "https://github.com/svenevs/exhale"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa7943919a123ae99ee86a0daf9e1871"
+
+SRC_URI[sha256sum] = "752a96d0a59456511d933311d4a81f642cd668296eacd2561905727d5ed6b0d8"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "exhale"
+
+BBCLASSEXTEND =+ "native"
-- 
2.39.5


