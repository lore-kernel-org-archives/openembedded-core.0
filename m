Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C6AC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 11:43:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7079.1651059823835772364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 04:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0CCBED1;
	Wed, 27 Apr 2022 04:43:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40A8E3F5A1;
	Wed, 27 Apr 2022 04:43:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cve_check: skip remote patches that haven't been fetched when
 searching for CVE tags
Date: Wed, 27 Apr 2022 12:43:39 +0100
Message-Id: <20220427114339.1174686-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 11:43:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164919

If a remote patch is compressed we need to have run the unpack task for
the file to exist locally.  Currently cve_check only depends on fetch so
instead of erroring out, emit a warning that this file won't be scanned
for CVE references.

Typically, remote compressed patches won't contain our custom tags, so
this is unlikely to be an issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/cve_check.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index e445b7a6ae..dc7d2e2826 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -89,9 +89,10 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file =3D bb.fetch.decodeurl(url)[2]
=20
+        # Remote compressed patches may not be unpacked, so silently ign=
ore them
         if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
+            bb.warn("%s does not exist, cannot extract CVE list" % patch=
_file)
+            continue
=20
         # Check patch file name for CVE ID
         fname_match =3D cve_file_name_match.search(patch_file)
--=20
2.25.1


