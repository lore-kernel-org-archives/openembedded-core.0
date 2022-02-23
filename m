Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B12C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 12:54:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7155.1645620876224807216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DA65139F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:54:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7893F70D
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 04:54:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] Revert "cve-check: add lockfile to task"
Date: Wed, 23 Feb 2022 12:54:32 +0000
Message-Id: <20220223125432.2733396-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223125432.2733396-1-ross.burton@arm.com>
References: <20220223125432.2733396-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 12:54:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162259

Now that all of the functions in cve-check open the database read-only,
we can remove this lockfile.

This means cve-check can run in parallal again, improving runtimes
massively.

This reverts commit d55fbf4779483d2cfd71df78d0f733b599fef739.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index d715fbf4d8..079d09a76f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -111,7 +111,6 @@ python do_cve_check () {
 }
=20
 addtask cve_check before do_build after do_fetch
-do_cve_check[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] =3D "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] =3D "1"
=20
--=20
2.25.1


