Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F211CC531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 13:10:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.15722.1724418649755777417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 06:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kiYxhE1E;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d60f48a2ccso1560045a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724418649; x=1725023449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjqk0VC0zjFdtWYi3xXP1kkkdczaVzGTa7cklNUvvdw=;
        b=kiYxhE1EgArmLMb9XoaM7uL3ufeEJoXJq0BCaRsnUUb5JciN7kxvNsO9tkImGTeg6Z
         5JfRRQ9nV+54UdVE+QuRIMdX5W+K2R5kn9fsFHM7zwGqiTzZiAOOl8YKDfAL3GyS1Xq/
         l4LGDzoJpgHZPHDxx1o35r8Dt6D1idyJF7RbgLi5jrcTxmmrTM2HA65ArsVOf9gTBKrY
         NbEqSOXrC2Iz11AE+/SdZDcWWEZE8EfbnU7Ot6YQ3s71vUSNUS+uZzAhliQwecnRq7HL
         HWHkKhpPWmiqZ9QiV05CfU4kZV2UCQ2RR74e8PYNI71MWgQ/AuO1G/7l+gvR0Gd/0AbG
         AOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418649; x=1725023449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjqk0VC0zjFdtWYi3xXP1kkkdczaVzGTa7cklNUvvdw=;
        b=RJ0Y1bu5JF1M9ZFgOAwk8DyEO5q0h8IsZ1cy5fZarKIhSzhauWerxqgaiEluSrXAFq
         mHU8C3ALpIV/szdxJyMzDUCdk1HVdgniBr6WDLfDocboMNYEEYT0VNNipC2AOdk/GuEI
         FBvGfd8WNxC8NqD6UNa6p9Axp4MGpBA+jHIgJH3xUA9FymCoLF/l8iCeThKmHBGFi80u
         Ak4wW5n84Ney5bZGawxMkbhiwq11GnJvcyBDhsB1Q+zTvNYnKzi5QLjEEmf2UNOHx337
         y1wuZMYaAgVHVsnO6X5JksBy+NAaB99ypgK35lO2hwFYivGolL9DF4keY7ZPg6Q6ta46
         Nphg==
X-Gm-Message-State: AOJu0YyvHh+2Pwv0Rea5KyH5fxEkXvSPfxHky0UFZvQEAtv5zymxTcma
	pQOOqCHi9MYzg6w8269kQEkK7OeJj19WitfAJNnZsF/1hVB6RcIHGP0MVA==
X-Google-Smtp-Source: AGHT+IEqmaM7WFzQjCgTbYVMnmi/SqeOJj6HhNK9T0MrCPnHa4d1Xe2HUjWUcDsvXyt2SlZeB61ZGA==
X-Received: by 2002:a17:90a:8983:b0:2cb:4f14:2a70 with SMTP id 98e67ed59e1d1-2d646d2483amr2130084a91.30.1724418648638;
        Fri, 23 Aug 2024 06:10:48 -0700 (PDT)
Received: from localhost.localdomain ([193.33.57.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb905f25sm6322381a91.16.2024.08.23.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:10:47 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH 1/2] cve-json-to-text: add script
Date: Fri, 23 Aug 2024 15:10:33 +0200
Message-ID: <20240823131034.1580972-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 13:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203689

Add a script that converts the cve-check result from the JSON format
to the TEXT format.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 scripts/cve-json-to-text.py | 145 ++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100755 scripts/cve-json-to-text.py

diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
new file mode 100755
index 0000000000..5531ee5eb6
--- /dev/null
+++ b/scripts/cve-json-to-text.py
@@ -0,0 +1,145 @@
+#!/bin/env python3
+# SPDX-FileCopyrightText: OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+
+# CVE results conversion script: JSON format to text
+# Derived from cve-report.py from Oniro (MIT, by Huawei Inc)
+
+import sys
+import getopt
+
+infile = "in.json"
+outfile = "out.txt"
+
+
+def show_syntax_and_exit(code):
+    """
+    Show the program syntax and exit with an errror
+    Arguments:
+        code: the error code to return
+    """
+    print("Syntax: %s [-h] [-i inputJSONfile][-o outputfile]" % sys.argv[0])
+    sys.exit(code)
+
+
+def exit_error(code, message):
+    """
+    Show the error message and exit with an errror
+    Arguments:
+        code: the error code to return
+        message: the message to show
+    """
+    print("Error: %s" % message)
+    sys.exit(code)
+
+
+def parse_args(argv):
+    """
+    Parse the program arguments, put options in global variables
+    Arguments:
+        argv: program arguments
+    """
+    global infile, outfile
+    try:
+        opts, args = getopt.getopt(
+            argv, "hi:o:", ["help", "input", "output"]
+        )
+    except getopt.GetoptError:
+        show_syntax_and_exit(1)
+    for opt, arg in opts:
+        if opt in ("-h", "--help"):
+            show_syntax_and_exit(0)
+        elif opt in ("-a", "--all"):
+            show_all = True
+            show_unknown = True
+        elif opt in ("-i", "--input"):
+            infile = arg
+
+def load_json(filename):
+    """
+    Load the JSON file, return the resulting dictionary
+    Arguments:
+        filename: the file to open
+    Returns:
+        Parsed file as a dictionary
+    """
+    import json
+
+    out = {}
+    try:
+        with open(filename, "r") as f:
+            out = json.load(f)
+    except FileNotFoundError:
+        exit_error(1, "Input file (%s) not found" % (filename))
+    except json.decoder.JSONDecodeError as error:
+        exit_error(1, "Malformed JSON file: %s" % str(error))
+    return out
+
+
+def process_data(filename, data):
+    """
+    Write the resulting CSV with one line for each package
+    Arguments:
+        filename: the file to write to
+        data: dictionary from parsing the JSON file
+    Returns:
+        None
+    """
+    if not "version" in data or data["version"] != "1":
+        exit_error(1, "Unrecognized format version number")
+    if not "package" in data:
+        exit_error(1, "Mandatory 'package' key not found")
+
+    lines = ""
+    total_issue_count = 0
+    for package in data["package"]:
+        package_info = ""
+        keys_in_package = {"name", "layer", "version", "issue"}
+        if keys_in_package - package.keys():
+            exit_error(
+                1,
+                "Missing a mandatory key in package: %s"
+                % (keys_in_package - package.keys()),
+            )
+
+        package_info += "LAYER: %s\n" % package["layer"]
+        package_info += "PACKAGE NAME: %s\n" % package["name"]
+        package_info += "PACKAGE VERSION: %s\n" % package["version"]
+
+        for issue in package["issue"]:
+            keys_in_issue = {"id", "status", "detail"}
+            if keys_in_issue - issue.keys():
+                print("Warning: Missing keys %s in 'issue' for the package '%s'"
+                    % (keys_in_issue - issue.keys(), package["name"]))
+
+            lines += package_info
+            lines += "CVE: %s\n" % issue["id"]
+            lines += "CVE STATUS: %s\n" % issue["status"]
+            lines += "CVE DETAIL: %s\n" % issue["detail"]
+            if "description" in issue:
+                lines += "CVE DESCRIPTION: %s\n" % issue["description"]
+            if "summary" in issue:
+                lines += "CVE SUMMARY: %s\n" % issue["summary"]
+            if "scorev2" in issue:
+                lines += "CVSS v2 BASE SCORE: %s\n" % issue["scorev2"]
+            if "scorev3" in issue:
+                lines += "CVSS v3 BASE SCORE: %s\n" % issue["scorev3"]
+            if "vector" in issue:
+                lines += "VECTOR: %s\n" % issue["vector"]
+            if "vectorString" in issue:
+                lines += "VECTORSTRING: %s\n" % issue["vectorString"]
+            lines += "MORE INFORMATION: https://nvd.nist.gov/vuln/detail/%s\n" % issue["id"]
+            lines += "\n"
+
+    with open(filename, "w") as f:
+        f.write(lines)
+
+def main(argv):
+    parse_args(argv)
+    data = load_json(infile)
+    process_data(outfile, data)
+
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
-- 
2.43.0


