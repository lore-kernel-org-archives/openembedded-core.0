Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5493C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:04 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.860.1637704684261792149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kf4svQ3A;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id t6so700213qkg.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FOZUTeR8iOz1V/p6thOneGoDqj1RkoXU+Ln3qFaWdq8=;
        b=Kf4svQ3Aj2ZqQvA3ieJxHlhkLURfr3hw5TT7p5Ohk0aMu1YM4WPwB17I5eutTYjo/i
         hqx8e/ycCnYrRPU5rvrW8c1Cq119fBI9vdpJIBRmmKT8ZNjVFEBtZgPvwygiwec2hXqN
         BKrbXGVqAjMsJDnwROX/p2inczr8Q4kSYVhvonLM4SSxOnKrPFGpXt4q3Q77aDLWXcW+
         oE3L9lmgyEizfvbBWF9ocvxnd98qeLCwZbqBtS9aOSLBuzFHVmk4xs9h1zgGluYcgqNz
         5TlBLKZ560bfMGhVEK70Kf5Xe9XA7bvAjjbWQ6F2HwTIUq30To11TQtj5sOnap2kR+vL
         sKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOZUTeR8iOz1V/p6thOneGoDqj1RkoXU+Ln3qFaWdq8=;
        b=Y0gXEiiV/VPdDhgebUgvDEhzrhNhtSmpA+wiI44LNWaslFF/VV/aNEilxpjXHTcD4x
         5pzjlT+vWHiTeDbnRV9Swrwkb5hZD84tCdT+7g+vClSbv3c3SskQxUoXwvqnfoQh/fjg
         1MnbgPEvpu2ehkGbovuT9fEf1N/7BwEUO3xn/wC3v3jMuAJgOsQO1ksfi8kud/Tb2UR0
         BUcF50x+ZOBKjSFexvhWSjMIcBtQCuZtzWJQV5nfoF6rExCdyCjmb9mIhLb03g65aiM3
         +vmqsOwfbsOUIvdaXydKLDmzTV3mDPNSTOS1W7yVTJ3KYZZwLSs2D0anuEEtYse6kRme
         l2eA==
X-Gm-Message-State: AOAM530Jdk+zeAUo5h8BmMVCHpfOR21qbA/lfn0x6Kzztxu+TtEwQ0X0
	ofeM4O2j+3tytWGO8AhLeVI=
X-Google-Smtp-Source: 
 ABdhPJy6M84gnQI0TY+DbsBvlCR9Lg90q7fIN5ueJjfrH/9oFoVh3amKzad7+LUbRiNmudvAeqdOgQ==
X-Received: by 2002:a37:9244:: with SMTP id u65mr773696qkd.46.1637704683359;
        Tue, 23 Nov 2021 13:58:03 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 13/20] python: import webcolors from meta-python
Date: Tue, 23 Nov 2021 16:57:40 -0500
Message-Id: 
 <d92f02a9d9b23c2563f275d2f785631a327fca90.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158634

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing webcolors, which is a dependency of
python3-jsonschema. These packges are required to support
the validation of kernel device trees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-webcolors/run-ptest        |  3 +++
 .../python/python3-webcolors_1.11.1.bb        | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb

diff --git a/meta/recipes-devtools/python/python3-webcolors/run-ptest b/meta/recipes-devtools/python/python3-webcolors/run-ptest
new file mode 100644
index 0000000000..3385d68939
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-webcolors/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
new file mode 100644
index 0000000000..2ec036ef35
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
+
+SRC_URI[md5sum] = "54d28a7c80b3e4d974ec2fee86768be9"
+SRC_URI[sha256sum] = "76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS:${PN}:class-target = "\
+    ${PYTHON_PN}-stringold \
+"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


