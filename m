Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F69E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 18:38:33 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.28345.1736361508859455426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 10:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844ce213af6so2059639f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736361507; x=1736966307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6v6rkMKZSi2H/S9ufdlENRmoWqLKh7KF+vWaE5h4X0o=;
        b=CSqMFmBpFfTPMcgs1FS0a03JrXMQ5z9N3f/F/BfCqAwF6Kq0zidSAhks9VWxFLZO0E
         lZBqharwYtsGDkAtZueUEK+63gkRechS3K3nkF82EjslC4VQHSOWK5xxkWdiPtfv0qal
         Ne0FU3EdLiGhUC20dok+Mp8WUo5YFoOQPz4DW7zCWpX6A8yDYX1nJ3Nbv36RH6x3cjDh
         zN1zLyxohCtQVknk8RJiHZdeGeprUgttRUkgQyDvgjoYnY796CqSho9w4lcsFP5Mc8W3
         J090RwK00iV16CBiX3mUyQrqG2Jgr45y6HV8bsLCTMlSSBBJwXSe9abopEajwjzaTwG0
         uYIQ==
X-Gm-Message-State: AOJu0Yx8aRXZf907+11xY1nGmzlhdoWQY6g7EpkUYRJ1sXM//FJZVejZ
	vQ/m4q2Wa7IRQlBp1UnfbFcMqRDEeIUTpDMPmQyQNkmiiDmRIxIUTEg26Lod
X-Gm-Gg: ASbGncvYk+Zoxr2YbvSYc2zgz4KIGTeY3GEvijuaULMmOZrqb9dyC+LhKtFBNlcuP7C
	PcXiObkI7dlzLwzzNgDguPF6QOtQeEphpy69rO9VSWEF+/19Pln+UbSCQJ35I73Lp1CUbNwz78o
	OsJEwhFzELxJvzjIt5FpY/WbEe340KS+T39KRnLxVyzz2txrO0VbvtobeXj/rHi4JbruWQ5L/Ux
	8lRg6W1hktmKpaQG5gN8qUvKlS4zjA7w9eESewfpN6RR9dSr9ccQ3TbTTwDj6WtciOus2mjHnZq
	I3BrnKUAmgzrkcqI7E9hYHfeBQ==
X-Google-Smtp-Source: AGHT+IFnvfgpj//Hv2L82p8acyl/p+Addj1aEgirxO6xHAPINkdEucjxCImOjAYQLNrJCQbh8ws9+g==
X-Received: by 2002:a92:cdab:0:b0:3a7:c5b1:a55c with SMTP id e9e14a558f8ab-3ce3a8936efmr30763325ab.0.1736361507432;
        Wed, 08 Jan 2025 10:38:27 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3cdcf05aed2sm28603695ab.59.2025.01.08.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 10:38:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv2] classes/ptest-python-pytest: simplify python ptest file overriding
Date: Wed,  8 Jan 2025 18:38:10 +0000
Message-Id: <20250108183810.3413047-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 18:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209589

The complexity of overriding files from the bbclass made the behavior at
times hard to follow and predict. This change replaces the default file with a
heredoc equivalent that creates a default file if the user does not provide their
own version of run-ptest in the SRC_URI.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../ptest-python-pytest.bbclass               | 22 ++++++++++++-------
 meta/files/ptest-python-pytest/run-ptest      |  3 ---
 2 files changed, 14 insertions(+), 11 deletions(-)
 delete mode 100755 meta/files/ptest-python-pytest/run-ptest

diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
index 801079e6ab..398a238300 100644
--- a/meta/classes-recipe/ptest-python-pytest.bbclass
+++ b/meta/classes-recipe/ptest-python-pytest.bbclass
@@ -6,19 +6,25 @@
 
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
+	if [ ! -f "${UNPACKDIR}${PTEST_PATH}/run-ptest" ]; then
+		cat > ${D}${PTEST_PATH}/run-ptest << EOF
+#!/bin/sh
+pytest --automake
+EOF
+        # Ensure the newly created script has the execute bit set
+        chmod 755 ${D}${PTEST_PATH}/run-ptest
 	fi
     if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
         install -d ${D}${PTEST_PATH}/${PTEST_PYTEST_DIR}
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


