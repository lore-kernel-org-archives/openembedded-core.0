Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 4/4] python3-wheel-native: install ${bindir}/wheel
Date: Wed, 23 Feb 2022 14:09:13 -0800
Message-Id: <20220223220913.2057644-4-tim.orling@konsulko.com>
In-Reply-To: <20220223220913.2057644-1-tim.orling@konsulko.com>
References: <20220223220913.2057644-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>

pip install would normally install [project.scripts] to ${D}${bindir}
but our naïve bootstrapping only unzipps the wheel to
${D}${PYTHON_SITEPACKAGES_DIR}. Correct this by creating the equivalent
script in do_install:class-native

[YOCTO #14739]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-wheel_0.37.1.bb               | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
index c7354c9d982..91bff825097 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -18,6 +18,22 @@ do_install:class-native () {
     PYPA_WHEEL="${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
     bbfatal_log "Failed to install"
+
+    # pip install would normally generate [project.scripts] in ${bindir}
+    install -d ${D}/${bindir}
+    cat << EOF >> ${D}/${bindir}/wheel
+#!/bin/sh
+'''exec' ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} "\$0" "\$@"
+' '''
+# -*- coding: utf-8 -*-
+import re
+import sys
+from wheel.cli import main
+if __name__ == '__main__':
+    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
+    sys.exit(main())
+EOF
+    chmod 0755 ${D}${bindir}/wheel
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

