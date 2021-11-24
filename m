Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EA2C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:37 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.3999.1637788476077076339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LogeWUcU;
 spf=pass (domain: gmail.com, ip: 209.85.219.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id gu12so2635388qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oDVwv+qBE1pNj5i7FN65q94QCOIEQCUCacf5H04qKSg=;
        b=LogeWUcUHBVvtCLDwBS3AXhsgMFn79Q90JMTJrnxpeOsemfKLT3uhNAhPS/QrSI0Ap
         jpVN+PjxEbzoWjEw5lrx2x+Y2suaiKV76Tu/4GL3ktANdVT1ItwN3QgDnIMWjA1kzdeo
         2d1VWkdND8r5Jzc92Nc2iay6VoK5ujaJbrQRfNI1dJZpeAazxIdauZPIMqfjSD7ZKZYs
         vETwUFIhqoPfid1CgFWuKmkE7d6RAHorNoLfhgdL0XXJgMh8kvc7+YOnCjY+V1W0HEeo
         GJqVq07mdnKoEJ3PGeA/J1R5pUF7GTKLkSX1yBx1PqIaB6DJd8e6SYWZigfmf9By4+2D
         cD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oDVwv+qBE1pNj5i7FN65q94QCOIEQCUCacf5H04qKSg=;
        b=ttvqPWsppjtZvFmJCuUsAYsXaQ+mo1PA6B/hSqVxAWZ06qEgNjwqYk458Fl1oke/xC
         AHRmR1LVlsUs09qF0SOdxkxepMjY5BS7Xx1v14S/103BVvDpchIUgVv1DbgC2oahK+G4
         UNkKI3kT72LWH/sRI3vRzneKj0LzKfhyYqCgRTnh4FlsMdfVKLQ8LHTv8fwsXeg/VtY1
         73SppNSvowKxbe4eHXlXeiNMpXejrdRXpN7drl7uL4dLl3ggstZll+KqPcZzDCX4EzIW
         E/zc3PnPIH2X6LKZmShPy2eSdCSzs7CXa3d6mCIzKENWRxPyqwlxX2mKZyu7vs5PEoHp
         HWHQ==
X-Gm-Message-State: AOAM533lYQcNVDf8WbpNo3KIuNDN6nDPEdGLD/vzSwu7pz881EtEtA8D
	9uOHVuw0BRumlOOpUeywcE4=
X-Google-Smtp-Source: 
 ABdhPJwcJC49UyWGSy8BqvYM8cp4lVmFgcuhgkekwg5eaZx/ok7xQiFgQv/LoB7wlJe7cVxBB2fTrw==
X-Received: by 2002:a05:6214:4007:: with SMTP id
 kd7mr11682425qvb.52.1637788475257;
        Wed, 24 Nov 2021 13:14:35 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:34 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 07/20] python: import rfc3339-validator from meta-python
Date: Wed, 24 Nov 2021 16:14:13 -0500
Message-Id: 
 <7f326cee54467c982490bcddf477608ac9e5fc43.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158753

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing rfc3339-validator from meta-python, which is a dependency of
python3-jsonschema. These packges are required to support
the validation of kernel device trees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-rfc3339-validator_0.1.4.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb

diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
new file mode 100644
index 0000000000..7f1bbaf97d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A pure python RFC3339 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
+
+SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
+
+PYPI_PACKAGE = "rfc3339_validator"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


