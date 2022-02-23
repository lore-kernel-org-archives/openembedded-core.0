Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D67DC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 12:54:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7154.1645620876224628255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B89AED1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:54:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461FD3F70D
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:54:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] cve-check: get_cve_info should open the database
 read-only
Date: Wed, 23 Feb 2022 12:54:31 +0000
Message-Id: <20220223125432.2733396-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 12:54:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162258

All of the function in cve-check should open the database read-only, as
the only writer is the fetch task in cve-update-db.  However,
get_cve_info() was failing to do this, which might be causing locking
issues with sqlite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 2d69aeba4b..d715fbf4d8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -265,7 +265,8 @@ def get_cve_info(d, cves):
     import sqlite3
=20
     cve_data =3D {}
-    conn =3D sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
+    db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
+    conn =3D sqlite3.connect(db_file, uri=3DTrue)
=20
     for cve in cves:
         for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,=
)):
--=20
2.25.1


