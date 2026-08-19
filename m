Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47574C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:18:27 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4804.1787138303260544718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DB1rCtYV;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4154; q=dns/txt;
  s=iport01; t=1787138303; x=1788347903;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ns+iCz8Lwk3/gbtvawnr4hWJB7X24ijSoQcnfl8GYwU=;
  b=DB1rCtYVj139DFATwUu9KuqZ1koWm+raZmpkFB9NBQaT219p/xWFdEMr
   4qquPN+mM4JKP4aCtnsDMLwVKNjmtdBlFSTmIbIrMDiegh2wWb0jk5DJR
   6qNYfd8NFmToxBCTceP//dnDS+kxgmPuVopXXBuHqg4olsAiScx5vKk2A
   7nBmrB/vhUQyI2zL5u+ELL3rhzhNXbzQuumcrM743sxvjDYV7PDbKuX/m
   z1M90wZYIPoMSdJaWv4g/IdnawTWNjXSWxZunJsHgUy2LvkcBVZoghhMC
   5OZrZdkl/iuj2nkVjg0d/tIXz5ZM5RmfQKBvHzlHCXmcVgQJht3Ahtr4a
   Q==;
X-CSE-ConnectionGUID: RceWnil1SUmc/c06kzhSsA==
X-CSE-MsgGUID: Kw74N3D6TmKVaCLT/TzPFg==
X-IPAS-Result: =?us-ascii?q?A0BGAgA0kIVq/47/Ja1SCB4BAQsSDIIFC4JXdF9CSYRXj?=
 =?us-ascii?q?1KCIZ4egX4PAQEBD0QNBAEBhD+OMwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaASkPAXIDAQIDAiYCLSMYAQiDAgGCdAMRw256g?=
 =?us-ascii?q?TKBAYNiAYEa2zABCxQBgQouhT+DHwGFAl0ZhHwnGxuBcoEVg2mCYQKBOYQCg?=
 =?us-ascii?q?kgiBIIigQyBWh6RR0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNVgbB?=
 =?us-ascii?q?gWBHYEohDcjGTZ6gQlegSsqYhIXgQmCCgKCc4IGAgFJRREKCwsYDUgRLDcUG?=
 =?us-ascii?q?QQ9AW4HjkkggXpNATwcCC0BKwVPgSkGo36CHqESCiiDdowhlToaM6psmQiOC?=
 =?us-ascii?q?pZQhGmBaDyBWXAVgyIJShkPji0WgjuBJYUTUcY9PDULMgIHAgcBAQsBAwuTZ?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:j7vKEqNEUtl/uc7vrR30lsFynXyQoLVcMsEvi/4bfWQNrUoi3jEDn
 zNMWD+BOKuNYGT9KdAnatm/9U4O6JXXx9A1HnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj689lAX4wPIlBwdtyCiZFr
 aIbOjA2dTnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNnwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsiuC2a4eEJ4fiqcN9vVnH+
 kSd0zrFBzIkPfe79X254EqCibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvkCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:sJwe+K5bqxzUmE8YwwPXwP7XdLJyesId70hD6qkXc20xTiX4rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3AuKMm42rM921H72Xe/KP5zMHmUfouf0LbzXOJGHK?=
 =?us-ascii?q?9AiFiEOOWW1+r44oxxg=3D=3D?=
X-Talos-MUID: 9a23:BF3XXgZ4WUgdyuBTlCCz2Bc5GJlU5oeQAWsprdI6qfGqOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="520335953"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:18:22 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id EF42618000346
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:18:21 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 1C3FDCC037D; Wed, 19 Aug 2026 16:48:20 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] python3-cryptography: backport stray file install fix
Date: Wed, 19 Aug 2026 16:47:55 +0530
Message-Id: <20260819111755.4060280-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243725

From: Himanshu Jadon <hjadon@cisco.com>

Maturin 1.12 changed the handling of include entries from
pyproject.toml. With the current cryptography metadata, files like
CHANGELOG.rst, CONTRIBUTING.rst, docs and tests can be installed under
site-packages instead of being kept only in the source archive.

That can cause image install conflicts when packages such as
python3-pyrad and python3-pyexpect are installed with
python3-cryptography, because those packages also install top-level docs
or tests directories under site-packages.

Backport the upstream cryptography fix which marks these entries as
sdist-only. The files remain available from the source tree, so the
existing ptest install path which copies tests from ${S} is not changed.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../python/python3-cryptography.bb            |  1 +
 ...lling-stray-files-into-site-packages.patch | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 42e8c5ff19..b73123d361 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -14,6 +14,7 @@ require python3-cryptography-common.inc
 SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+            file://0002-Fix-installing-stray-files-into-site-packages.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
diff --git a/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch b/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch
new file mode 100644
index 0000000000..6212c1a43e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch
@@ -0,0 +1,55 @@
+From af53f00da0538e7d64625eea9f4ec850a2b7dd2e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Sun, 15 Feb 2026 18:01:37 +0100
+Subject: [PATCH] Fix installing stray files into site-packages (#14319)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix the `include` pattern in `pyproject.toml` not to install stray files
+such as `CHANGELOG.rst`, `CONTRIBUTING.rst`, `docs` and `tests` straight
+into site-packages.  Apparently Maturin did not install them before due
+to a bug, but it was fixed in maturin 1.12.0, leading to the files being
+suddenly installed.
+
+Originally reported as https://bugs.gentoo.org/970090.
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/43eb178ee3aae8d0060221118437b03c23570a41]
+
+Signed-off-by: Michał Górny <mgorny@gentoo.org>
+(cherry picked from commit 43eb178ee3aae8d0060221118437b03c23570a41)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ pyproject.toml | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 75bfcbb94..8ee43d17a 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -106,10 +106,10 @@ module-name = "cryptography.hazmat.bindings._rust"
+ locked = true
+ sdist-generator = "git"
+ include = [
+-    "CHANGELOG.rst",
+-    "CONTRIBUTING.rst",
++    { path = "CHANGELOG.rst", format = "sdist" },
++    { path = "CONTRIBUTING.rst", format = "sdist" },
+ 
+-    "docs/**/*",
++    { path = "docs/**/*", format = "sdist" },
+ 
+     { path = "src/_cffi_src/**/*.py", format = "sdist" },
+     { path = "src/_cffi_src/**/*.c", format = "sdist" },
+@@ -121,7 +121,7 @@ include = [
+     { path = "src/rust/**/Cargo.lock", format = "sdist" },
+     { path = "src/rust/**/*.rs", format = "sdist" },
+ 
+-    "tests/**/*.py",
++    { path = "tests/**/*.py", format = "sdist" },
+ ]
+ exclude = [
+     "vectors/**/*",
+-- 
+2.35.6
+
-- 
2.35.6


