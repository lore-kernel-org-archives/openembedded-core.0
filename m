Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B316EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:21:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20329.1688570468627048657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 197A5175A;
	Wed,  5 Jul 2023 08:21:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 24D8D3F762;
	Wed,  5 Jul 2023 08:21:07 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cml1: add showconfig task to easily find the generated .config file
Date: Wed,  5 Jul 2023 16:21:05 +0100
Message-Id: <20230705152105.2296007-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183891

From: Ross Burton <ross.burton@arm.com>

It's not that unusual to want to manually review the generated .config fi=
le
after do_configure has ran.  Add a new 'showconfig' task that simply
prints the full path to the .config file, so the user can open it in an
editor.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cml1.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.=
bbclass
index d87d8204e44..d83c636e486 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -109,3 +109,9 @@ python do_diffconfig() {
 do_diffconfig[nostamp] =3D "1"
 do_diffconfig[dirs] =3D "${KCONFIG_CONFIG_ROOTDIR}"
 addtask diffconfig
+
+do_showconfig() {
+    bbplain "Config file written to ${KCONFIG_CONFIG_ROOTDIR}/.config"
+}
+do_showconfig[nostamp] =3D "1"
+addtask showconfig after do_configure
--=20
2.34.1


