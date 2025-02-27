Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1C7C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 16:26:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14978.1740673603934550682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 08:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C888150C
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 08:26:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 210B43F673
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 08:26:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mirrors: rationalise Debian mirrors
Date: Thu, 27 Feb 2025 16:26:38 +0000
Message-ID: <20250227162638.3790699-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 16:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212021

Change DEBIAN_MIRROR to point at the canonical server, deb.debian.org.

This is a CDN-backed server using network magic to load balance across
the planet so there's no need to set a slew of regional mirrors.

Also add a more recent snapshot.debian.org from the beginning of 2025.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/mirrors.bbclass | 18 +-----------------
 meta/conf/bitbake.conf              |  2 +-
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mi=
rrors.bbclass
index d68d30b0f2a..e31af488b95 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -6,26 +6,10 @@
=20
 MIRRORS +=3D "\
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20180310T2151=
05Z/pool \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian/20250101T0237=
59Z/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120=
328T092752Z/debian/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110=
127T084257Z/debian/pool \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090=
802T004153Z/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.de.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.au.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.cl.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.hr.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.fi.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.hk.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.hu.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.ie.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.it.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.jp.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.no.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.pl.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.ro.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.si.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.es.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.se.debian.org/debian/pool \
-${DEBIAN_MIRROR}	http://ftp.tr.debian.org/debian/pool \
 ${GNU_MIRROR}	https://mirrors.kernel.org/gnu \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \
 ${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b607088c6e..38ddf18d37a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -701,7 +701,7 @@ BBLAYERS_FETCH_DIR ??=3D "${COREBASE}"
=20
 APACHE_MIRROR =3D "https://archive.apache.org/dist"
 CPAN_MIRROR =3D "https://search.cpan.org/CPAN"
-DEBIAN_MIRROR =3D "http://ftp.debian.org/debian/pool"
+DEBIAN_MIRROR =3D "http://deb.debian.org/debian/pool"
 GENTOO_MIRROR =3D "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT =3D "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR =3D "https://download.gnome.org/sources/"
--=20
2.43.0


