Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0504C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 21:36:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1031.1743111396762742971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 14:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 327F41762
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:36:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3AD63F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:36:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] coreutils: add missing ptest dependencies
Date: Thu, 27 Mar 2025 21:36:25 +0000
Message-ID: <20250327213627.530742-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 21:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213788

One tests needs xz, and the acl and attr tests if enabled need the
corresponding tools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-=
core/coreutils/coreutils_9.6.bb
index 6db435cfcb8..d89c75ba665 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -222,4 +222,7 @@ do_install_ptest:append:libc-musl () {
     sed -i -e '/tests\/dd\/no-allocate.sh/d' ${D}${PTEST_PATH}/Makefile
     sed -i -e '/tests\/split\/line-bytes.sh/d' ${D}${PTEST_PATH}/Makefil=
e
 }
-RDEPENDS:${PN}-ptest +=3D "${PN}-getlimits"
+
+RDEPENDS:${PN}-ptest +=3D "${PN}-getlimits xz  \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'a=
cl', '', d)} \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'xattr', =
'attr', '', d)}"
--=20
2.43.0


