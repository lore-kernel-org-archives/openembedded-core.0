Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F75CC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.3405.1647298131093531070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MalAsYu1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so415799wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ztMLaZIxcZY7JNf6Vq0LP0wIjTwOwhhv96gCXT76/FQ=;
        b=MalAsYu1+dUSnxhhPuwG+rJ2BqXZt3cWdv/TYsVQZhSsxwewc9nKnIs9+e69VinN+2
         ntItLVtL5/oGvjvGdqkv22HpSvSZ3p2mycMajAjzveLApnzJ+dUwkmyqdyycbtfHCIPO
         LaEfTCeuAq327QsbqLYDJUkA+/Dr7yBlAS8zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ztMLaZIxcZY7JNf6Vq0LP0wIjTwOwhhv96gCXT76/FQ=;
        b=ci4qyk5uS9hfe04boclJemavRZOWZ/9tl5EYsAuOqF+pKc/gxhQUD5Au9cnF7EvP4h
         fo0Mijsz8ZF0IOBC6Lvy//J1GtXdtx+I3raz7RlXeP97OHgZsIEq2UQNHUJKBRr2F4PK
         MogJLfyKzocLWs+k51eEKvOTGzc4fFLo/SBCHQYbHFoIKPrDBYLTmwNDDp+O/to4/H2h
         UFZkkYi8av8zR/jvaBCSBiWRZ/Wam5czO/h8+DTQazCe/E5K9lRRIq0OcaUJMhLNQ0/h
         kM0HYTzWXA1SeK1S6qVtGfarRabT9Lty9Of4txR0syQCYQSRbRGVnpotCFVPfGAerc6W
         G/ZQ==
X-Gm-Message-State: AOAM533LNic5bjh7Y21n58AQyJHK7bhyoCUjZGcwYcHQhIIt/zW/HxW2
	svMDNGbChOd6WfvtUtZvHEiNsae0JpPibvii
X-Google-Smtp-Source: 
 ABdhPJzfjGWMz+iDZx7te3vvrh+h5u3rb/AZT9WlSOw1dnJ8deOIGeyxJx5J/5KtgZA0vqsr6hkuAQ==
X-Received: by 2002:a7b:c256:0:b0:389:d7f7:fbc3 with SMTP id
 b22-20020a7bc256000000b00389d7f7fbc3mr985192wmj.154.1647298129468;
        Mon, 14 Mar 2022 15:48:49 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 11/33] python3-bcrypt: move from meta-python
Date: Mon, 14 Mar 2022 22:48:15 +0000
Message-Id: <20220314224837.834776-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163177

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-bcrypt/run-ptest           |  3 ++
 .../python/python3-bcrypt_3.2.0.bb            | 30 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-bcrypt/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-bcrypt/run-ptest b/meta/recipes-devtools/python/python3-bcrypt/run-ptest
new file mode 100644
index 00000000000..b63c4de0d9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-bcrypt/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
new file mode 100644
index 00000000000..92a6a0d8c5f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Modern password hashing for your software and your servers."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
+
+DEPENDS += "${PYTHON_PN}-cffi-native"
+
+SRC_URI[md5sum] = "fe31390dab603728f756cd3d6830c80a"
+SRC_URI[sha256sum] = "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
+
+inherit pypi setuptools_build_meta ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN}:class-target += "\
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-six \
+"
-- 
2.32.0


