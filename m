Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B95FE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 20:30:46 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.2476.1736281842211093529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 12:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e2bb84fe3so8360121a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 12:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736281841; x=1736886641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEXvJZ3DE3KEYWWQoLer5HVjKA2v7rVsJxYUePDMzPo=;
        b=Rf1w18268b2Pxx8vbICtspIR4Knp3rtNlIU9UDGVHKPOz4C026CBjCn3gY+yOdmdzK
         u/8FqMmnxRsp+nQLDjnZSTIPRKXSfahdXOt3dmH5Wk5jVYOelkbkX1EJa2Pzl0vJdUqv
         vdTVf3eMCLclnnD0+S6YjbWXECU4+gCxbzaPxjzEpV8ENDOHVAwvMc5GNjp4cLqf38Ll
         7ueX1uTyehPWSzhSxhrGWit1fLmGOhhLUWW+1V87MoeFAm1CjFjKgZC4IslGHn/a7TMd
         40uM7IV5PbxM7ZvjM2OGEqjTfzmqC7jGkqjPKzwMzzpl6ICV5Lj82r7+tQIlt6m3sKka
         km5A==
X-Gm-Message-State: AOJu0Yx5cs2Q4ya4eUlmLI03Pg01Id3Oup0acBURKOrBxNW0KuXPQOzV
	Cxqn+cqMbxeITerH61YBfP7KlGBh9Ahf6OrNrf7cVooHUyaGz92vKTujCFkH
X-Gm-Gg: ASbGncuin39ZOl2Nsx4BNfQ1lr/UKc+8MikpXsO2nyVV0ptG01LxO7yssdrZGNY6abp
	MIDioa8b9nL90o666CnQ7NPxiAm5vb3GJPH5v7bicM54mXtkkCj3k0TPXcEPwiREm2Ftk0LhBc4
	agAKRfRxFlOXi0nEEckmqWcqeGTwlJfrCjKLHEAwkaCbJ2nWeSgIj/dv5pVRHHp11nQpaV+90Pg
	6OXjIt5Jhe+KWxTBstZ9dpez5HaVexdmgtydXUZ4AbxCEWiHulakfhvfV6omCH5fJSjWzNINN4t
	RCDVmwgm2yvZ16IfRz5peWa6Sw==
X-Google-Smtp-Source: AGHT+IEQ2/pXodYk/nn0h4CiwD/AE7PEOvCaHVWv+RtYpvpjB8IxxvaAK1tvNi5TEqDnI1269cmEEw==
X-Received: by 2002:a05:6871:200b:b0:297:26a9:32ef with SMTP id 586e51a60fabf-2aa0690ea6emr165450fac.33.1736281840601;
        Tue, 07 Jan 2025 12:30:40 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d7454102sm12706701fac.1.2025.01.07.12.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:30:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCH] classes/ptest-python-pytest: simplify python ptest file overriding
Date: Tue,  7 Jan 2025 20:30:09 +0000
Message-Id: <20250107203009.3251029-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 20:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209503

The complexity of overriding files from the bbclass made the behavior at
times hard to follow. This change replaces the default file with a
heredoc equivalent that creates a default file if the user does not provide their
own version of run-ptest.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/classes-recipe/ptest-python-pytest.bbclass | 12 +++++-------
 meta/files/ptest-python-pytest/run-ptest        |  3 ---
 2 files changed, 5 insertions(+), 10 deletions(-)
 delete mode 100755 meta/files/ptest-python-pytest/run-ptest

diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/classes-recipe/ptest-python-pytest.bbclass
index 801079e6ab..7ed84584b7 100644
--- a/meta/classes-recipe/ptest-python-pytest.bbclass
+++ b/meta/classes-recipe/ptest-python-pytest.bbclass
@@ -6,19 +6,17 @@
 
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
 	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
-		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}
+		cat > ${D}${PTEST_PATH}/run-ptest << EOF
+#!/bin/sh
+pytest --automake
+EOF
+
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


