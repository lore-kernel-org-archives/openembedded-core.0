Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A80C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:07:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5367.1650974846978462288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4448823A
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:07:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E49DF3F5A1
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:07:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] bitbake.conf: mark all directories as safe for git to
 read
Date: Tue, 26 Apr 2022 13:07:20 +0100
Message-Id: <20220426120720.969039-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 12:07:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164868

Recent git releases containing [1] have an ownership check when opening
repositories, and refuse to open a repository if it is owned by a
different user.

This breaks any use of git in do_install, as that is executed by the
(fake) root user. Whilst not common, this does happen.

Setting the git configuration safe.directories=3D* disables this check, s=
o
that git is usable in fakeroot tasks.  This can be set globally via the
internal environment variable GIT_CONFIG_PARAMETERS, we can't use
GIT_CONFIG_*_KEY/VALUE as that isn't present in all the releases which
have the ownership check.

We already set GIT_CEILING_DIRECTORIES to ensure that git doesn't
recurse up out of the work directory, so this isn't a security issue.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb=
7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0e939aca4f..1deba8d910 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -776,10 +776,18 @@ export PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
=20
+# Git configuration
+
 # Don't allow git to chdir up past WORKDIR so that it doesn't detect the=
 OE
 # repository when building a recipe
 export GIT_CEILING_DIRECTORIES =3D "${WORKDIR}"
=20
+# Treat all directories are safe, as during fakeroot tasks git will run =
as
+# root so recent git releases (eg 2.30.3) will refuse to work on reposit=
ories. See
+# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7=
e7d9 for
+# further details.
+export GIT_CONFIG_PARAMETERS=3D"'safe.directory=3D*'"
+
 ###
 ### Config file processing
 ###
--=20
2.25.1


