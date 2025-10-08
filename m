Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF61CCA472
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:02:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16976.1759932150136716928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 07:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E1122FC
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 07:02:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FFA23F738
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 07:02:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: add TMPDIR to GIT_CEILING_DIRECTORIES
Date: Wed,  8 Oct 2025 15:02:24 +0100
Message-ID: <20251008140224.637323-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 14:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224582

We export GIT_CEILING_DIRECTORIES=3DWORKDIR to ensure that git calls
inside the builds don't find oe-core when they're meant to be looking
for the git repository of the source code.

However, this breaks for recipes that use work-shared (such as llvm), as
their working directory is outside of WORKDIR.

Solve this by adding TMPDIR to the list as a final catch, but keeping
WORKDIR first so that git will stop sooner in the general case.

This solves reproduciblity problems in LLVM, where for example lld's
version string would contain the URL and commit hash of the poky repo
being built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eebefc48406..1d4e44b0531 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -775,9 +775,9 @@ export PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
=20
-# Don't allow git to chdir up past WORKDIR so that it doesn't detect the=
 OE
-# repository when building a recipe
-export GIT_CEILING_DIRECTORIES =3D "${WORKDIR}"
+# Don't allow git to chdir up past WORKDIR or TMPDIR so that it doesn't =
detect the OE
+# repository when building a recipe.
+export GIT_CEILING_DIRECTORIES =3D "${WORKDIR}:${TMPDIR}"
=20
 ###
 ### Config file processing
--=20
2.43.0


