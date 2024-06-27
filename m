Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7ECC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:18:21 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.4504.1719526693701873374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3lx8i7j;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d55f198f1eso10158b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719526691; x=1720131491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtcKho1/JaVmLh6zJNUr28v4W0lhUuGqUyjx5KaBsHg=;
        b=h3lx8i7jz3LEYpoRaFTMv9clrm01thS4do7b08i+FztX4QLJC9yRhEFrfyjQnmNPUV
         /SlCtHTD5X6OVBA6AfPdkYmJnDHOPiplyYJYwWtkcpyqUIuidgO7PE7GfHvXWyzZNJfe
         3CX31857JzFbJjgxytn/O1cNlXVwDawsmVmdYL7xqBx3+CaQvKzzcaNfebxmaKUKpBW6
         yat3Vstsv9TS2dYzwx9K93rIQxwamqReB05yE3j4hnPR+6xojisyNteSXfPfgRZvsLw/
         WlPnQ2awM2dXH4JerebSAdp0OBwGmE5kFHGAsHDhGpLRY4IpybeJodjV8XWVcSqJuyWD
         Zfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526691; x=1720131491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtcKho1/JaVmLh6zJNUr28v4W0lhUuGqUyjx5KaBsHg=;
        b=TedAHyYxQrLvu9/BQAvA+oBLi8g7mpvYOuH0oqN7osR32Rz0hIVAxqhtB/cYRt+nZ8
         /grER5A7iMlrWhT58TMtSfcatrVdMRDS8vfuOrE/E9ktDcVtbjjRc0ZoiMJpdyvqMJCR
         bT0bSwOhS4TerGk2Uc5D1YbIykGMR63iZ951p4VDCTh0gtsv224I29/wC0Uq8qKpeyFU
         hgvQmWz2hevXYvXLPa+X5IgV8it1ZnbW+eu61ri/ml3amSUOI81LhhhXwZYxJVENRRJ8
         ASchdUVZhm1WWwS1wIpZWUUWhilCRWQgafP2y+28VS+3+f8WFM65NnepA99nKe49jED1
         Dg3g==
X-Gm-Message-State: AOJu0YwdfitA1lK86xbZH4HYih0e5W/21+gvptqNkCYkNKCWdhH3F+2U
	L3L0AAwJssfsYALkjK+6fvMNOtyLyP08W8iZXuqWan4Rdl03qG6eJGW3PA==
X-Google-Smtp-Source: AGHT+IFTq6GDwqkdtR3TQOzDSLPrTEUrFKKbeu55UAZox+H1YUK4xvodwEvD9grlREwJPYbAdbNkxQ==
X-Received: by 2002:a05:6808:16a6:b0:3d2:22c6:59d3 with SMTP id 5614622812f47-3d541c50f73mr17019787b6e.6.1719526691225;
        Thu, 27 Jun 2024 15:18:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::56b2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb5234esm81571b6e.58.2024.06.27.15.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:18:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] scripts/pull-spdx-licenses.py: Add script
Date: Thu, 27 Jun 2024 16:16:55 -0600
Message-ID: <20240627221804.599573-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627221804.599573-1-JPEWhacker@gmail.com>
References: <20240627221804.599573-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 22:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201213

Adds a script to pull the SPDX license data and update the license list
JSON data, as well as update the license directory.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/pull-sdpx-licenses.py | 101 ++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100755 scripts/pull-sdpx-licenses.py

diff --git a/scripts/pull-sdpx-licenses.py b/scripts/pull-sdpx-licenses.py
new file mode 100755
index 00000000000..597a62133fb
--- /dev/null
+++ b/scripts/pull-sdpx-licenses.py
@@ -0,0 +1,101 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import argparse
+import json
+import sys
+import urllib.request
+from pathlib import Path
+
+TOP_DIR = Path(__file__).parent.parent
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Update SPDX License files from upstream"
+    )
+    parser.add_argument(
+        "-v",
+        "--version",
+        metavar="MAJOR.MINOR[.MICRO]",
+        help="Pull specific version of License list instead of latest",
+    )
+    parser.add_argument(
+        "--overwrite",
+        action="store_true",
+        help="Update existing license file text with upstream text",
+    )
+    parser.add_argument(
+        "--deprecated",
+        action="store_true",
+        help="Update deprecated licenses",
+    )
+    parser.add_argument(
+        "--dest",
+        type=Path,
+        default=TOP_DIR / "meta" / "files" / "common-licenses",
+        help="Write licenses to directory DEST. Default is %(default)s",
+    )
+
+    args = parser.parse_args()
+
+    if args.version:
+        version = f"v{args.version}"
+    else:
+        # Fetch the latest release
+        req = urllib.request.Request(
+            "https://api.github.com/repos/spdx/license-list-data/releases/latest"
+        )
+        req.add_header("X-GitHub-Api-Version", "2022-11-28")
+        req.add_header("Accept", "application/vnd.github+json")
+        with urllib.request.urlopen(req) as response:
+            data = json.load(response)
+            version = data["tag_name"]
+
+    print(f"Pulling SPDX license list version {version}")
+    req = urllib.request.Request(
+        f"https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/licenses.json"
+    )
+    with urllib.request.urlopen(req) as response:
+        spdx_licenses = json.load(response)
+
+    with (TOP_DIR / "meta" / "files" / "spdx-licenses.json").open("w") as f:
+        json.dump(spdx_licenses, f, sort_keys=True, indent=2)
+
+    total_count = len(spdx_licenses["licenses"])
+    updated = 0
+    for idx, lic in enumerate(spdx_licenses["licenses"]):
+        lic_id = lic["licenseId"]
+
+        print(f"[{idx + 1} of {total_count}] ", end="")
+
+        dest_license_file = args.dest / lic_id
+        if dest_license_file.is_file() and not args.overwrite:
+            print(f"Skipping {lic_id} since it already exists")
+            continue
+
+        print(f"Fetching {lic_id}... ", end="", flush=True)
+
+        req = urllib.request.Request(lic["detailsUrl"])
+        with urllib.request.urlopen(req) as response:
+            lic_data = json.load(response)
+
+        if lic_data["isDeprecatedLicenseId"] and not args.deprecated:
+            print("Skipping (deprecated)")
+            continue
+
+        with dest_license_file.open("w") as f:
+            f.write(lic_data["licenseText"])
+        updated += 1
+        print("done")
+
+    print(f"Updated {updated} licenses")
+
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.45.2


