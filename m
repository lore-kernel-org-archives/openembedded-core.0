Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3363.1626177394621898036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 04:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BDE1FB
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 04:56:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAEF53F694
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 04:56:32 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cups: update to 2.3.3op2
Date: Tue, 13 Jul 2021 12:56:30 +0100
Message-Id: <20210713115630.1879319-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Apple are no longer maintaining CUPS, and future development is now
happening under the OpenPrinting project:

https://ftp.pwg.org/pub/pwg/liaison/openprinting/presentations/cups-plena=
ry-may-2021.pdf

Also stop disabling the manpage installation as manpages are useful, and
remove some patch chunks that are not required.

The CVE-2020-10001 patch is dropped as this is incorporated into 2.3.3op2=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/cups/cups.inc           | 28 ++-----
 ...-don-t-try-to-run-generated-binaries.patch | 42 -----------
 ...003-cups_1.4.6.bb-Fix-build-on-ppc64.patch | 51 -------------
 .../cups/cups/CVE-2020-10001.patch            | 74 -------------------
 .../cups/cups/libexecdir.patch                | 27 +++++++
 meta/recipes-extended/cups/cups_2.3.3.bb      |  6 --
 meta/recipes-extended/cups/cups_2.3.3op2.bb   |  5 ++
 7 files changed, 39 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fi=
x-build-on-ppc64.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2020-10001.patch
 create mode 100644 meta/recipes-extended/cups/cups/libexecdir.patch
 delete mode 100644 meta/recipes-extended/cups/cups_2.3.3.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.3.3op2.bb

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index be5a11c944..df23825466 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,18 +8,17 @@ SECTION =3D "console/utils"
 LICENSE =3D "Apache-2.0"
 DEPENDS =3D "libpng jpeg dbus zlib libusb1"
=20
-SRC_URI =3D "https://github.com/apple/cups/releases/download/v${PV}/${BP=
}-source.tar.gz \
+SRC_URI =3D "https://github.com/OpenPrinting/cups/releases/download/v${P=
V}/cups-${PV}-source.tar.gz \
            file://0001-use-echo-only-in-init.patch \
            file://0002-don-t-try-to-run-generated-binaries.patch \
-           file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
+           file://libexecdir.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
-           file://CVE-2020-10001.patch \
            "
=20
-UPSTREAM_CHECK_URI =3D "https://github.com/apple/cups/releases"
-UPSTREAM_CHECK_REGEX =3D "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
+UPSTREAM_CHECK_URI =3D "https://github.com/OpenPrinting/cups/releases"
+UPSTREAM_CHECK_REGEX =3D "cups-(?P<pver>.+)-source.tar"
=20
 # Issue only applies to MacOS
 CVE_CHECK_WHITELIST +=3D "CVE-2008-1033"
@@ -37,7 +36,7 @@ inherit autotools-brokensep binconfig useradd systemd p=
kgconfig multilib_script
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM_${PN} =3D "--system lpadmin"
=20
-SYSTEMD_SERVICE_${PN} =3D "org.cups.cupsd.socket org.cups.cupsd.path org=
.cups.cupsd.service org.cups.cups-lpd.socket"
+SYSTEMD_SERVICE_${PN} =3D "cups.socket cups.path cups.service cups-lpd.s=
ocket"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', =
d)}"
@@ -63,20 +62,8 @@ EXTRA_OECONF =3D " \
=20
 EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
=20
-do_compile () {
-	echo "all:"    >  man/Makefile
-	echo "libs:" >> man/Makefile
-	echo "install:" >> man/Makefile
-	echo "install-data:" >> man/Makefile
-	echo "install-exec:" >> man/Makefile
-	echo "install-headers:" >> man/Makefile
-	echo "install-libs:" >> man/Makefile
-
-	oe_runmake
-}
-
 do_install () {
-	oe_runmake "DSTROOT=3D${D}" install
+	oe_runmake "DESTDIR=3D${D}" install
=20
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
@@ -105,8 +92,7 @@ do_install () {
 PACKAGES =3D+ "${PN}-lib ${PN}-libimage"
=20
 RDEPENDS_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',=
 'procps', '', d)}"
-FILES_${PN} +=3D "${libexecdir}/cups/ \
-	       "
+FILES_${PN} +=3D "${libexecdir}/cups/"
=20
 FILES_${PN}-lib =3D "${libdir}/libcups.so.*"
=20
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-genera=
ted-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-ru=
n-generated-binaries.patch
index ea248e4710..2bc26edbfc 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-bin=
aries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-bin=
aries.patch
@@ -25,48 +25,6 @@ index 32e2e0b..f1478d4 100644
 +#	./genstrings >sample.c
 =20
 =20
- #
-@@ -205,9 +205,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cups/$(LIBCUPS=
STATIC) foo.drv foo-fr.po
- 	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o ppdc-static ppdc.o libcupsppd=
c.a \
- 		$(LINKCUPSSTATIC)
- 	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
--	echo Testing PPD compiler...
--	./ppdc-static -l en,fr -I ../data foo.drv
--	./ppdc-static -l en,fr -z -I ../data foo.drv
-+#	echo Testing PPD compiler...
-+#	./ppdc-static -l en,fr -I ../data foo.drv
-+#	./ppdc-static -l en,fr -z -I ../data foo.drv
-=20
-=20
- #
-@@ -235,17 +235,17 @@ ppdi-static:		ppdc-static ppdi.o libcupsppdc.a ../=
cups/$(LIBCUPSSTATIC)
- 	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o ppdi-static ppdi.o libcupsppd=
c.a \
- 		$(LINKCUPSSTATIC)
- 	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
--	echo Testing PPD importer...
--	$(RM) -r ppd ppd2 sample-import.drv
--	./ppdc-static -l en -I ../data sample.drv
--	./ppdi-static -I ../data -o sample-import.drv ppd/*
--	./ppdc-static -l en -I ../data -d ppd2 sample-import.drv
--	if diff -r ppd ppd2 >/dev/null; then \
--		echo PPD import OK; \
--	else \
--		echo PPD import FAILED; \
--		exit 1; \
--	fi
-+#	echo Testing PPD importer...
-+#	$(RM) -r ppd ppd2 sample-import.drv
-+#	./ppdc-static -l en -I ../data sample.drv
-+#	./ppdi-static -I ../data -o sample-import.drv ppd/*
-+#	./ppdc-static -l en -I ../data -d ppd2 sample-import.drv
-+#	if diff -r ppd ppd2 >/dev/null; then \
-+#		echo PPD import OK; \
-+#	else \
-+#		echo PPD import FAILED; \
-+#		exit 1; \
-+#	fi
-=20
-=20
  #
 --=20
 2.17.1
diff --git a/meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-build=
-on-ppc64.patch b/meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-=
build-on-ppc64.patch
deleted file mode 100644
index b48c7a9ad2..0000000000
--- a/meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-build-on-ppc=
64.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 66c2079ae91389ee0f9d704bf0d2cccd53b2c603 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 22 Jul 2012 16:54:17 -0700
-Subject: [PATCH 3/4] cups_1.4.6.bb: Fix build on ppc64
-
-Make CUPS_SERVERBIN relative to libdir otherwise on 64bit arches
-e.g. ppc64 where base libdir is lib64 this does not go well
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate [OE config specific]
-
-Update on 20190904:
-Redefine CUPS_SERVERBIN to "$libexecdir/cups" which solves file conflict=
ion
-when multilib is enabled.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- config-scripts/cups-directories.m4 | 2 +-
- configure                          | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-di=
rectories.m4
-index b74083a..9a5abb2 100644
---- a/config-scripts/cups-directories.m4
-+++ b/config-scripts/cups-directories.m4
-@@ -270,7 +270,7 @@ case "$host_os_name" in
- 	*)
- 		# All others
- 		INSTALL_SYSV=3D"install-sysv"
--		CUPS_SERVERBIN=3D"$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN=3D"$libexecdir/cups"
- 		;;
- esac
-=20
-diff --git a/configure b/configure
-index d3df145..bc68a6c 100755
---- a/configure
-+++ b/configure
-@@ -6420,7 +6420,7 @@ case "$host_os_name" in
- 	*)
- 		# All others
- 		INSTALL_SYSV=3D"install-sysv"
--		CUPS_SERVERBIN=3D"$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN=3D"$libexecdir/cups"
- 		;;
- esac
-=20
---=20
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/CVE-2020-10001.patch b/meta/=
recipes-extended/cups/cups/CVE-2020-10001.patch
deleted file mode 100644
index 09a0a5765d..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2020-10001.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From efbea1742bd30f842fbbfb87a473e5c84f4162f9 Mon Sep 17 00:00:00 2001
-From: Michael R Sweet <msweet@msweet.org>
-Date: Mon, 1 Feb 2021 15:02:32 -0500
-Subject: [PATCH] Fix a buffer (read) overflow in ippReadIO (CVE-2020-100=
01)
-
-Upstream-Status: Backport
-CVE: CVE-2020-10001
-
-Reference to upstream patch:
-[https://github.com/OpenPrinting/cups/commit/efbea1742bd30f842fbbfb87a47=
3e5c84f4162f9]
-
-[SG: Addapted for version 2.3.3]
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- CHANGES.md | 2 ++
- cups/ipp.c | 8 +++++---
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/CHANGES.md b/CHANGES.md
-index df72892..5ca12da 100644
---- a/CHANGES.md
-+++ b/CHANGES.md
-@@ -4,6 +4,8 @@ CHANGES - 2.3.3 - 2020-04-24
- Changes in CUPS v2.3.3
- ----------------------
-=20
-+- Security: Fixed a buffer (read) overflow in the `ippReadIO` function
-+  (CVE-2020-10001)
- - CVE-2020-3898: The `ppdOpen` function did not handle invalid UI
-   constraint.  `ppdcSource::get_resolution` function did not handle
-   invalid resolution strings.
-diff --git a/cups/ipp.c b/cups/ipp.c
-index 3d52934..adbb26f 100644
---- a/cups/ipp.c
-+++ b/cups/ipp.c
-@@ -2866,7 +2866,8 @@ ippReadIO(void       *src,		/* I - Data source */
-   unsigned char		*buffer,	/* Data buffer */
- 			string[IPP_MAX_TEXT],
- 					/* Small string buffer */
--			*bufptr;	/* Pointer into buffer */
-+			*bufptr,	/* Pointer into buffer */
-+			*bufend;	/* End of buffer */
-   ipp_attribute_t	*attr;		/* Current attribute */
-   ipp_tag_t		tag;		/* Current tag */
-   ipp_tag_t		value_tag;	/* Current value tag */
-@@ -3441,6 +3442,7 @@ ippReadIO(void       *src,		/* I - Data source */
- 		}
-=20
-                 bufptr =3D buffer;
-+                bufend =3D buffer + n;
-=20
- 	       /*
- 	        * text-with-language and name-with-language are composite
-@@ -3454,7 +3456,7 @@ ippReadIO(void       *src,		/* I - Data source */
-=20
- 		n =3D (bufptr[0] << 8) | bufptr[1];
-=20
--		if ((bufptr + 2 + n) >=3D (buffer + IPP_BUF_SIZE) || n >=3D (int)size=
of(string))
-+		if ((bufptr + 2 + n + 2) > bufend || n >=3D (int)sizeof(string))
- 		{
- 		  _cupsSetError(IPP_STATUS_ERROR_INTERNAL,
- 		                _("IPP language length overflows value."), 1);
-@@ -3481,7 +3483,7 @@ ippReadIO(void       *src,		/* I - Data source */
-                 bufptr +=3D 2 + n;
- 		n =3D (bufptr[0] << 8) | bufptr[1];
-=20
--		if ((bufptr + 2 + n) >=3D (buffer + IPP_BUF_SIZE))
-+		if ((bufptr + 2 + n) > bufend)
- 		{
- 		  _cupsSetError(IPP_STATUS_ERROR_INTERNAL,
- 		                _("IPP string length overflows value."), 1);
---=20
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/reci=
pes-extended/cups/cups/libexecdir.patch
new file mode 100644
index 0000000000..2e15841b0d
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -0,0 +1,27 @@
+Use $libexecdir instead of hardcoding $prefix/lib as this breaks multili=
b builds.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-di=
rectories.m4
+index 1430af3a6..6efedc604 100644
+--- a/config-scripts/cups-directories.m4
++++ b/config-scripts/cups-directories.m4
+@@ -265,7 +265,7 @@ case "$host_os_name" in
+ 	*-gnu)
+ 		# GNUs
+ 		INSTALL_SYSV=3D"install-sysv"
+-		CUPS_SERVERBIN=3D"$exec_prefix/lib/cups"
++		CUPS_SERVERBIN=3D"$libexecdir/cups"
+ 		;;
+ 	*bsd* | darwin*)
+ 		# *BSD and Darwin (macOS)
+@@ -275,7 +275,7 @@ case "$host_os_name" in
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV=3D"install-sysv"
+-		CUPS_SERVERBIN=3D"$exec_prefix/lib/cups"
++		CUPS_SERVERBIN=3D"$libexecdir/cups"
+ 		;;
+ esac
+=20
\ No newline at end of file
diff --git a/meta/recipes-extended/cups/cups_2.3.3.bb b/meta/recipes-exte=
nded/cups/cups_2.3.3.bb
deleted file mode 100644
index 5caeb6f58b..0000000000
--- a/meta/recipes-extended/cups/cups_2.3.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
-
-SRC_URI[md5sum] =3D "412434ceefbdf3ec71bc9188a035f589"
-SRC_URI[sha256sum] =3D "261fd948bce8647b6d5cb2a1784f0c24cc52b5c4e827b71d=
726020bcc502f3ee"
diff --git a/meta/recipes-extended/cups/cups_2.3.3op2.bb b/meta/recipes-e=
xtended/cups/cups_2.3.3op2.bb
new file mode 100644
index 0000000000..fc2aa702f5
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.3.3op2.bb
@@ -0,0 +1,5 @@
+require cups.inc
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+SRC_URI[sha256sum] =3D "deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c943=
18a74efec86f96df"
--=20
2.25.1

