Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20619CF3950
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:34 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.21243.1726756650354258995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DDJvEHEx;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5356bb55224so1340532e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756648; x=1727361448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7o+gnznbqn5KpDoFPpylEINQPs1ltBErWP66Vkg2T4=;
        b=DDJvEHExVfNTbAj6hycFK7W3okDGGZ/pIgfKmGGg49xftTgcQ3lerH694jnXc61Ssy
         5tTZaJEii4fEMby25msSb1GDanc3RFJ9Xz1yeQuXFvFlzHTN3Kxn8ZWJNKKU0vgY2H7O
         jRKuz5NpwVXDBooEjLcSGWe7uBIWWeFaL5uj4efMvAdFob3AbFfMw5kwOKRq8oo80Stf
         gEOOd1riOf6fNG/dIQ/ilJFrouLHBlyZLM+zuT6MGEoQT5FYqV3DU8XAUcfm73wz8SqS
         67w2Ug/LyYgXBk/Q/wDhxP4Iz/70XJnGxUhunPtJW/1dPzPO6UdQat98iL+7UN8uWLMy
         cCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756648; x=1727361448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7o+gnznbqn5KpDoFPpylEINQPs1ltBErWP66Vkg2T4=;
        b=xPVx4bkmpQzfVvS19PZrq1rdNIuLnv80HVn2QvSc1NyVSulgWWZZp/3kKxEL63+NGC
         yjIROjupyrPb6647r9bhbCSU6Lg8wV8mbmmS465yDGVsaSiNaXTRi7aWCBJSgO4fDT1S
         eCk1vwUv0SJ3T9d+a+/3nh+QROVLyY1R3VRU71RJD4uq7TbEeQOELMlO6FFG0KUYMakz
         NTr6/C6SRXyoMdcXHRf3g6OgmaqN4QvbKpMuUWeIZ/rlGKBBeIx60G0d7OU8EQd4ctc4
         2JuQtm2o7nUiIw6jzw3yZfCv4bBUXBtvjoIrq+fkLwOkQWD0aixZWMbwcTo1Tm2UfoxD
         IvXg==
X-Gm-Message-State: AOJu0YwAYKsWm+kFl0YCCp4MhtPRklgXMukFq49rmFahDvh7i7EzsLUT
	9ScBjK+xvnydCIa+7k87r8cgvWKMf2spjAaCAmATnGlM1O9ppEd4CfUx1sq9Ein+Wx6SDPFLoF5
	wsv8=
X-Google-Smtp-Source: AGHT+IF0v4Yid34wfENhAbE2E5Z1YSEfCZtHiq0vV9rtXTCRlzLHZDj5F0S2QX/mdD6MkyxDkdWVMA==
X-Received: by 2002:a05:6512:3e1a:b0:52e:76d5:9504 with SMTP id 2adb3069b0e04-53678faaed7mr16405772e87.3.1726756648394;
        Thu, 19 Sep 2024 07:37:28 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:27 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 01/12] python3-pefile: add recipe from meta-openembedded
Date: Thu, 19 Sep 2024 17:36:55 +0300
Message-ID: <20240919143706.6074-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204693

It is needed by systemd ukify tool and uki.bbclass to generate
UEFI boot binaries.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../python/python3-pefile/run-ptest           |  3 ++
 .../python/python3-pefile_2023.2.7.bb         | 28 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pefile/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pefile_2023.2.7.bb

diff --git a/meta/recipes-devtools/python/python3-pefile/run-ptest b/meta/recipes-devtools/python/python3-pefile/run-ptest
new file mode 100644
index 0000000000..95ae72306f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pefile/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --ignore=./tests/pefile_test.py
diff --git a/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
new file mode 100644
index 0000000000..e30b362323
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Python PE parsing module"
+DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
+HOMEPAGE = "https://github.com/erocarrera/pefile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+
+inherit setuptools3 ptest
+SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
+           file://run-ptest"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+   install -d ${D}${PTEST_PATH}/tests
+   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+    python3-mmap \
+    python3-netclient \
+    python3-stringold \
+"
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
-- 
2.34.1


