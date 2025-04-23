Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC343C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:08:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11021.1745420877703591320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 08:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 813A41063;
	Wed, 23 Apr 2025 08:07:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B28253F66E;
	Wed, 23 Apr 2025 08:07:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: koen.kooi@oss.qualcomm.com
Subject: [PATCH v2] autoconf: mangle PV to avoid version-goes-backwards
Date: Wed, 23 Apr 2025 16:07:46 +0100
Message-ID: <20250423150746.3951901-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 15:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215314

I previously upgrade autoconf 2.72e (the fifth release candidate) to the
final release 2.72, but unfortunately failed to notice that the version
appears to go backwards as the package managers sort 2.72e _after_ 2.72.

We could resolve this with an epoch (via PE) but epochs are forever and
this mistake is temporary, so set a convoluted PV to fix the sorting
order that can be removed when the next major release is made.

[1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.72.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.72.bb
index f2d2781fec9..283596d556e 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -11,8 +11,14 @@ DEPENDS:remove:class-native =3D "autoconf-native autom=
ake-native help2man-native"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb558bbd9eb7fbaa3ef=
16c \
 		    file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
=20
+# Remove this when upgrading past 2.72, as package managers sort 2.72e (=
the
+# fifth release candidate) after 2.72.
+REALPV =3D "2.72"
+PV =3D "2.72e+really${REALPV}"
+S =3D "${WORKDIR}/${BPN}-${REALPV}"
+
 SRC_URI =3D " \
-           ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
+           ${GNU_MIRROR}/autoconf/${BPN}-${REALPV}.tar.gz \
            file://program_prefix.patch \
            file://autoreconf-exclude.patch \
            file://remove-usr-local-lib-from-m4.patch \
--=20
2.43.0


