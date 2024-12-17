Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483F5E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 23:12:21 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.94288.1734477135877831178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 15:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a8c7b02d68so48630585ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 15:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734477134; x=1735081934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np8+fuKY6NfSiGnx2MpEbFfIZqYwPgIW1tjcAyQv0iU=;
        b=loJhr2t40mgYOu3vRkXgY0yusUmHJD1mWvO9BLEzx0dr6UbaKXa7IW/5M7lUSMoAbu
         qKEVwCPs4hwk9WH5vXn14hwBi2Grusr5m3Sl3j6Rj8HF6lTnMKE/fWMY+JBl2iKZo5rw
         c3Re0fYTW5TvJQD5yUMdxwsLnAz7oskRiN6eMK4i6XEHtQybE6L+CvxLdDWDEyGJDqHa
         dTjZJasWfCwx/PmJR7TVkBMWVtvTxZIWirpBRE/byPP1bqBmlMsHyansEM8T1084k9ol
         oEKR47IQ6iLFgxApPDpyQMgGOKFWzazLvH7BEuX60QNm7n0t+A9BuTagdkmt47jToXve
         iFkg==
X-Gm-Message-State: AOJu0YxCgecPgHqb1T/Wr5qVrxQ20U4wXtquomwiUWb/9/3oV2lTa2II
	5CbpUwBegNPm+NQjG0JVMggcxnYaaFTRpTPZxArxuOYAWGxHUn2thBrtzg==
X-Gm-Gg: ASbGncurzFQM9UUIO7YWPQJYK4xW/TkntQDXbK1505kb9gcjbcS2MGdJeetaUemJU/t
	mhHxePhyBzQIFwRJpu5HHQPf8odZ3GxbwL1KmjrEdyWzRzmvvrLK9M4S2Hv5FL3ZGs0Tuxd3ZrR
	9nsaNsjJOzPd0CYce2+PtirTh3AJhfCca6o9dcLwijg6rTobuQ18qXpOrEQm7XdBUeqoF6yUtM4
	2oT4HkqcXg+JBzJFbusN3J6IZPyRqg2kJsPa62b2Fo4JSFe69oOPPBbcTgvQD3RdY7d/6FYUlj4
	PqWKxGx916bqlKh/En+o5D9cow==
X-Google-Smtp-Source: AGHT+IGQ0EstkE5cmlyXefR/Nx4V2OkawQkQbbsV9rGXr4sfAVac2MOrcvvufpNm9l7RXGfVZjatoA==
X-Received: by 2002:a05:6e02:13ae:b0:3a7:e452:db4 with SMTP id e9e14a558f8ab-3bdc437adebmr6906225ab.16.1734477134168;
        Tue, 17 Dec 2024 15:12:14 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e0368817sm1867355173.6.2024.12.17.15.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 15:12:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv2 1/2] classes/ptest-python-pytest: add a new class to consolidate pytest ptest functionality
Date: Tue, 17 Dec 2024 23:12:01 +0000
Message-Id: <20241217231202.3384873-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 23:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208864

A large number of python packages leverage the pytest unit test
framework for their ptest functionality.  Currently, many of the tests
have duplicate code for:
    1. Installing pytest files
    2. Declaring ptest dependencies
    3. Script for executing tests (run-ptes)

To simplify adding common pytest based ptests, added a new class
enabling base functionality.  Users can also override the location of
the pytest files in addition to using their own version of run-ptest

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../ptest-python-pytest.bbclass               | 42 +++++++++++++++++++
 meta/files/ptest-python-pytest/run-ptest      |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
 create mode 100755 meta/files/ptest-python-pytest/run-ptest

diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
new file mode 100644
index 0000000000..89ff10c335
--- /dev/null
+++ b/meta/classes-recipe/ptest-python-pytest.bbclass
@@ -0,0 +1,42 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit ptest
+
+FILESEXTRAPATHS:prepend := "${COREBASE}/meta/files:"
+
+SRC_URI += "file://ptest-python-pytest/run-ptest"
+
+# Overridable configuration for the directory within the source tree
+# containing the pytest files
+PTEST_PYTEST_DIR ?= "/tests"
+
+do_install_ptest_python_pytest() {
+	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
+		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
+	fi
+    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
+        install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
+        cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
+    fi
+}
+
+FILES:${PN}-ptest:prepend = "${PTEST_PATH}/tests/* ${PTEST_PATH}/run-ptest "
+
+RDEPENDS:${PN}-ptest:prepend = "python3-pytest python3-unittest-automake-output"
+
+addtask install_ptest_python_pytest after do_install_ptest_base before do_package
+
+python () {
+    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.setVarFlag('do_install_ptest_python_pytest', 'fakeroot', '1')
+        d.setVarFlag('do_install_ptest_python_pytest', 'umask', '022')
+
+    # Remove all '*ptest_python_pytest' tasks when ptest is not enabled
+    if not(d.getVar('PTEST_ENABLED') == "1"):
+        for i in ['do_install_ptest_python_pytest']:
+            bb.build.deltask(i, d)
+}
diff --git a/meta/files/ptest-python-pytest/run-ptest b/meta/files/ptest-python-pytest/run-ptest
new file mode 100755
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta/files/ptest-python-pytest/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
-- 
2.34.1


