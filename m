Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A67C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:43:06 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.570.1683049383752822526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=VLkx1xen;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-74fc1452fbdso321685585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683049382; x=1685641382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=evD1cNbDtSyUoPkXFEougrVebwF8neqIfsKSzB2kozs=;
        b=VLkx1xenCMXmsfYzXcwJpnt/VREO+dbrWxylJk4lM+CuCZ7d0z9U9pa1izSOd4skIW
         gKEpEIZ7I3OjAuOj25qHIUV7vV1tUF593fAHl4P7CWBdZUiemiStT5nT3b2jOMud2Vwd
         ab7NelhAT4YRRpqBKFh0UA+yzuiNUsdUz/oUPnUNTqjD8luRX8SwINYh1N+I/UYEUeYh
         ECnXxLYU+F7KY0zYzl77Z+u6Lf2XskTg5u0X5syXkpINU4X8fuOSZbT7RHvktbmoRNe3
         lLV7932+Ks39kne7o2+Tdb4dje5O8req6iM0OjrPm38zNoyopt+8f8zmvZzHs3vTTNS3
         iyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683049382; x=1685641382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evD1cNbDtSyUoPkXFEougrVebwF8neqIfsKSzB2kozs=;
        b=bDDcNDMvIOJ4+7Pmr/e+0ZfVZkTsgPKDHAPL/wuz6ZA2BD5UVqwgOqX3693JxqEVT6
         Rl238s5CtYM2xCHXIg3knvX/GaB4jIrhWYRXG+5eyKtEuuLk3Azm9gd16vLUzlb+eQun
         skESAXXNn0KNLikzGccJHEi1TPBlas0wYfqE7TkoSB04jBHCL9CzT2OM0Vr5Y9IZt6iu
         s5RVzwSIAY5N3XlsIcZ/S94NzctV2vO7/FVv9OsSLwvvzKZqBBLqphv0jPlQfUcxG2NO
         5KweY2U7XHHOjbPvRaaOkWufQrbw8GRbsUQ5lJv6HMJcsOEWujp1bwNIe3BCexuarYGd
         vcLw==
X-Gm-Message-State: AC+VfDx9+tsKpRBhzLiUgwhCTrFW2XmcQjy3SZBBB6b0dvQxxd+Dv38p
	98z+XfefTSq5uC6AEfMZYg1VG/fZLEGE6Ov7UIQ=
X-Google-Smtp-Source: ACHHUZ5EQUbCZRrrZ5kdaW9R/jlLZq+5uuoOOnwraGVenHsrvH9UP8IMcyjsPQp/bxeHe1fpUcwzIg==
X-Received: by 2002:a05:6214:485:b0:5ef:8909:9b43 with SMTP id pt5-20020a056214048500b005ef89099b43mr6485328qvb.36.1683049382539;
        Tue, 02 May 2023 10:43:02 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id x20-20020a0ce0d4000000b0061927ddb043sm2787653qvk.80.2023.05.02.10.43.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:43:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-calver: Add recipe
Date: Tue,  2 May 2023 13:43:00 -0400
Message-Id: <20230502174300.2261694-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180763

calver is "a setuptools extension for automatically defining your Python
package version as a calendar version." It is required for
python3-trove-classifiers (another new recipe), which in turn is
required for the upgrade of python3-hatchling from 1.13.0 to work.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2f83132aeb..bd95a13ff6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -56,6 +56,7 @@ PTESTS_FAST = "\
     popt \
     python3-atomicwrites \
     python3-bcrypt \
+    python3-calver \
     python3-hypothesis \
     python3-jinja2 \
     python3-jsonpointer \
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
new file mode 100644
index 0000000000..32b6cfbd42
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Setuptools extension for CalVer package versions"
+HOMEPAGE = "https://github.com/di/calver"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = " \
+    git://github.com/di/calver;branch=master;protocol=https \
+    file://run-ptest \
+"
+SRC_URI[sha256sum] = "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b"
+SRCREV ?= "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
+
+inherit python_setuptools_build_meta ptest
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests ${D}${PTEST_PATH}/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


