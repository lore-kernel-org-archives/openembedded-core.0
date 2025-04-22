Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2662C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 13:12:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39520.1745327522445753545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC63152B;
	Tue, 22 Apr 2025 06:11:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 298C63F5A1;
	Tue, 22 Apr 2025 06:12:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: koen.kooi@oss.qualcomm.com
Subject: [PATCH] autoconf: mangle PV to avoid version-goes-backwards
Date: Tue, 22 Apr 2025 14:11:12 +0100
Message-ID: <20250422131112.2392350-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215208

I previously upgrade autoconf 2.72e (the fifth release candidate) to the
final release 2.72, but unfortunately failed to notice that the version
appears to go backwards as the package managers sort 2.72e _after_ 2.72.

We could resolve this with an epoch (via PE) but epochs are forever and
this mistake is temporary, so set a convoluted PV to fix the sorting
order that can be removed when the next major release is made.

[1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.72.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.72.bb
index f2d2781fec9..04b771d05a8 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -11,6 +11,10 @@ DEPENDS:remove:class-native =3D "autoconf-native autom=
ake-native help2man-native"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3ef=
16c \
 		    file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
=20
+# Remove this when upgrading past 2.72, as package managers sort 2.72e (=
the
+# fifth release candidate) after 2.72.
+PV =3D "2.72e+really2.72"
+
 SRC_URI =3D " \
            ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
            file://program_prefix.patch \
--=20
2.43.0


