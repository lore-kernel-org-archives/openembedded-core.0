Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B60C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:03:38 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.10983.1704891809967777822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rNYEw-004w83-2K;
	Wed, 10 Jan 2024 15:03:27 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rNYEw-00H7EF-Cf; Wed, 10 Jan 2024 15:03:26 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa parselogs.py: load ignore files from sys.path
Date: Wed, 10 Jan 2024 15:03:22 +0200
Message-Id: <20240110130322.4078930-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20240110130322.4078930-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193499

python import.resources open_text() loads files from the module paths
but this requires layers to set "addpylib ${LAYERDIR}/lib oeqa"
which is not needed to find the plain .py test files to run the tests.
Also an empty __init__.py file in a layer will break the resource file
loading completely as only that path with __init__.py file will
be used to search the resource files. Then open_text() is marked
as deprecated from python 3.11 onwards
https://docs.python.org/3/library/importlib.resources.html

So replace open_text() by iterating over sys.path to find the ignore
files. This works since paths like ${LAYERDIR}/lib/oeqa/runtime/cases are
already in sys.path. Add debug prints for found and not found files
while at it.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 29 +++++++++++-------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 6966923c94..47583dbb5d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -6,27 +6,19 @@
 
 import collections
 import os
+import pathlib
 import sys
 
 from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 
-# importlib.resources.open_text in Python <3.10 doesn't search all directories
-# when a package is split across multiple directories. Until we can rely on
-# 3.10+, reimplement the searching logic.
-if sys.version_info < (3, 10):
-    def _open_text(package, resource):
-        import importlib, pathlib
-        module = importlib.import_module(package)
-        for path in module.__path__:
-            candidate = pathlib.Path(path) / resource
-            if candidate.exists():
-                return candidate.open(encoding='utf-8')
-        raise FileNotFoundError
-else:
-    from importlib.resources import open_text as _open_text
-
+def open_syspath_text(resource):
+    for path in sys.path:
+        candidate = pathlib.Path(path) / resource
+        if candidate.exists():
+            return candidate.open(encoding='utf-8')
+    raise FileNotFoundError
 
 class ParseLogsTest(OERuntimeTestCase):
 
@@ -61,11 +53,16 @@ class ParseLogsTest(OERuntimeTestCase):
         for candidate in ["common", cls.td.get("TARGET_ARCH")] + cls.td.get("MACHINEOVERRIDES").split(":"):
             try:
                 name = f"parselogs-ignores-{candidate}.txt"
-                for line in _open_text("oeqa.runtime.cases", name):
+                print_once = True
+                for line in open_syspath_text(name):
+                    if print_once:
+                        bb.debug(1, "parselogs: ignore file %s found" % (name))
+                        print_once = False
                     line = line.strip()
                     if line and not line.startswith("#"):
                         cls.ignore_errors.append(line.casefold())
             except FileNotFoundError:
+                bb.debug(1, "parselogs: ignore file %s not found" % (name))
                 pass
 
     # Go through the log locations provided and if it's a folder
-- 
2.34.1


