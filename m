Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8248FCDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 17:04:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.132590.1697475841514274544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 10:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6DB51FB;
	Mon, 16 Oct 2023 10:04:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B55F13F64C;
	Mon, 16 Oct 2023 10:04:00 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com
Subject: [PATCH] man-db: remove inexplicable man_db.conf patch
Date: Mon, 16 Oct 2023 18:03:55 +0100
Message-Id: <20231016170355.3505964-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189308

From: Ross Burton <ross.burton@arm.com>

The patch we're applying to man_db.conf claims that the variable
@config_file_basename@ will be replaced with the package name, and that
this breaks multilib systems as that causes conflicts.

However, this suggests that both man-db and lib32-man-db are being
installed which is pointless, and the variable expands to the basename
which is just man_db.conf.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...nf-avoid-multilib-install-file-conflict.patch | 16 ----------------
 meta/recipes-extended/man-db/man-db_2.11.2.bb    |  3 +--
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/man-db/files/man_db.conf-avoid-=
multilib-install-file-conflict.patch

diff --git a/meta/recipes-extended/man-db/files/man_db.conf-avoid-multili=
b-install-file-conflict.patch b/meta/recipes-extended/man-db/files/man_db=
.conf-avoid-multilib-install-file-conflict.patch
deleted file mode 100644
index 03273d3b49f..00000000000
--- a/meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-insta=
ll-file-conflict.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-The first line of man_db.conf will be replaced by package name. And it c=
auses
-multilib install file conflict. Remove the line to avoid the issue.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/src/man_db.conf.in b/src/man_db.conf.in
-index bc8bb7e..04cfb31 100644
---- a/src/man_db.conf.in
-+++ b/src/man_db.conf.in
-@@ -1,4 +1,3 @@
--# @config_file_basename@
- #
- # This file is used by the man-db package to configure the man and cat =
paths.
- # It is also used to provide a manpath for those without one by examini=
ng
diff --git a/meta/recipes-extended/man-db/man-db_2.11.2.bb b/meta/recipes=
-extended/man-db/man-db_2.11.2.bb
index 76e3786b269..8941ffc013e 100644
--- a/meta/recipes-extended/man-db/man-db_2.11.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.11.2.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237=
af26da5dc08a4e440464 \
 SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-s=
cop.patch \
-           file://autoconf-2.73.patch \
-           file://man_db.conf-avoid-multilib-install-file-conflict.patch=
"
+           file://autoconf-2.73.patch"
 SRC_URI[sha256sum] =3D "cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938c=
c1064f058fef9f8d"
=20
 DEPENDS =3D "libpipeline gdbm groff-native base-passwd"
--=20
2.34.1


