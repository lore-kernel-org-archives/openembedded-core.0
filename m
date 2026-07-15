Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD61C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:49 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12673.1784134068583017159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ujm1n79B;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-455a61c53d3so2125816fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134068; x=1784738868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi4/ryKBVPflVsFdajeMnwoWzrRBrJEW4iBcNy6E3IQ=;
        b=Ujm1n79B/gukA9nhJwNkFsgBUZ/nSQecgOofJZ0O84XlUPaWDthiwgx0ZR3vDuoXBZ
         IoLaambI+wdFCWnAs7k/BADXJITCTvKJuegRAYn13psKtpAbXcQmcwJGljkU5FormHO5
         0wM/mV1N1IKDw5Ql5aB6j1/r49rNPA0jIHQbxIk9gZrY1jCweuSN71HHk9VmsywmmMYL
         OKrwwSDt9jCF9Y/oTpNOxNLyvx/KcxrhW4YzhpQDlZtDSfh7GNi5H5svM0FT1V1RgUCN
         38ECZ5C2r47+LMB0W89miQeHxqwTIC194KlY5c5/3tWq1qxOnMRuJMkMoMh4qxDBIRYp
         aG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134068; x=1784738868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi4/ryKBVPflVsFdajeMnwoWzrRBrJEW4iBcNy6E3IQ=;
        b=Eewzt1TYguM8j3lMi2zIc6hn93KWt1qhMIKVJgGpbDsOizgszFNtwusnvDJEJy8ORZ
         R96LJ8xyzlg3pY7yTKZcONi2u82mVGNiJAqnhU4B1BdX3ZzDd2+vbbFbGPwWc/AD9CJj
         ifqhJwKjP8QLegK25wuIap8hUscUMpGYFS+aNr0trxhv1SLx+yylUla3jTSDj1afxvZI
         +J9CWvjMYy18lUSfPIAedjBPTWRZSLa2hnCgAPVGX3QJvDI37fM1D6g9jn1I+7d2CnEu
         kHOYBAmoeruRip/u81ZQv/NrHduPVsDxnICjQdLVXgeULk7Ig21dZ7Z3YBd1m3b0xnAw
         8G6Q==
X-Gm-Message-State: AOJu0YwhRpMV9P2Kc+zQcJdftjAmhetseuz2wyKYzNzk+6XWXt9uRKtn
	MO24oDNB/MIqnLL5ZjJlu89Lt89W0Tm1St0RRNRkXmUmcIRorU6O1HPN1ydwGw==
X-Gm-Gg: AfdE7ckup/6+47K+G7kIxMWecEpgdodWd5CrV1fPjfm8MLmNDBFIMaEQZPlYS1UMy94
	Zc0wvdNE8sxD0/dnKBpbEZOKxcaIpgxJZ4E+StAGaenMvDhMehhDA0II1rgcQgARvGE5l7IFWhG
	f22qP5Cr1zZXafFM7VRqFNWGm5SEcNuUA8R+2BRdD/vwvUN6e7c6W1KxCJC0g+MuuMpLZ8/s6LX
	DXYMn3wCpKVBVV8yFLRR46nj31N3AZ6naAklahag4F7Mpt2foZTlJ8Y/uyHvjqLNRpTXFHBUztQ
	1y7gkPqMxUElvyKCQcA9zFpygNz8T01rD6HOJMRrYv4yhWkgAMQ7ekGPDYUn/YBMc/3wJJSuj6X
	y5nWYhd4PD/7PiVGjQSTgQHD6xqHguMRX5LeqGnzELK/mC6oSKImCaOFJMNuicyH3hZPTvae3IC
	0wmxbt1ds2
X-Received: by 2002:a05:6870:80ce:b0:42f:aec9:9d92 with SMTP id 586e51a60fabf-4560b7ee34fmr4074912fac.29.1784134067570;
        Wed, 15 Jul 2026 09:47:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:47 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 07/25] convert-spdx-licenses: Convert to valid SPDX expressions
Date: Wed, 15 Jul 2026 10:45:03 -0600
Message-ID: <20260715164739.364323-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240999

Reworks the script to re-write LICENSE lines as valid SPDX license
expressions in addition to remapping the license names

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/contrib/convert-spdx-licenses.py | 254 +++++++++++++++--------
 1 file changed, 162 insertions(+), 92 deletions(-)

diff --git a/scripts/contrib/convert-spdx-licenses.py b/scripts/contrib/convert-spdx-licenses.py
index 13cf12a33f..39cbbb28e5 100755
--- a/scripts/contrib/convert-spdx-licenses.py
+++ b/scripts/contrib/convert-spdx-licenses.py
@@ -7,113 +7,175 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import re
+
+from abc import abstractmethod, ABC
+from enum import Enum
+from pathlib import Path
+import json
+import mimetypes
 import os
+import re
+import shutil
 import sys
 import tempfile
-import shutil
-import mimetypes
+
+THIS_DIR = Path(__file__).parent
+
+sys.path.insert(0, str(THIS_DIR.parent.parent / "meta" / "lib"))
+import oe.spdx_license
 
 if len(sys.argv) < 2:
     print("Please specify a directory to run the conversion script against.")
     sys.exit(1)
 
-license_map = {
-"AGPL-3" : "AGPL-3.0-only",
-"AGPL-3+" : "AGPL-3.0-or-later",
-"AGPLv3" : "AGPL-3.0-only",
-"AGPLv3+" : "AGPL-3.0-or-later",
-"AGPLv3.0" : "AGPL-3.0-only",
-"AGPLv3.0+" : "AGPL-3.0-or-later",
-"AGPL-3.0" : "AGPL-3.0-only",
-"AGPL-3.0+" : "AGPL-3.0-or-later",
-"BSD-0-Clause" : "0BSD",
-"GPL-1" : "GPL-1.0-only",
-"GPL-1+" : "GPL-1.0-or-later",
-"GPLv1" : "GPL-1.0-only",
-"GPLv1+" : "GPL-1.0-or-later",
-"GPLv1.0" : "GPL-1.0-only",
-"GPLv1.0+" : "GPL-1.0-or-later",
-"GPL-1.0" : "GPL-1.0-only",
-"GPL-1.0+" : "GPL-1.0-or-later",
-"GPL-2" : "GPL-2.0-only",
-"GPL-2+" : "GPL-2.0-or-later",
-"GPLv2" : "GPL-2.0-only",
-"GPLv2+" : "GPL-2.0-or-later",
-"GPLv2.0" : "GPL-2.0-only",
-"GPLv2.0+" : "GPL-2.0-or-later",
-"GPL-2.0" : "GPL-2.0-only",
-"GPL-2.0+" : "GPL-2.0-or-later",
-"GPL-3" : "GPL-3.0-only",
-"GPL-3+" : "GPL-3.0-or-later",
-"GPLv3" : "GPL-3.0-only",
-"GPLv3+" : "GPL-3.0-or-later",
-"GPLv3.0" : "GPL-3.0-only",
-"GPLv3.0+" : "GPL-3.0-or-later",
-"GPL-3.0" : "GPL-3.0-only",
-"GPL-3.0+" : "GPL-3.0-or-later",
-"LGPLv2" : "LGPL-2.0-only",
-"LGPLv2+" : "LGPL-2.0-or-later",
-"LGPLv2.0" : "LGPL-2.0-only",
-"LGPLv2.0+" : "LGPL-2.0-or-later",
-"LGPL-2.0" : "LGPL-2.0-only",
-"LGPL-2.0+" : "LGPL-2.0-or-later",
-"LGPL2.1" : "LGPL-2.1-only",
-"LGPL2.1+" : "LGPL-2.1-or-later",
-"LGPLv2.1" : "LGPL-2.1-only",
-"LGPLv2.1+" : "LGPL-2.1-or-later",
-"LGPL-2.1" : "LGPL-2.1-only",
-"LGPL-2.1+" : "LGPL-2.1-or-later",
-"LGPLv3" : "LGPL-3.0-only",
-"LGPLv3+" : "LGPL-3.0-or-later",
-"LGPL-3.0" : "LGPL-3.0-only",
-"LGPL-3.0+" : "LGPL-3.0-or-later",
-"MPL-1" : "MPL-1.0",
-"MPLv1" : "MPL-1.0",
-"MPLv1.1" : "MPL-1.1",
-"MPLv2" : "MPL-2.0",
-"MIT-X" : "MIT",
-"MIT-style" : "MIT",
-"openssl" : "OpenSSL",
-"PSF" : "PSF-2.0",
-"PSFv2" : "PSF-2.0",
-"Python-2" : "Python-2.0",
-"Apachev2" : "Apache-2.0",
-"Apache-2" : "Apache-2.0",
-"Artisticv1" : "Artistic-1.0",
-"Artistic-1" : "Artistic-1.0",
-"AFL-2" : "AFL-2.0",
-"AFL-1" : "AFL-1.2",
-"AFLv2" : "AFL-2.0",
-"AFLv1" : "AFL-1.2",
-"CDDLv1" : "CDDL-1.0",
-"CDDL-1" : "CDDL-1.0",
-"EPLv1.0" : "EPL-1.0",
-"FreeType" : "FTL",
-"Nauman" : "Naumen",
-"tcl" : "TCL",
-"vim" : "Vim",
-"SGIv1" : "SGI-OpenGL",
+LICENSE_MAP = {
+    "AGPL-3": "AGPL-3.0-only",
+    "AGPL-3+": "AGPL-3.0-or-later",
+    "AGPLv3": "AGPL-3.0-only",
+    "AGPLv3+": "AGPL-3.0-or-later",
+    "AGPLv3.0": "AGPL-3.0-only",
+    "AGPLv3.0+": "AGPL-3.0-or-later",
+    "AGPL-3.0": "AGPL-3.0-only",
+    "AGPL-3.0+": "AGPL-3.0-or-later",
+    "BSD-0-Clause": "0BSD",
+    "GPL-1": "GPL-1.0-only",
+    "GPL-1+": "GPL-1.0-or-later",
+    "GPLv1": "GPL-1.0-only",
+    "GPLv1+": "GPL-1.0-or-later",
+    "GPLv1.0": "GPL-1.0-only",
+    "GPLv1.0+": "GPL-1.0-or-later",
+    "GPL-1.0": "GPL-1.0-only",
+    "GPL-1.0+": "GPL-1.0-or-later",
+    "GPL-2": "GPL-2.0-only",
+    "GPL-2+": "GPL-2.0-or-later",
+    "GPLv2": "GPL-2.0-only",
+    "GPLv2+": "GPL-2.0-or-later",
+    "GPLv2.0": "GPL-2.0-only",
+    "GPLv2.0+": "GPL-2.0-or-later",
+    "GPL-2.0": "GPL-2.0-only",
+    "GPL-2.0+": "GPL-2.0-or-later",
+    "GPL-3": "GPL-3.0-only",
+    "GPL-3+": "GPL-3.0-or-later",
+    "GPLv3": "GPL-3.0-only",
+    "GPLv3+": "GPL-3.0-or-later",
+    "GPLv3.0": "GPL-3.0-only",
+    "GPLv3.0+": "GPL-3.0-or-later",
+    "GPL-3.0": "GPL-3.0-only",
+    "GPL-3.0+": "GPL-3.0-or-later",
+    "LGPLv2": "LGPL-2.0-only",
+    "LGPLv2+": "LGPL-2.0-or-later",
+    "LGPLv2.0": "LGPL-2.0-only",
+    "LGPLv2.0+": "LGPL-2.0-or-later",
+    "LGPL-2.0": "LGPL-2.0-only",
+    "LGPL-2.0+": "LGPL-2.0-or-later",
+    "LGPL2.1": "LGPL-2.1-only",
+    "LGPL2.1+": "LGPL-2.1-or-later",
+    "LGPLv2.1": "LGPL-2.1-only",
+    "LGPLv2.1+": "LGPL-2.1-or-later",
+    "LGPL-2.1": "LGPL-2.1-only",
+    "LGPL-2.1+": "LGPL-2.1-or-later",
+    "LGPLv3": "LGPL-3.0-only",
+    "LGPLv3+": "LGPL-3.0-or-later",
+    "LGPL-3.0": "LGPL-3.0-only",
+    "LGPL-3.0+": "LGPL-3.0-or-later",
+    "MPL-1": "MPL-1.0",
+    "MPLv1": "MPL-1.0",
+    "MPLv1.1": "MPL-1.1",
+    "MPLv2": "MPL-2.0",
+    "MIT-X": "MIT",
+    "MIT-style": "MIT",
+    "openssl": "OpenSSL",
+    "PSF": "PSF-2.0",
+    "PSFv2": "PSF-2.0",
+    "Python-2": "Python-2.0",
+    "Apachev2": "Apache-2.0",
+    "Apache-2": "Apache-2.0",
+    "Artisticv1": "Artistic-1.0",
+    "Artistic-1": "Artistic-1.0",
+    "AFL-2": "AFL-2.0",
+    "AFL-1": "AFL-1.2",
+    "AFLv2": "AFL-2.0",
+    "AFLv1": "AFL-1.2",
+    "CDDLv1": "CDDL-1.0",
+    "CDDL-1": "CDDL-1.0",
+    "EPLv1.0": "EPL-1.0",
+    "FreeType": "FTL",
+    "Nauman": "Naumen",
+    "tcl": "TCL",
+    "vim": "Vim",
+    "SGIv1": "SGI-OpenGL",
+    "Apache-2.0-with-LLVM-exception": "Apache-2.0 WITH LLVM-exception",
+    "GPL-3-with-bison-exception": "GPL-3.0-or-later WITH Bison-exception-2.2",
+    "GPL-2.0-with-Linux-syscall-note": "GPL-2.0-only WITH Linux-syscall-note",
 }
 
+
+LINE_RE = re.compile(r'^(?P<var>LICENSE[\s:].*=.*)"(?P<expression>.*)"')
+
+
+def convert_unknown(node):
+    node.children = [convert_unknown(c) for c in node.children]
+
+    if not isinstance(node, oe.spdx_license.UnknownId):
+        return node
+
+    if node.ident.startswith("$"):
+        return node
+
+    if node.ident in LICENSE_MAP:
+        return oe.spdx_license.parse(LICENSE_MAP[node.ident])
+
+    ident = re.sub(r"[^a-zA-Z0-9\.\-]", "-", node.ident)
+
+    return oe.spdx_license.LicenseRef("LicenseRef-" + ident, ident, token=node.token)
+
+
 def processfile(fn):
-    print("processing file '%s'" % fn)
+    # print("processing file '%s'" % fn)
     try:
         fh, abs_path = tempfile.mkstemp()
+        if os.path.basename(fn) == "bitbake.conf":
+            return
+
         modified = False
-        with os.fdopen(fh, 'w') as new_file:
+        with os.fdopen(fh, "w") as new_file:
             with open(fn, "r") as old_file:
-                for line in old_file:
-                    if not line.startswith("LICENSE"):
+                for lineno, line in enumerate(old_file):
+                    m = LINE_RE.match(line)
+                    if m is None:
+                        new_file.write(line)
+                        continue
+
+                    if "[doc]" in m.group("var"):
+                        new_file.write(line)
+                        continue
+
+                    expression = (
+                        m.group("expression").replace("|", " OR ").replace("&", " AND ")
+                    ).strip()
+                    if not expression or expression == "CLOSED":
                         new_file.write(line)
                         continue
-                    orig = line
-                    for license in sorted(license_map, key=len, reverse=True):
-                        for ending in ['"', "'", " ", ")"]:
-                            line = line.replace(license + ending, license_map[license] + ending)
-                    if orig != line:
-                        modified = True
-                    new_file.write(line)
+
+                    try:
+                        t = oe.spdx_license.parse(expression, allow_unknown=True)
+                        if t is None:
+                            new_file.write(line)
+                            continue
+                        t = convert_unknown(t)
+                    except oe.spdx_license.ParseError as e:
+                        print(f"Cannot convert {fn}:{lineno + 1}")
+                        print(e.format())
+                        new_file.write(line)
+                        continue
+
+                    if t.to_string() == expression:
+                        new_file.write(line)
+                        continue
+
+                    new_line = m.group("var") + '"' + t.sort().to_string() + '"\n'
+                    new_file.write(new_line)
+                    modified = True
         new_file.close()
         if modified:
             shutil.copymode(fn, abs_path)
@@ -122,8 +184,9 @@ def processfile(fn):
     except UnicodeDecodeError:
         pass
 
+
 ourname = os.path.basename(sys.argv[0])
-ourversion = "0.01"
+ourversion = "0.02"
 
 if os.path.isfile(sys.argv[1]):
     processfile(sys.argv[1])
@@ -138,7 +201,14 @@ for targetdir in sys.argv[1:]:
             fn = os.path.join(root, name)
             if os.path.islink(fn):
                 continue
-            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff") or fn.endswith(".orig"):
+            if (
+                "/.git/" in fn
+                or fn.endswith(".html")
+                or fn.endswith(".patch")
+                or fn.endswith(".m4")
+                or fn.endswith(".diff")
+                or fn.endswith(".orig")
+            ):
                 continue
             processfile(fn)
 
-- 
2.54.0


