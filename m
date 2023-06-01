Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63178C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 07:47:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.25489.1685605652071690421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 00:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sAHQXNh5;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30b023b0068so414217f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 00:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685605650; x=1688197650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZVZWjQDjROVHn/aLT/vXtt+MRRRaGL5NYbxJYz9yxw=;
        b=sAHQXNh5Xg9RLVXs+vGTcoZSzELkIRogLOvYdPyKdmtJi/4SFkaIhZuVqqaFV0ouS/
         wPiWzx2KajI5apBQ4sU8Qf1bRFhMQ7JNobBoOgi6RKHwygHA6zAwxHLgImtud5YqyysC
         +xYLPDqHZOXE5Taus3dkfIdAw2Svh7bCOlmT6kH7EU6C6qhwZa7Vy3qyB0PfN8T8VwTT
         how34zO+JJ6CRuho9bPNjGKsZfMnGToY1PIYQruqU2PYtrbQOV3opW986Y+S+ldXV8um
         sCL/lpcF+FkdZ2eQtJ/D1HsdgJwuRihTp3y2XRJaBdXcriEPTlN69k+MFIi9lgdFB1eC
         djrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605650; x=1688197650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZVZWjQDjROVHn/aLT/vXtt+MRRRaGL5NYbxJYz9yxw=;
        b=J4XZlhXSBSudZlroZOmFW5oDpOil44feN6MdfMKmIMXBzV/tp/Q/zWGbuVt4Aznbs6
         jqhgha7+Hf4rkNSn6wuQPaDViD+gagN4aGFvic8tDU0eTHj3QKIr69JTVE+g9VAVUMOV
         xFeaZ3v9BVNgNAhL20YMZ/zm+F27Zs7OZxGqGOQQVn9y7flu6flxFvnphIa6l5LL+RbI
         U6YZ4UJbu8BYC7n2CEIBmflz/S+UmMDaNlevZ5rjTQAp1tvYeO8o8xV9kSgvd3M7+IV9
         P1BI++2G4lCRLOgEXW8nce13xWG/ngD91XqvMNM0GbYbmNnX65iYwGrl0CY1YaAYlBhd
         S8ew==
X-Gm-Message-State: AC+VfDzuoggP4ojFfToO90a+6zlK8YqLolJdGk8UP+nkyMJDj5U00+cO
	PY4e2Lz3UASHS4+WO8O2f233rY+ae0Y=
X-Google-Smtp-Source: ACHHUZ5ky3eYXKifamXu603+NfMxgU32shrkqEJLsWTZ4bFW1sqnHie7hi7TDYSok+gqgtxr0EkYUA==
X-Received: by 2002:adf:f44b:0:b0:30a:8edc:8567 with SMTP id f11-20020adff44b000000b0030a8edc8567mr771197wrp.8.1685605650123;
        Thu, 01 Jun 2023 00:47:30 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d522e000000b0030aded83385sm9246735wra.27.2023.06.01.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:47:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/2] python3-meson-python: New recipe
Date: Thu,  1 Jun 2023 09:47:21 +0200
Message-Id: <20230601074721.1985397-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601074721.1985397-1-zboszor@gmail.com>
References: <20230601074721.1985397-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182051

This python module adds support for a new PEP517 build backend
used by recent versions of scikit-image, scipy and others.

The previously added python_mesonpy.bbclass uses it

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
new file mode 100644
index 0000000000..828a1652fa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native ninja-native patchelf-native \
+	python3-pyproject-metadata-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
+
+DEPENDS:remove:class-native = "python3-meson-python-native"
+
+RDEPENDS:${PN} = " \
+	meson ninja patchelf \
+	python3-pyproject-metadata \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


