Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCF7C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3509.1647298122435638958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNa1cDPp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id i66so10173487wma.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsA1B5Gp+t4MI+Tb9UWiZR6AVW9KxivNYKXTMLfnEzk=;
        b=eNa1cDPp0rJKNbZhtK9j9/QbtZv1rbduaOztvmOzRV2MHy/ZTBRVPA7deCDwUOrWtA
         mhUpBrCTTW7YlcOsafP/wo9RujpiNPzWJJGE6ZciTdPoqk4+Rm0iG8bDzbkoXsYiSCr4
         VX3rb4/QlsRIvBB5TRfKzj/fHE6aBe7/TrRdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsA1B5Gp+t4MI+Tb9UWiZR6AVW9KxivNYKXTMLfnEzk=;
        b=N2upPgIQhVlQ5+D+uPiK3vPEMcymM5vmqfs7xv3Bug1NtfaYs/YXiXCT1cBnb5TSZV
         Mzp6hr6hRdDcS9+jYbazfmMFFHbBIhQCH75O+3UkYv4VnukVGX1uokRgXu0IUNF+cdId
         tAca2kMYgv7+yyoWP8jdJcvnwuKDcSVc07bCJrvwMr24tyKzNf6TH4K6ztQnCgsM/pK4
         YJz4y090hj/bCojfUiihUdF3tF030KHg2VSTv4Y/P47ly6d6GiH9CJGJFdiIkzM7P/VX
         l1OEBUKF7m4DFXiYoW56Vchk99qbvBRU49Ppfj9huXfzwZKonGvi3eF0mHSxNck9A89L
         YXqQ==
X-Gm-Message-State: AOAM533h9RRCvOajYNu0gmgMHkhet57fbv/4sXEhXthJKKjWnu6Hlsbf
	WlwuvNEkwuOel8adOlaK6EGQwa+hUWc7dS8h
X-Google-Smtp-Source: 
 ABdhPJwsMwi3Tb6DNY86MTDCpx3zb2OQm6cqg7PYYlImyT9RyjDPUbcRupRw49dp00/YnO/UphFkiA==
X-Received: by 2002:a05:600c:1d1b:b0:389:d0a5:c7c4 with SMTP id
 l27-20020a05600c1d1b00b00389d0a5c7c4mr1027068wms.88.1647298120316;
        Mon, 14 Mar 2022 15:48:40 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 01/33] python3-setuptools-rust-native: from meta-python
Date: Mon, 14 Mar 2022 22:48:05 +0000
Message-Id: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163167

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography 3.4.x+

Only native rustc is supported at this time in oe-core,
therefore it makes no sense to try to build for target.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python3-setuptools-rust-native_1.1.2.bb   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
new file mode 100644
index 00000000000..73dcbb26e67
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Setuptools Rust extension plugin"
+DESCRIPTION = "setuptools-rust is a plugin for setuptools to build Rust \
+Python extensions implemented with PyO3 or rust-cpython.\
+\
+Compile and distribute Python extensions written in Rust as easily as if they were written in C."
+HOMEPAGE = "https://github.com/PyO3/setuptools-rust"
+BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
+
+SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
+SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
+
+# While this has a pyproject.toml and declares that setuptools_build_meta should work
+# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay with setuptools3
+# until that can be resolved
+inherit cargo pypi setuptools3 native
+
+# For some reason the wheel is built in ${S} not ${B}
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+PIP_INSTALL_PACKAGE = "setuptools_rust"
+
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
+
+RDEPENDS:${PN}:class-native += " \
+    python3-semantic-version-native \
+    python3-setuptools-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+    python3-typing-extensions-native \
+    python3-wheel-native \
+"
-- 
2.32.0


