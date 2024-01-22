Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA766C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:04:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.74557.1705932248731841943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 692D5FEC
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 069303F73F
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:07 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] cve_check: cleanup logging
Date: Mon, 22 Jan 2024 14:04:03 +0000
Message-Id: <20240122140406.3837333-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122140406.3837333-1-ross.burton@arm.com>
References: <20240122140406.3837333-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194161

From: Ross Burton <ross.burton@arm.com>

Primarily list the number of patches found, useful when debugging.

Also clean up some bad escaping that caused warnings and use
re.IGNORECASE instead of manually doing case-insenstive rang matches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/cve_check.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index b5fc5364dc8..ed5c714cb8b 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -79,20 +79,19 @@ def get_patched_cves(d):
     import re
     import oe.patch
=20
-    pn =3D d.getVar("PN")
-    cve_match =3D re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+    cve_match =3D re.compile(r"CVE:( CVE-\d{4}-\d+)+")
=20
     # Matches the last "CVE-YYYY-ID" in the file name, also if written
     # in lowercase. Possible to have multiple CVE IDs in a single
     # file name, but only the last one will be detected from the file na=
me.
     # However, patch files contents addressing multiple CVE IDs are supp=
orted
     # (cve_match regular expression)
-
-    cve_file_name_match =3D re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECA=
SE)
=20
     patched_cves =3D set()
-    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
-    for url in oe.patch.src_patches(d):
+    patches =3D oe.patch.src_patches(d)
+    bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
+    for url in patches:
         patch_file =3D bb.fetch.decodeurl(url)[2]
=20
         # Check patch file name for CVE ID
@@ -100,7 +99,7 @@ def get_patched_cves(d):
         if fname_match:
             cve =3D fname_match.group(1).upper()
             patched_cves.add(cve)
-            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, p=
atch_file))
+            bb.debug(2, "Found %s from patch file name %s" % (cve, patch=
_file))
=20
         # Remote patches won't be present and compressed patches won't b=
e
         # unpacked, so say we're not scanning them
--=20
2.34.1


