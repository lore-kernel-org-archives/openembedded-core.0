Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBDFC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 10:22:22 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.5504.1652782940845964812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 03:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24HAMHTD016382
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 17 May 2022 03:22:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24HAMGLg027134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 03:22:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 17 May 2022 03:22:16 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 17 May 2022 03:22:15 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3] python3-cryptography: remove --benchmark-disable option
Date: Tue, 17 May 2022 18:22:14 +0800
Message-ID: <20220517102214.2413676-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: 
 <d037486615787f0c2f53edf1d2e09688ee8a2e62.camel@linuxfoundation.org>
References: 
 <d037486615787f0c2f53edf1d2e09688ee8a2e62.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 10:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165725

From: Mingli Yu <mingli.yu@windriver.com>

The new version introduced below change, so remove the option
to avoid python3-pytest-benchmark rdepends to fix the gap.
496703c8 Refs #7079 -- added basic scaffholding for benchmarks (#7087)

Fixes:
  # ./run-ptest
  Free memory: 31.283 GB
  ERROR: usage: pytest [options] [file_or_dir] [file_or_dir] [...]
  pytest: error: unrecognized arguments: --benchmark-disable
  inifile: /usr/lib/python3-cryptography/ptest/pyproject.toml
  rootdir: /usr/lib/python3-cryptography/ptest

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...toml-remove-benchmark-disable-option.patch | 40 +++++++++++++++++++
 .../python/python3-cryptography_37.0.1.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
new file mode 100644
index 0000000000..481f595246
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -0,0 +1,40 @@
+From ce972ea92d724f232323a9a6265a8b44d913d4d8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 17 May 2022 17:22:48 +0800
+Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
+
+The new version introduced below change, so remove the option
+to avoid python3-pytest-benchmark rdepends to fix the gap.
+496703c8 Refs #7079 -- added basic scaffholding for benchmarks (#7087)
+
+Fixes:
+  # ./run-ptest
+  Free memory: 31.283 GB
+  ERROR: usage: pytest [options] [file_or_dir] [file_or_dir] [...]
+  pytest: error: unrecognized arguments: --benchmark-disable
+  inifile: /usr/lib/python3-cryptography/ptest/pyproject.toml
+  rootdir: /usr/lib/python3-cryptography/ptest
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 4d58129..b011fca 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -15,7 +15,7 @@ line-length = 79
+ target-version = ["py36"]
+ 
+ [tool.pytest.ini_options]
+-addopts = "-r s --capture=no --strict-markers --benchmark-disable"
++addopts = "-r s --capture=no --strict-markers"
+ markers = [
+     "skip_fips: this test is not executed in FIPS mode",
+     "supported: parametrized test requiring only_if and skip_message",
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
index 1271954a08..191ea29b9c 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://run-ptest \
            file://check-memfree.py \
            file://0001-Cargo.toml-specify-pem-version.patch \
            file://0002-Cargo.toml-edition-2018-2021.patch \
+           file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
            crate://crates.io/Inflector/0.11.4 \
            crate://crates.io/aliasable/0.1.3 \
            crate://crates.io/asn1/0.8.7 \
-- 
2.25.1


