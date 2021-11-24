Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3436FC433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:35 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.4151.1637788474428632563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XFNrIS3+;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id g28so5029796qkk.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGjnjc6y0KSH8anUAzQKpDSAqdDGHb9ifuw0EDlZlOE=;
        b=XFNrIS3+13BU60outKsYMB850SESF9Ov0DOOSZ51HG7asPnyKdbBOFf9rTpKDBgx3k
         FL7Xaf1OZ+r2S3WWV7vjbmZVbtllXwmI8nQQjSl4yP5rWOI0nVudggYjVY9f1J84pV5+
         O5t6gHU2oU03lfHJOh7RnQOidq47FqziD3b4ViNx+Bb0LWLiKzSxVDWxSYmm30hITpGh
         gyqTuxmeS+ExLGV0p28MTwdTT2Ey9kBI7dqho/Y2l0/AHiN1ug3jakB2FgdabHAfTln6
         fNlREeVEyKBSnJyhEse+vuHKsoo+3CwC2+7ongtqeWKiBLdICtN+j/dv7wyYwPe266r3
         zxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGjnjc6y0KSH8anUAzQKpDSAqdDGHb9ifuw0EDlZlOE=;
        b=jgeyzsusWWcFKF9SpzYNh198RhHzMz5BL1oflB5zDrXxlu7PeOr8eMa1RhlRNdUb8A
         MENz8CrbDDV+Yg4FHQuE5MAl2Mo4289gtU6jwbMqMuV/b/cJnR36umDoKyGrKP8BHELM
         KaLzFIdvF8N73tR1dYvlOzkF+zFpEJNIGAl03+Pi3xCC92qIvmH67Lj4v3WemHqErdI2
         I3HOq4J58bJqUsyRGCMhCWGqQxcXJRDqmAgyklRIIJFVCtDpbE07HOanMQjV4CEz9qHD
         0+qtMgegR/MSIpYOdZYpRTYHz6WWaRsehy6iJimVwGQvCqUj/eFDsZi4OdfOVb9gx4XA
         YClA==
X-Gm-Message-State: AOAM531GvViyXFlkQIUQNWXtcTA/rjk0Omrc6js72d7fEIcnSHcQBHxW
	Rikjl+qGfPKY5pZGMQ51M8I=
X-Google-Smtp-Source: 
 ABdhPJwqYP2Q2+AHHSwTgV5wE7zHgGaMeEsLz3D5OyRx1vr7YPJkK2lnK+C4mZzXgQlfN2S78Lzn8w==
X-Received: by 2002:a37:9b47:: with SMTP id d68mr1494013qke.717.1637788473538;
        Wed, 24 Nov 2021 13:14:33 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:33 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 05/20] python: import jsonschema from meta-python
Date: Wed, 24 Nov 2021 16:14:11 -0500
Message-Id: 
 <408de88e7c1ff55cb4dca6b92abb6e386e6f4a41.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158751

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


