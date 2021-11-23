Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3987C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:00 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.858.1637704679676219081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eti+u1PZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id jo22so280062qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGjnjc6y0KSH8anUAzQKpDSAqdDGHb9ifuw0EDlZlOE=;
        b=eti+u1PZV+8cc/v0BaRHerX9zyDUygO06i/Du79oR1oGkdg/aH+n+ovU37TOcNRouJ
         czeXx9F/mpDh+XfAFcARtfCq12e67glIoZU215zwtXqXSsOGbKA+O804YIR5yTUaot2Y
         40zhLdbzCZs3/VrvkLff6Hz1JAVwRrICJgU/ykwafTpOxk8NYDFjGFnY4WBoy6vAIc/W
         TXAdg5qKne+igYPRPyWYIFR95IVBEsQtM+a6QR7XUCKMPRe9IdrYyfv7CKzhyuu4Jhet
         ECR5oJhX9b3glkks4oxqi9VpdT2NEcL+rQYzmH1gGJxZKqxJgJ3NQNoqveManRTpUbUl
         3tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGjnjc6y0KSH8anUAzQKpDSAqdDGHb9ifuw0EDlZlOE=;
        b=T61DJg0VhkKspnIvhyXxc2KKQTUgH9j897zXeyUInp0NRIPvw82imwfi272kd6wMTy
         wSos+9uxn1/sqWLtu4SPqmMKCgb4KFYEIh+q+iKQoiQ0uGgKIcy0VKn1rTK/BnZGBd/n
         r8udHrcNCR2KkEacnCFPBQ0bDKbAn8yYCmdOET7s1fVCjcBzm25OiOeX+K76qrBFkT4i
         ROg+3sovQfJBXyMdM84kc7+P4u8RW8st/ijJX8GqLCn5W0XAN/e1z+Ss0QfZak/MKf77
         diGtYN2hKdL9y0hztNWzMl1JsNDg+y7/HvCa8f9pXD2Y0ZZux7wd6mI2iiFTC0Wtm4bo
         FtRw==
X-Gm-Message-State: AOAM5323AAkbpAhhqga+7KphcOxWaekLSg1IH9N8BScvPGZjYLiIuaUs
	QIpydPanABaVvtZ75ejNQHAcmvMUYkfyhA==
X-Google-Smtp-Source: 
 ABdhPJwYAWXmrAQwb8qJ0NCyZSxENWyoEJrxipueCOnh5ylfLq/ngNarzLd9YPaDIE4H09Cia7O+Xg==
X-Received: by 2002:a0c:e98a:: with SMTP id z10mr595652qvn.43.1637704678808;
        Tue, 23 Nov 2021 13:57:58 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 09/20] python: import jsonschema from meta-python
Date: Tue, 23 Nov 2021 16:57:36 -0500
Message-Id: 
 <8ec765f17eb8b42851e3f6db36e363cd962f743b.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158630

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing this package as a dependency to python3-dt-schema,
which is required for kernel device tree validation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-jsonschema_3.2.0.bb        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
new file mode 100644
index 0000000000..c7efe33a83
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
@@ -0,0 +1,48 @@
+SUMMARY = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "https://github.com/Julian/jsonschema"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
+SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
+
+inherit pypi setuptools3
+
+PACKAGECONFIG ??= "format"
+PACKAGECONFIG[format] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3987 \
+    ${PYTHON_PN}-strict-rfc3339 \
+"
+PACKAGECONFIG[nongpl] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3986-validator \
+    ${PYTHON_PN}-rfc3339-validator \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-importlib-metadata \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-pyrsistent \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-setuptools-scm \
+    ${PYTHON_PN}-zipp \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


