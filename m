Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 1/4] python3-pip-native: install scripts in ${bindir}
Date: Wed, 23 Feb 2022 14:09:10 -0800
Message-Id: <20220223220913.2057644-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>

The naïve approach of simply unzipping the built wheel is not
sufficient. 'pip install' would normally have created the
[console_scripts] from entry-points.txt in ${D}${bindir}.

For bootstrapping purposes, hardcode the scripts and install them into
${D}${bindir}. Skip the ${bindir}/pip variant.

[YOCTO #14739]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pip_22.0.3.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 482a210ee99..5a77cb72d70 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -23,6 +23,23 @@ do_install:class-native() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
     bbfatal_log "Failed to unzip wheel: ${PYPA_WHEEL}. Check the logs."
+
+    # pip install would normally generate [console_scripts] in ${bindir}
+    install -d ${D}/${bindir}
+    # We will skip the ${bindir}/pip variant as we would just remove it in the do_install:append
+    cat << EOF >> ${D}/${bindir}/pip3 | tee ${D}/${bindir}/pip${PYTHON_BASEVERSION}
+#!/bin/sh
+'''exec' ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} "\$0" "\$@"
+' '''
+# -*- coding: utf-8 -*-
+import re
+import sys
+from pip._internal.cli.main import main
+if __name__ == '__main__':
+    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
+    sys.exit(main())
+EOF
+    chmod 0755 ${D}${bindir}/pip3 ${D}${bindir}/pip${PYTHON_BASEVERSION}
 }
 
 do_install:append() {
-- 
2.30.2

