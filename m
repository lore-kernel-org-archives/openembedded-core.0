Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5256C43217
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:02:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16087.1636725762795924125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38722ED1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83263F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] ncurses: clean up pkgconfig install location
Date: Fri, 12 Nov 2021 14:02:37 +0000
Message-Id: <20211112140237.575404-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112140237.575404-1-ross.burton@arm.com>
References: <20211112140237.575404-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 14:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158222

These is now an option to set the pkg-config install location, instead of
injecting it into the install to override the detected location (which
is into the sysroot).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index a0ecd8a80b..89642ea782 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -86,6 +86,7 @@ ncurses_configure() {
 	        --with-termlib=3D${EX_TERMLIB} \
 	        --enable-sigwinch \
 	        --enable-pc-files \
+	        --with-pkg-config-libdir=3D${libdir}/pkgconfig \
 	        --disable-rpath-hack \
 		${EXCONFIG_ARGS} \
 	        --with-manpage-format=3Dnormal \
@@ -156,10 +157,7 @@ do_test() {
=20
 _install_opts =3D " install.libs install.man "
=20
-_install_cfgs =3D "\
-  DESTDIR=3D'${D}' \
-  PKG_CONFIG_LIBDIR=3D'${libdir}/pkgconfig' \
-"
+_install_cfgs =3D "DESTDIR=3D'${D}'"
=20
 do_install() {
         # Order of installation is important; widec installs a 'curses.h=
'
--=20
2.25.1


