Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D060FC8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.15019.1751425939014142367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IxWu5q41;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-749248d06faso6529549b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425938; x=1752030738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g3GEjqwCOMbDi1eW11RIQfJ5EaulEOaB0WJVRz2OCg=;
        b=IxWu5q41jPYuhnbQzeEkwNyZ+/ZmxXbQCTlzngQ4+rqE/TE+ak/3yGedvaIOXii8UT
         nVSGVrt+jl+5oM/4Qt0Yd8lSbzq+7H9E8IuAYWslVNSPZ5VEAUClstQ+f/bSzFUAH2PH
         luHCVUTbakCUr+CmSyNDuFenjAJDsiq9DZ9i1peKP6VmKtqDEPSTmfw2ddm5OxBnUbm8
         oA9MifxLndkCe5KvLNQuETPWv/juSQ4A71h7bhq/Gy5biimnRD44CFqAgw8BXunVFsAu
         KwIJN5Mv/ko0t7mUKx77pyNnx9IbIpXh2mp6nhHrYJstc7VZS+u8sbRdO4PriL5BWqDw
         FKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425938; x=1752030738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g3GEjqwCOMbDi1eW11RIQfJ5EaulEOaB0WJVRz2OCg=;
        b=hCjwxzyS7OReHHiomZAjvs+wpmnDHSPLoc3aZs1yT1F4GdLUDwanxkkfZCqNTKHxWj
         plV6iIGhyiMuB7kD0tz6aSDqI11LP3j/mTyTI1qDuffFnXT3SpDP73viVI6o2rEjMPJf
         weQs4uSsKUpl7MRuKDTND2UOU/VoKqasIdBKbl2kobDQ8Pw/v687JibVeWggCQYMPdET
         W4INl+iGKjxNWK2+uqKCy4Ps/Yso3a7J/Qn5xi684WgwHLlIgnEkbronefbmr8TkRfcH
         NWsYVVntnQGrtkO6h33QiVLhOiv7u16Gl1ZDl6NrP4SoDOk++1GNqChshzTqjAhVOU7T
         ZeVA==
X-Gm-Message-State: AOJu0YyfENSZfHV6HGrlo6IGKpKxT7OTsJfDJueg3I+uBcSx8b8Gtx9D
	rdiXvy+QhC19j33IJ0jDBiU5wQk38juagWa0BSLhlXkIpNB4HP4cbw3z5e2ncW3ubO/ATEK7Bi4
	LoJYb
X-Gm-Gg: ASbGncstMmYfYOfBVJtl7sKkpIhTpz9b3+UyXdjhT+yBK4syUF7Wfhv7/Pwp8AFyU8l
	8TPCsqNIL1SSaphR5sJkKyRYgzrhFKdAmTNmasNCnbvWrn2VF6qaNFXDI0pm+BwSdBhuEG00Pym
	iiciKXnFiRjF9i8v+Df5WxeUVnM79eXgH9ceb/TGQL1zPY/rFsYJvGVjP1UouLs6ZNw0usbcRq7
	y8Fy+28SW2xiJypqq3vj1B3gij7Rzi9fXe5QPjGKKX+z1c840QkWc3irHRoET6kxUJw/Ek9DZZi
	wy2bjvIW5Q1G7goOzjNStGNbpFbqXNa2lqyk1YcnZVIFut86OlXLmQ==
X-Google-Smtp-Source: AGHT+IEPr2oFQqlnqdQJLlqDBVSXK/aLbYXu3tMfpHbZFVgijZCA3OBmpn3+GDGGApe7NbRlB8OulQ==
X-Received: by 2002:a05:6a00:1391:b0:749:464a:a77b with SMTP id d2e1a72fcca58-74b5126bb8emr1785607b3a.18.1751425938013;
        Tue, 01 Jul 2025 20:12:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/19] linux/generate-cve-exclusions: use data from CVEProject
Date: Tue,  1 Jul 2025 20:11:46 -0700
Message-ID: <ab4d2a79188da5b58bf9a4eacc2460a00a5c1d70.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219755

From: Daniel Turull <daniel.turull@ericsson.com>

The old script was relying on linuxkernelcves.com that was archived in
May 2024 when kernel.org became a CNA.

The new script reads CVE json files from the datadir that can be either
from the official kernel.org CNA [1] or CVEProject [2]

[1] https://git.kernel.org/pub/scm/linux/security/vulns.git
[2] https://github.com/CVEProject/cvelistV5

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12612e8680798bdce39fbb79885e661596dbd53c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/generate-cve-exclusions.py          | 116 +++++++++++++-----
 1 file changed, 85 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index aa9195aab4..82fb4264e3 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -1,7 +1,7 @@
 #! /usr/bin/env python3
 
 # Generate granular CVE status metadata for a specific version of the kernel
-# using data from linuxkernelcves.com.
+# using json data from cvelistV5 or vulns repository
 #
 # SPDX-License-Identifier: GPL-2.0-only
 
@@ -9,7 +9,8 @@ import argparse
 import datetime
 import json
 import pathlib
-import re
+import os
+import glob
 
 from packaging.version import Version
 
@@ -25,22 +26,75 @@ def parse_version(s):
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
+                if v == 0:
+                    #Skiping non-affected
+                    continue
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
+                    fixed = less_than
+                if base_version < v and v < next_version:
+                    first_affected = v
+                    fixed = less_than
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
     datadir = args.datadir
     version = args.version
-    base_version = f"{version.major}.{version.minor}"
-
-    with open(datadir / "data" / "kernel_cves.json", "r") as f:
-        cve_data = json.load(f)
-
-    with open(datadir / "data" / "stream_fixes.json", "r") as f:
-        stream_data = json.load(f)
+    base_version = Version(f"{version.major}.{version.minor}")
 
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
@@ -55,17 +109,23 @@ python check_kernel_cve_status_version() {{
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
@@ -75,19 +135,13 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
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
+                    print(f"# {cve} needs backporting (fixed from {backport_ver})")
             else:
                 print(f"# {cve} needs backporting (fixed from {fixed})")
 
-- 
2.43.0


