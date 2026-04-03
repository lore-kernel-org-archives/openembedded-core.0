Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2A2E7E35E
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 09:41:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8389.1775209280890880491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 02:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZgjNd6iJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E77F01A3129
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 09:41:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B18A6603C1;
	Fri,  3 Apr 2026 09:41:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51AB410451A8C;
	Fri,  3 Apr 2026 11:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775209278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1jbYtAgny00GO9mFSxtq0ScjGYDDqdwf0w1mBvB/I1w=;
	b=ZgjNd6iJq4FMF6qWNRcnYsHaNh76OdoCEMxzzF8hGiOT+bDYpbkO6oLMwB7uUhxcnsGNxB
	rDAiWK532zZceN+w/PVW/Zjdrn8sXdvYkzj4KAqjS6VkTe2H/EEnaUQQrgFSjhxH5N5PLZ
	LQmk2+bF7qJ8oAVjgpS5RBzLdYMzQYLv1UGb8XmPMCScck0EOBXWO7HuCSVXsEQ/lgbYAl
	bUehg8q/NCB82rvw/wepc8qSbRwXaekiM2ZA/8TsJI8VLnFE4Gdez5K8D02faniKxWprEz
	6p2asKS0xmtUIJ43I0jsS8IUdF7mu0WcS6lhYQvXTG3iH1PNE/PXkvLidS1DkQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	benjamin.robin@bootlin.com,
	steve@sakoman.com,
	mathieu.dubois-briand@bootlin.com,
	pascal.eberhard@se.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 1/2] linux/generate-cve-exclusions: backport script from master branch
Date: Fri,  3 Apr 2026 11:41:05 +0200
Message-ID: <20260403094106.819783-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 09:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234575

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

The current version of this script in Scarthgap is outdated, since it
still uses data from linux_kernel_cves. This repository was archived in
2024.

To avoid any risks of conflicts, and/or a patch series longer than it
needs to be, I copied the generate-cve-exclusions.py script from
oe-core's master branch (rev. "e954a94b5b528b2430e8da331107d7d58287f89b")=
 as-is.

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../linux/generate-cve-exclusions.py          | 122 +++++++++++++-----
 1 file changed, 90 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/=
recipes-kernel/linux/generate-cve-exclusions.py
index aa9195aab4..5139b11055 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -1,7 +1,7 @@
 #! /usr/bin/env python3
=20
 # Generate granular CVE status metadata for a specific version of the ke=
rnel
-# using data from linuxkernelcves.com.
+# using json data from cvelistV5 or vulns repository
 #
 # SPDX-License-Identifier: GPL-2.0-only
=20
@@ -9,7 +9,9 @@ import argparse
 import datetime
 import json
 import pathlib
-import re
+import os
+import glob
+import subprocess
=20
 from packaging.version import Version
=20
@@ -25,26 +27,82 @@ def parse_version(s):
         return Version(s)
     return None
=20
+def get_fixed_versions(cve_info, base_version):
+    '''
+    Get fixed versionss
+    '''
+    first_affected =3D None
+    fixed =3D None
+    fixed_backport =3D None
+    next_version =3D Version(str(base_version) + ".5000")
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        # In case the CVE info is not complete, it might not have defaul=
t status and therefore
+        # we don't know the status of this CVE.
+        if not "defaultStatus" in affected:
+            return first_affected, fixed, fixed_backport
+        if affected["defaultStatus"] =3D=3D "affected":
+            for version in affected["versions"]:
+                v =3D Version(version["version"])
+                if v =3D=3D Version('0'):
+                    #Skiping non-affected
+                    continue
+                if version["status"] =3D=3D "unaffected" and first_affec=
ted and v < first_affected:
+                    first_affected =3D Version(f"{v.major}.{v.minor}")
+                if version["status"] =3D=3D "affected" and not first_aff=
ected:
+                    first_affected =3D v
+                elif (version["status"] =3D=3D "unaffected" and
+                    version['versionType'] =3D=3D "original_commit_for_f=
ix"):
+                    fixed =3D v
+                elif base_version < v and v < next_version:
+                    fixed_backport =3D v
+        elif affected["defaultStatus"] =3D=3D "unaffected":
+            # Only specific versions are affected. We care only about ou=
r base version
+            if "versions" not in affected:
+                continue
+            for version in affected["versions"]:
+                if "versionType" not in version:
+                    continue
+                if version["versionType"] =3D=3D "git":
+                    continue
+                v =3D Version(version["version"])
+                # in case it is not in our base version
+                less_than =3D Version(version["lessThan"])
+
+                if not first_affected:
+                    first_affected =3D v
+                fixed =3D less_than
+                if base_version < v and v < next_version:
+                    fixed_backport =3D less_than
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
+        if affected["product"] =3D=3D "Linux" and affected["vendor"] =3D=
=3D "Linux":
+            return True
+    return False
=20
 def main(argp=3DNone):
     parser =3D argparse.ArgumentParser()
-    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to =
a clone of https://github.com/nluedtke/linux_kernel_cves")
+    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to =
a clone of https://github.com/CVEProject/cvelistV5 or https://git.kernel.=
org/pub/scm/linux/security/vulns.git")
     parser.add_argument("version", type=3DVersion, help=3D"Kernel versio=
n number to generate data for, such as 6.1.38")
=20
     args =3D parser.parse_args(argp)
-    datadir =3D args.datadir
+    datadir =3D args.datadir.resolve()
     version =3D args.version
-    base_version =3D f"{version.major}.{version.minor}"
+    base_version =3D Version(f"{version.major}.{version.minor}")
=20
-    with open(datadir / "data" / "kernel_cves.json", "r") as f:
-        cve_data =3D json.load(f)
-
-    with open(datadir / "data" / "stream_fixes.json", "r") as f:
-        stream_data =3D json.load(f)
+    data_version =3D subprocess.check_output(("git", "describe", "--tags=
", "--always", "HEAD"), cwd=3Ddatadir, text=3DTrue)
=20
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at {datetime.datetime.now(datetime.timezone.utc)} for versio=
n {version}
+# Generated at {datetime.datetime.now(datetime.timezone.utc)} for kernel=
 version {version}
+# From {datadir.name} {data_version}
=20
 python check_kernel_cve_status_version() {{
     this_version =3D "{version}"
@@ -55,17 +113,23 @@ python check_kernel_cve_status_version() {{
 do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
 """)
=20
-    for cve, data in cve_data.items():
-        if "affected_versions" not in data:
-            print(f"# Skipping {cve}, no affected_versions")
-            print()
-            continue
+    # Loop though all CVES and check if they are kernel related, newer t=
han 2015
+    pattern =3D os.path.join(datadir, '**', "CVE-20*.json")
=20
-        affected =3D data["affected_versions"]
-        first_affected, fixed =3D re.search(r"(.+) to (.+)", affected).g=
roups()
-        first_affected =3D parse_version(first_affected)
-        fixed =3D parse_version(fixed)
+    files =3D glob.glob(pattern, recursive=3DTrue)
+    for cve_file in sorted(files):
+        # Get CVE Id
+        cve =3D cve_file[cve_file.rfind("/")+1:cve_file.rfind(".json")]
+        # We process from 2015 data, old request are not properly format=
ed
+        year =3D cve.split("-")[1]
+        if int(year) < 2015:
+            continue
+        with open(cve_file, 'r', encoding=3D'utf-8') as json_file:
+            cve_info =3D json.load(json_file)
=20
+        if not is_linux_cve(cve_info):
+            continue
+        first_affected, fixed, backport_ver =3D get_fixed_versions(cve_i=
nfo, base_version)
         if not fixed:
             print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
@@ -75,19 +139,13 @@ do_cve_check[prefuncs] +=3D "check_kernel_cve_status=
_version"
                 f'CVE_STATUS[{cve}] =3D "fixed-version: Fixed from versi=
on {fixed}"'
             )
         else:
-            if cve in stream_data:
-                backport_data =3D stream_data[cve]
-                if base_version in backport_data:
-                    backport_ver =3D Version(backport_data[base_version]=
["fixed_version"])
-                    if backport_ver <=3D version:
-                        print(
-                            f'CVE_STATUS[{cve}] =3D "cpe-stable-backport=
: Backported in {backport_ver}"'
-                        )
-                    else:
-                        # TODO print a note that the kernel needs bumpin=
g
-                        print(f"# {cve} needs backporting (fixed from {b=
ackport_ver})")
+            if backport_ver:
+                if backport_ver <=3D version:
+                    print(
+                        f'CVE_STATUS[{cve}] =3D "cpe-stable-backport: Ba=
ckported in {backport_ver}"'
+                    )
                 else:
-                    print(f"# {cve} needs backporting (fixed from {fixed=
})")
+                    print(f"# {cve} may need backporting (fixed from {ba=
ckport_ver})")
             else:
                 print(f"# {cve} needs backporting (fixed from {fixed})")
=20
--=20
2.47.0


