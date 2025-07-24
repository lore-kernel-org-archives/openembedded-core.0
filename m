Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B1C87FD1
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:15:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.634.1753373751867323160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28AF31A00
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:15:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2EC5A3F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:15:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] setuptools3: clean the build directory in configure
Date: Thu, 24 Jul 2025 17:15:42 +0100
Message-ID: <20250724161543.2253776-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724161543.2253776-1-ross.burton@arm.com>
References: <20250724161543.2253776-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220847

It's not currently possible to set the build tree to be somewhere we
control, but we know it will always be in the build directory alongside
the setup.py so we can [cleandirs] that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index ee83ba83277..7f3ea4f8357 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -29,6 +29,9 @@ addtask check_backend after do_patch before do_configur=
e
 setuptools3_do_configure() {
     :
 }
+# This isn't nice, but is the best solutions to ensure clean builds for =
now.
+# https://github.com/pypa/setuptools/issues/4732
+do_configure[cleandirs] =3D "${SETUPTOOLS_SETUP_PATH}/build"
=20
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}
--=20
2.43.0


