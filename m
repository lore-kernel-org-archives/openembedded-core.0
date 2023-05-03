Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B4EC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:35:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.17820.1683117302323754005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hdFipCja;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-74e13e46cb9so226223085a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683117301; x=1685709301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=raMMb+5BZ6g5q0mGdcyjmefDDd37TZesV8TzCH7jsM8=;
        b=hdFipCjaM0rSidUejYcs7ofoz+VLFd2Ru8p6Lyxf73iBsRfpISXpHcDZBWJUVnuVXb
         SRqcdg5UgvRdvlIcmEi+lqqZCc+SwEJAwrJ/+/DL/GzfBTQVCZV1lZkynKB0JopndnuK
         dZtWhC0c5g/OrCQDwX0gVeil82z/1J/5gDg0YxjZjpmTYCvtjtyOtfbPFq+bSOoR3Wlp
         PqE3i5zsWyG9stN9Fcyqbv9rJlwLOhpkOU1REM09X7PyaCQJst3H1KefmY2APu3afwmX
         K6WEpTiLzddo7YQfsYgF6/bZ+MZQjYYGQW7fJcDC8+MuPkW6XR/aOB8Dv7pjegRwkW+L
         VWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683117301; x=1685709301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raMMb+5BZ6g5q0mGdcyjmefDDd37TZesV8TzCH7jsM8=;
        b=X9+lWTi4JKtxzK07Wc0bDjrh6Bvx5qHqSmq2h5C10xJHqlchdkWavNi71ku/iKKO72
         3XS34g2yGxkHdYXVSUJ9GxL/aMykAZaUxR0QMwowac1TBnmSg9GCAjNRU8ehVo/Flqpx
         Cnq6+TUD4DvHTFgFyZv5GVIYJ9rMSHKUBQO15dr3tKBNlAWyttunCVwyWB0hRDQGBVpI
         99teiA7swiA+XNJt+XDtlYmxIK1tNO6YwHN4dKlY309tpovPOYzeO0MmPkJ5a9KEbXBK
         YDUgiJsFdPeyr1Da0WuwXykWAFifMwZrmXZ4bnQwqf6gd5OLCTsfseZTIG6stDf7uvDp
         7vDw==
X-Gm-Message-State: AC+VfDwZBKZbXpcSwfrBf8sOZpfOFqYEt+ivN3891SvYPJiBJRF9YT4i
	zKtPP1t54vRx20BJyVJ7wALQ5jwZTelHm4xHfPI=
X-Google-Smtp-Source: ACHHUZ6IrzX8/QtI4YIWoq6YORw4uAYqBs5Xu8YTIg3or8PRh7icYYhnis/DQhV9w3pqeMXpI9vPLw==
X-Received: by 2002:ad4:5967:0:b0:615:a18b:d5af with SMTP id eq7-20020ad45967000000b00615a18bd5afmr8408105qvb.35.1683117300866;
        Wed, 03 May 2023 05:35:00 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id f16-20020a0ccc90000000b005ef6557834fsm10249651qvl.62.2023.05.03.05.35.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 05:35:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v4] python3-calver: Add recipe
Date: Wed,  3 May 2023 08:34:59 -0400
Message-Id: <20230503123459.2804087-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180814

calver is "a setuptools extension for automatically defining your Python
package version as a calendar version." It is required for
python3-trove-classifiers (another new recipe), which in turn is
required for the upgrade of python3-hatchling from 1.13.0 to work.

v4 adds the missing run-ptest script and adds maintainer info.

v3 clarifies that the recipe now includes ptests, where v2 didn't make
this clear and v1 didn't have them at all.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-calver/run-ptest           |  3 ++
 .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-calver/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdf..4853a905ef 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -603,6 +603,7 @@ RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-babel = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-bcrypt = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-build = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-calver = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-certifi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
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
diff --git a/meta/recipes-devtools/python/python3-calver/run-ptest b/meta/recipes-devtools/python/python3-calver/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-calver/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
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


