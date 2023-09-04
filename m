Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB61C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:23:03 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.49483.1693837374678394265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hXiKEJ9T;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-54290603887so745016a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693837373; x=1694442173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HSHL0PnZr86OluZmm232nbCx94ZbHRUHHMXvhcEv7s=;
        b=hXiKEJ9T59pm6tbl72ichyzDYsf7PrWihX1B40pKMjSrmCJl9/uo1vWS26wWJE8sw5
         IHVG0FVc7FtIsJ9wI2F41V7/6zGIlQ/tIxKxi7zBeP+vaC1aH0dyE0sKGenKLJTCkDme
         6DfXsF16VJNXWDG+J3OUqsYlKL1fyICYLQPvtIUi3IN1y0Coggon6J8QLtoPMdFop3tM
         gpWT3j2Gge+IQmmDa9IaIs3FFTsPZZcnNNJ1KHs3CtYvTjNoQgw4XwKNPaqK/9tonE5P
         QRsdgoWjvvjl0vJEzrzeNrWzFi9mzXOOvhKYUSjzY+56wKxu25wt1FUD/TllI8eKMOpF
         hxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693837373; x=1694442173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HSHL0PnZr86OluZmm232nbCx94ZbHRUHHMXvhcEv7s=;
        b=ECU18aO0ue8cDUKEgYAxUWyfbKGtzPBgJCJC/Bmcjfss69QbMa/b5O/4C+UMUqFiUf
         o3wNAQ289U2CFOqopLHeps4/z6pO8HM7psFApVkahLl158uHYrSjnZBI0Gos4oySUdBI
         NOx7EUGWFhDRliCPX4LDkWqKK4aKKxC2L6R3R1EGKHCNX2Z/d3y6AYhs+nxjWJaBVd19
         HBPeBcT+xmOmlilcx75Ug8WFWoRz3GHnAHftAUDVzREGR89KGiJsDkyE7yMdKD+pw12X
         6hnX2H2t7B/IjDqb9yvum4A/fEsj7O6jr24dHx8ivmr41iU45INz2xphoDDCQx9u1nyW
         CTtg==
X-Gm-Message-State: AOJu0YxocbCdxICRWESDqxahTXFPXg09MYhNBd0TAHQpYWmrijxNghWR
	/m6KYDld9EYtmj7LUyV8YK9gnuK2QTRw+0Fddi8=
X-Google-Smtp-Source: AGHT+IHRDm99WYznJayhvC2C7uvsn6QpmumI1IjWSHYFpdGWhEiLsNv7UnldTokLz4MSgbztYrBWqw==
X-Received: by 2002:a05:6a20:841f:b0:137:3c67:85d7 with SMTP id c31-20020a056a20841f00b001373c6785d7mr11934217pzd.16.1693837373428;
        Mon, 04 Sep 2023 07:22:53 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z14-20020aa785ce000000b00689f10adef9sm7443032pfn.67.2023.09.04.07.22.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:22:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] linux-yocto: add script to generate kernel CVE_CHECK_WHITELIST entries
Date: Mon,  4 Sep 2023 04:22:38 -1000
Message-Id: <496c0b8fab5dd87102c3a63656debdb3aa214ae7.1693837232.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693837231.git.steve@sakoman.com>
References: <cover.1693837231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187185

From: Ross Burton <ross.burton@arm.com>

Instead of manually looking up new CVEs and determining what point
releases the fixes are incorporated into, add a script to generate the
CVE_CHECK_WHITELIST data automatically.

First, note that this is very much an interim solution until the
cve-check class fetches data from www.linuxkernelcves.com directly.

The script should be passed the path to a local clone of the
linuxkernelcves repository[1] and the kernel version number. It will
then write to standard output the CVE_STATUS entries for every known
kernel CVE.

The script should be periodically reran as CVEs are backported and
kernels upgraded frequently.

[1] https://github.com/nluedtke/linux_kernel_cves

Note: for the Dunfell backport this is not a cherry-pick of the commit
in master as the variable names are different. This incorporates the
following commits:

linux/generate-cve-exclusions: add version check warning
linux/generate-cve-exclusions.py: fix comparison
linux-yocto: add script to generate kernel CVE_STATUS entries

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/generate-cve-exclusions.py          | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
new file mode 100755
index 0000000000..12ae3b0b1d
--- /dev/null
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -0,0 +1,101 @@
+#! /usr/bin/env python3
+
+# Generate granular CVE status metadata for a specific version of the kernel
+# using data from linuxkernelcves.com.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import argparse
+import datetime
+import json
+import pathlib
+import re
+
+from packaging.version import Version
+
+
+def parse_version(s):
+    """
+    Parse the version string and either return a packaging.version.Version, or
+    None if the string was unset or "unk".
+    """
+    if s and s != "unk":
+        # packaging.version.Version doesn't approve of versions like v5.12-rc1-dontuse
+        s = s.replace("-dontuse", "")
+        return Version(s)
+    return None
+
+
+def main(argp=None):
+    parser = argparse.ArgumentParser()
+    parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/nluedtke/linux_kernel_cves")
+    parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
+
+    args = parser.parse_args(argp)
+    datadir = args.datadir
+    version = args.version
+    base_version = f"{version.major}.{version.minor}"
+
+    with open(datadir / "data" / "kernel_cves.json", "r") as f:
+        cve_data = json.load(f)
+
+    with open(datadir / "data" / "stream_fixes.json", "r") as f:
+        stream_data = json.load(f)
+
+    print(f"""
+# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
+# Generated at {datetime.datetime.now()} for version {version}
+
+python check_kernel_cve_status_version() {{
+    this_version = "{version}"
+    kernel_version = d.getVar("LINUX_VERSION")
+    if kernel_version != this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+}}
+do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+""")
+
+    for cve, data in cve_data.items():
+        if "affected_versions" not in data:
+            print(f"# Skipping {cve}, no affected_versions")
+            print()
+            continue
+
+        affected = data["affected_versions"]
+        first_affected, last_affected = re.search(r"(.+) to (.+)", affected).groups()
+        first_affected = parse_version(first_affected)
+        last_affected = parse_version(last_affected)
+
+        handled = False
+        if not last_affected:
+            print(f"# {cve} has no known resolution")
+        elif first_affected and version < first_affected:
+            print(f"# fixed-version: only affects {first_affected} onwards")
+            handled = True
+        elif last_affected < version:
+            print(f"# fixed-version: Fixed after version {last_affected}")
+            handled = True
+        else:
+            if cve in stream_data:
+                backport_data = stream_data[cve]
+                if base_version in backport_data:
+                    backport_ver = Version(backport_data[base_version]["fixed_version"])
+                    if backport_ver <= version:
+                        print(f"# cpe-stable-backport: Backported in {backport_ver}")
+                        handled = True
+                    else:
+                        # TODO print a note that the kernel needs bumping
+                        print(f"# {cve} needs backporting (fixed from {backport_ver})")
+                else:
+                    print(f"# {cve} needs backporting (fixed from {last_affected})")
+            else:
+                print(f"# {cve} needs backporting (fixed from {last_affected})")
+
+        if handled:
+            print(f'CVE_CHECK_WHITELIST += "{cve}"')
+
+        print()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1


