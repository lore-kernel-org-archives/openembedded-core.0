Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0529C54E55
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:19:35 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.27960.1709655569266003818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Q8ITPAL9;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=787e54d6c=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709655570; x=1741191570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o+jpaj0HX0HRxHStRGa0vOt5wCP4RR+8UasZPekfenQ=;
  b=Q8ITPAL9Ahan87Fve7VtSRZUZUI95pT9G+XyiG7+Qr8elDzyVK4JDW1j
   AdiQzkobybkjPoqngbiPP92snMMYYlwWYfPvmwRvg7vOHJFGgPTExfjxV
   qpZHP11BL0h1fTUkXfsO5ZzbYhg7FHoMoiMtaYTlt/uNCKExWR630Bw3L
   8=;
X-CSE-ConnectionGUID: NcK67gmiTcSJfQ7NqrMMJg==
X-CSE-MsgGUID: Uu2YF4yTQsWpFg+FPkZVUA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 05 Mar 2024 17:19:27 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from localhost.localdomain (10.30.85.204) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 5 Mar 2024 17:19:25 +0100
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [RFC PATCH v2 1/3] oe-pkgdata-util: Add read-extended command
Date: Tue, 5 Mar 2024 17:18:28 +0100
Message-ID: <20240305161856.4163138-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228062139.473528-1-philip.lorenz@bmw.de>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP10F.europe.bmw.corp (2a03:1e80:a15:58f::202c) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196639

So far, reading the "extended" data of a package stored within "pkgdata"
is not supported. Extend oe-pkgdata-util to support this use case.

For symmetry to `read-value` and `package-info` it expects the runtime
package name as its package name. Passing in multiple packages is not
supported as this would require further processing by clients using this
command before the returned JSON payload can be parsed.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 16 +++++++++++
 scripts/oe-pkgdata-util                 | 36 +++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index d786c33018d..6c5b7a84f47 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -4,7 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+import json
 import os
+import pathlib
 import tempfile
 import fnmatch
 
@@ -225,3 +227,17 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
         currpos = result.output.find('usage: oe-pkgdata-util')
         self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
+
+    def test_read_extended(self):
+        result = runCmd('oe-pkgdata-util read-extended libz-dbg')
+        extended_data = json.loads(result.output)
+
+        self.assertIn('files_info', extended_data, "Could not find key 'files_info' in '%s'" % extended_data)
+
+        files_info = extended_data['files_info']
+        libz_file_name = next((key for key in files_info.keys() \
+            if pathlib.Path(key).name.startswith('libz')), None)
+        self.assertIsNotNone(libz_file_name, "Couldn't find libz in '%s'" % files_info)
+
+        file_info = files_info[libz_file_name]
+        self.assertIn('size', file_info, "Couldn't find key 'size' in '%s'" % file_info)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549ae..50be8e0bb60 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -16,6 +16,8 @@ import fnmatch
 import re
 import argparse
 import logging
+import pathlib
+import subprocess
 from collections import defaultdict, OrderedDict
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
@@ -206,6 +208,34 @@ def read_value(args):
         else:
             logger.debug("revlink %s does not exist", revlink)
 
+def read_extended(args):
+    if not args.pkg:
+        logger.error("No package specified")
+        sys.exit(1)
+
+    logger.debug("read-extended('%s', '%s')" % (args.pkgdata_dir, args.pkg))
+
+    pkgdata_dir = pathlib.Path(args.pkgdata_dir)
+    pkg_name = args.pkg.split('_')[0]
+
+    # Map runtime package name to recipe-world
+    runtimepkgpath = pkgdata_dir / "runtime-reverse" / pkg_name
+    recipe_pkg_name = runtimepkgpath.readlink().name
+
+    extendedpath = pkgdata_dir / "extended" / ("%s.json.zstd" % recipe_pkg_name)
+
+    if not extendedpath.exists():
+        logger.error("Extended package information '%s' does not exist", extendedpath)
+        sys.exit(1)
+
+    try:
+        info = subprocess.check_output(["zstdcat", extendedpath]).decode("utf-8")
+        print(info)
+    except subprocess.CalledProcessError as exc:
+        logger.error("Failed to decompress '%s': %s", extendedpath, exc, exc_info=exc)
+        sys.exit(1)
+
+
 def lookup_pkglist(pkgs, pkgdata_dir, reverse):
     if reverse:
         mappings = OrderedDict()
@@ -586,6 +616,12 @@ def main():
     parser_read_value.add_argument('-u', '--unescape', help='Expand escapes such as \\n', action='store_true')
     parser_read_value.set_defaults(func=read_value)
 
+    parser_read_extended = subparsers.add_parser('read-extended',
+                                                   help='Read extended pkgdata for a package',
+                                                   description='Outputs the extended data content of a package')
+    parser_read_extended.add_argument('pkg', help='Package name to look up')
+    parser_read_extended.set_defaults(func=read_extended)
+
     parser_glob = subparsers.add_parser('glob',
                                           help='Expand package name glob expression',
                                           description='Expands one or more glob expressions over the packages listed in pkglistfile')
-- 
2.44.0


