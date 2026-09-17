Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131B7C982E0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1671.1789682878919900343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qcqp4+Ip;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so780435e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682877; x=1790287677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dycyFwYReeEDhYJ3eXAHkuG0cvtzLZO58ttFIR3tqRE=;
        b=qcqp4+IprRGzklI9jGBUGU5i0VZ/z1knr/7XjqBMxrmDwYNOBnEpCoEgtyNrbnKUW1
         XV5CLfZH41hJM0A1NZ3oqkOFnNahBnXZ3uMZdJ1QLdKpCm83hxbO3V07IT3CpIzS8FM0
         Po8rKcXUu9eLJlTwkTul9l/5TgRe5jF+8pgWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682877; x=1790287677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dycyFwYReeEDhYJ3eXAHkuG0cvtzLZO58ttFIR3tqRE=;
        b=ET2wQy6t2qs1up9yvE8wuC+7hIBDTIwAV07WDxC1F2o/Cm7rWbNwcdcZ0zmmUVDpQG
         s3pU5wdRtWOe0vaRks/dMO2ChhveUXLhptaOLLyes61pUx6Uoyqak0PHFtvnDJ0JSHXK
         1YL41DCSunV9Iigfa0dD1uASkmiITcaZU+/klB90OmXOKNCMxxxdBA686o5w3M9FnHc2
         YbeL1034qklGDnJvx96BeNrrXYcg1HYWpVOzd0Rich+hmUEATUfP6WRhmpxSFBHs4jNZ
         8OX3ckXIDLiOXBJwDyj3LOEa0DM8v0DHRMC0Fuy4uWxZgI/Jgx77czSvBDpNKMgAdeJ5
         MBBA==
X-Gm-Message-State: AFuF++lfedu+Yfvbqg3S0y4ZWBhvHRmsW+9f0V0a7wdnvBdstEvKQYI7
	JtbKn+LwucismNG6Dz+RXCDCTBGAX9KG2Pk8klQRd4ZalOD7FBtSROytt1eokFuDTkt5pzhBv8+
	SdOrK6V0=
X-Gm-Gg: AYBFou3vCRxJ+U9tUz8+Hw1QhSKU9Ag7yykMzQcc67uCnQpb4sJa3nBhyD4+xbWM2hl
	7OVwmrbJlb9VRwLQ+/fdEC98n6hmkrwthOsbbRfQWjYOlhzpR1sF9y/e63GS+L61uCp99qHD4ve
	lFTUywtztEsCLi7Mlp+NNhqA0go4wB0tWbWMRsoinw0aq0LTl22WiDw56S+GuByg27naktOzImg
	E4ZfFwsqQcDkqeeRpXybiL+ui5ea1NDs7QihU9AXIc0PZfGgr2gi6axI1JM6BxNXpV3QvOlYPR1
	2hAaF/5neuhqVvD9SNRthIfgW056nDapVti/Z4a1sXEtDIZd1+GM7sLGSDeaaUOmgEPIqa4uPBI
	bkVExrWvF5Ts3mdRTTZTVnfg+OVXgbT9M9FNvNI5A60fwpfsI1+DmTEPmB+fSXo0hTGrvqqGfmk
	Vx7rqx13Z8V2bDUMbVO0r6Qw5TyPPQKldsg6QPxPGiUD8Bz0c5IqC0IstPyKuHn76u6w3w3DJN4
	ITl0Bkux4kd36KC+LreBdfQuKFO0zI8QR7EKnsR8IrMsBAAqproepd4jnc80nHe4GEfaQwh4C8=
X-Received: by 2002:a05:600c:3148:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49fc5737ac5mr3376625e9.19.1789682877148;
        Thu, 17 Sep 2026 15:07:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/79] python3-shacl2code: upgrade 1.0.1 -> 1.1.0
Date: Fri, 18 Sep 2026 00:06:00 +0200
Message-ID: <3aa18c06496d004752acd87951fb19b449ebc2f3.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246110

From: Alexander Kanavin <alex@linutronix.de>

Add a patch to python3-spdx-python-model to support this release.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: f6557000abc90b0c3b7ca5b4560849e64425c853)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: Changelog: https://github.com/JPEWdev/shacl2code/releases/tag/v1.1.0]
---
 ...e_1.0.1.bb => python3-shacl2code_1.1.0.bb} |  2 +-
 ...pdate-shacl2code-to-1.1.0-and-add-ke.patch | 41 +++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.5.bb | 10 ++---
 3 files changed, 47 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} (81%)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
index 904940926fe..a9c8bec84fc 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
+SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
 
 inherit pypi python_hatchling
 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
new file mode 100644
index 00000000000..d9dc0a03c8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch
@@ -0,0 +1,41 @@
+From b623473f634aebeb30028cc746fb7a3da4fb2ce3 Mon Sep 17 00:00:00 2001
+From: Arthit Suriyawongkul <arthit@gmail.com>
+Date: Sat, 6 Jun 2026 02:44:48 +0100
+Subject: [PATCH] pyproject.toml: Update shacl2code to 1.1.0 and add keywords
+ (#35)
+
+Signed-off-by: Arthit Suriyawongkul <arthit@gmail.com>
+Upstream-Status: Backport [https://github.com/spdx/spdx-python-model/commit/2d7b71a7c8e6270a1c8795cdeb4f3dcd9393b3a9]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ pyproject.toml | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index c8b3e56..df011e8 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -8,6 +8,14 @@ authors = [
+     {name = "Joshua Watt", email = "JPEWhacker@gmail.com"},
+ ]
+ readme = "README.md"
++keywords = [
++    "spdx",
++    "sbom",
++    "spdx3",
++    "software-bill-of-materials",
++    "shacl2code",
++    "bindings",
++]
+ classifiers = [
+     "Development Status :: 4 - Beta",
+     "Intended Audience :: Developers",
+@@ -36,7 +44,7 @@ Issues = "https://github.com/spdx/spdx-python-model/issues"
+ requires = [
+     "hatchling >= 1.27.0",
+     "hatch-build-scripts >= 0.0.4",
+-    "shacl2code == 1.0.1",
++    "shacl2code == 1.1.0",
+ ]
+ build-backend = "hatchling.build"
+ 
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
index c77bdffada9..19d9bb815ba 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.5.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PYPI_PACKAGE = "spdx_python_model"
 SRC_URI[sha256sum] = "4bcf7c6e5e2e8f0b787ed4eb8fb519e2ed776e820cb6d9eb93e44e98eb92ca2d"
 
-SRC_URI += " \
-    https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
-    https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
-    https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
-"
+SRC_URI += "https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
+           https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
+           https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+           file://0001-pyproject.toml-Update-shacl2code-to-1.1.0-and-add-ke.patch \
+           "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
 SRC_URI[spdx2.sha256sum] = "c6a54b51230eb2bf3b31302546af201f303e0b7931c1db404d7f5b72b6f863e6"

