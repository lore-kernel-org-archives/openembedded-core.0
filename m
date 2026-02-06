Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E22EB28D7
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 07:22:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6542.1770362533373012007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 23:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WjAZu3+O;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770362533; x=1801898533;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xWqSaVSjCvmTc5sg7woomNcL+ATrMh8oHevMp929QtI=;
  b=WjAZu3+O5qnfRIfbYTKKQX4lpntTrZR3pcQE+PESbjHgprNFhQvcI5fm
   Xvoz7mewGjErmAB9GS/wD0itIN9wJ8DLUF6+1fhTEMk3C3XyNWMBrmPoG
   umz92N6T8IfM3lsEsc2KT1gr3nXdnapu054QMAoHe31YnWKWBsqGy9UMd
   YtBsXIwAqrb3U1FrdENHCZuF2AAcI0g7PLmouyH2u9IPPwg8hzkoIorNN
   T9WNUtpOh7RdGf4t1OqYlOeEB/JN7V1koKwtwdfRX18hwAZzzm3JoYUv+
   m0Sl/RFuXK5ht/B0LYFnUsx0co1ppBT1iDFhj96C4e8N0HW+gbXwUvSL1
   g==;
X-CSE-ConnectionGUID: /00NZbxbRe6wUAyotvV7uQ==
X-CSE-MsgGUID: hvw/H9npRtGHLkyIuQr92g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="207585786"
X-IronPort-AV: E=Sophos;i="6.21,276,1763391600"; 
   d="scan'208";a="207585786"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 16:22:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 80915100037C
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 07:22:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1F29BC0735A
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 07:22:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 99A3714000DB;
	Fri,  6 Feb 2026 07:22:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v4] python3-packaging: upgrade 25.0 -> 26.0
Date: Fri,  6 Feb 2026 15:22:04 +0800
Message-ID: <20260206072205.1435-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 07:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230595

From: Wang Mingyu <wangmy@fujitsu.com>

Add patch to fix ptest error:
The test_toml_roundtrip test requires tomli_w for TOML serialization
comparison. Skip this specific test while allowing all other tests to run.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sing-tomli_w-gracefully-in-test_pylo.patch | 54 +++++++++++++++++++
 ...ging_25.0.bb => python3-packaging_26.0.bb} |  5 +-
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-packaging/0001-tests-Handle-missing-tomli_w-gracefully-in-test_pylo.patch
 rename meta/recipes-devtools/python/{python3-packaging_25.0.bb => python3-packaging_26.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-packaging/0001-tests-Handle-missing-tomli_w-gracefully-in-test_pylo.patch b/meta/recipes-devtools/python/python3-packaging/0001-tests-Handle-missing-tomli_w-gracefully-in-test_pylo.patch
new file mode 100644
index 0000000000..85dd244c45
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-packaging/0001-tests-Handle-missing-tomli_w-gracefully-in-test_pylo.patch
@@ -0,0 +1,54 @@
+From fa918b8dec1794d089419a316bb13ce97ca6cf80 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Fri, 6 Feb 2026 03:25:14 +0000
+Subject: [PATCH] tests: Handle missing tomli_w gracefully in test_pylock.py
+
+The test_toml_roundtrip test requires tomli_w for TOML serialization
+comparison. Since tomli_w is not available, skip this
+specific test while allowing all other tests to run.
+
+Upstream-Status: Inappropriate [ptest specific]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ tests/test_pylock.py | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_pylock.py b/tests/test_pylock.py
+index 1e3d957..6bfdbe9 100644
+--- a/tests/test_pylock.py
++++ b/tests/test_pylock.py
+@@ -5,8 +5,17 @@ import sys
+ from pathlib import Path
+ from typing import Any
+ 
++# Import tomli_w conditionally
++try:
++    import tomli_w
++    TOMLI_W_AVAILABLE = True
++except ImportError:
++    # In environments where tomli_w is not available,
++    # we set it to None and mark as unavailable
++    tomli_w = None
++    TOMLI_W_AVAILABLE = False
++
+ import pytest
+-import tomli_w
+ 
+ from packaging.markers import Marker
+ from packaging.pylock import (
+@@ -41,7 +50,10 @@ else:
+ def test_pylock_file_name(file_name: str, valid: bool) -> None:
+     assert is_valid_pylock_path(Path(file_name)) is valid
+ 
+-
++@pytest.mark.skipif(
++    not TOMLI_W_AVAILABLE,
++    reason="tomli_w not available"
++)
+ def test_toml_roundtrip() -> None:
+     pep751_example = (
+         Path(__file__).parent / "pylock" / "pylock.spec-example.toml"
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-packaging_25.0.bb b/meta/recipes-devtools/python/python3-packaging_26.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-packaging_25.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.0.bb
index 9cb5c68f58..e683a0020c 100644
--- a/meta/recipes-devtools/python/python3-packaging_25.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
+SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
 
-SRC_URI += "file://run-ptest.in"
+SRC_URI += "file://run-ptest.in \
+            file://0001-tests-Handle-missing-tomli_w-gracefully-in-test_pylo.patch"
 
 inherit pypi python_flit_core ptest
 
-- 
2.43.0


