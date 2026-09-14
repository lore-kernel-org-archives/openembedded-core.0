Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA59C88E70
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:08:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18723.1789387694568946492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TYd7IKVH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44A1A1570
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84C933F9A2
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789387693; bh=ZDcabAgidLAYoINRpO1FdYE1mQe7TFUno+C+nvwFaqM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TYd7IKVHIG0gBH6OPAIobEhtOcA2EwTfAWlJ7ajJJZ6HBmogOn6SCZSOV/NDI7tTA
	 kGo52CJzsC0Q+OC7FGtLYlJwrY4N9tgqhwLou7nnRUSLupugxbCGO8yAI4+1fxEi8n
	 J+mVcjr8bioAoQGYNVn4vGV6vX44mdTRkR9XWRyw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] xdg-utils: refresh runtime dependencies
Date: Mon, 14 Sep 2026 13:08:05 +0100
Message-ID: <20260914120807.2162673-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914120807.2162673-1-ross.burton@arm.com>
References: <20260914120807.2162673-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245768

xdg-utils doesn't _need_ x11, so make the X11 dependencies dependent on
the x11 DISTRO_FEATURE being set.

Also add xset, file, and dbus-tools (for dbus-send) to the dependency
list, as they're also needed.

Finally convert the dependencies to recommends, as they're not needed by
all tools and it might be desirable to ship xdg-utils but not all of the
dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/re=
cipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 482cf3aa7a3..7141a72dd53 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "The xdg-utils package is a set of simple=
 scripts that provide bas
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da5367a90934098d6b05af3b746405=
014"
=20
+DEPENDS =3D "xmlto-native libxslt-native"
+
 SRC_URI =3D "git://gitlab.freedesktop.org/xdg/xdg-utils.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3Dv${PV} \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
@@ -14,12 +16,9 @@ SRC_URI =3D "git://gitlab.freedesktop.org/xdg/xdg-util=
s.git;protocol=3Dhttps;branch=3D
 SRCREV =3D "159fc37075db2decf446f453fe1a796da6921aad"
=20
 # Needs brokensep as this doesn't use automake
-inherit autotools-brokensep features_check
+inherit autotools-brokensep
=20
-# The xprop requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES =3D "x11"
-
-DEPENDS =3D "xmlto-native libxslt-native"
-RDEPENDS:${PN} +=3D "xprop"
+RRECOMMENDS:${PN} =3D "dbus-tools file \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xprop xset', '', d)}=
"
=20
 CVE_STATUS[CVE-2025-52968] =3D "disputed"
--=20
2.43.0


