Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17856.1621252686940542463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92265113E
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:58:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383FD3F73B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:58:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rpm: turn Berkeley DB hard dependency into PACKAGECONFIG
Date: Mon, 17 May 2021 12:58:02 +0100
Message-Id: <20210517115803.866262-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In the future we hope to switch to sqlite instead of Berkeley DB, so
prepare for this by adding an (enabled by default) PACKAGECONFIG for
Berkeley DB.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-dev=
tools/rpm/rpm_4.16.1.3.bb
index 2857cd730c4..2baa23944e6 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -51,7 +51,7 @@ S =3D "${WORKDIR}/git"
 # included in 4.16.1.3
 CVE_CHECK_WHIETLIST +=3D "CVE-2021-20271"
=20
-DEPENDS =3D "libgcrypt db file popt xz bzip2 elfutils python3"
+DEPENDS =3D "libgcrypt file popt xz bzip2 elfutils python3"
 DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
=20
 inherit autotools gettext pkgconfig python3native
@@ -74,7 +74,7 @@ EXTRA_OECONF_append_class-nativesdk =3D " --sysconfdir=3D=
/etc --disable-plugins"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'inhibit', '', d)}"
+PACKAGECONFIG ??=3D "bdb ${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', 'inhibit', '', d)}"
 # The inhibit plugin serves no purpose outside of the target
 PACKAGECONFIG_remove_class-native =3D "inhibit"
 PACKAGECONFIG_remove_class-nativesdk =3D "inhibit"
@@ -82,6 +82,7 @@ PACKAGECONFIG_remove_class-nativesdk =3D "inhibit"
 PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
 PACKAGECONFIG[inhibit] =3D "--enable-inhibit-plugin,--disable-inhibit-pl=
ugin,dbus"
 PACKAGECONFIG[rpm2archive] =3D "--with-archive,--without-archive,libarch=
ive"
+PACKAGECONFIG[bdb] =3D "--enable-bdb,--disable-bdb,db"
=20
 ASNEEDED =3D ""
=20
--=20
2.25.1

