Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B3EC001DB
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 16:08:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1654.1692979712596222358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 09:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C33D75;
	Fri, 25 Aug 2023 09:09:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AB2D3F64C;
	Fri, 25 Aug 2023 09:08:31 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 1/2] linux/generate-cve-exclusions: add version check warning
Date: Fri, 25 Aug 2023 17:08:29 +0100
Message-Id: <20230825160830.2139251-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 16:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186712

From: Ross Burton <ross.burton@arm.com>

Embed the version that this file was generated for in the include, and
compare it to the version that is being checked.

This should act as a reminder to update the file when the kernel is
upgraded.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/generate-cve-exclusions.py              | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/=
recipes-kernel/linux/generate-cve-exclusions.py
index 34f9ee731dc..3bc1c7096ff 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -42,9 +42,18 @@ def main(argp=3DNone):
     with open(datadir / "data" / "stream_fixes.json", "r") as f:
         stream_data =3D json.load(f)
=20
-    print("# Auto-generated CVE metadata, DO NOT EDIT BY HAND.")
-    print(f"# Generated at {datetime.datetime.now()} for version {versio=
n}")
-    print()
+    print(f"""
+# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
+# Generated at {datetime.datetime.now()} for version {version}
+
+python check_kernel_cve_status_version() {{
+    this_version =3D "{version}"
+    kernel_version =3D d.getVar("LINUX_VERSION")
+    if kernel_version !=3D this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
+}}
+do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
+""")
=20
     for cve, data in cve_data.items():
         if "affected_versions" not in data:
--=20
2.34.1


