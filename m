Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A313CCAC599
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.41408.1757580700784000714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xz672fYA;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso2801395e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580699; x=1758185499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6MBugWgX6aGK5UOkYrxbe48c65h5s7Pjd+x7GIulf8=;
        b=Xz672fYAnRqtwi1nloIgjAKAGjAy8guWPn98TlxxmOwSBKwvSSbXz0YR+8jhITIT68
         ZDTGN7/UYuVmRuFgsjjEfVy7iZQOEh0mC9u6InUn90jD3MbmvTi6RuKh0VlHL8Sl0J4R
         I3nyNB3At2OdvgNVRNc0tZO9rIP67JvURb6YH16JS5oPSBSLFtdYLigkAE99q4oRo0sr
         yOrQ6q5e3JriyxxWQk51x37cLvhW82UleWRfNzTXDTNcTWE/73O7/0k9tUA2j8ir1cpG
         YVSD4SqMOlI2B6asKN9wPO3//I/dopoQ1Rqh/CsTwSuvfP14gAW72zVSlHJwUwEpW/d/
         Qm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580699; x=1758185499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6MBugWgX6aGK5UOkYrxbe48c65h5s7Pjd+x7GIulf8=;
        b=sGWEXiQmt8uGlhyu3gX17tbGO+BrecjUF9HeaJ61ue+1iVnAuMTlnZDF06/l9BTLv9
         AZ4ZSYSKSyKoBNfqR4LIa8Xg2wlN2vQ+56OBBNd4TZZCIF57Zks6H80b1jVOxd8vx9xr
         i3oYE9oM51iiyUU5wcPtM8oUzqn4dIPGrrSw6Y1DOtQcY2luE4tFAplUczgFQ1Whueet
         tKA3nSZEN00O74xrCL7b03HbxjO8Ea+l6ZhmwqvpY/cry3YqSf9zcIyRkfxzJeAqq1SR
         0UiwNNKCcsXulNSUbsDvW5CwQIFFRXHzYADKf7HQqMz3ke3J9VEv7DsbwM+xiWPMpgX+
         KIwA==
X-Gm-Message-State: AOJu0Yz9Lk9Z2vUO1NXyP0lXu9YaGWimaCKuL3341WOSD+0gyAc2XdOv
	mMvfVDbNay8hZtxAc9B4EEWR0VKazudwFIbnrHlZADHw2aVZchB8n+1odCvVbg==
X-Gm-Gg: ASbGncsMO6fC8ZjL4UbPuBzkKbQQsgKYqvmfdWhhhK17Po+gWu395JI/pQzPRYKzEkN
	O1QNHMWem6kFlXRqS+T0IsJP6kMA6Sm+oU0PboTnKTE9O65ILzMDKIdtkQSXPUfB9YsPND9i6/i
	csuqswk2gOwI00TZ4RYPM2BfrQ+OxIX5BMhm+fJL3B7REF12Q5Rr1Pay/2kv3XdmQH6gIUk/vFt
	+LtUx1X7+egJyrmDnTz5TcMGX+VbdavXGST6jWNfevtUnsIwXwPnJcSlUfzZsptE3bWGXTl+thv
	YXqCdS0rBlJPTWuCOoxu3iSS2dLajgdsiJIHZaq3FTptq7zVZuNEKZyjPwkBTlTw1rP1zxn70x9
	a3QOBRfzsH5vSYjpQtjmSfwvXx2xSmGgZaVvu5jbQottIWM+oaOLjq9OkWxIGSqfEo53Vj7yN8u
	KMw+nNpGPKDFCm8bePwo1BGa6VKfOA/HnIu1eVCAKsQldlm+ZnTUsBxoio1SWwd/5M3+kQ
X-Google-Smtp-Source: AGHT+IG678fFgMPaSyKyUmXua9w1lXSVyB0X16EbvIux7iGfoYRMDudJvdsvY+k1SU4O9Lu3fi7LfA==
X-Received: by 2002:a05:600c:190b:b0:45d:d3a1:70dd with SMTP id 5b1f17b1804b1-45dddee3a58mr148119775e9.35.1757580699059;
        Thu, 11 Sep 2025 01:51:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/16] python3-pip: update 25.1.1 -> 25.2
Date: Thu, 11 Sep 2025 10:51:15 +0200
Message-Id: <20250911085123.1551425-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223255

From: Alexander Kanavin <alex@linutronix.de>

License-update: drop typing extensions license as it has been removed from vendor directory.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pip/no_shebang_mangling.patch              | 4 ++--
 .../python/{python3-pip_25.1.1.bb => python3-pip_25.2.bb}     | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_25.1.1.bb => python3-pip_25.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 71836dca078..7f15e9c0da7 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From a715a622989ac182d18f6f2ada8201122282d889 Mon Sep 17 00:00:00 2001
+From 6adf47097928ee3bb1b02c204126ed923faa7446 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index b1fc705..c030e98 100644
+index 195dc3f..a0e0d61 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
 @@ -155,6 +155,8 @@ class ScriptMaker(object):
diff --git a/meta/recipes-devtools/python/python3-pip_25.1.1.bb b/meta/recipes-devtools/python/python3-pip_25.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pip_25.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_25.2.bb
index 431ba182c68..350092d9ad0 100644
--- a/meta/recipes-devtools/python/python3-pip_25.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
@@ -19,7 +19,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
                     file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
                     file://src/pip/_vendor/truststore/LICENSE;md5=74420fc3965c4558a4a1529e63c2867f \
-                    file://src/pip/_vendor/typing_extensions.LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2 \
                     file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
                     "
 
@@ -27,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "3de45d411d308d5054c2168185d8da7f9a2cd753dbac8acbfa88a8909ecd9077"
+SRC_URI[sha256sum] = "578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.39.5


