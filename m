Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6185BC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11347.1651852570392426957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2EE11042;
	Fri,  6 May 2022 08:56:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 696053F885;
	Fri,  6 May 2022 08:56:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] Revert "bitbake.conf: mark all directories as safe for
 git to read"
Date: Fri,  6 May 2022 16:56:04 +0100
Message-Id: <20220506155604.2401829-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506155604.2401829-1-ross.burton@arm.com>
References: <20220506155604.2401829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165348

Turns out this doesn't actually work, as git doesn't respect the environm=
ent
when reading the safe.directory configuration variable.

This reverts commit d4a5862ce8db97d26a3c32c4cffea3197c1defec.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1deba8d910..0e939aca4f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -776,18 +776,10 @@ export PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
=20
-# Git configuration
-
 # Don't allow git to chdir up past WORKDIR so that it doesn't detect the=
 OE
 # repository when building a recipe
 export GIT_CEILING_DIRECTORIES =3D "${WORKDIR}"
=20
-# Treat all directories are safe, as during fakeroot tasks git will run =
as
-# root so recent git releases (eg 2.30.3) will refuse to work on reposit=
ories. See
-# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7=
e7d9 for
-# further details.
-export GIT_CONFIG_PARAMETERS=3D"'safe.directory=3D*'"
-
 ###
 ### Config file processing
 ###
--=20
2.25.1


