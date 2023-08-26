Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C23C83F01
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.10481.1693064344813960918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fzBPmafN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68a3e943762so1671118b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064344; x=1693669144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIpWLj1NkB9je/dgR3CXyajtQg/wTrJ1vg3wyWQiIDY=;
        b=fzBPmafNxQ7Wy4DDq4+KfrqfNWbyWH6b3VH2oOEYyADTFNX0FDLaHdrF+CAnWGZulK
         pIqkJ9od/eiXcYWKp8atg0izAZpXLNFuMFFfv7ZUpKR0m0Bf/QkizruLsigaDR8OTovq
         5CW5XrWBrZbtv7w6NOVP1ATyr+irDFfp1MOeloFofuvqrCh/2NCpWGJHupI5Vj6oohrC
         j7tx/4QRrXdpmSSnl7LGMCJsPMC7X0OTWoCZJdlMataFdkC6zg41J+uAw3Gk1wAjP00N
         62YclV2opZYwMmUtMKHvATb1/iI8Z1O9VSauISY1WjDufXUo0yu63+m4iwETLXrpbp4F
         8NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064344; x=1693669144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIpWLj1NkB9je/dgR3CXyajtQg/wTrJ1vg3wyWQiIDY=;
        b=Ok9GWb6Afkn8RswyLPFHcnxbFDpQRDz5Tu1aZ89y/GuQQ5qNSY+aK7rwIbbW6T5q4T
         Qaj7lJs/DZkCJ3lWgDQJKDAV5X40xYulMqKyjEYA6l1cLOy94F5Hy7xr0T/D9JAqK6Oz
         4zT90ilVhqFMy7J+jYOrsrpv0RnjekTAu5xAfO1VsIkS3wiCWIpMaIj5lccZzYx+SvJG
         hY78InFYcg40/8NWVwMcj8Dr/2DTKrP0pHIbuhRHSRhZGXpJ4t0jpweHpNnlRAo4j8W5
         AM69Gc2xyraCCGZwH2ba5KrhYFaahfEHdnORBpZzt/unTbSgc8AxKnDgpKag+m0SRWmo
         ydKQ==
X-Gm-Message-State: AOJu0YwJX8rRR2ukj1jZUDdN1wsusDIMFOG0Hu7n1pfFVWRuJI9+z6Mb
	FGz1peaUdDI6FZ98zbU5UEEje1N3oo+ucHT4gdU=
X-Google-Smtp-Source: AGHT+IHlmnFlBjcpYKSgQl9eKRGi2wbYY2P4OH8jBYTQV1twyu7euK3BTF93GImWHHDfOW4fcV+K7Q==
X-Received: by 2002:a05:6a00:1955:b0:68a:3fbb:3985 with SMTP id s21-20020a056a00195500b0068a3fbb3985mr20655382pfk.20.1693064343834;
        Sat, 26 Aug 2023 08:39:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/20] linux-yocto: add script to generate kernel CVE_CHECK_IGNORE entries
Date: Sat, 26 Aug 2023 05:38:35 -1000
Message-Id: <f9bfaee1c05a61457ada7850d707a847f327e605.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186748

From: Ross Burton <ross.burton@arm.com>

Instead of manually looking up new CVEs and determining what point
releases the fixes are incorporated into, add a script to generate the
CVE_CHECK_IGNORE data automatically.

First, note that this is very much an interim solution until the
cve-check class fetches data from www.linuxkernelcves.com directly.

The script should be passed the path to a local clone of the
linuxkernelcves repository[1] and the kernel version number. It will
then write to standard output the CVE_STATUS entries for every known
kernel CVE.

The script should be periodically reran as CVEs are backported and
kernels upgraded frequently.

[1] https://github.com/nluedtke/linux_kernel_cves

Note: for the backport this is not a cherry-pick of the commit in master
as the variable names are different. This incorporates the following
commits:

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
index 0000000000..b9b87f245d
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
+            print(f'CVE_CHECK_IGNORE += "{cve}"')
+
+        print()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1


