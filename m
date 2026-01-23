Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F87D778AB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 18:05:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1639.1769191500900448311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C971476
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:04:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 31C8C3F694
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:05:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] pkgconf: add pkg-config-native to the nativesdk package
Date: Fri, 23 Jan 2026 18:04:47 +0000
Message-ID: <20260123180448.2997378-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123180448.2997378-1-ross.burton@arm.com>
References: <20260123180448.2997378-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 18:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229910

This was added to the pkg-config recipe but not pkgconf.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_2.5.1.bb
index e3500431b3..e335c843bd 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -43,6 +43,15 @@ do_install:append:class-native () {
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
=20
+do_install:append:class-nativesdk () {
+    # Install a pkg-config-native wrapper that will use the native sysro=
ot instead
+    # of the MACHINE sysroot, for using pkg-config when building native =
tools.
+    sed -e "s|@PATH_NATIVE@|\$OECORE_NATIVE_SYSROOT|" \
+        -e "s|@LIBDIR_NATIVE@|\$OECORE_NATIVE_SYSROOT/usr/lib/pkgconfig|=
" \
+        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
+
 # When using the RPM generated automatic package dependencies, some pack=
ages
 # will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
 # specifying an appropriate provide.
--=20
2.43.0


