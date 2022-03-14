Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3C6C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.3333.1647298127467555838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JOBIiDbs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id x15so26241845wru.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E8MAvYI3VQ3g2NZJHblYbEHYmJnk41JTxSQMGOjpd/Q=;
        b=JOBIiDbstTO4DGy9GZ2cskziglGBXDmTFUfH7O2Dc9BFUiweT5t9lv8TmOktUviRcB
         ZRuw0YgKuP4WRKHnhIJbmJQXjhrXV93IrGUnSGD6sVZALCU9f58yW2T+yB43n2XYXv3b
         CjoKFco/gYequNwJ2XtjLRweNP/HjWOkDavw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E8MAvYI3VQ3g2NZJHblYbEHYmJnk41JTxSQMGOjpd/Q=;
        b=Cglu9DpXD8H8EH155iP5CDFAnqCNmAsE0gZ+uj2lfeN2f/YYO/jBxJifxFVyN19Q4o
         zKLOYo2KMsbFS9Ne0DI+RmN9Ry1ju74OuW3A4MjhZ5JqboVQ7QzCizNXtUNPJTZO9tui
         9iI1chev1/D7zbyLWYjJiNJ0Ux6N9c/0sbd3keRSnne2kjGoR26HPgC/dTTXKqFA+Cn3
         N0bqFGOGvEyFogLTkoh4vqntEm0tsZB0JzANtAzqB/QajBqwNVSt7Ft+yyt+Hm6aHngr
         SZC7fn/jik+Ekdr70pigqFq9fFlIHw3XpWwiCV5Cg1n87nrPyjr8tWxCQZNvRLiAinLI
         xRMA==
X-Gm-Message-State: AOAM531WAtj3iSN7H4h9SLH8xZeltKmsxXg5Ievcc0T/GML8CWiszRet
	VIqnJNqkNjrsZp+HbizZidDt5ve5G2G4aY7p
X-Google-Smtp-Source: 
 ABdhPJxOTlhfFnq2noZGaultcCVww4fFXLjbG1/yBxaM8jp9pRneKo2wQq+4t2iXSjNXi6Ma4xEIKQ==
X-Received: by 2002:a05:6000:18ae:b0:1f1:f7f8:5a4d with SMTP id
 b14-20020a05600018ae00b001f1f7f85a4dmr17664029wri.43.1647298125825;
        Mon, 14 Mar 2022 15:48:45 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 08/33] python3-asn1crypto: move from meta-python
Date: Mon, 14 Mar 2022 22:48:12 +0000
Message-Id: <20220314224837.834776-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163174

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-asn1crypto_1.4.0.bb        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb

diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb b/meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
new file mode 100644
index 00000000000..c052cb8c827
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 structures"
+HOMEPAGE = "https://github.com/wbond/asn1crypto"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
+
+PYPI_PACKAGE = "asn1crypto"
+
+SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
+SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN}:class-target += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


