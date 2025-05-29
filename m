Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB9C5B543
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 10:58:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18046.1748516293225338744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 03:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C16C1758
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 03:57:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73E113F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 03:58:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux/generate-cve-exclusions: show the name and version of the data source
Date: Thu, 29 May 2025 11:58:07 +0100
Message-ID: <20250529105808.1943410-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 10:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217408

Add another comment to state what the data source for the CVE data was,
specifically the basename of the repository and the "git describe" output
of HEAD.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/=
recipes-kernel/linux/generate-cve-exclusions.py
index b45c2d5702a..dfc16663a58 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -11,6 +11,7 @@ import json
 import pathlib
 import os
 import glob
+import subprocess
=20
 from packaging.version import Version
=20
@@ -92,13 +93,16 @@ def main(argp=3DNone):
     parser.add_argument("version", type=3DVersion, help=3D"Kernel versio=
n number to generate data for, such as 6.1.38")
=20
     args =3D parser.parse_args(argp)
-    datadir =3D args.datadir
+    datadir =3D args.datadir.resolve()
     version =3D args.version
     base_version =3D Version(f"{version.major}.{version.minor}")
=20
+    data_version =3D subprocess.check_output(("git", "describe", "--tags=
", "HEAD"), cwd=3Ddatadir, text=3DTrue)
+
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
--=20
2.43.0


