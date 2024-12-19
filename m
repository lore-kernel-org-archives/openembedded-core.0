Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E3BE7718E
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:12:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.129620.1734617518656757633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CF311762
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:12:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB1E53F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:11:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] expect: don't run aclocal in do_configure
Date: Thu, 19 Dec 2024 14:11:50 +0000
Message-ID: <20241219141151.2592031-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219141151.2592031-1-ross.burton@arm.com>
References: <20241219141151.2592031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208915

expect has a hand-maintained aclocal.m4 so don't run aclocal, which has t=
he
side effect of not deleting the aclocal.m4 file which pulls in macros.

The build works without this change more through luck and a combination
of behaviours than design.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
index 3d50a8f25a1..3886a5771a2 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -39,6 +39,8 @@ UPSTREAM_CHECK_REGEX =3D "/Expect/(?P<pver>(\d+[\.\-_]*=
)+)/"
=20
 S =3D "${WORKDIR}/${BPN}${PV}"
=20
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
+
 do_install:append() {
 	install -d ${D}${libdir}
         install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${=
libdir}/
--=20
2.43.0


