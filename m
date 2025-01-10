Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E63E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 15:59:50 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.22249.1736524789496044798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 07:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f2e13cb359so635994eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 07:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524788; x=1737129588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxQS0H9Gj69QxnNBolnhcAVFOlxU1Cmtw6rplEVlkRk=;
        b=oYa1RVjuB+2Dd7T0Os1D9VxbNBKdGiSgyipYzqVLcSITCIAtzG0qRypAwlGpKszSoa
         GJxPlpzXZgcNHPhojL3l8Wm6f7cYsaSfgfYvbBf/mCuwsJ+kMIubt0XtQrn9PzdZ4oKB
         nrnWrIBe+LcMRN31KinVglOsr5/Y0cEla73kJ5aWEWxNSJ5abnHLavhzlS+U5qykgm2z
         goXZlI8vk4Gqt2CP/OtKitUIkPa5Cmjx6eOrLk91+8Ahbpj0TTGRONCmRJiL8kt5Xqb/
         WFq4uHahQ6VBDGUG1tAlXfu5zKQglqhYtmkxPNTD/sC51wicv2jcoETTGV3mPyqCr615
         PbHA==
X-Gm-Message-State: AOJu0YzKK4g9OWJPpO1Jxwno7de5jdaUOsBeKwjv8Lu2e9MIhSuczaIq
	MuBnjyylXxp2VU8YTmtWl5is8acuG/9HoILaNGoPrGAzXkMpJANUOHX7fg==
X-Gm-Gg: ASbGncvRfKlFio9E0M8i55v7Bdq7W3uUxhNLgurATFindpkjtr6deFEOaf2Fy0MhXT3
	SeMhPM54dxAH8U6v65tVtCea3yy6T+HfZsnCHGTb2gbZs0iw+dgarob0WWqTxgOqbTxezKTp95u
	rilwVNUSel9XdV21FkuIZywPMPiQe18C7CTLW7ijDdu/ye+VH74Twkt5d7w3kpSJBcX9YCmmDCx
	qTJ9T6cME2hZMKQ5A7QN1v9o2ZtZ5n8rFF3ISHwJe0glNHR+ViICLB0e14BDo3sQAipQ22g9VC1
	nG1299dZJoZYkkDOja4gihJNKw==
X-Google-Smtp-Source: AGHT+IFPcaEeD9AUQr8JS8jdqpZvXc6SZjRTyjYm4ce6zscQ8ow16RPW3exIGWXR5laRRg1EvVZHmQ==
X-Received: by 2002:a05:6820:c86:b0:5f7:246c:2240 with SMTP id 006d021491bc7-5f73092b617mr6406256eaf.4.1736524787802;
        Fri, 10 Jan 2025 07:59:47 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7231861bf71sm888108a34.52.2025.01.10.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:59:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv3] classes/ptest-python-pytest: simplify python ptest file overriding
Date: Fri, 10 Jan 2025 15:59:29 +0000
Message-Id: <20250110155929.3547418-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 15:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209655

The complexity of overriding files from the bbclass made the behavior at
times hard to follow and predict. This change replaces the default file with a
heredoc equivalent that creates a default file if the user does not provide their
own version of run-ptest in the SRC_URI.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../ptest-python-pytest.bbclass               | 30 +++++++++++--------
 meta/files/ptest-python-pytest/run-ptest      |  3 --
 2 files changed, 18 insertions(+), 15 deletions(-)
 delete mode 100755 meta/files/ptest-python-pytest/run-ptest

diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
index 801079e6ab..0ece83dfc8 100644
--- a/meta/classes-recipe/ptest-python-pytest.bbclass
+++ b/meta/classes-recipe/ptest-python-pytest.bbclass
@@ -6,24 +6,30 @@
 
 inherit ptest
 
-FILESEXTRAPATHS:prepend := "${COREBASE}/meta/files:"
-
-SRC_URI:append = "\
-    file://ptest-python-pytest/run-ptest \
-"
-
 # Overridable configuration for the directory within the source tree
 # containing the pytest files
 PTEST_PYTEST_DIR ?= "tests"
 
 do_install_ptest() {
-	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
-		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
+    # Check if the recipe provides its own version of run-ptest
+    # If nothing exists in the SRC_URI, dynamically create a 
+    # run-test script of "last resort" that has the default
+    # pytest behavior.
+    # 
+    # Users can override this behavior by simply including a
+    # custom script (run-ptest) in the source file list
+	if [ ! -f "${UNPACKDIR}/run-ptest" ]; then
+		cat > ${D}${PTEST_PATH}/run-ptest << EOF
+#!/bin/sh
+pytest --automake
+EOF
+		# Ensure the newly created script has the execute bit set
+		chmod 755 ${D}${PTEST_PATH}/run-ptest
+	fi
+	if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
+		install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
+		cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
 	fi
-    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
-        install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
-        cp -rf ${S}/${PTEST_PYTEST_DIR}/* ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}/
-    fi
 }
 
 FILES:${PN}-ptest:prepend = "${PTEST_PATH}/*"
diff --git a/meta/files/ptest-python-pytest/run-ptest b/meta/files/ptest-python-pytest/run-ptest
deleted file mode 100755
index 8d2017d39c..0000000000
--- a/meta/files/ptest-python-pytest/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
-- 
2.34.1


