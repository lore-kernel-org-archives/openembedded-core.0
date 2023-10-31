Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEB2C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:36:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3662.1698777405013876344
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 11:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C5C72F4;
	Tue, 31 Oct 2023 11:37:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AF073F67D;
	Tue, 31 Oct 2023 11:36:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cve-check: don't warn if a patch is remote
Date: Tue, 31 Oct 2023 18:36:41 +0000
Message-Id: <20231031183641.62514-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 18:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189868

From: Ross Burton <ross.burton@arm.com>

We don't make do_cve_check depend on do_unpack because that would be a
waste of time 99% of the time.  The compromise here is that we can't
scan remote patches for issues, but this isn't a problem so downgrade
the warning to a note.

Also move the check for CVEs in the filename before the local file check
so that even with remote patches, we still check for CVE references in
the name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/cve_check.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index c0ab22d25ea..3fa77bf9a71 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -95,11 +95,6 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file =3D bb.fetch.decodeurl(url)[2]
=20
-        # Remote compressed patches may not be unpacked, so silently ign=
ore them
-        if not os.path.isfile(patch_file):
-            bb.warn("%s does not exist, cannot extract CVE list" % patch=
_file)
-            continue
-
         # Check patch file name for CVE ID
         fname_match =3D cve_file_name_match.search(patch_file)
         if fname_match:
@@ -107,6 +102,12 @@ def get_patched_cves(d):
             patched_cves.add(cve)
             bb.debug(2, "Found CVE %s from patch file name %s" % (cve, p=
atch_file))
=20
+        # Remote patches won't be present and compressed patches won't b=
e
+        # unpacked, so say we're not scanning them
+        if not os.path.isfile(patch_file):
+            bb.note("%s is remote or compressed, not scanning content" %=
 patch_file)
+            continue
+
         with open(patch_file, "r", encoding=3D"utf-8") as f:
             try:
                 patch_text =3D f.read()
--=20
2.34.1


