Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7B2E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 22:36:41 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.93610.1734474994119681236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 14:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29e2a50586dso2776684fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 14:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734474993; x=1735079793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np8+fuKY6NfSiGnx2MpEbFfIZqYwPgIW1tjcAyQv0iU=;
        b=BDGqSbIJqgsaEgRIakC4PgzBzSxtXtxUvGYZJ8TuS03meuc32m/UxVLJDwms8U3hit
         85ByHPS3LDRSF54QxwyKFKomQw/DT9r7tACZ6fFpOOqRybJWuDE08H543E+3nJeOg55f
         jXZVyz7h1C8Zx3DVGdwZZhvxyANXZBrtxXvwAEgfTDPrTzdbFQRAcZSf6PSd7cVAbLXI
         U6lnEr9GOy689oDkRZOQjUU3anCHUU7Raz5byqaFTCKDyNAf9ty6CnoDj1NGixpf9Ak9
         cyZ73BsVOosaFZDm98W0IKYy0VhRIp11pf/1TgUU0XTimChoGyAJTlc79TnCIgTIaOOe
         CN6g==
X-Gm-Message-State: AOJu0YyrrG1l5DmLO2iolaR8OaklbSZCfeqz1ROflqYOqQ5c9SZL8O7m
	JV/N0FnmrwfZQylIINhRvS8uewD+K38EKSwlg0CKslDarV7HP6gbNBXhAw==
X-Gm-Gg: ASbGncv2SVh2OVd8iaWt9z6PmRnUnC03wztyYBQGAsA73NXCj/Ym4r/HVqunNUDSe1E
	pzHvVDvxkEUPoF1T8CEfcjX72V5bYpc4zBgMUpJWFU/VJVVNni3XziwBuWtryWOOoxxTHP+E+no
	Wq6RYGakeGznEM4FNpozidSbUTtDvy6vsv8MK7lnTzY2SLH6Vfq1/kRljt315azWdV8y3yuiNlC
	TnhGnR/FIQJQej41clLzdZof8s5GyO7ALOedx1iM9fwzK+iBXzHCXzcq7eFOrDrjZ2ngyLBcxKo
	y1gGc02xI+LoFQs3U1kjHvpNQQ==
X-Google-Smtp-Source: AGHT+IF3Ia6rbK6a3APkLKn5IJEVaNBEx+hZle5tIxmbW/pW5qqJ7D28P9PKoC6s3i95QG53JwjyMA==
X-Received: by 2002:a05:6871:488:b0:2a0:d2d:e60a with SMTP id 586e51a60fabf-2a7b343b353mr269239fac.43.1734474992636;
        Tue, 17 Dec 2024 14:36:32 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a3d24aebefsm3155333fac.3.2024.12.17.14.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 14:36:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCH 1/2] classes/ptest-python-pytest: add a new class to consolidate ptest functionality for python pytest based tests
Date: Tue, 17 Dec 2024 22:36:04 +0000
Message-Id: <20241217223605.3383795-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 22:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208859

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


