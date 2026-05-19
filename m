Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C3BCD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:22:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4115.1779211359610313083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 10:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nf2P3zAu;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c80227c9572so1801416a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779211359; x=1779816159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHoRr9A4Ep3SEdxxoBow9zIh9X8sOBqQmReA5UO6Ado=;
        b=nf2P3zAuWCO+WmpdhUHgiICpZipscSjbNLO0/qJJOj33cxVvwQBV12D46ELSTcnjuO
         9JRQVAhua2YpWz04bx3rWM5v0ZaR5KasC6B47V1/QyhN95beq5Krf8xxxIjwU4MCNDn4
         t6p74AeDS6M3rcCQL1lWFQrOr8Qo6hptf9L+Ux4S/8eyEhphZHggmnX0lFrhAPMwEG0J
         O+Q6oxCeMpMynOOJvlKAgK8kAXhBzuoFzePZ8gmZmS2FjparNICIYjwvUvazEq7qUg6F
         m7wdE3JgtYT53mqlkoo0C5sbHwjHwPmBaNiBDzwxnQdaGpcem1a+tuYmAsW/agQ3GYi6
         e57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211359; x=1779816159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHoRr9A4Ep3SEdxxoBow9zIh9X8sOBqQmReA5UO6Ado=;
        b=cFDlbbb0xUZtWWu80hqtRBTJzqbfQDepaHjVy7hKsLpWp+v+7EJFhiHjqQWQBsR9gA
         rz10aBzgeRcjU8T3JqdW01U1q6c955VpVJrj8YJIt0nul35u6XpzpOS/jQWCBQI+SAzq
         V7CEnbuI6ItsN1MV1TKtdyoCm4d/1tr/MEU6p+wiEBQKacyEAEqJErJLcbk5jFvVcBWM
         0ddg/HMdErPLLoHI/Wpiu+xd+gFN3FS5RfkxhD645TINjQpktNxDN0RLFm5smGHYf+kr
         vN0xsYzVlctLC24bjumAXOTQ0I4ko+8eoP667jDWUzRPPUMk15GO1H2WVYWT51FnC6kc
         6+Yg==
X-Gm-Message-State: AOJu0YwYyG+Mfv8lrxFsJCf5YsZ/vlkdmSbjeuu0dE+Pyht2Khlt2RJj
	PAbOGauFZitsTBhrG0iFuPC+XdzMFUZg+njY435pFD5LQAWStwVe+vZ5T+mALj4l
X-Gm-Gg: Acq92OGxQLqLyKwjCS4l/ndMr8PLJUktWfwGuDzArTRTS8tCIpaCFVaU0nYjYEGr2SK
	zrjKWtb5bYHi8oOQX1/lVg3jLdUO9ukCQsTzMAhC79O3WdLjcWDXPzvfkj0HME+7ExHPU0nXSMj
	UVaNR9g663oiK9qibPAmWnd1uF75jun7ihV8L/jJTtp5+wMU7l6UyRc9NYyUBC5Ps4KMAspURFi
	nhEOz1MoGJP+KQKBDIenDYOaquuoErXfgmeGupLxYvPB1xF69scus7Umv6cgXLTbQUz4psYaZ5x
	oo3f/l5CNzVJK/7bihERHDF54NIh5XG2zsv1OCZatDc2PY0bUQ/WzDtZi/MKCeNnkPQc0O3yzHR
	JOVFVjpQk5uUwFyJ00i25OeZPeR1+VzvUVAXkr334WtQWKOd2t8DXvY9nHBdyX4dc3IHGiOZT2G
	UxiFohiO75Q8iRD3B5yUhgLpiKx3waLbMhlpCWUdyMiNOCbf5ye8NE0oTVWw==
X-Received: by 2002:a17:903:acf:b0:2bc:d1ec:9f09 with SMTP id d9443c01a7336-2bd7e9c9cf1mr223545895ad.40.1779211358975;
        Tue, 19 May 2026 10:22:38 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm107910735ad.20.2026.05.19.10.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:22:38 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 7/7] python3-urllib3: upgrade 2.6.3 -> 2.7.0
Date: Tue, 19 May 2026 22:52:05 +0530
Message-ID: <20260519172205.274641-7-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237343

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/urllib3/urllib3/releases/tag/2.7.0
https://github.com/urllib3/urllib3/compare/2.6.3...2.7.0

Drop merged patches:
- 001-pyproject.toml-remove-setuptools-scm-upper-limit.patch

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 ...ml-remove-setuptools-scm-upper-limit.patch | 30 -------------------
 ...lib3_2.6.3.bb => python3-urllib3_2.7.0.bb} |  6 +---
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
 rename meta/recipes-devtools/python/{python3-urllib3_2.6.3.bb => python3-urllib3_2.7.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch b/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
deleted file mode 100644
index 62c7e3d68d..0000000000
--- a/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7a4a7fddff72413bac190ad14bca8fca2d1461e3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
-Date: Wed, 1 Apr 2026 19:09:22 +0200
-Subject: [PATCH] Allow using setuptools_scm 10 (#4954)
-
-Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/166f66faa5ef23e255f654e8c6b66ad8590fe630]
-
-It works in Fedora, so I hope it will work upstream as well.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 45538a6e..d2607c78 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,7 +1,7 @@
- # This file is protected via CODEOWNERS
- 
- [build-system]
--requires = ["hatchling>=1.27.0,<2", "hatch-vcs>=0.4.0,<0.6.0", "setuptools-scm>=8,<10"]
-+requires = ["hatchling>=1.27.0,<2", "hatch-vcs>=0.4.0,<0.6.0", "setuptools-scm>=8,<11"]
- build-backend = "hatchling.build"
- 
- [project]
--- 
-2.53.0
-
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
index b8028efece..9e73a49bca 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.7.0.bb
@@ -3,11 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
-
-SRC_URI += "\
-    file://0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch \
-"
+SRC_URI[sha256sum] = "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
 
 inherit pypi python_hatchling
 

