Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56615108B8F7
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 11:15:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10241.1774005353974584161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 04:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bb/4e9cL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774005354; x=1805541354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tu2u5SM9N6swhiTxl6oVOK+1qpqKdRLhGeR9Setvgho=;
  b=bb/4e9cLd0hO28v8Pm60+y1x5tOT8Xb32v+nJbpGrATcHVJlR17wklOq
   XXLcJ/vRk/lu0uP3CVazv7+Jw2gWG6jC+95YlxbAkvU74pFHdsA/fkT0B
   UYWwvyl6mtGtkF0aoFOabtnPX7duuHCjMeP7DEI+phDBAbqqFsW6oXWw+
   ht/ugJjpRzXXG5r/NnbM4UTiR8aw/whYPKxQ9fFkb7fe/why4KIrf+060
   2OGuWR8MYE5V1x0Bpgufkv0sK3SQE422aRptUjBs5/GHaXFblKjgKR1+u
   7VDNfj/dxrCBlrQ1Zxq0nNCXWQaYFGf/q1yzoEoSn1SbCrDlIGNUR0+hQ
   A==;
X-CSE-ConnectionGUID: UQt7rtBFSxOQEiD9nLsZYg==
X-CSE-MsgGUID: LMv5ulh/QJ+TbjiluEZZqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="222629000"
X-IronPort-AV: E=Sophos;i="6.23,130,1770562800"; 
   d="scan'208";a="222629000"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 20:15:52 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4446E3E5
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:15:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E6A16100D128
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:15:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0EE1314001D2;
	Fri, 20 Mar 2026 11:15:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-spdx-python-model: fix do_compile error for update of python3-shacl2code
Date: Fri, 20 Mar 2026 19:15:43 +0800
Message-ID: <20260320111545.2108-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 11:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233597

From: Wang Mingyu <wangmy@fujitsu.com>

Add patch 0001-Update-gen-generate-bindings-to-output-to-directory-.patch to fix bug when updated python3-shacl2code:

ERROR: python3-spdx-python-model-0.0.4-r0 do_compile: Execution of '/tmp/work/cortexa57-poky-linux/python3-spdx-python-model/0.0.4/temp/run.do_compile.2283925' failed with exit code 1
ERROR: Logfile of failure stored in: /tmp/work/cortexa57-poky-linux/python3-spdx-python-model/0.0.4/temp/log.do_compile.2283925
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
|       shacl2code==0.0.24
| WARNING: exit code 1 from a shell command.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ate-bindings-to-output-to-directory-.patch | 54 +++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.4.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-gen-generate-bindings-to-output-to-directory-.patch

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-gen-generate-bindings-to-output-to-directory-.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-gen-generate-bindings-to-output-to-directory-.patch
new file mode 100644
index 0000000000..a84ce54382
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-gen-generate-bindings-to-output-to-directory-.patch
@@ -0,0 +1,54 @@
+From 1fd7e490a082ffb450283c43c3635e80110091e7 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Fri, 20 Mar 2026 09:02:18 +0000
+Subject: [PATCH] Update gen/generate-bindings to output to directory name
+
+Upstream-Status: Backport [https://github.com/spdx/spdx-python-model/commit/678f5af062743cb8a84fdb24bb9e63963464c86b]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ gen/generate-bindings | 4 ++--
+ pyproject.toml        | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/gen/generate-bindings b/gen/generate-bindings
+index bc7041e..d1e06aa 100755
+--- a/gen/generate-bindings
++++ b/gen/generate-bindings
+@@ -21,14 +21,14 @@ for v in $SPDX_VERSIONS; do
+             --context-url "file://${SHACL2CODE_SPDX_DIR}/$v/spdx-context.jsonld" https://spdx.org/rdf/$v/spdx-context.jsonld  \
+             --license Apache-2.0 \
+             python \
+-            -o "$MODNAME.py"
++            --output "$MODNAME"
+     else
+         shacl2code generate --input https://spdx.org/rdf/$v/spdx-model.ttl \
+             --input https://spdx.org/rdf/$v/spdx-json-serialize-annotations.ttl \
+             --context https://spdx.org/rdf/$v/spdx-context.jsonld \
+             --license Apache-2.0 \
+             python \
+-            -o "$MODNAME.py"
++i           --output "$MODNAME"
+     fi
+ 
+     echo "from . import $MODNAME" >> __init__.py
+diff --git a/pyproject.toml b/pyproject.toml
+index a0a5f4d..7075375 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -32,9 +32,9 @@ Issues = "https://github.com/spdx/spdx-python-model/issues"
+ 
+ [build-system]
+ requires = [
+-    "hatchling",
+-    "hatch-build-scripts",
+-    "shacl2code == 0.0.24",
++    "hatchling >= 1.27.0",
++    "hatch-build-scripts >= 0.0.4",
++    "shacl2code == 1.0.0",
+ ]
+ build-backend = "hatchling.build"
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
index 00c3b3913c..16adbc9577 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.4.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
     https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
     file://0001-generate-bindings-allow-to-use-local-files.patch \
+    file://0001-Update-gen-generate-bindings-to-output-to-directory-.patch \
 "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
-- 
2.43.0


