Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5312AC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.3404.1647298129696842798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZrxBTU2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso426312wms.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysUYpYSNnrbNW1qgGB6MkqdVE2LLO/An/ITo0KznAkY=;
        b=bZrxBTU20XtfwApAFC1GJ0YvcNriEb/gykppYbXW7JkyjndDVPqsqrfHEsrXLwF+Zz
         4ovVXQIgnkM+pr+Wlpd04ii7ZCyJ6tspTTH0pMIxyRiejpW3XkqKh0PYuAc6O/Qh2aH6
         I39Sdsjj3g2rYDv6csd4GPbnzZbrUkPY3hfds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysUYpYSNnrbNW1qgGB6MkqdVE2LLO/An/ITo0KznAkY=;
        b=t3UI5y5Jl93SYIipuJvEO0AbWa/NZ5DoHEA+T8haHdBX6IcZF0Y1lO5+CEPldyLmSG
         KlqJA6DPRzNhhrdW8/bXRI4nScZPR+C8CUHd3lWxecsHyPXbN6i2m2lIJMIl+u1ElQih
         aBZnvYHSZ7fSCqFr9WVU/RhrBvxVD01nhrm/npc3c3czHTRWjpCJeLVPIQoyE+Nb6jK0
         uH50FJIBL8LsUePKQhxfTEyTgQpaCy4ygxTW08u6Imcj8MqPOPfZpx2rcEIoxGEz+OnK
         p7XCcrGMGsWyMS7rbSJZ2mCvMG2jwojMaoOhMWjNW8R3BXKyW53GCgMOAMX0iNEA6vi2
         MZcg==
X-Gm-Message-State: AOAM532UwD4aXoH/TevfaNfuANVHr0eHHM4lM2+OPQkGKh9lXfCDx9Ci
	hD/pT541HUaEDa+P7uKL2+U5pLc64fG2k2IT
X-Google-Smtp-Source: 
 ABdhPJwdce+lqO3lrp5Lt0AFVYCW30vyfYrne0yCHVqaD+IybYoqC7INP+gXnmmtgIBkVNBYXyIqSQ==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr978649wmq.166.1647298127902;
        Mon, 14 Mar 2022 15:48:47 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 10/33] python3-pytz: move from meta-python
Date: Mon, 14 Mar 2022 22:48:14 +0000
Message-Id: <20220314224837.834776-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163176

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pytz/run-ptest             |  3 ++
 .../python/python3-pytz_2021.3.bb             | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytz/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pytz_2021.3.bb

diff --git a/meta/recipes-devtools/python/python3-pytz/run-ptest b/meta/recipes-devtools/python/python3-pytz/run-ptest
new file mode 100644
index 00000000000..b63c4de0d9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytz/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-pytz_2021.3.bb b/meta/recipes-devtools/python/python3-pytz_2021.3.bb
new file mode 100644
index 00000000000..119342a4bd7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytz_2021.3.bb
@@ -0,0 +1,35 @@
+SUMMARY = "World timezone definitions, modern and historical"
+HOMEPAGE = "http://pythonhosted.org/pytz"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI[sha256sum] = "acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326"
+
+RDEPENDS:${PN}:class-target += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
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
+	install -d ${D}${PTEST_PATH}/pytz
+	install -d ${D}${PTEST_PATH}/pytz/tests
+	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
+	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
+
+}
-- 
2.32.0


