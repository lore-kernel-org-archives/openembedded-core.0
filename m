Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C87CFED3F8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 18:41:15 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29835.1777056069928924346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 11:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=sRJoVNCG;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a3b0242631so99532406d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777056068; x=1777660868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx4fq0zhRN8PPFLe7v2DI5sK8Gs4TOV2L9qnWFhtuSU=;
        b=sRJoVNCGrZRctKkJOBGeC+G+az6slH5Rluf0uefWokaEjdRSLCjL9NJcqk4jADaMnA
         9dMAIZdTvRhk7ZEIE7fnaQoE2IM3YbcRqoVKo65j7cAh6wvVkll/MG1gJvjiZ3cgv+ot
         U4fjTFzND5bVpa6WDfBH9fNgQVyiOWIOVWfybfLHNsnzPoDKCaiPbV0SGchj8gsz+foz
         s+A4GYqYUnTqbfPXA4QbBQOYVmVS6mpPV+pSV9CNkKqDYGhcxU/+y4WXmYUi51+lGS3T
         G2cvv/xlK1u9PWcun29G3QZJ+E91XRfzg5Kc1AKUCkC99/1uiiHhQVoX0P4F6uX7OK8S
         vXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777056068; x=1777660868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx4fq0zhRN8PPFLe7v2DI5sK8Gs4TOV2L9qnWFhtuSU=;
        b=TAHfut/6sFESMStiJEPHt1xxar8EHAMstyaCsj9gYiSNYM2BN2+YZo/lqvTc/AcV4f
         n1yx0n68Mux9Rj6IhM0zAYK2v7cKe4wSujfXdesPwIq/tw5IPpmyQ3k7wqC0AlmPugzP
         WYCouRRx/Fq7MZRNyxYkVdBfdZPsLr4miRRWcVOoEnDu70RXt1ye2io7tFOqEUC0Oyrg
         BluWHn1mpczMMrFH9qGBl0cLFxwzocaD+8VwCqFC7Sx0FvHsVM6EtPlrFd/ro0peJM+M
         IJjhsNHt2NxPDkyKvPmt8Ul13X9POSMulUfJKV7GMHCGP6Kj5hs4npL7VylnHODsDDn1
         826g==
X-Gm-Message-State: AOJu0YynbgxXZnPTW15nRqCfgSL7qmxjmpTfbpdzNK7+Fk4vRdfs5SD0
	7Bw9ZNPmeFHY1ZxO8i6/Y+RDR8ImYOM17GvuQIkfSzkN81/J65nBe/zNSMyaFaCM472T6tUz9q6
	Gq5sh
X-Gm-Gg: AeBDieuNFUBKrE1E3ipv0VPQbvR31igehf4qO5+3bJ+bYQyhSwc3kRvVvDbd+nIVFR2
	gEaMpe81icC2x+efJb3urA7AAA5eCsVxw+6+Zio+zAcEMbJaNJna/+thcHQqohLunkR07AmX9Jb
	Rt1VjDAb8ROI0hh3BWNK+0gbB8d6Wrws9PrFHJ5K2Dx0Iz9OHp6phgC9yrluoigbNPB7hpQdrzx
	i/kNrwxZw6Pdut7n+akRVdd40rqbB0U17wDMMEI+XrSjqT9jWLNKp8hUcucKRBMu14OYi3yOznP
	c+k++nRjCABzD2sIUaeOrD+j8SfIlNQjbkqs4dzBBROA/8js9Znyaa1kFtGoQv3JaLpM+vWNOyd
	gh0929rQMt7UBqr1Q4XLOcdUGMw4fArIdm6A6hkgTGtNz3Cqr5WvtQBpt/kcNzgDJ+UKiSunuT0
	QAd1Ry9Mtadd4Dkj9ZDgWwNeXOV12B35TDDuu4CQ==
X-Received: by 2002:a05:6214:508b:b0:8b0:2fbd:8e28 with SMTP id 6a1803df08f44-8b02fbd96e0mr495630816d6.5.1777056068122;
        Fri, 24 Apr 2026 11:41:08 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae86947sm254201976d6.37.2026.04.24.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 11:41:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH] python3-urllib3: enable setuptools-scm 10.x
Date: Fri, 24 Apr 2026 14:41:05 -0400
Message-ID: <20260424184105.5627-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 18:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235872

Backport a patch from upstream to allow python3-urllib3 2.6.3 to build
with python3-setuptools-scm 10.x, so that we can use an updated version
of that recipe.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ml-remove-setuptools-scm-upper-limit.patch | 30 +++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |  4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch b/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
new file mode 100644
index 0000000000..62c7e3d68d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
@@ -0,0 +1,30 @@
+From 7a4a7fddff72413bac190ad14bca8fca2d1461e3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Wed, 1 Apr 2026 19:09:22 +0200
+Subject: [PATCH] Allow using setuptools_scm 10 (#4954)
+
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/166f66faa5ef23e255f654e8c6b66ad8590fe630]
+
+It works in Fedora, so I hope it will work upstream as well.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 45538a6e..d2607c78 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,7 +1,7 @@
+ # This file is protected via CODEOWNERS
+ 
+ [build-system]
+-requires = ["hatchling>=1.27.0,<2", "hatch-vcs>=0.4.0,<0.6.0", "setuptools-scm>=8,<10"]
++requires = ["hatchling>=1.27.0,<2", "hatch-vcs>=0.4.0,<0.6.0", "setuptools-scm>=8,<11"]
+ build-backend = "hatchling.build"
+ 
+ [project]
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index e63791a8f4..b8028efece 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
+SRC_URI += "\
+    file://0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch \
+"
+
 inherit pypi python_hatchling
 
 DEPENDS += "python3-hatch-vcs-native"
-- 
2.53.0


