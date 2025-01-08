Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E273E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:46:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22870.1736351201607070530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57D1513D5
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:47:09 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B54EB3F66E
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:46:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] rsync: clean up configure/configure.sh fiddling
Date: Wed,  8 Jan 2025 15:46:33 +0000
Message-ID: <20250108154636.1431857-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209569

The upstream Makefiles tell autoconf to write the generated script to
configure.sh instead of the idiomatic configure.  We now remove all of
the Makefile rules that refer to configure.sh (makefile-no-rebuild.patch)
but some pieces remained, so remove them too and delete the existing
configure.sh to avoid confusion for anyone looking at the build treee.

Also add a comment explaining why autotools-brokensep is used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rsync/rsync_3.3.0.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.3.0.bb b/meta/recipes-de=
vtools/rsync/rsync_3.3.0.bb
index a90d2887bd5..c03bb270d41 100644
--- a/meta/recipes-devtools/rsync/rsync_3.3.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/=
${BP}.tar.gz \
            "
 SRC_URI[sha256sum] =3D "7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1=
348498d07041df90"
=20
+# Doesn't use automake
 inherit autotools-brokensep
=20
 PACKAGECONFIG ??=3D "acl attr \
@@ -49,14 +50,10 @@ EXTRA_OECONF =3D "--disable-md2man --with-nobody-grou=
p=3Dnogroup"
 #| If you can't fix the issue, re-run ./configure with --disable-roll-si=
md.
 EXTRA_OECONF:append:libc-musl =3D " --disable-roll-simd"
=20
-# rsync 3.0 uses configure.sh instead of configure, and
-# makefile checks the existence of configure.sh
+# rsync uses configure.sh instead of configure, so delete that file
+# to avoid confusion as we will generate configure.
 do_configure:prepend () {
-	rm -f ${S}/configure ${S}/configure.sh
-}
-
-do_configure:append () {
-	cp -f ${S}/configure ${S}/configure.sh
+       rm -f ${S}/configure.sh
 }
=20
 do_install:append() {
--=20
2.43.0


