Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7858C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 15:15:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12869.1656515724988767526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D110B153B;
	Wed, 29 Jun 2022 08:15:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF633F792;
	Wed, 29 Jun 2022 08:15:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] cve-check: hook cleanup to the BuildCompleted event,
 not CookerExit
Date: Wed, 29 Jun 2022 16:15:19 +0100
Message-Id: <20220629151519.1179173-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629151519.1179173-1-ross.burton@arm.com>
References: <20220629151519.1179173-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 15:15:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167382

The cve-check class writes temporary files to preserve state across the
build, and cleans them up in a CookerExit handler.

However, in memory-resident builds the cooker won't exit in between
builds, so the state isn't cleared and the CVE report generation fails:

NOTE: Generating JSON CVE summary
ERROR: Error adding the same package twice

Easily solved by hooking to BuildCompleted, instead of CookerExit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index 50b9247f464..da7f93371c0 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -166,7 +166,7 @@ python cve_check_cleanup () {
 }
=20
 addhandler cve_check_cleanup
-cve_check_cleanup[eventmask] =3D "bb.cooker.CookerExit"
+cve_check_cleanup[eventmask] =3D "bb.event.BuildCompleted"
=20
 python cve_check_write_rootfs_manifest () {
     """
--=20
2.25.1


