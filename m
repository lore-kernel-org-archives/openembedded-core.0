Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3E8E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:12:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.129617.1734617517231799601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECF801D13
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:12:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 76B233F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:11:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] tcl: don't run aclocal in do_configure
Date: Thu, 19 Dec 2024 14:11:48 +0000
Message-ID: <20241219141151.2592031-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219141151.2592031-1-ross.burton@arm.com>
References: <20241219141151.2592031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208913

tcl has a hand-maintained aclocal.m4 so don't run aclocal, which has the
side effect of not deleting the aclocal.m4 file which pulls in macros.

The build works without this change more through luck and a combination
of behaviours than design.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl_9.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.0.bb
index 46e8e7d5c52..b67847c5260 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -35,6 +35,8 @@ VER =3D "${PV}"
 inherit autotools ptest binconfig
=20
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
+EXTRA_AUTORECONF =3D "--exclude=3Daclocal"
+
 EXTRA_OECONF =3D "--disable-rpath --enable-man-suffix=3Dtcl9"
=20
 # Prevent installing copy of tzdata based on tzdata installation on the =
build host
--=20
2.43.0


