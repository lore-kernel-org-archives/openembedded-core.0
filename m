Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80759C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 15:49:53 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.36562.1683647389582767631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 08:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=SLVUepPG;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7576516c81fso345984985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683647388; x=1686239388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGMd6vsJ/hVV9NvWbvf6a88YakvX6wGKi06cvLxg5NA=;
        b=SLVUepPGbz4puRRkUrZhW9CxxB8L8p/fHASPBw/6q/axnu4OFAl4eDqJMJAhnU7UQL
         CvMFaI/8hjDAiZnHyGsHgevdFu9LaYoJmv+xSo7fCHlRvzAmaDaiS2JJSo2D+lo1UI1J
         IC47IXmnYXDfihfzWXfrQFj0+kmGFdJe2xb6mYs8Kd7aZYngO7V2Hu4Hmy1hD/UMcbg7
         UH4kgnpuxk3XYgFlq9XSP2ul85XOQ2KNQS0X4BqSE4BiU6tKA1TjK1IHd71AKdRwzoDb
         y1/HJ2f2C488/bYZr83uMcZca3P5e9lzfjFsc5LT4ouQLjgOVjs29lWpW2mVz5+FX5JD
         3vBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683647388; x=1686239388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGMd6vsJ/hVV9NvWbvf6a88YakvX6wGKi06cvLxg5NA=;
        b=CkY/t4OupT98a/bY7OJBjjHIf5q2HVTsHU8tYRwYAp1qUaND66iI5Y61hAsQBrYjYv
         xsnviH/7cULtOWU5Ty1PKWUm5GyJD/SaRJW5fCWOtIo36vmH0St/eeUTZHhxNII5WF8a
         qeqAcyZ1bjVinvg9VmV+NN+ixTfnujdsRW9wHIq484QpBZcu9DYUA9co7a72i0BCEtHA
         Ns2Zu/aE9JXc09pI96wxMm0IyzXjEbkEt78MGOSg6XZTCm0+N79L8xj9OIrigGYOVv7C
         4s4o/kc5mWWDXY1RvvoBi2epnV/FbtGKu7aY5VZB2UpP9t6S9WeIdVqbrw0vYqIvlexg
         UI6A==
X-Gm-Message-State: AC+VfDxaj1TGbGN6nNEk6e/Bh9P98rgApIwdbxAORFLSFDWa5QUgRy+e
	I0rNR49dxD3Hq3kWza8nMNEoWk4gaDuUbVFG71Ii+Q==
X-Google-Smtp-Source: ACHHUZ7ZnR7GVhPds3u/aebHwXe01TLMljZzV6dm0Bw3XacLsjSNpt0yAz1v2p/mx3Sflcnv8V5q7A==
X-Received: by 2002:a05:622a:1441:b0:3ef:4b16:6df4 with SMTP id v1-20020a05622a144100b003ef4b166df4mr20443397qtx.29.1683647388056;
        Tue, 09 May 2023 08:49:48 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id p19-20020ac87413000000b003e64303bd2dsm581837qtq.63.2023.05.09.08.49.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:49:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6] python3-calver: Add recipe
Date: Tue,  9 May 2023 11:49:46 -0400
Message-Id: <20230509154946.3090692-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181045

calver is "a setuptools extension for automatically defining your Python
package version as a calendar version." It is required for
python3-trove-classifiers (another new recipe), which in turn is
required for the upgrade of python3-hatchling from 1.13.0 to work.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

v6 addresses reproducibility by patching the source code, and fixes 
issues with that were missed from previous reviews.
v5 moves these revision notes to the correct place.
v4 adds the run-ptest script and adds maintainer info.
v3 clarifies that the recipe now includes ptests, where v2 didn't make
this clear and v1 didn't have them at all.
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../0001-setup.py-hard-code-version.patch     | 32 +++++++++++++++++++
 .../python/python3-calver/run-ptest           |  3 ++
 .../python/python3-calver_2022.6.26.bb        | 29 +++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
 create mode 100644 meta/recipes-devtools/python/python3-calver/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e24d8545ba..0ee465fe1f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -607,6 +607,7 @@ RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com>"
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
diff --git a/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
new file mode 100644
index 0000000000..43f8a78ef0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-calver/0001-setup.py-hard-code-version.patch
@@ -0,0 +1,32 @@
+From 390a233ed969f82b2ef209b23bfb523e785603f9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 9 May 2023 10:19:41 -0400
+Subject: [PATCH] setup.py: hard-code version
+
+setup.py is pulling the build version from the current date rather than
+a release tag or other predictable method, causing reproducibility 
+issues in builds. Patch this to make reproducible builds work while
+discussing this with upstream maintainer (or developing a patch that can
+make calver rely on a more standard pyproject.toml solution).
+
+Upstream-Status: Inappropriate (configuration)
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 73f6b10..2e27cf1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -42,5 +42,5 @@ setup(
+             "use_calver = calver.integration:version",
+         ],
+     },
+-    version=calver_version(True),
++    version=calver_version("2022.6.26"),
+ )
+-- 
+2.40.0
+
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
index 0000000000..e564515176
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Setuptools extension for CalVer package versions"
+HOMEPAGE = "https://github.com/di/calver"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = " \
+    git://github.com/di/calver;branch=master;protocol=https \
+    file://run-ptest \
+    file://0001-setup.py-hard-code-version.patch \
+"
+SRC_URI[sha256sum] = "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b"
+SRCREV = "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
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
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests ${D}${PTEST_PATH}/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


