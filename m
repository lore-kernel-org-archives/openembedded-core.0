Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF8BC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:39 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.3995.1637788478265881915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AztnpRnU;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id m17so2642091qvx.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FOZUTeR8iOz1V/p6thOneGoDqj1RkoXU+Ln3qFaWdq8=;
        b=AztnpRnUQjaOWoa+0xNvCU+3dIngqEG/O7HAiiKDymMpwJ6w9BLjZdyiJ5Po/7rLYB
         15hL0IpPSnAWyU8KWOh8ggyZ659W/tD5j4WYsO1f3N6fV4CFjp8gW7vRcbF8OTPitFbC
         e+FRi0W8X07ezSICPDdMwdPlQFDJxp/cMdRFWH68xo3FGddaYw4Naps3f+U2jNprSW5c
         XzzLMfCPUNyqfSTGVmcmGK8IywPzsnTOfNwqP27vjMdUQUuivFFgU5ke0aHvPbFYK1oH
         Wm84NEPK6L7S6zLEDo3nPGo+dtGgcokQeI4amH0KyN1lD+pCVCOeP/QJM7xfT4QL2wAq
         x0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOZUTeR8iOz1V/p6thOneGoDqj1RkoXU+Ln3qFaWdq8=;
        b=Tm9FAwmd6kinr2l1+X5rn+3d3MCD3A021EF9YLKLcSxyq4ojtLcD6IC+CLyX8J59Zr
         9ruKqbEE5I0DDnC3YIevIOyVJ9ZB6hQfgx2fKfbBjJrHBU70BQU96eYi9nnK56jytrPc
         +k6tNF67GGNgxzMJvBO4LFf9KFnOsUsjNWK49TJjKVnlF/c7UzL7G5mj73An3fqy7vXS
         S9l0SQ/nejWE0u6M2YE5UUSjOG1YUmsZliyA4hK0Wa4d0V0XF0sSahRGDQuTs6NGqiJL
         crF+dU5tD3vH0EUD6AiA1WasFMUhTh0DEU5ThiHB+kzzRND7pLMZJ11n+4tA6zoRJBhi
         NzUw==
X-Gm-Message-State: AOAM533BcmOatzOq++B5VgPmTiP9CRX4wjC8lmxUPCjCaylFGYOvoZDI
	e/NUHZlOxY/oEXq/ael5/nM=
X-Google-Smtp-Source: 
 ABdhPJywtCNlCPt7bwJoBEu1E2vNQZoeb5XbDjs/12CeiOunBxRmC8jPlXve4dP2dAug0vEpIhrDGg==
X-Received: by 2002:ad4:5b8f:: with SMTP id 15mr11588372qvp.60.1637788477406;
        Wed, 24 Nov 2021 13:14:37 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 09/20] python: import webcolors from meta-python
Date: Wed, 24 Nov 2021 16:14:15 -0500
Message-Id: 
 <d340e4c4e7ce495785acf852bb106e5ac57fb1ed.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158755

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing webcolors, which is a dependency of
python3-jsonschema. These packges are required to support
the validation of kernel device trees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-webcolors/run-ptest        |  3 +++
 .../python/python3-webcolors_1.11.1.bb        | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb

diff --git a/meta/recipes-devtools/python/python3-webcolors/run-ptest b/meta/recipes-devtools/python/python3-webcolors/run-ptest
new file mode 100644
index 0000000000..3385d68939
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-webcolors/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
new file mode 100644
index 0000000000..2ec036ef35
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
+
+SRC_URI[md5sum] = "54d28a7c80b3e4d974ec2fee86768be9"
+SRC_URI[sha256sum] = "76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS:${PN}:class-target = "\
+    ${PYTHON_PN}-stringold \
+"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


