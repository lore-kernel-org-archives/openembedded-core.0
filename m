Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7D3C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:54 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.132.1693169566165687472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TfFonWCZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a8614fe8c4so2092100b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693169565; x=1693774365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIpWLj1NkB9je/dgR3CXyajtQg/wTrJ1vg3wyWQiIDY=;
        b=TfFonWCZ/xarJ6a/TBIre6mNrEnYsOjaE/pv3pfifTQicJzleF5lo3JWuzbvLGYABX
         /39fqyf50zwJhNFkmANBMTf0FK9k/1S8qVc41Eqr9DJkC1at5QYqrJZHvLGwhaYpJ1yK
         d5XLxA+c4nLI/t+pkX8xKL9aUXAV7L3mmsgojllTNx8Y12tWEynb8CbPRKxJq/RrHztj
         YsTZHX2bozWVEUIoSX61yIFM1iSlitOAbtDdhBhu/8/97knWx6xzSGn2Yi1JbtIgPuI+
         0oZiZD3AdDmYCZF3bmW9PcH953hCBKugskljSakk451u7NHc7QnlpxYLF+PWBbSamBak
         EAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169565; x=1693774365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIpWLj1NkB9je/dgR3CXyajtQg/wTrJ1vg3wyWQiIDY=;
        b=BHdhwbYaGkXMeZcb3A/dsrzUP32gVBdHy4CODc33wZ+2lm/pUD1YHOqYtAtmcMZ09Q
         T1+1FF+FFyjkElHrGxPY4YCZSxS0FJiPOHbq9S1r6fGTB9K8JIAslzaU3NScpcL47d7a
         /ewV6NnwGZp227ytKJerZtxf9d0mcKqBxG4PmNhlpjpGhsmkwuOxav1/cv4uDvl+y63J
         4XSxYVDwvwK0RIQgUNmePLyGkt1GE2Roe/ybL9zrMr4E3CMst/ehmYdkT/DXWEsN0Ivm
         2FN6TtPXT9goatICZAc/SG61R4BYDa1IOu0THA/3N5lFg6JuYoyKYwGH6w+GCCl5DAl4
         MsDQ==
X-Gm-Message-State: AOJu0Yz8hfnKL5THUWEgskCgmmaUPZxh01y9hgU7IQ7r+pK89SJhimT+
	Q4zUWwd1z+lbUqcdKEs4GQSP10gPGVdBhYWmf/a3RQ==
X-Google-Smtp-Source: AGHT+IFuAHValOJJf8b1HS3ztypaNTLrSGegRTOFu2PR8PynkGp/qiq9t/UE114Joh7qD0YA9OcQ+Q==
X-Received: by 2002:a05:6808:1393:b0:3a7:73e0:d18f with SMTP id c19-20020a056808139300b003a773e0d18fmr11676459oiw.14.1693169565132;
        Sun, 27 Aug 2023 13:52:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a63c142000000b00565dd935938sm1220684pgi.85.2023.08.27.13.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:52:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] linux-yocto: add script to generate kernel CVE_CHECK_IGNORE entries
Date: Sun, 27 Aug 2023 10:52:26 -1000
Message-Id: <c7a71692b7ed4cc2187f4c82bf11e32e0ce32cb6.1693169420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693169420.git.steve@sakoman.com>
References: <cover.1693169420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186801

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


