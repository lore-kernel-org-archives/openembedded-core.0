Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF19C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 13:22:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8222.1651065752904831034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 06:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 009AFED1;
	Wed, 27 Apr 2022 06:22:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83EB43F5A1;
	Wed, 27 Apr 2022 06:22:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cve-check: no need to depend on the fetch task
Date: Wed, 27 Apr 2022 14:22:28 +0100
Message-Id: <20220427132228.1179532-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 13:22:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164921

The only part of the cve-check task which needs files is the patch
examination, and typically these patches are local so fetch isn't needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 78516d0bb6..7cf206299b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -126,7 +126,7 @@ python do_cve_check () {
=20
 }
=20
-addtask cve_check before do_build after do_fetch
+addtask cve_check before do_build
 do_cve_check[depends] =3D "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] =3D "1"
=20
--=20
2.25.1


