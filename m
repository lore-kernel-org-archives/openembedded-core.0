Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7927C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 16:27:35 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.76030.1680539253730209522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 09:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C1bPV5fc;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id o2so28578231plg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680539253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/ttKAmXu9ttUx84vlsPNAYFuGQ69AVOFesjYW02XxQ=;
        b=C1bPV5fcnPn8GCPjbYlTg6FlXDB53SWbE6dzb3ErIe8+kn975z7vn5pZKkhLYfT1iS
         IVoj9ows6nhrecvdylCBQBBZz+EhJqv8mpEVo04HTncdosBSYql48/BDsqH8XXB0L8Ju
         vLwExURhx83gbTLv3tKXSwLXVCvNWg1okQaCtAbUxzQbabjtlzUP7Vw+XMFDu54liKBp
         GM24WG6dHExU/PQxJmtqO44VIW/KGHJpkSJZan50Og1ooXCTvN2yFy1szgZc1OwLTpKB
         lkW9dzFSGu2o1spEhPSz2V6FoFMKFvMP0Fg0yfXmXrhkv2l42ewWMIffpmEQFi+0DIea
         KYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/ttKAmXu9ttUx84vlsPNAYFuGQ69AVOFesjYW02XxQ=;
        b=Xj3xS3Jzu3d5LbvDaFKa0AjnvRdyTBKHg4hzQMhgdlTJAWoGQTLOpaCQX5TPPRvPKK
         fCn56BJ13LKj1Ktp6LsR7t6eN/dzcVKggYEb3AV6kW17LjoVgKEqyQ5fs353UaVvusLf
         0hLehzVI/4zDqi/e1G/+biAkarjbCLakdrEMQ0yAdPgHnHcoOWYiAst5wwtVeLCoE6S6
         7GDjdHuZ8XPm2TLRsgq9tGR2i5Pv5OrInO+cBKl5SxDC7iG7HCopay5B/3Brm1KHv3lD
         8cwUq+9qfosE005MNY1t8SBN6nGhF8GaJm0ePJR+EJ1H4dqjCSVDCe+nALZIUX0kG6Wk
         jL8A==
X-Gm-Message-State: AAQBX9crIFZx6Dv9H3oExk7FyCOitqlwEfacWPyk6ZlF5brRer6okmV/
	blH/B/XUFv8VMuM1/Ok7/8JGslF5V1s=
X-Google-Smtp-Source: AKy350aTHRfbdsSvpa6Daa3/sPpPzaMXRKY5A6nz9/htHWNAyVtG4ip7OGNuXXhmkCCw6eQRjhekJQ==
X-Received: by 2002:a17:90b:1c03:b0:240:883:8ff8 with SMTP id oc3-20020a17090b1c0300b0024008838ff8mr43366430pjb.3.1680539253014;
        Mon, 03 Apr 2023 09:27:33 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c2d:7ffa:2ced:a026:9258:b967])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090a804500b00240d4521958sm6449285pjw.18.2023.04.03.09.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 09:27:32 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Anuj Chougule <Anuj.Chougule@kpit.com>
Subject: [meta][kirkstone][PATCH] json-c: Add ptest
Date: Mon,  3 Apr 2023 21:57:23 +0530
Message-Id: <20230403162723.695380-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 16:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179645

From: Anuj Chougule <Anuj.Chougule@kpit.com>

Re-used implicit test suite and converted it into ptest.

Signed-off-by: pawan <badganchipv@gmail.com>
---
 meta/recipes-devtools/json-c/json-c/run-ptest | 14 +++++++++++++
 meta/recipes-devtools/json-c/json-c_0.15.bb   | 21 ++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest

diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-devtools/json-c/json-c/run-ptest
new file mode 100644
index 0000000000..570aac4588
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+set -eux
+cd tests
+for t in test1 test2 test4
+do
+    echo "Running $t.test..."
+    if "./$t.test"
+    then
+        echo "PASS:$t"
+    else
+        echo "FAIL:$t"
+    fi
+done
diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index a4673a2f0e..4070078089 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
-
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
@@ -13,6 +14,20 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-inherit cmake
+inherit cmake ptest
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-ptest += "bash"
+
+do_compile_ptest() {
+        oe_runmake -C tests test1 test2 test4
+}
+
+do_install_ptest() {
+    mkdir "${D}${PTEST_PATH}/tests"
+    for t in test1 test2 test4; do
+        cp "${S}/tests/$t"* "${D}${PTEST_PATH}/tests/"
+    done
+    cp "${S}/tests/test-defs.sh" "${D}${PTEST_PATH}/tests/"
+}
-- 
2.38.1


