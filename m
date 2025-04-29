Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE4BC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 19:43:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32.1745955811177050995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 12:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD8F150C
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 12:43:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 397E43F673
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 12:43:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] autoconf: set PKGV to avoid version-goes-backwards
Date: Tue, 29 Apr 2025 20:43:25 +0100
Message-ID: <20250429194325.4184267-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215689

I previously upgrade autoconf 2.72e (the fifth release candidate) to the
final release 2.72, but unfortunately failed to notice that the version
appears to go backwards as the package managers sort 2.72e _after_ 2.72.

We could resolve this with an epoch (via PE) but epochs are forever and
this mistake is temporary. We could set a convoluted PV but that gets
messy as it then means SRC_URI needs to set manually.  Instead, set a
convoluted PKGV to fix the sorting order in a way that only alters the
output packages and nothing else, which can be removed when the next
major release is made.

[1] oe-core 11ff8dba0ce ("autoconf: upgrade to final 2.72 release")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.72.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.72.bb
index f2d2781fec9..b599f270c79 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -24,6 +24,10 @@ SRC_URI:append:class-native =3D " file://no-man.patch"
=20
 SRC_URI[sha256sum] =3D "afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef7=
9ebedc4467d92d6e"
=20
+# Remove this when upgrading past 2.72, as package managers sort 2.72e (=
the
+# fifth release candidate) after 2.72.
+PKGV =3D "2.72e+really${PV}"
+
 RDEPENDS:${PN} =3D "m4 gnu-config \
 		  perl \
 		  perl-module-bytes \
--=20
2.43.0


