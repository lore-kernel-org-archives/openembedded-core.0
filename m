Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60075C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 17:16:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.16.1645204612506043028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 09:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TKB6MpqY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id i14so15652742wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 09:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p96kn3xKYdX2ta14THXLJdyB2i/K58KafsHRXpzOXdU=;
        b=TKB6MpqY0cOtdWLVMUKhOJAjMqqbtbrMzPoOGW7rO6omBddAJXcDomDJlBBo5Sj9A7
         6BsanNLKkpcBWFFgnRnLokADAaXBaUOuEzBpzXG4SH4TDEx0Kq/UAh9Jale+2M/4xmcE
         1vQI/96u60zok3zKjWEHY48ksrgrnXGHqLng0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p96kn3xKYdX2ta14THXLJdyB2i/K58KafsHRXpzOXdU=;
        b=XqN691NMnw1VdwwO3i2M5mdf1uV2j775VXHvfvLH3w23xHWLX2zS1QPLGS9dinCEF6
         5XG+kYsDCj8kf6dYtV9SUc7o2KrEc9hXJnPqByr/BH/sTcTYAQWWX1Sg8dmvSbMHjNjJ
         56GEuQ6hKYZRQGGHLZ4J62hdSKqho9xXk6m3gWh0xr60p9nSdtcIxCtJUs914+8crLmY
         hq/QwdJGBgAM+8odo674ckgQ6NQ+Nbze7oYu0jhyK2uwZ4+IYLMFdzfVg581/EqC1PnE
         ggT8vvfwCYsBxwJPukqu5tOauOczrzezx0Az30MHTgLgXgGey0RAlfvDRUB+ZyQ75DOf
         o2Uw==
X-Gm-Message-State: AOAM531ouSvLvzNPDc4REikNtghhoIehWIqYdFnhLoKtbpLuIuRrSFXf
	YabsEInBbtQndUhH99zO9PRlJkGi8CUpJXUz
X-Google-Smtp-Source: 
 ABdhPJx8MZ9eONW3UlfiWooqQM88kwXEIcSogRa7VOjmN7R3vyoX5Ns6TvoevRdNgNcs7fKsjn5KVw==
X-Received: by 2002:a05:6000:108b:b0:1e3:222a:25dd with SMTP id
 y11-20020a056000108b00b001e3222a25ddmr7000947wrw.481.1645204610248;
        Fri, 18 Feb 2022 09:16:50 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 b15sm40995712wri.96.2022.02.18.09.16.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 09:16:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts: Add a conversion script to use SPDX license
 names
Date: Fri, 18 Feb 2022 17:16:46 +0000
Message-Id: <20220218171647.3045919-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 17:16:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161946

We're standardising on SPDX license names so it is overdue to change
the ones in the LICENSE fileds to the SPDX values. Add a conversion
script which makes this straightforward on the most part.

Ultimately this allows the core code to be more efficient and not need
to consult the mappings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/convert-spdx-licenses.py | 144 +++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100755 scripts/contrib/convert-spdx-licenses.py

diff --git a/scripts/contrib/convert-spdx-licenses.py b/scripts/contrib/convert-spdx-licenses.py
new file mode 100755
index 00000000000..09418f4050e
--- /dev/null
+++ b/scripts/contrib/convert-spdx-licenses.py
@@ -0,0 +1,144 @@
+#!/usr/bin/env python3
+#
+# Conversion script to change LICENSE entries to SPDX identifiers
+#
+# Copyright (C) 2021-2022 Richard Purdie
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import re
+import os
+import sys
+import tempfile
+import shutil
+import mimetypes
+
+if len(sys.argv) < 2:
+    print("Please specify a directory to run the conversion script against.")
+    sys.exit(1)
+
+license_map = {
+"AGPL-3" : "AGPL-3.0-only",
+"AGPL-3+" : "AGPL-3.0-or-later",
+"AGPLv3" : "AGPL-3.0-only",
+"AGPLv3+" : "AGPL-3.0-or-later",
+"AGPLv3.0" : "AGPL-3.0-only",
+"AGPLv3.0+" : "AGPL-3.0-or-later",
+"AGPL-3.0" : "AGPL-3.0-only",
+"AGPL-3.0+" : "AGPL-3.0-or-later",
+"BSD-0-Clause" : "0BSD",
+"GPL-1" : "GPL-1.0-only",
+"GPL-1+" : "GPL-1.0-or-later",
+"GPLv1" : "GPL-1.0-only",
+"GPLv1+" : "GPL-1.0-or-later",
+"GPLv1.0" : "GPL-1.0-only",
+"GPLv1.0+" : "GPL-1.0-or-later",
+"GPL-1.0" : "GPL-1.0-only",
+"GPL-1.0+" : "GPL-1.0-or-later",
+"GPL-2" : "GPL-2.0-only",
+"GPL-2+" : "GPL-2.0-or-later",
+"GPLv2" : "GPL-2.0-only",
+"GPLv2+" : "GPL-2.0-or-later",
+"GPLv2.0" : "GPL-2.0-only",
+"GPLv2.0+" : "GPL-2.0-or-later",
+"GPL-2.0" : "GPL-2.0-only",
+"GPL-2.0+" : "GPL-2.0-or-later",
+"GPL-3" : "GPL-3.0-only",
+"GPL-3+" : "GPL-3.0-or-later",
+"GPLv3" : "GPL-3.0-only",
+"GPLv3+" : "GPL-3.0-or-later",
+"GPLv3.0" : "GPL-3.0-only",
+"GPLv3.0+" : "GPL-3.0-or-later",
+"GPL-3.0" : "GPL-3.0-only",
+"GPL-3.0+" : "GPL-3.0-or-later",
+"LGPLv2" : "LGPL-2.0-only",
+"LGPLv2+" : "LGPL-2.0-or-later",
+"LGPLv2.0" : "LGPL-2.0-only",
+"LGPLv2.0+" : "LGPL-2.0-or-later",
+"LGPL-2.0" : "LGPL-2.0-only",
+"LGPL-2.0+" : "LGPL-2.0-or-later",
+"LGPL2.1" : "LGPL-2.1-only",
+"LGPL2.1+" : "LGPL-2.1-or-later",
+"LGPLv2.1" : "LGPL-2.1-only",
+"LGPLv2.1+" : "LGPL-2.1-or-later",
+"LGPL-2.1" : "LGPL-2.1-only",
+"LGPL-2.1+" : "LGPL-2.1-or-later",
+"LGPLv3" : "LGPL-3.0-only",
+"LGPLv3+" : "LGPL-3.0-or-later",
+"LGPL-3.0" : "LGPL-3.0-only",
+"LGPL-3.0+" : "LGPL-3.0-or-later",
+"MPL-1" : "MPL-1.0",
+"MPLv1" : "MPL-1.0",
+"MPLv1.1" : "MPL-1.1",
+"MPLv2" : "MPL-2.0",
+"MIT-X" : "MIT",
+"MIT-style" : "MIT",
+"openssl" : "OpenSSL",
+"PSF" : "PSF-2.0",
+"PSFv2" : "PSF-2.0",
+"Python-2" : "Python-2.0",
+"Apachev2" : "Apache-2.0",
+"Apache-2" : "Apache-2.0",
+"Artisticv1" : "Artistic-1.0",
+"Artistic-1" : "Artistic-1.0",
+"AFL-2" : "AFL-2.0",
+"AFL-1" : "AFL-1.2",
+"AFLv2" : "AFL-2.0",
+"AFLv1" : "AFL-1.2",
+"CDDLv1" : "CDDL-1.0",
+"CDDL-1" : "CDDL-1.0",
+"EPLv1.0" : "EPL-1.0",
+"FreeType" : "FTL",
+"Nauman" : "Naumen",
+"tcl" : "TCL",
+"vim" : "Vim",
+"SGIv1" : "SGI-1",
+}
+
+def processfile(fn):
+    print("processing file '%s'" % fn)
+    try:
+        fh, abs_path = tempfile.mkstemp()
+        modified = False
+        with os.fdopen(fh, 'w') as new_file:
+            with open(fn, "r") as old_file:
+                for line in old_file:
+                    if not line.startswith("LICENSE"):
+                        new_file.write(line)
+                        continue
+                    orig = line
+                    for license in sorted(license_map, key=len, reverse=True):
+                        for ending in ['"', "'", " "]:
+                            line = line.replace(license + ending, license_map[license] + ending)
+                    if orig != line:
+                        modified = True
+                    new_file.write(line)
+        if modified:
+            shutil.copymode(fn, abs_path)
+            os.remove(fn)
+            shutil.move(abs_path, fn)
+    except UnicodeDecodeError:
+        pass
+
+ourname = os.path.basename(sys.argv[0])
+ourversion = "0.01"
+
+if os.path.isfile(sys.argv[1]):
+    processfile(sys.argv[1])
+    sys.exit(0)
+
+for targetdir in sys.argv[1:]:
+    print("processing directory '%s'" % targetdir)
+    for root, dirs, files in os.walk(targetdir):
+        for name in files:
+            if name == ourname:
+                continue
+            fn = os.path.join(root, name)
+            if os.path.islink(fn):
+                continue
+            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff") or fn.endswith(".orig"):
+                continue
+            processfile(fn)
+
+print("All files processed with version %s" % ourversion)
-- 
2.32.0


