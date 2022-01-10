Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDF4C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 12:19:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30835.1641817175853408900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 04:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6592B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 04:19:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E65223F5A1
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 04:19:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xserver-xorg: whitelist two CVEs
Date: Mon, 10 Jan 2022 12:19:32 +0000
Message-Id: <20220110121932.4090264-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 12:19:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160345

CVE-2011-4613 is specific to Debian/Ubuntu.

CVE-2020-25697 is a non-trivial attack that may not actually be feasible
considering the default behaviour for clients is to exit if the
connection is lost.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
index 4e88cf26f7..437d5a8861 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -20,6 +20,14 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_=
PN}-${PV}.tar.xz"
 UPSTREAM_CHECK_REGEX =3D "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
=20
 CVE_PRODUCT =3D "xorg-server x_server"
+# This is specific to Debian's xserver-wrapper.c
+CVE_CHECK_WHITELIST +=3D "CVE-2011-4613"
+# As per upstream, exploiting this flaw is non-trivial and it requires e=
xact
+# timing on the behalf of the attacker. Many graphical applications exit=
 if their
+# connection to the X server is lost, so a typical desktop session is ei=
ther
+# impossible or difficult to exploit. There is currently no upstream pat=
ch
+# available for this flaw.
+CVE_CHECK_WHITELIST +=3D "CVE-2020-25697"
=20
 S =3D "${WORKDIR}/${XORG_PN}-${PV}"
=20
--=20
2.25.1


