Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A10CD37B2
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8171.1778224354320235560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bLlaHmO5;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso16425115e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224352; x=1778829152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMriodXZxQR2RdfOwmWcNw9tI92RdXgtdkdHSftHinw=;
        b=bLlaHmO55WDZGej7fW31JjWn7/BRY+6xk5SMgzPi/cXk6j/iMZpan5EaPiEEfg8hOf
         u9mBmzbJGXlss6h9kg1lmmALYI4zK8jdLk7BY3klBljRhSuoJPmyJoZ+aqhm0uSaU0jM
         gSzBb9zo6w7VQKR9ycgqgHf5xWMVJnTS91+Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224352; x=1778829152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMriodXZxQR2RdfOwmWcNw9tI92RdXgtdkdHSftHinw=;
        b=TI3tyPIvxc2B9Fi7fS52g8id2OU1Nu7Q0GV/JBP9Txv6ZHuJNsgN7L1QyVtSxDQ5Z9
         KTXblcjbbl7ldUCS1VEhfaA8985D5twUL/fIcrt6Z+lt6CUapoY5m8BHxTTX2Ws/8KJn
         pxMJ9gOEKkVSjjuj5xm4Z5I5fEcyfHEymc0gLF+bcqZmrO0Cl3kYyPNkJlDE7LbqinqT
         uW9NSccZlE8W81HuawJ1HZ918+cp+zuudfTUZMtfd8xiauh5WEbZUGfUb1S29VqJ/wmD
         nx7UeYErpU8bOaUi+ZRBWt+GdE3EJi5kIEj0TQWS4bPSCeafjGtKUz0CgSqXJLHoHQYp
         /lsQ==
X-Gm-Message-State: AOJu0YzRpr2kDN0auvz2dy3VZ+fswL1hDmfxHlDtE/2lDacY81KsSk5z
	irYgfzPtLhWljvQwiXdSffKa5i96GsOEIHrntGKbQsufbSDjJL4cnEFpaPq6tAYwGOpPotC3p4O
	D+ygIWG4=
X-Gm-Gg: AeBDieu75jD+lvUttx5/F4HnAWSxx3kGIRWeY0oIM2m5rhivvYmoglzLsKtjgODe0c3
	hTdjPZkixYseBm5jXqad/yJHM2VWAW8VlzEmhZZlmvaR29/TFwQ+xccm832cZKffbUFv6Fm7zEK
	/oKHE2B2x5y+0MhVaCp0OfW6G4aGXoKks9mQHwieJshXfmOVhmziXxf1LxUWgIL4bzkjfTxZS/8
	8SIu3dqwhSuifKTau8/LCVCVff490vrd5w/gBDTVmGe3SHUWmW7gvjlLYGNbM+dATHold9kG9vJ
	9+0WXYQw1wAMydqA0e3ljehxTYrSMXGILpXk6PfiQr4Qy5fhXi8zwNPFDXIoLxc46IHLLRCAR8P
	HlgFxbEaZAanPRscl1LbV0OCELdDIO94hjJW1hPq3t83P724oQGA60a4xxkVINcXtl4QUU0F7IC
	D9TyBXiDYcBSiiuNckFGKHm6OxHjMwEwF02aEnBAdx5OJA0l9fqbnQ2h1u2gCP/dJo9grV2rMbM
	E8Pyxt5yiftbzVcMIR3PUu7IC+lSQdYu8Bfxg==
X-Received: by 2002:a05:600c:3208:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-48e51f46c07mr95918435e9.29.1778224352324;
        Fri, 08 May 2026 00:12:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/52] python3-urllib3: enable setuptools-scm 10.x
Date: Fri,  8 May 2026 09:11:23 +0200
Message-ID: <2c562a17737923b288bcf5c252cd729d54a7514a.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236672

From: Trevor Gamblin <tgamblin@baylibre.com>

Backport a patch from upstream to allow python3-urllib3 2.6.3 to build
with python3-setuptools-scm 10.x, so that we can use an updated version
of that recipe.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 012b14d1ef16d4a91f98a7f62dd5b0ac8ee923ab)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ml-remove-setuptools-scm-upper-limit.patch | 30 +++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |  4 +++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch b/meta/recipes-devtools/python/python3-urllib3/0001-pyproject.toml-remove-setuptools-scm-upper-limit.patch
new file mode 100644
index 00000000000..62c7e3d68db
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
index e63791a8f45..b8028efecee 100644
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

