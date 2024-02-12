Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342FAC4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 19:53:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16532.1707767629830912936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 11:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CABADA7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 11:54:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB7623F766
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 11:53:48 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] cve-update-nvd2: ignore rejected CVEs
Date: Mon, 12 Feb 2024 19:53:46 +0000
Message-Id: <20240212195346.1315761-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 19:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195360

From: Ross Burton <ross.burton@arm.com>

We shouldn't consider CVEs which have been marked as rejected or
disputed by either NIST or the upstream project.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
index bfe48b27e79..719b2f639a1 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -170,7 +170,8 @@ def update_db_file(db_tmp_file, d, database_time):
     conn =3D sqlite3.connect(db_tmp_file)
     initialize_db(conn)
=20
-    req_args =3D {'startIndex' : 0}
+    req_args =3D {'startIndex' : 0,
+                'noRejected': ''}
=20
     # The maximum range for time is 120 days
     # Force a complete update if our range is longer
--=20
2.34.1


