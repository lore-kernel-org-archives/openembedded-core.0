Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2433C7EE2C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:51:30 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.2934.1683312684010338514
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ZNHkZQkz;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-61b58779b93so19597196d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683312683; x=1685904683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZdyBzBPP3IlumVZZaVtqzK/Jv9hRCu0BuoXrDzXSgc=;
        b=ZNHkZQkzTzrUcG8OFHcfIFXP3moL15AC6N+jCl68VK8WVTRSVhhWI2uuXz2aiHTcdx
         HU6WFQ1/kAy7gtGMafh1tTHXBbxqczCnDlo+xGhzIC5eIPA1i9JGZeT9G+cmMOmI3equ
         t6vH7+oOEERbVwu+mo4qQhlpEz5g/bHdlmG8LOo8nDjGftVlyURlmcNt7aak7DMrQtHN
         R8l0Q2XoodVQwejbhoKdj4CbT2CZI6g4S13mMpVMY9AsjRTJvuh8IW8E6n7BuRMOQAfY
         uiTM4ak0dfdrzXUvlwoIGLqv7qTar4pqpF2QOsqx2ZYDiZcqToh8o/CElLjaJFiiTsIZ
         qZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312683; x=1685904683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZdyBzBPP3IlumVZZaVtqzK/Jv9hRCu0BuoXrDzXSgc=;
        b=K66XGzgtVGpi5HljpchgMtqz9k/e6c3NC4aCRvk/VGg6ViOaPWup94OzO2MiBKeC7g
         8jMmHZccbnvg3T38kZF8RvETQrxnepx9H66FYFLIc3rtpvjk3cLhL1PFCYjfd4p8kU1E
         yRjw/P5CRKaC18inP2ex6NUAXmGry059+LEw3GQiK0CZEQa1DBw/3bap4zDaADXVrJuF
         0DzKpfNYZJ8jGzZaqmmR8GtEnzj1ZGbWAGXWabwZOS/AQ5e2Tc1cinPjskzRDM8O97mL
         k6zc6K4kEI4APy69l+IsCZCcpTIBGtGS3uedvBlofMUXDmjQwaq+qElMfBVUFXkgVaFU
         i1ZA==
X-Gm-Message-State: AC+VfDxrb3cyS7pD3GKSEm6ODPL5zB3sOppxL/pmmfhGjeSbV/ybV3wm
	RnuxppnFprI3PYiV3Sj8woN6n6OfNEv6G7zPs2XzTw==
X-Google-Smtp-Source: ACHHUZ6/1qKSHHGoGdlBl4PeirSnhMMIfe9fFpgxUed7WCEcohsUHfuCfkfjZhhxhVkRFEMmMusokQ==
X-Received: by 2002:a05:6214:2623:b0:618:5828:a97f with SMTP id gv3-20020a056214262300b006185828a97fmr4115826qvb.22.1683312682908;
        Fri, 05 May 2023 11:51:22 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id b8-20020a05620a118800b007465ee178a3sm765863qkk.96.2023.05.05.11.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 11:51:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v5] python3-calver: Add recipe
Date: Fri,  5 May 2023 14:51:20 -0400
Message-Id: <20230505185121.2063085-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180968

calver is "a setuptools extension for automatically defining your Python
package version as a calendar version." It is required for
python3-trove-classifiers (another new recipe), which in turn is
required for the upgrade of python3-hatchling from 1.13.0 to work.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v5 moves these revision notes to the correct place.
v4 adds the run-ptest script and adds maintainer info.
v3 clarifies that the recipe now includes ptests, where v2 didn't make
this clear and v1 didn't have them at all.

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


