Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E346FED3FC
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32579.1777064209080665983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BPXqgZOO;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso53507985e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064207; x=1777669007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM9dy3xZ7fO4lcMOdD3JEC93WMKYTqcEWdhopusC+b0=;
        b=BPXqgZOOFsDc/B42ehQfc7yu9u+4Iw/7GE6+qmWG9angwpaNZ39afbZFNheeO5UpAE
         icnHtIrpthwXINBNIY73bZKZj5X7p7X5eLgiFDfIVESSvl8cebFMkfAmvuxBwhd9t5Sp
         EznsmifBCncXtlxjgY4vbZts80b5fSTQRCwp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064207; x=1777669007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tM9dy3xZ7fO4lcMOdD3JEC93WMKYTqcEWdhopusC+b0=;
        b=AMRtwaKH71cEgifinFQRR7fU0SEHjjXsM4aPk3IUe4ezT0eGPIdl2DiJzv/pocgaKD
         gkLdOLrM3ACiKu0HmSt62/lby/mqw621OsL/gvIp7HWP9HePApljI7k3zXO5b6VlIcQT
         9vsy3Aq4/P9WRbjMKx4l1IP+lNDeHoU8dDesQFBNAs7mt8FX/w2+tCkD2wm0F/Y73y4Z
         q1ey/HR070rLE+m7vRo8utYNk/BM/N8ybXciaK0Q62yr4nZY9Gxbk3T96WtFxmgGZ0ZP
         NGuh9ZDSeKsizeocEERLzTb7u6BbA6kiDgZ43IW4R4f6qVEcjUjQMqqVv5XJ7SjYvYmJ
         9OFA==
X-Gm-Message-State: AOJu0YyFfR4LGDM3YmpvEmEYuO1kLFr/dtxUbZce4e8eJuLp2ecSsLgE
	oQ0ThphtLG1F4KJoscZQhazdyrhl8htrVbfiNT9Ar8j7CbUFMH6RjSN5APOpv7lLKvYgql8Twlw
	ciFw0C80hmNzJ
X-Gm-Gg: AeBDievUXqMNiXXcBbyjQfXp55HGvLkd/MuU7iSveAwMBS664bCwezzFJVMGSZBJkC6
	hTejqjlnocRWGzqTPthujDzPasylY9HoWQ6eoz8u0C/OKUfIi93EYY00kQ2g2OKB0UUSdYGKdBD
	Eux9jhalq0qkPv0U8J4Z648396Xfyu/Q/bSzrv/j+Su8ucxBsyi/jJE1RYc+wfuv6sQL53/hd5v
	Vl85OiM4+IIgN9yH1gOiJrCbGXgCggjwoNi4tMzWLd3rig+BlHt2UakulLs6Y7eY1yn56vhvqLa
	bpKTFEPkta9aA/B164sfyKxfHAQ6bHZZO6VJETYO46HuAIdZUomiWzN1cXVJWW/+/h06wh+Aow2
	XEMo86HMovIJP6Jj5dt3xvnvPlY8ojyCvHG7JYm1mhAPnHaHB/1pFijskJFcP2jO9TcD2+xh6cs
	VoTYiFowvqfDcYhS4wecxfUI1Bmgh3pKxd0ST4GrlhLCmudH9N/9RiungmWNNAAMKr35/u6DqGX
	+/7haTkOGiumBc6CwT5otdTv0OpZA5zJ2TeTw==
X-Received: by 2002:a05:600c:468f:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-4891cd2624fmr310641285e9.9.1777064207160;
        Fri, 24 Apr 2026 13:56:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/66] linux/generate-cve-exclusions: backport script from master branch
Date: Fri, 24 Apr 2026 22:55:16 +0200
Message-ID: <66a13f93403533b95ed27eed24931aa310f8ce79.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235890

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

The current version of this script in Scarthgap is outdated, since it
still uses data from linux_kernel_cves. This repository was archived in
2024.

To avoid any risks of conflicts, and/or a patch series longer than it
needs to be, I copied the generate-cve-exclusions.py script from
oe-core's master branch (rev. "e954a94b5b528b2430e8da331107d7d58287f89b") as-is.

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/generate-cve-exclusions.py          | 122 +++++++++++++-----
 1 file changed, 90 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index aa9195aab4f..5139b110558 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -1,7 +1,7 @@
 #! /usr/bin/env python3
 
 # Generate granular CVE status metadata for a specific version of the kernel
-# using data from linuxkernelcves.com.
+# using json data from cvelistV5 or vulns repository
 #
 # SPDX-License-Identifier: GPL-2.0-only
 
@@ -9,7 +9,9 @@ import argparse
 import datetime
 import json
 import pathlib
-import re
+import os
+import glob
+import subprocess
 
 from packaging.version import Version
 
@@ -25,26 +27,82 @@ def parse_version(s):
         return Version(s)
     return None
 
+def get_fixed_versions(cve_info, base_version):
+    '''
+    Get fixed versionss
+    '''
+    first_affected = None
+    fixed = None
+    fixed_backport = None
+    next_version = Version(str(base_version) + ".5000")
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        # In case the CVE info is not complete, it might not have default status and therefore
+        # we don't know the status of this CVE.
+        if not "defaultStatus" in affected:
+            return first_affected, fixed, fixed_backport
+        if affected["defaultStatus"] == "affected":
+            for version in affected["versions"]:
+                v = Version(version["version"])
+                if v == Version('0'):
+                    #Skiping non-affected
+                    continue
+                if version["status"] == "unaffected" and first_affected and v < first_affected:
+                    first_affected = Version(f"{v.major}.{v.minor}")
+                if version["status"] == "affected" and not first_affected:
+                    first_affected = v
+                elif (version["status"] == "unaffected" and
+                    version['versionType'] == "original_commit_for_fix"):
+                    fixed = v
+                elif base_version < v and v < next_version:
+                    fixed_backport = v
+        elif affected["defaultStatus"] == "unaffected":
+            # Only specific versions are affected. We care only about our base version
+            if "versions" not in affected:
+                continue
+            for version in affected["versions"]:
+                if "versionType" not in version:
+                    continue
+                if version["versionType"] == "git":
+                    continue
+                v = Version(version["version"])
+                # in case it is not in our base version
+                less_than = Version(version["lessThan"])
+
+                if not first_affected:
+                    first_affected = v
+                fixed = less_than
+                if base_version < v and v < next_version:
+                    fixed_backport = less_than
+
+    return first_affected, fixed, fixed_backport
+
+def is_linux_cve(cve_info):
+    '''Return true is the CVE belongs to Linux'''
+    if not "affected" in cve_info["containers"]["cna"]:
+        return False
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        if not "product" in affected:
+            return False
+        if affected["product"] == "Linux" and affected["vendor"] == "Linux":
+            return True
+    return False
 
 def main(argp=None):
     parser = argparse.ArgumentParser()
-    parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/nluedtke/linux_kernel_cves")
+    parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/CVEProject/cvelistV5 or https://git.kernel.org/pub/scm/linux/security/vulns.git")
     parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
 
     args = parser.parse_args(argp)
-    datadir = args.datadir
+    datadir = args.datadir.resolve()
     version = args.version
-    base_version = f"{version.major}.{version.minor}"
+    base_version = Version(f"{version.major}.{version.minor}")
 
-    with open(datadir / "data" / "kernel_cves.json", "r") as f:
-        cve_data = json.load(f)
-
-    with open(datadir / "data" / "stream_fixes.json", "r") as f:
-        stream_data = json.load(f)
+    data_version = subprocess.check_output(("git", "describe", "--tags", "--always", "HEAD"), cwd=datadir, text=True)
 
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at {datetime.datetime.now(datetime.timezone.utc)} for version {version}
+# Generated at {datetime.datetime.now(datetime.timezone.utc)} for kernel version {version}
+# From {datadir.name} {data_version}
 
 python check_kernel_cve_status_version() {{
     this_version = "{version}"
@@ -55,17 +113,23 @@ python check_kernel_cve_status_version() {{
 do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 """)
 
-    for cve, data in cve_data.items():
-        if "affected_versions" not in data:
-            print(f"# Skipping {cve}, no affected_versions")
-            print()
-            continue
+    # Loop though all CVES and check if they are kernel related, newer than 2015
+    pattern = os.path.join(datadir, '**', "CVE-20*.json")
 
-        affected = data["affected_versions"]
-        first_affected, fixed = re.search(r"(.+) to (.+)", affected).groups()
-        first_affected = parse_version(first_affected)
-        fixed = parse_version(fixed)
+    files = glob.glob(pattern, recursive=True)
+    for cve_file in sorted(files):
+        # Get CVE Id
+        cve = cve_file[cve_file.rfind("/")+1:cve_file.rfind(".json")]
+        # We process from 2015 data, old request are not properly formated
+        year = cve.split("-")[1]
+        if int(year) < 2015:
+            continue
+        with open(cve_file, 'r', encoding='utf-8') as json_file:
+            cve_info = json.load(json_file)
 
+        if not is_linux_cve(cve_info):
+            continue
+        first_affected, fixed, backport_ver = get_fixed_versions(cve_info, base_version)
         if not fixed:
             print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
@@ -75,19 +139,13 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
                 f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"'
             )
         else:
-            if cve in stream_data:
-                backport_data = stream_data[cve]
-                if base_version in backport_data:
-                    backport_ver = Version(backport_data[base_version]["fixed_version"])
-                    if backport_ver <= version:
-                        print(
-                            f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"'
-                        )
-                    else:
-                        # TODO print a note that the kernel needs bumping
-                        print(f"# {cve} needs backporting (fixed from {backport_ver})")
+            if backport_ver:
+                if backport_ver <= version:
+                    print(
+                        f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"'
+                    )
                 else:
-                    print(f"# {cve} needs backporting (fixed from {fixed})")
+                    print(f"# {cve} may need backporting (fixed from {backport_ver})")
             else:
                 print(f"# {cve} needs backporting (fixed from {fixed})")
 

