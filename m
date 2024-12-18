Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9DFE77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 18:06:06 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.111995.1734545165862138100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 10:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so36325539f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 10:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734545164; x=1735149964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy2UgXhKQvkSsZacgTUQwN4pAUccUOSao/tgeOJ6LfY=;
        b=ZNYAo1N4md2ZTPNU0soVtzUbADZTLSMaQBL8poafOayvBt0kBqb4MH4XZygn2gL6mr
         CxkEN86iBLPHmiRX4AULicpj7bUFUWVTwuEArYrONu9iztkqd0r0DLiZuLTClPPNWjtg
         8fXwiMeBus6H7uID00I3tE8kyrXds5NL/QGUCnTqItX1cE2wq1HM4Fuqu4AIR/ISHtB5
         U2JwlpkIPODqhjC5TH2coGR8VUASFWjrNhj/Ry03npLIjWvEtngd6g2jptf7gHLQ+Mdn
         scr/IEMZIoQYOITG4NS5XSoWNNHVxQ6hMAW7fWuag9EWrB39U3HXY4fT2QXis20mOqcU
         NN4w==
X-Gm-Message-State: AOJu0YyCcsSMrIc1M18lusAJG1pTAhwO0+6qii7ZnDYLV4tvINWT4afA
	xfG925FbEltWcPbo40ietksVSnqQOMkYSidhOTK7fDz9pwJMp9NZeWRaMw==
X-Gm-Gg: ASbGncsHQvRW/Ka5fZsjAPW/JMVtlaI+YHighwTmm10wPd3nR/kbOS6+mZJGsF+4jzF
	pWt6rvLIv6IFxWc1OuhJ67ge3In2uoSK8anxPvQmKRN75Zu+onUMomdVhf03UmZFgWFFpdMbYrW
	331dFbFrhN9ncUYKzj9R20rod6yGfTlF1hhS6T8QwF/hby9dDmaY9JzR2TeBenbULwIdZRnS93C
	M/7NWqy34l3VOEGg9evepdO13ay/dda8QDvG2lOWHu7/T2DDyPrzxdz0EfeSDx4D4ZQ36fKE4MR
	rwPJJG8ZbPHMzQ/Ouwkwfssy8A==
X-Google-Smtp-Source: AGHT+IGQPxiVPuiXe8zuuLmqBLAon2oSetvebxZ8aNrXMVYBZ0EtXbKY/1+cMwuv4eMxl5Tz6lAvww==
X-Received: by 2002:a5e:dc48:0:b0:83a:943d:a280 with SMTP id ca18e2360f4ac-849885adfbemr25712439f.1.1734545164172;
        Wed, 18 Dec 2024 10:06:04 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a353fsm2348400173.97.2024.12.18.10.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:06:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv3 1/2] classes/ptest-python-pytest: add a new class to consolidate pytest ptest functionality
Date: Wed, 18 Dec 2024 18:05:47 +0000
Message-Id: <20241218180548.3539070-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 18:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208876

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
 .../ptest-python-pytest.bbclass               | 31 +++++++++++++++++++
 meta/files/ptest-python-pytest/run-ptest      |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
 create mode 100755 meta/files/ptest-python-pytest/run-ptest

diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
new file mode 100644
index 0000000000..801079e6ab
--- /dev/null
+++ b/meta/classes-recipe/ptest-python-pytest.bbclass
@@ -0,0 +1,31 @@
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
+SRC_URI:append = "\
+    file://ptest-python-pytest/run-ptest \
+"
+
+# Overridable configuration for the directory within the source tree
+# containing the pytest files
+PTEST_PYTEST_DIR ?= "tests"
+
+do_install_ptest() {
+	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
+		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
+	fi
+    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
+        install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
+        cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
+    fi
+}
+
+FILES:${PN}-ptest:prepend = "${PTEST_PATH}/*"
+
+RDEPENDS:${PN}-ptest:prepend = "python3-pytest python3-unittest-automake-output"
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


