Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF400C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:59 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.822.1637704678792423075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KJxI/We1;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id t11so716693qtw.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZhFNzrCuMTpHsg6HM4paCFGFMMnkAPdTe+ZdSkF8UDc=;
        b=KJxI/We1OPJ8+6CBaaqxkJSWGr06sK61Q6h9HwQg7BZNhG+s3LQL3TM792JZqa0bL7
         muZnYMv+XHa5VOqZcq7bAIfseAPKQhkPxCGWpn3krdR/r6rjoIvyjEDO2nCDd/Csvluk
         CVMJ9zggLZZWwJ5F3ZyHT+IMPMCD87u5rIGgGkkwBNl2ZCBM9HxzZp//AohF9y6XsRAV
         rwU4CALP5VNAb8VDWvwmBY1CNVPwz04n3GfjwOmwvPPNe7DcVlBkPNzbRYfOwgDqm745
         5qE9Lgv63Ri10hOQxep7eDXh4SLldsgi2QWhu6P+MRumXKhBInbfMeNAY6tIG4TzU3i8
         7aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhFNzrCuMTpHsg6HM4paCFGFMMnkAPdTe+ZdSkF8UDc=;
        b=P5KFKQkslDFCUashklS0pPogrKe/7HsaYtKDk/GtU/ff/DBo+QVTPePRzOaN6wORZV
         OuBg0mWBOJ6Ayv13TYV2fUntWpXWIK8yqFeyVH3ttHat+y+SbmDAVggSYWO9HJnXOK8h
         S51eECYrFOtIQv7TcZEV/o4bUtU2Q4myHqcDCHVEwCAbXkjVpsoU3YD4nyImYEaMYoOo
         dUPTymeWySH9oG38Dl3DGE0xEMIsrCtn4ZwdBpbGUpdkL9XMY2zQnQUcsbyuJlwfyv3O
         LJSrd6hbfL0++1SCnNC+VAAcep78KRd5Sw03V0sCOy22HdhOFam/HZMdRXm9tuxuLA5b
         a4yA==
X-Gm-Message-State: AOAM532num4Zqx9oMKOFKG81Faq5KrP0qY8ZA2MUlvGMo+zjIEmqmLp2
	+nNQsUdJtL1SSzI2JMo8Lcs=
X-Google-Smtp-Source: 
 ABdhPJxJ1MX98ocJylibnTvwobg5hGybw8tiWbcklHDyKfowPjNHL9ciTM3Wogfcn6UXtqj6UDfGHQ==
X-Received: by 2002:a05:622a:18e:: with SMTP id
 s14mr868738qtw.203.1637704677951;
        Tue, 23 Nov 2021 13:57:57 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 08/20] python: import jsonpointer from meta-python
Date: Tue, 23 Nov 2021 16:57:35 -0500
Message-Id: 
 <e086515b58d71f9cbecca1c366806feb0105f459.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158629

From: Bruce Ashfield <bruce.ashfield@gmail.com>

required to support python3-json, which is required for python3-dtschema
and device tree checking by the kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-jsonpointer/run-ptest      |  3 +++
 .../python/python3-jsonpointer_2.1.bb         | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer_2.1.bb

diff --git a/meta/recipes-devtools/python/python3-jsonpointer/run-ptest b/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
new file mode 100644
index 0000000000..51e609f4ba
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonpointer/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 tests.py
diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb b/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
new file mode 100644
index 0000000000..fb3d9e0da9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi ptest setuptools3
+
+SRC_URI[sha256sum] = "5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-json \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
+}
-- 
2.19.1


