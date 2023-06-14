Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAEFC001B0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.7366.1686734992005270496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cBLerFa4;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5187aa18410so1880973a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734990; x=1689326990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PObRhwkcVgttB1mS3m6MrmwZHcNNEf5pNMARZppbnKE=;
        b=cBLerFa4uf3opIojy4IxPOQlTvD4Hi1FZ5rEeDlEuMt7Sewq0yOKKb95lJYUfEcjgo
         QeoaXTE9rne4yEq4uwV941FMJ19TEb5RN3hJYWr9QK2EEjpH92fIPJ8mOY7I+V8DpBZ9
         4XFgQs7P20WY+cN6/bIpoETGpQtmcLt8T8pOcY8Ni9YVG+uFKFbUt3GCe2CFhuEvnSs6
         lkBVyQ7WRfqNw33tCsE9Rc767TY3bEjx84nP19NIft2rRkEJq+QYiGWS1fUsRNdyUgkl
         XSInpbeE08fYbcivnUffjYE2u6p38Z4ziHdGs97PFbwbXTqLSqkufcfK6YvKolkVNF3M
         jx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734990; x=1689326990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PObRhwkcVgttB1mS3m6MrmwZHcNNEf5pNMARZppbnKE=;
        b=MzRMVvCHCZUq335/gM+8jJEKyS+j4U44GTGcuu6Ws3Y2tgxUx6hl8TWS4PRmdCu6tR
         QiSiHk/vC1vLUpma4cnW/c2pKhuwdV89u+02oXwtllXPbHFcbYZosXG0XLNJFa0mDeO1
         kd/8KM/rlvicRZFYSaOMWwlKijuQ5KsmH4Ro9Om00goRVArlKKPjJSUyT3tgBeesKXta
         gLBij5NfKFX0I7Z2sCc2KVDGtIoXSDMqntXeFql4gM5ZFheDySHIUuSiFygHmDAeZO98
         qeSYnTkCciR6Wj8KQyFFn+XAytao0OxsPL0ny93k6dYmbRha8oaGA3aKRu5lcbDdByCC
         pbFQ==
X-Gm-Message-State: AC+VfDygBwkmaecfONs/+8OgrOphKUZ5aR0nWQ3QHiU+y9eZGceKtee+
	wF+eQqAVkkSVhUeGPXvmXDZqWneJjJ4=
X-Google-Smtp-Source: ACHHUZ6uR14uDGQtdOEs8kTKaQfNM/EDVPzI+y5P1/iobwnMNvxYOMTK4weNXQpIsDmmiT/+PwFzCQ==
X-Received: by 2002:a17:907:3ea3:b0:982:65e0:2984 with SMTP id hs35-20020a1709073ea300b0098265e02984mr2281384ejc.68.1686734990440;
        Wed, 14 Jun 2023 02:29:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/55] python3-pyasn1: upgrade 0.4.8 -> 0.5.0
Date: Wed, 14 Jun 2023 11:29:05 +0200
Message-Id: <20230614092918.4065570-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182787

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/python/python-pyasn1.inc | 10 +++----
 ...arning-__int__-returned-non-int-on-P.patch | 28 -------------------
 ...yasn1_0.4.8.bb => python3-pyasn1_0.5.0.bb} |  1 +
 3 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
 rename meta/recipes-devtools/python/{python3-pyasn1_0.4.8.bb => python3-pyasn1_0.5.0.bb} (98%)

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 126d0388efa..9eb87354cf3 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,9 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[md5sum] = "dffae4ff9f997a83324b3f33fe62be54"
-SRC_URI[sha256sum] = "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba"
+SRC_URI[sha256sum] = "97b7290ca68e62a832558ec3976f15cbf911bf5d7c7039d8b861c2a0ece69fde"
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-codecs \
@@ -18,9 +17,8 @@ BBCLASSEXTEND = "native nativesdk"
 inherit ptest
 
 SRC_URI += " \
-	file://run-ptest \
-	file://0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch \
-"
+       file://run-ptest \
+           "
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch b/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
deleted file mode 100644
index 30ac9a66843..00000000000
--- a/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From db8f1a7930c6b5826357646746337dafc983f953 Mon Sep 17 00:00:00 2001
-From: Ilya Etingof <etingof@gmail.com>
-Date: Sat, 21 Mar 2020 19:05:03 +0100
-Subject: [PATCH] Fix `DeprecationWarning: __int__ returned non-int` on Py3
-
-In `BitString.__int__()`
-Upstream-Status: Backport
-Signed-off-by: Yulong Liu <yulong.liu@windriver.com>
----
- pyasn1/type/univ.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyasn1/type/univ.py b/pyasn1/type/univ.py
-index 10924c3..488241f 100644
---- a/pyasn1/type/univ.py
-+++ b/pyasn1/type/univ.py
-@@ -551,7 +551,7 @@ class BitString(base.SimpleAsn1Type):
-         return self.clone(SizedInteger(self._value >> count).setBitLength(max(0, len(self._value) - count)))
- 
-     def __int__(self):
--        return self._value
-+        return int(self._value)
- 
-     def __float__(self):
-         return float(self._value)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb b/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb
index a5e2a713626..0519ba5edb0 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb
@@ -1,2 +1,3 @@
 inherit pypi setuptools3
 require python-pyasn1.inc
+
-- 
2.30.2


