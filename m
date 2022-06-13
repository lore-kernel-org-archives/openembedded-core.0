Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444E4C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 07:31:15 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3149.1655105472335390357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 00:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25D7UxlI006134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jun 2022 00:30:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Jun 2022 00:30:58 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 13 Jun 2022 00:30:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH v4] python3-cryptography: remove test_x509.py
Date: Mon, 13 Jun 2022 15:30:56 +0800
Message-ID: <20220613073056.1288293-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090604.067b8258@booty>
References: <20220609090604.067b8258@booty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 07:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166832

From: Mingli Yu <mingli.yu@windriver.com>

We already have removed --benchmark-disable option to avoid
adding python3-pytest-benchmark rdepends.

Also remove the case test_x509.py which needs benchmark feature
to avoid below failure:
 file /usr/lib64/python3-cryptography/ptest/tests/bench/test_x509.py, line 9
  def test_aki_public_bytes(benchmark):
 >       fixture 'benchmark' not found
 >       available fixtures: backend, cache, capfd, capfdbinary, caplog, capsys, capsysbinary, disable_rsa_checks, doctesty
 >       use 'pytest --fixtures [testpath]' for help on them.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3-cryptography_37.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
index d7a720bf2b..470cf4388c 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
@@ -104,6 +104,9 @@ do_install_ptest() {
     install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    # remove test_x509.py as it needs benchmark and we don't
+    # want to introduce the benchmark dependency
+    rm -rf ${D}${PTEST_PATH}/tests/bench/test_x509.py
     install -d ${D}${PTEST_PATH}/tests/hazmat
     cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
     cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
-- 
2.25.1


