Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D659AC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:13:00 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3312.1787217171479573091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YjOJiPSa;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4160; q=dns/txt;
  s=iport01; t=1787217171; x=1788426771;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4BMcf0zexICZKKKF4mbz7Iuypdb4iz+XLi7eJcdm9Ig=;
  b=YjOJiPSaTUF0iAlMcDGo2xfWd9sUDkMQMNOxELi+Cn34cwWhhpvfllJ1
   FZ5hMSYQw/6eOULwufPwrmyRaNNBF+krEIslGUc3Uzx6W3COMgZtCflcZ
   SYl07PK2WX3itMd+bdaR+Kn8B6IT8Ti1rVRjqoVUQmvm3GprGI66TyNIO
   bU9cH1Nd6CW6y8Frswqb6pZWIcMI3jsJD+seeZydDfAzIUf39J0Uq4Gz+
   4JsyuaLLwlWQ36F+MMwnqXGd8p8b0IK2jTzREY0TJATl1Dj0Td9a2zSpG
   oidNtCZfRUyZt7kEaVdzCbXwHi3xeC/gI+aHUhqh6FgQ8cGYRciSjPpJ6
   Q==;
X-CSE-ConnectionGUID: +NWvouTdQpKlRxkW8cxTdA==
X-CSE-MsgGUID: TV/jBorgR4mkOtXjXzkFFg==
X-IPAS-Result: =?us-ascii?q?A0BGAgANxIZq/5L/Ja1SCB4BAQsSDIIFC4JXdF9CSYRXj?=
 =?us-ascii?q?1KCIZ4egX4PAQEBD0QNBAEBhD+OMwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaASkPAXIDAQIDAiYCLSMYAQiDAgGCdAMRwj16g?=
 =?us-ascii?q?TKBAYNiAYEa2zABCxQBgQouhT+DHwGFAl0ZhHwnGxuBcoEVg2mCYQKBOYQCg?=
 =?us-ascii?q?kgiBIIigQyBWh6RUkiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNVgbB?=
 =?us-ascii?q?gWBHYEohDcjGTZ8gQlegSsqYhIXgQmCCgKCcIIGAgFJRQ4JFwsYDUgRLDcUG?=
 =?us-ascii?q?QQ9AW4HjlEggX5NATwcCC0BKwVPgSkGo36CHqESCiiDdowhlToaM6psmQiOC?=
 =?us-ascii?q?pZQhGmBaDyBWXAVgyIJShkPji0WgjuBJYUTUcY9PDULMgIHAgcBAQsBAwuTZ?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:SDfqHKDrG/97ZxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDgg0jEOn
 2MWUGrUafmJYGv0fIogb9+/px8F6sTdndU1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEgNNREkYrAYEh4sVzO3FNy
 qwTOAwBR0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoiuK8aoWNILRmQ+1poAGaj
 GXc8F6lBxI9KOyd+SiG3Fyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:f7fMY6MjfYYdKMBcTvejsMiBIKoaSvp037BN7TEVdfU1SL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:2WXq8WzYmsE3s29t285fBgVXPP87dWDhwE7IAEuCGWVWGLaFdVO5rfY=
X-Talos-MUID: 9a23:0QlceAg53RVMP11BhR5RLcMpCPkv4Y6pEk83zZAFnNW0NxxiOBmzg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="512292702"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:12:50 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 372B018000234
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:12:50 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5D7ECCC037D; Thu, 20 Aug 2026 14:42:48 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] python3-cryptography: backport stray file install fix
Date: Thu, 20 Aug 2026 14:42:42 +0530
Message-Id: <20260820091242.999697-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243844

From: Deepak Rathore <deeratho@cisco.com>

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

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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


