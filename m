Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5802CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:37:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11195.1778765874705761124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=E4xlf0U9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB4151595
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 06:37:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42F7E3F836
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778765874; bh=beZziHYr2iqrovOxYTF/bMjS4pkgH9RTw7AAv8L5SJ0=;
	h=From:To:Subject:Date:From;
	b=E4xlf0U99n0CUPTpzsxQ+SJwuSwgApv1iHe5ok9jCjueWwbKKRohGSLyzyACEjHhJ
	 L81WtL2tyQ5ivDTqbtWPtMoCc35yBt8lrKeXImJQ5w5k/wzhRGUsw1MnAoC//SBCIm
	 3IcIBlS9W4btpzskQZV/RrnBSa772ztelAcYrdxM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Date: Thu, 14 May 2026 14:37:47 +0100
Message-ID: <20260514133748.219486-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237035

As per upstream[1], 0.9-rc4 is pretty much what is going to be in the
0.9 release, and upgrading to this now will make upgrading to the final
release a lot simplier.

As there are no tarballs for the release candidates, switch to git. This
means we need to disable the manpages as they need xmltoman to build.

Delete all of the backported CVE patches as they're included in this
release. The cvelistv5 database has version information on all of these
CVEs, so they don't reappear in reports.

Delete invalid-service.patch, fixed upstream differently in [2].

Upstream has deleted the in-tree init scripts, so copy them from before
deletion and add alongside the recipe.

Consolidate the systemd options, and depend on libsystemd as avahi links
to that instead of duplicating the code.

Pass --runstatedir so that /run is used as expected.

[1] https://github.com/avahi/avahi/issues/503#issuecomment-4443016376
[2] avahi 93b1436 ("core: no longer supply bogus services to callbacks")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../avahi/{avahi_0.8.bb =3D> avahi_0.9.bb}      |  52 ++--
 ...01-Fix-opening-etc-resolv.conf-error.patch |   2 +-
 .../avahi/files/CVE-2023-1981.patch           |  58 -----
 .../avahi/files/CVE-2023-38469-1.patch        |  48 ----
 .../avahi/files/CVE-2023-38469-2.patch        |  65 -----
 .../avahi/files/CVE-2023-38470-1.patch        |  59 -----
 .../avahi/files/CVE-2023-38470-2.patch        |  52 ----
 .../avahi/files/CVE-2023-38471-1.patch        |  73 ------
 .../avahi/files/CVE-2023-38471-2.patch        |  52 ----
 .../avahi/files/CVE-2023-38472.patch          |  46 ----
 .../avahi/files/CVE-2023-38473.patch          | 110 ---------
 .../avahi/files/CVE-2024-52615.patch          | 228 ------------------
 .../avahi/files/CVE-2024-52616.patch          | 104 --------
 .../avahi/files/CVE-2025-68276.patch          |  68 ------
 .../avahi/files/CVE-2025-68468.patch          |  32 ---
 .../avahi/files/CVE-2025-68471.patch          |  36 ---
 .../avahi/files/CVE-2026-24401.patch          |  74 ------
 .../avahi/files/CVE-2026-34933-1.patch        | 108 ---------
 .../avahi/files/CVE-2026-34933-2.patch        |  96 --------
 .../avahi/files/avahi-daemon.in               | 198 +++++++++++++++
 .../avahi/files/avahi-dnsconfd.in             | 197 +++++++++++++++
 .../avahi/files/handle-hup.patch              |  41 ----
 .../avahi/files/initscript.patch              |  51 ----
 .../avahi/files/invalid-service.patch         |  29 ---
 .../avahi/files/local-ping.patch              | 152 ------------
 25 files changed, 416 insertions(+), 1615 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi_0.8.bb =3D> avahi_0.9.bb} =
(83%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.p=
atch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-=
1.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-=
2.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-=
1.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-=
2.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-=
1.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-=
2.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.=
patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-=
1.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-34933-=
2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi-daemon.in
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi-dnsconfd.=
in
 delete mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.patc=
h
 delete mode 100644 meta/recipes-connectivity/avahi/files/initscript.patc=
h
 delete mode 100644 meta/recipes-connectivity/avahi/files/invalid-service=
.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/local-ping.patc=
h

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.9.bb
similarity index 83%
rename from meta/recipes-connectivity/avahi/avahi_0.8.bb
rename to meta/recipes-connectivity/avahi/avahi_0.9.bb
index 0042c3c2e3d..b5b63cf1ee4 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -18,35 +18,18 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa=
3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=3D21;md5=3D9ee773=
68c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=3D23;md5=3Df4ac=
741a25c4f434039ba3e18c8674cf"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
+SRC_URI =3D "git://github.com/avahi/avahi;protocol=3Dhttps;branch=3Dmast=
er;tag=3Dv0.9-rc4 \
            file://00avahi-autoipd \
            file://99avahi-autoipd \
-           file://initscript.patch \
+           file://avahi-daemon.in \
+           file://avahi-dnsconfd.in \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
-           file://handle-hup.patch \
-           file://local-ping.patch \
-           file://invalid-service.patch \
-           file://CVE-2023-1981.patch \
-           file://CVE-2023-38469-1.patch \
-           file://CVE-2023-38469-2.patch \
-           file://CVE-2023-38470-1.patch \
-           file://CVE-2023-38470-2.patch \
-           file://CVE-2023-38471-1.patch \
-           file://CVE-2023-38471-2.patch \
-           file://CVE-2023-38472.patch \
-           file://CVE-2023-38473.patch \
-           file://CVE-2024-52616.patch \
-           file://CVE-2024-52615.patch \
-           file://CVE-2025-68276.patch \
-           file://CVE-2026-24401.patch \
-           file://CVE-2025-68468.patch \
-           file://CVE-2025-68471.patch \
-           file://CVE-2026-34933-1.patch \
-           file://CVE-2026-34933-2.patch \
            "
=20
+PV =3D "0.9~rc4"
+SRCREV =3D "625ca0fac19229f6dfa3a6c6b698ae657187e50c"
+
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
-SRC_URI[sha256sum] =3D "060309d7a333d38d951bc27598c677af1796934dbd98e102=
4e7ad8de798fedda"
=20
 CVE_STATUS[CVE-2021-26720] =3D "not-applicable-platform: Issue only affe=
cts Debian/SUSE"
=20
@@ -55,17 +38,20 @@ DEPENDS =3D "expat libcap libdaemon glib-2.0 glib-2.0=
-native"
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?=3D ""
=20
-PACKAGECONFIG ??=3D "dbus ${@bb.utils.contains_any('DISTRO_FEATURES','x1=
1 wayland','${AVAHI_GTK}','',d)}"
+PACKAGECONFIG ??=3D "dbus ${@bb.utils.contains_any('DISTRO_FEATURES','x1=
1 wayland','${AVAHI_GTK}','',d)} ${@bb.utils.filter('DISTRO_FEATURES', 's=
ystemd', d)}"
 PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[libdns_sd] =3D "--enable-compat-libdns_sd --enable-dbus,,d=
bus"
 PACKAGECONFIG[libevent] =3D "--enable-libevent,--disable-libevent,libeve=
nt"
+PACKAGECONFIG[systemd] =3D "--enable-libsystemd,--disable-libsystemd --w=
ithout-systemdsystemunitdir,systemd"
 PACKAGECONFIG[qt5] =3D "--enable-qt5,--disable-qt5,qtbase"
=20
 inherit autotools pkgconfig gettext gobject-introspection github-release=
s
=20
-EXTRA_OECONF =3D "--with-avahi-priv-access-group=3Dadm \
+EXTRA_OECONF =3D " \
+             --runstatedir=3D${runtimedir} \
+             --with-avahi-priv-access-group=3Dadm \
              --disable-stack-protector \
              --disable-gdbm \
              --disable-dbm \
@@ -75,14 +61,12 @@ EXTRA_OECONF =3D "--with-avahi-priv-access-group=3Dad=
m \
              --disable-qt4 \
              --disable-python \
              --disable-doxygen-doc \
-             --enable-manpages \
+             --disable-manpages \
              ${EXTRA_OECONF_SYSVINIT} \
-             ${EXTRA_OECONF_SYSTEMD} \
            "
=20
 # The distro choice determines what init scripts are installed
 EXTRA_OECONF_SYSVINIT =3D "${@bb.utils.contains('DISTRO_FEATURES','sysvi=
nit','--with-distro=3Ddebian','--with-distro=3Dnone',d)}"
-EXTRA_OECONF_SYSTEMD =3D "${@bb.utils.contains('DISTRO_FEATURES','system=
d','--with-systemdsystemunitdir=3D${systemd_system_unitdir}/','--without-=
systemdsystemunitdir',d)}"
=20
 do_configure:prepend() {
     # This m4 file will get in the way of our introspection.m4 with spec=
ial cross-compilation fixes
@@ -97,9 +81,9 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D " avahi-libnss-=
mdns"
=20
 do_install() {
 	autotools_do_install
-	rm -rf ${D}/run
+
+	rm -rf ${D}${runtimedir}
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}$=
{datadir}/dbus-1
-	rm -rf ${D}${libdir}/avahi
=20
 	# Move example service files out of /etc/avahi/services so we don't
 	# advertise ssh & sftp-ssh by default
@@ -147,9 +131,8 @@ FILES:avahi-daemon =3D "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/avahi-daemon.conf \
                       ${sysconfdir}/avahi/hosts \
                       ${sysconfdir}/avahi/services \
-                      ${sysconfdir}/dbus-1 \
                       ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/dbus-1/interfaces \
+                      ${datadir}/dbus-1 \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
@@ -194,6 +177,11 @@ do_install:append() {
 	install -d ${D}${sysconfdir}/udhcpc.d
 	install ${UNPACKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 	install ${UNPACKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+
+	install -d ${D}${sysconfdir}/init.d
+	install ${UNPACKDIR}/avahi-daemon.in ${D}${sysconfdir}/init.d/avahi-dae=
mon
+	install ${UNPACKDIR}/avahi-dnsconfd.in ${D}${sysconfdir}/init.d/avahi-d=
nsconfd
+	sed -i -e 's,@sbindir@,${sbindir},g' -e 's,@sysconfdir@,${sysconfdir},g=
' ${D}${sysconfdir}/init.d/avahi-*
 }
=20
 # At the time the postinst runs, dbus might not be setup so only restart=
 if running=20
diff --git a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-r=
esolv.conf-error.patch b/meta/recipes-connectivity/avahi/files/0001-Fix-o=
pening-etc-resolv.conf-error.patch
index cb8b83fd238..d46b4d88ac8 100644
--- a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.c=
onf-error.patch
+++ b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.c=
onf-error.patch
@@ -39,7 +39,7 @@ index 548c834..63e28e4 100644
 +After=3Dsystemd-resolved.service connman.service
 =20
  [Service]
- Type=3Ddbus
+ BusName=3Dorg.freedesktop.Avahi
 --=20
 2.11.0
=20
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch b/=
meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
deleted file mode 100644
index 4d7924d13a6..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat=
.com>
-Date: Thu, 17 Nov 2022 01:51:53 +0100
-Subject: [PATCH] Emit error if requested service is not found
-
-It currently just crashes instead of replying with error. Check return
-value and emit error instead of passing NULL pointer to reply.
-
-Fixes #375
-
-Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/avahi/tree/debian/patches/CVE-2023-1981.patch?h=3Dubuntu/j=
ammy-security
-Upstream commit https://github.com/lathiat/avahi/commit/a2696da2f2c50ac4=
3b6c4903f72290d5c3fa9f6f]
-CVE: CVE-2023-1981
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-daemon/dbus-protocol.c | 20 ++++++++++++++------
- 1 file changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/avahi-daemon/dbus-protocol.c b/avahi-daemon/dbus-protocol.c
-index 70d7687bc..406d0b441 100644
---- a/avahi-daemon/dbus-protocol.c
-+++ b/avahi-daemon/dbus-protocol.c
-@@ -375,10 +375,14 @@ static DBusHandlerResult dbus_get_alternative_host=
_name(DBusConnection *c, DBusM
-     }
-=20
-     t =3D avahi_alternative_host_name(n);
--    avahi_dbus_respond_string(c, m, t);
--    avahi_free(t);
-+    if (t) {
-+        avahi_dbus_respond_string(c, m, t);
-+        avahi_free(t);
-=20
--    return DBUS_HANDLER_RESULT_HANDLED;
-+        return DBUS_HANDLER_RESULT_HANDLED;
-+    } else {
-+        return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND, "Hos=
tname not found");
-+    }
- }
-=20
- static DBusHandlerResult dbus_get_alternative_service_name(DBusConnecti=
on *c, DBusMessage *m, DBusError *error) {
-@@ -389,10 +393,14 @@ static DBusHandlerResult dbus_get_alternative_serv=
ice_name(DBusConnection *c, DB
-     }
-=20
-     t =3D avahi_alternative_service_name(n);
--    avahi_dbus_respond_string(c, m, t);
--    avahi_free(t);
-+    if (t) {
-+        avahi_dbus_respond_string(c, m, t);
-+        avahi_free(t);
-=20
--    return DBUS_HANDLER_RESULT_HANDLED;
-+        return DBUS_HANDLER_RESULT_HANDLED;
-+    } else {
-+        return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND, "Ser=
vice not found");
-+    }
- }
-=20
- static DBusHandlerResult dbus_create_new_entry_group(DBusConnection *c,=
 DBusMessage *m, DBusError *error) {
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
deleted file mode 100644
index a078f66102f..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 72842945085cc3adaccfdfa2853771b0e75ef991 Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Mon, 23 Oct 2023 20:29:31 +0000
-Subject: [PATCH] avahi: core: reject overly long TXT resource records
-
-Closes https://github.com/lathiat/avahi/issues/455
-
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/a337a=
1ba7d15853fb56deef1f464529af6e3a1cf]
-CVE: CVE-2023-38469
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- avahi-core/rr.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/avahi-core/rr.c b/avahi-core/rr.c
-index 7fa0bee..b03a24c 100644
---- a/avahi-core/rr.c
-+++ b/avahi-core/rr.c
-@@ -32,6 +32,7 @@
- #include <avahi-common/malloc.h>
- #include <avahi-common/defs.h>
-
-+#include "dns.h"
- #include "rr.h"
- #include "log.h"
- #include "util.h"
-@@ -688,11 +689,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
-         case AVAHI_DNS_TYPE_TXT: {
-
-             AvahiStringList *strlst;
-+            size_t used =3D 0;
-
--            for (strlst =3D r->data.txt.string_list; strlst; strlst =3D=
 strlst->next)
-+            for (strlst =3D r->data.txt.string_list; strlst; strlst =3D=
 strlst->next) {
-                 if (strlst->size > 255 || strlst->size <=3D 0)
-                     return 0;
-
-+                used +=3D 1+strlst->size;
-+                if (used > AVAHI_DNS_RDATA_MAX)
-+                    return 0;
-+            }
-+
-             return 1;
-         }
-     }
---
-2.40.0
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
deleted file mode 100644
index f8f60ddca1c..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Wed, 25 Oct 2023 18:15:42 +0000
-Subject: [PATCH] tests: pass overly long TXT resource records
-
-to make sure they don't crash avahi any more.
-It reproduces https://github.com/lathiat/avahi/issues/455
-
-Canonical notes:
-nickgalanis> removed first hunk since there is no .github dir in this re=
lease
-
-Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38469-2.patch?h=3Dubunt=
u/jammy-security
-Upstream commit https://github.com/lathiat/avahi/commit/c6cab87df290448a=
63323c8ca759baa516166237]
-CVE: CVE-2023-38469
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-client/client-test.c       | 14 ++++++++++++++
- 1 files changed, 14 insertions(+)
-
-Index: avahi-0.8/avahi-client/client-test.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.8.orig/avahi-client/client-test.c
-+++ avahi-0.8/avahi-client/client-test.c
-@@ -22,6 +22,7 @@
- #endif
-=20
- #include <stdio.h>
-+#include <string.h>
- #include <assert.h>
-=20
- #include <avahi-client/client.h>
-@@ -33,6 +34,8 @@
- #include <avahi-common/malloc.h>
- #include <avahi-common/timeval.h>
-=20
-+#include <avahi-core/dns.h>
-+
- static const AvahiPoll *poll_api =3D NULL;
- static AvahiSimplePoll *simple_poll =3D NULL;
-=20
-@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
-     uint32_t cookie;
-     struct timeval tv;
-     AvahiAddress a;
-+    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
-+    AvahiStringList *txt =3D NULL;
-+    int r;
-=20
-     simple_poll =3D avahi_simple_poll_new();
-     poll_api =3D avahi_simple_poll_get(simple_poll);
-@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
-     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group,=
 AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", =
NULL, NULL, 80, "foo=3Dbar", NULL)));
-     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVA=
HI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya",=
 6));
-=20
-+    memset(rdata, 1, sizeof(rdata));
-+    r =3D avahi_string_list_parse(rdata, sizeof(rdata), &txt);
-+    assert(r >=3D 0);
-+    assert(avahi_string_list_serialize(txt, NULL, 0) =3D=3D sizeof(rdat=
a));
-+    error =3D avahi_entry_group_add_service_strlst(group, AVAHI_IF_UNSP=
EC, AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp", NULL, NULL, 123, txt);
-+    assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
-+    avahi_string_list_free(txt);
-+
-     avahi_entry_group_commit (group);
-=20
-     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_=
PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_=
callback, (char*) "omghai3u");
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
deleted file mode 100644
index 91f9e677ace..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From af7bfad67ca53a7c4042a4a2d85456b847e9f249 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat=
.com>
-Date: Tue, 11 Apr 2023 15:29:59 +0200
-Subject: [PATCH] avahi: Ensure each label is at least one byte long
-
-The only allowed exception is single dot, where it should return empty
-string.
-
-Fixes #454.
-
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/94cb6=
489114636940ac683515417990b55b5d66c]
-CVE: CVE-2023-38470
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- avahi-common/domain-test.c | 14 ++++++++++++++
- avahi-common/domain.c      |  2 +-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
-index cf763ec..3acc1c1 100644
---- a/avahi-common/domain-test.c
-+++ b/avahi-common/domain-test.c
-@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED =
char *argv[]) {
-     printf("%s\n", s =3D avahi_normalize_name_strdup("fo\\\\o\\..f oo."=
));
-     avahi_free(s);
-
-+    printf("%s\n", s =3D avahi_normalize_name_strdup("."));
-+    avahi_free(s);
-+
-+    s =3D avahi_normalize_name_strdup(",.=3D.}.=3D.?-.}.=3D.?.?.}.}.?.?=
.?.z.?.?.}.}."
-+		    "}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.}.}.=
}"
-+		    ".?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?.zM.=
?`"
-+		    "?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.?."
-+		    "?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.}."
-+		    "??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}?"
-+		    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM."
-+		    "?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.=
"
-+		    "}.?.?.?.}.=3D.?.?.}");
-+    assert(s =3D=3D NULL);
-+
-     printf("%i\n", avahi_domain_equal("\\065aa bbb\\.\\046cc.cc\\\\.dee=
.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
-     printf("%i\n", avahi_domain_equal("A", "a"));
-
-diff --git a/avahi-common/domain.c b/avahi-common/domain.c
-index 3b1ab68..e66d241 100644
---- a/avahi-common/domain.c
-+++ b/avahi-common/domain.c
-@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *ret_=
s, size_t size) {
-         }
-
-         if (!empty) {
--            if (size < 1)
-+            if (size < 2)
-                 return NULL;
-
-             *(r++) =3D '.';
---
-2.40.0
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
deleted file mode 100644
index e0736bf210a..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 20dec84b2480821704258bc908e7b2bd2e883b24 Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Tue, 19 Sep 2023 03:21:25 +0000
-Subject: [PATCH] [common] bail out when escaped labels can't fit into re=
t
-
-Fixes:
-```
-=3D=3D93410=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on addre=
ss 0x7f9e76f14c16 at pc 0x00000047208d bp 0x7ffee90a6a00 sp 0x7ffee90a61c=
8
-READ of size 1110 at 0x7f9e76f14c16 thread T0
-    #0 0x47208c in __interceptor_strlen (out/fuzz-domain+0x47208c) (Buil=
dId: 731b20c1eef22c2104e75a6496a399b10cfc7cba)
-    #1 0x534eb0 in avahi_strdup avahi/avahi-common/malloc.c:167:12
-    #2 0x53862c in avahi_normalize_name_strdup avahi/avahi-common/domain=
.c:226:12
-```
-and
-```
-fuzz-domain: fuzz/fuzz-domain.c:38: int LLVMFuzzerTestOneInput(const uin=
t8_t *, size_t): Assertion `avahi_domain_equal(s, t)' failed.
-=3D=3D101571=3D=3D ERROR: libFuzzer: deadly signal
-    #0 0x501175 in __sanitizer_print_stack_trace (/home/vagrant/avahi/ou=
t/fuzz-domain+0x501175) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea=
8)
-    #1 0x45ad2c in fuzzer::PrintStackTrace() (/home/vagrant/avahi/out/fu=
zz-domain+0x45ad2c) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
-    #2 0x43fc07 in fuzzer::Fuzzer::CrashCallback() (/home/vagrant/avahi/=
out/fuzz-domain+0x43fc07) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216=
ea8)
-    #3 0x7f1581d7ebaf  (/lib64/libc.so.6+0x3dbaf) (BuildId: c9f62793b9e8=
86eb1b95077d4f26fe2b4aa1ac25)
-    #4 0x7f1581dcf883 in __pthread_kill_implementation (/lib64/libc.so.6=
+0x8e883) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
-    #5 0x7f1581d7eafd in gsignal (/lib64/libc.so.6+0x3dafd) (BuildId: c9=
f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
-    #6 0x7f1581d6787e in abort (/lib64/libc.so.6+0x2687e) (BuildId: c9f6=
2793b9e886eb1b95077d4f26fe2b4aa1ac25)
-    #7 0x7f1581d6779a in __assert_fail_base.cold (/lib64/libc.so.6+0x267=
9a) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
-    #8 0x7f1581d77186 in __assert_fail (/lib64/libc.so.6+0x36186) (Build=
Id: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
-    #9 0x5344a4 in LLVMFuzzerTestOneInput /home/vagrant/avahi/fuzz/fuzz-=
domain.c:38:9
-```
-
-It's a follow-up to 94cb6489114636940ac683515417990b55b5d66c
-
-Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38470-2.patch?h=3Dubunt=
u/jammy-security
-CVE: CVE-2023-38470 #Follow-up patch
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-common/domain.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: avahi-0.8/avahi-common/domain.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.8.orig/avahi-common/domain.c
-+++ avahi-0.8/avahi-common/domain.c
-@@ -210,7 +210,8 @@ char *avahi_normalize_name(const char *s
-         } else
-             empty =3D 0;
-=20
--        avahi_escape_label(label, strlen(label), &r, &size);
-+        if (!(avahi_escape_label(label, strlen(label), &r, &size)))
-+            return NULL;
-     }
-=20
-     return ret_s;
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
deleted file mode 100644
index b3f716495db..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 48d745db7fd554fc33e96ec86d3675ebd530bb8e Mon Sep 17 00:00:00 2001
-From: Michal Sekletar <msekleta@redhat.com>
-Date: Mon, 23 Oct 2023 13:38:35 +0200
-Subject: [PATCH] avahi: core: extract host name using avahi_unescape_lab=
el()
-
-Previously we could create invalid escape sequence when we split the
-string on dot. For example, from valid host name "foo\\.bar" we have
-created invalid name "foo\\" and tried to set that as the host name
-which crashed the daemon.
-
-Fixes #453
-
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/894f0=
85f402e023a98cbb6f5a3d117bd88d93b09]
-CVE: CVE-2023-38471
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- avahi-core/server.c | 27 +++++++++++++++++++++------
- 1 file changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/avahi-core/server.c b/avahi-core/server.c
-index e507750..40f1d68 100644
---- a/avahi-core/server.c
-+++ b/avahi-core/server.c
-@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
- }
-
- int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
--    char *hn =3D NULL;
-+    char label_escaped[AVAHI_LABEL_MAX*4+1];
-+    char label[AVAHI_LABEL_MAX];
-+    char *hn =3D NULL, *h;
-+    size_t len;
-+
-     assert(s);
-
-     AVAHI_CHECK_VALIDITY(s, !host_name || avahi_is_valid_host_name(host=
_name), AVAHI_ERR_INVALID_HOST_NAME);
-@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s, c=
onst char *host_name) {
-     else
-         hn =3D avahi_normalize_name_strdup(host_name);
-
--    hn[strcspn(hn, ".")] =3D 0;
-+    h =3D hn;
-+    if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))=
) {
-+        avahi_free(h);
-+        return AVAHI_ERR_INVALID_HOST_NAME;
-+    }
-+
-+    avahi_free(h);
-+
-+    h =3D label_escaped;
-+    len =3D sizeof(label_escaped);
-+    if (!avahi_escape_label(label, strlen(label), &h, &len))
-+        return AVAHI_ERR_INVALID_HOST_NAME;
-
--    if (avahi_domain_equal(s->host_name, hn) && s->state !=3D AVAHI_SER=
VER_COLLISION) {
--        avahi_free(hn);
-+    if (avahi_domain_equal(s->host_name, label_escaped) && s->state !=3D=
 AVAHI_SERVER_COLLISION)
-         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
--    }
-
-     withdraw_host_rrs(s);
-
-     avahi_free(s->host_name);
--    s->host_name =3D hn;
-+    s->host_name =3D avahi_strdup(label_escaped);
-+    if (!s->host_name)
-+        return AVAHI_ERR_NO_MEMORY;
-
-     update_fqdn(s);
-
---
-2.40.0
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
deleted file mode 100644
index 44737bfc2e1..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From b675f70739f404342f7f78635d6e2dcd85a13460 Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Tue, 24 Oct 2023 22:04:51 +0000
-Subject: [PATCH] core: return errors from avahi_server_set_host_name pro=
perly
-
-It's a follow-up to 894f085f402e023a98cbb6f5a3d117bd88d93b09
-
-Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-2.patch?h=3Dubunt=
u/jammy-security
-Upstream commit https://github.com/lathiat/avahi/commit/b675f70739f40434=
2f7f78635d6e2dcd85a13460]
-CVE: CVE-2023-38471 #Follow-up Patch
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-core/server.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-Index: avahi-0.8/avahi-core/server.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.8.orig/avahi-core/server.c
-+++ avahi-0.8/avahi-core/server.c
-@@ -1309,10 +1309,13 @@ int avahi_server_set_host_name(AvahiServ
-     else
-         hn =3D avahi_normalize_name_strdup(host_name);
-=20
-+    if (!hn)
-+        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
-+
-     h =3D hn;
-     if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))=
) {
-         avahi_free(h);
--        return AVAHI_ERR_INVALID_HOST_NAME;
-+        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
-     }
-=20
-     avahi_free(h);
-@@ -1320,7 +1323,7 @@ int avahi_server_set_host_name(AvahiServ
-     h =3D label_escaped;
-     len =3D sizeof(label_escaped);
-     if (!avahi_escape_label(label, strlen(label), &h, &len))
--        return AVAHI_ERR_INVALID_HOST_NAME;
-+        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
-=20
-     if (avahi_domain_equal(s->host_name, label_escaped) && s->state !=3D=
 AVAHI_SERVER_COLLISION)
-         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
-@@ -1330,7 +1333,7 @@ int avahi_server_set_host_name(AvahiServ
-     avahi_free(s->host_name);
-     s->host_name =3D avahi_strdup(label_escaped);
-     if (!s->host_name)
--        return AVAHI_ERR_NO_MEMORY;
-+        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
-=20
-     update_fqdn(s);
-=20
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
deleted file mode 100644
index 85dbded73bd..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001
-From: Michal Sekletar <msekleta@redhat.com>
-Date: Thu, 19 Oct 2023 17:36:44 +0200
-Subject: [PATCH] core: make sure there is rdata to process before parsin=
g it
-
-Fixes #452
-
-CVE-2023-38472
-
-Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/=
ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38472.patch?h=3Dubuntu/=
jammy-security
-Upstream commit https://github.com/lathiat/avahi/commit/b024ae5749f4aeba=
03478e6391687c3c9c8dee40]
-CVE: CVE-2023-38472
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-client/client-test.c      | 3 +++
- avahi-daemon/dbus-entry-group.c | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-Index: avahi-0.8/avahi-client/client-test.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.8.orig/avahi-client/client-test.c
-+++ avahi-0.8/avahi-client/client-test.c
-@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
-     assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
-     avahi_string_list_free(txt);
-=20
-+    error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVA=
HI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
-+    assert(error !=3D AVAHI_OK);
-+
-     avahi_entry_group_commit (group);
-=20
-     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_=
PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_=
callback, (char*) "omghai3u");
-Index: avahi-0.8/avahi-daemon/dbus-entry-group.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.8.orig/avahi-daemon/dbus-entry-group.c
-+++ avahi-0.8/avahi-daemon/dbus-entry-group.c
-@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_g
-         if (!(r =3D avahi_record_new_full (name, clazz, type, ttl)))
-             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, =
NULL);
-=20
--        if (avahi_rdata_parse (r, rdata, size) < 0) {
-+        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
-             avahi_record_unref (r);
-             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDA=
TA, NULL);
-         }
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
deleted file mode 100644
index 707acb60fec..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 88cbbc48d5efff9726694557ca6c3f698f3affe4 Mon Sep 17 00:00:00 2001
-From: Michal Sekletar <msekleta@redhat.com>
-Date: Wed, 11 Oct 2023 17:45:44 +0200
-Subject: [PATCH] avahi: common: derive alternative host name from its
- unescaped version
-
-Normalization of input makes sure we don't have to deal with special
-cases like unescaped dot at the end of label.
-
-Fixes #451 #487
-
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b448c=
9f771bada14ae8de175695a9729f8646797]
-CVE: CVE-2023-38473
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- avahi-common/alternative-test.c |  3 +++
- avahi-common/alternative.c      | 27 +++++++++++++++++++--------
- 2 files changed, 22 insertions(+), 8 deletions(-)
-
-diff --git a/avahi-common/alternative-test.c b/avahi-common/alternative-=
test.c
-index 9255435..681fc15 100644
---- a/avahi-common/alternative-test.c
-+++ b/avahi-common/alternative-test.c
-@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED c=
har *argv[]) {
-     const char* const test_strings[] =3D {
-         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
X",
-         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=BC=C3=
=BC=C3=BC=C3=BC=C3=BC=C3=BC",
-+        ").",
-+        "\\.",
-+        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\=
\\",
-         "gurke",
-         "-",
-         " #",
-diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
-index b3d39f0..a094e6d 100644
---- a/avahi-common/alternative.c
-+++ b/avahi-common/alternative.c
-@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
- }
-
- char *avahi_alternative_host_name(const char *s) {
-+    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
-+    char *alt, *r, *ret;
-     const char *e;
--    char *r;
-+    size_t len;
-
-     assert(s);
-
-     if (!avahi_is_valid_host_name(s))
-         return NULL;
-
--    if ((e =3D strrchr(s, '-'))) {
-+    if (!avahi_unescape_label(&s, label, sizeof(label)))
-+        return NULL;
-+
-+    if ((e =3D strrchr(label, '-'))) {
-         const char *p;
-
-         e++;
-@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) {
-
-     if (e) {
-         char *c, *m;
--        size_t l;
-         int n;
-
-         n =3D atoi(e)+1;
-         if (!(m =3D avahi_strdup_printf("%i", n)))
-             return NULL;
-
--        l =3D e-s-1;
-+        len =3D e-label-1;
-
--        if (l >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
--            l =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
-+        if (len >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
-+            len =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
-
--        if (!(c =3D avahi_strndup(s, l))) {
-+        if (!(c =3D avahi_strndup(label, len))) {
-             avahi_free(m);
-             return NULL;
-         }
-@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) {
-     } else {
-         char *c;
-
--        if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
-+        if (!(c =3D avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
-             return NULL;
-
-         drop_incomplete_utf8(c);
-@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s) {
-         avahi_free(c);
-     }
-
-+    alt =3D alternative;
-+    len =3D sizeof(alternative);
-+    ret =3D avahi_escape_label(r, strlen(r), &alt, &len);
-+
-+    avahi_free(r);
-+    r =3D avahi_strdup(ret);
-+
-     assert(avahi_is_valid_host_name(r));
-
-     return r;
---
-2.40.0
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
deleted file mode 100644
index 9737f528375..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001
-From: Michal Sekletar <msekleta@redhat.com>
-Date: Wed, 27 Nov 2024 18:07:32 +0100
-Subject: [PATCH] core/wide-area: fix for CVE-2024-52615
-
-CVE: CVE-2024-52615
-Upstream-Status: Backport [https://github.com/avahi/avahi/commit/4e2e1ea=
0908d7e6ad7f38ae04fdcdf2411f8b942]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------
- 1 file changed, 69 insertions(+), 59 deletions(-)
-
-diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
-index 00a15056e..06df7afc6 100644
---- a/avahi-core/wide-area.c
-+++ b/avahi-core/wide-area.c
-@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {
-=20
-     AvahiAddress dns_server_used;
-=20
-+    int fd;
-+    AvahiWatch *watch;
-+    AvahiProtocol proto;
-+
-     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);
-     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);
- };
-@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {
- struct AvahiWideAreaLookupEngine {
-     AvahiServer *server;
-=20
--    int fd_ipv4, fd_ipv6;
--    AvahiWatch *watch_ipv4, *watch_ipv6;
--
-     /* Cache */
-     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
-     AvahiHashmap *cache_by_key;
-@@ -125,35 +126,67 @@ static AvahiWideAreaLookup* find_lookup(AvahiWideA=
reaLookupEngine *e, uint16_t i
-     return l;
- }
-=20
-+static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_=
GCC_UNUSED AvahiWatchEvent events, void *userdata);
-+
- static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p=
) {
-+    AvahiWideAreaLookupEngine *e;
-     AvahiAddress *a;
-+    AvahiServer *s;
-+    AvahiWatch *w;
-+    int r;
-=20
-     assert(l);
-     assert(p);
-=20
--    if (l->engine->n_dns_servers <=3D 0)
-+    e =3D l->engine;
-+    assert(e);
-+
-+    s =3D e->server;
-+    assert(s);
-+
-+    if (e->n_dns_servers <=3D 0)
-         return -1;
-=20
--    assert(l->engine->current_dns_server < l->engine->n_dns_servers);
-+    assert(e->current_dns_server < e->n_dns_servers);
-=20
--    a =3D &l->engine->dns_servers[l->engine->current_dns_server];
-+    a =3D &e->dns_servers[e->current_dns_server];
-     l->dns_server_used =3D *a;
-=20
--    if (a->proto =3D=3D AVAHI_PROTO_INET) {
-+    if (l->fd >=3D 0) {
-+        /* We are reusing lookup object and sending packet to another s=
erver so let's cleanup before we establish connection to new server. */
-+        s->poll_api->watch_free(l->watch);
-+        l->watch =3D NULL;
-=20
--        if (l->engine->fd_ipv4 < 0)
--            return -1;
-+        close(l->fd);
-+        l->fd =3D -EBADF;
-+    }
-=20
--        return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4, AVAHI_IF_=
UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
-+    assert(a->proto =3D=3D AVAHI_PROTO_INET || a->proto =3D=3D AVAHI_PR=
OTO_INET6);
-=20
--    } else {
--        assert(a->proto =3D=3D AVAHI_PROTO_INET6);
-+    if (a->proto =3D=3D AVAHI_PROTO_INET)
-+        r =3D s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -=
1;
-+    else
-+        r =3D s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -=
1;
-=20
--        if (l->engine->fd_ipv6 < 0)
--            return -1;
-+    if (r < 0) {
-+        avahi_log_error(__FILE__ ": Failed to create socket for wide ar=
ea lookup");
-+        return -1;
-+    }
-=20
--        return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6, AVAHI_IF_=
UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
-+    w =3D s->poll_api->watch_new(s->poll_api, r, AVAHI_WATCH_IN, socket=
_event, l);
-+    if (!w) {
-+        close(r);
-+        avahi_log_error(__FILE__ ": Failed to create socket watch for w=
ide area lookup");
-+        return -1;
-     }
-+
-+    l->fd =3D r;
-+    l->watch =3D w;
-+    l->proto =3D a->proto;
-+
-+    return a->proto =3D=3D AVAHI_PROTO_INET ?
-+                avahi_send_dns_packet_ipv4(l->fd, AVAHI_IF_UNSPEC, p, N=
ULL, &a->data.ipv4, AVAHI_DNS_PORT):
-+                avahi_send_dns_packet_ipv6(l->fd, AVAHI_IF_UNSPEC, p, N=
ULL, &a->data.ipv6, AVAHI_DNS_PORT);
- }
-=20
- static void next_dns_server(AvahiWideAreaLookupEngine *e) {
-@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
-     l->dead =3D 0;
-     l->key =3D avahi_key_ref(key);
-     l->cname_key =3D avahi_key_new_cname(l->key);
-+    l->fd =3D -EBADF;
-+    l->watch =3D NULL;
-+    l->proto =3D AVAHI_PROTO_UNSPEC;
-     l->callback =3D callback;
-     l->userdata =3D userdata;
-=20
-@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) =
{
-     if (l->cname_key)
-         avahi_key_unref(l->cname_key);
-=20
-+    if (l->watch)
-+            l->engine->server->poll_api->watch_free(l->watch);
-+
-+    if (l->fd >=3D 0)
-+        close(l->fd);
-+
-     avahi_free(l);
- }
-=20
-@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngin=
e *e, AvahiDnsPacket *p) {
- }
-=20
- static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_=
GCC_UNUSED AvahiWatchEvent events, void *userdata) {
--    AvahiWideAreaLookupEngine *e =3D userdata;
-+    AvahiWideAreaLookup *l =3D userdata;
-+    AvahiWideAreaLookupEngine *e =3D l->engine;
-     AvahiDnsPacket *p =3D NULL;
-=20
--    if (fd =3D=3D e->fd_ipv4)
--        p =3D avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL, =
NULL, NULL);
-+    assert(l);
-+    assert(e);
-+    assert(l->fd =3D=3D fd);
-+
-+    if (l->proto =3D=3D AVAHI_PROTO_INET)
-+        p =3D avahi_recv_dns_packet_ipv4(l->fd, NULL, NULL, NULL, NULL,=
 NULL);
-     else {
--        assert(fd =3D=3D e->fd_ipv6);
--        p =3D avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL, =
NULL, NULL);
-+        assert(l->proto =3D=3D AVAHI_PROTO_INET6);
-+
-+        p =3D avahi_recv_dns_packet_ipv6(l->fd, NULL, NULL, NULL, NULL,=
 NULL);
-     }
-=20
-     if (p) {
-@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_n=
ew(AvahiServer *s) {
-     e->server =3D s;
-     e->cleanup_dead =3D 0;
-=20
--    /* Create sockets */
--    e->fd_ipv4 =3D s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4(=
) : -1;
--    e->fd_ipv6 =3D s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6(=
) : -1;
--
--    if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
--        avahi_log_error(__FILE__": Failed to create wide area sockets: =
%s", strerror(errno));
--
--        if (e->fd_ipv6 >=3D 0)
--            close(e->fd_ipv6);
--
--        if (e->fd_ipv4 >=3D 0)
--            close(e->fd_ipv4);
--
--        avahi_free(e);
--        return NULL;
--    }
--
--    /* Create watches */
--
--    e->watch_ipv4 =3D e->watch_ipv6 =3D NULL;
--
--    if (e->fd_ipv4 >=3D 0)
--        e->watch_ipv4 =3D s->poll_api->watch_new(e->server->poll_api, e=
->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
--    if (e->fd_ipv6 >=3D 0)
--        e->watch_ipv6 =3D s->poll_api->watch_new(e->server->poll_api, e=
->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
--
-     e->n_dns_servers =3D e->current_dns_server =3D 0;
-=20
-     /* Initialize cache */
-@@ -651,18 +673,6 @@ void avahi_wide_area_engine_free(AvahiWideAreaLooku=
pEngine *e) {
-     avahi_hashmap_free(e->lookups_by_id);
-     avahi_hashmap_free(e->lookups_by_key);
-=20
--    if (e->watch_ipv4)
--        e->server->poll_api->watch_free(e->watch_ipv4);
--
--    if (e->watch_ipv6)
--        e->server->poll_api->watch_free(e->watch_ipv6);
--
--    if (e->fd_ipv6 >=3D 0)
--        close(e->fd_ipv6);
--
--    if (e->fd_ipv4 >=3D 0)
--        close(e->fd_ipv4);
--
-     avahi_free(e);
- }
-=20
-@@ -680,7 +690,7 @@ void avahi_wide_area_set_servers(AvahiWideAreaLookup=
Engine *e, const AvahiAddres
-=20
-     if (a) {
-         for (e->n_dns_servers =3D 0; n > 0 && e->n_dns_servers < AVAHI_=
WIDE_AREA_SERVERS_MAX; a++, n--)
--            if ((a->proto =3D=3D AVAHI_PROTO_INET && e->fd_ipv4 >=3D 0)=
 || (a->proto =3D=3D AVAHI_PROTO_INET6 && e->fd_ipv6 >=3D 0))
-+            if (a->proto =3D=3D AVAHI_PROTO_INET || a->proto =3D=3D AVA=
HI_PROTO_INET6)
-                 e->dns_servers[e->n_dns_servers++] =3D *a;
-     } else {
-         assert(n =3D=3D 0);
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
deleted file mode 100644
index a156f987280..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat=
.com>
-Date: Mon, 11 Nov 2024 00:56:09 +0100
-Subject: [PATCH] Properly randomize query id of DNS packets
-
-CVE: CVE-2024-52616
-Upstream-Status: Backport [https://github.com/avahi/avahi/commit/f8710bd=
c8b29ee1176fe3bfaeabebbda1b7a79f7]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
- configure.ac           |  3 ++-
- 2 files changed, 30 insertions(+), 9 deletions(-)
-
-diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
-index 971f5e714..00a15056e 100644
---- a/avahi-core/wide-area.c
-+++ b/avahi-core/wide-area.c
-@@ -40,6 +40,13 @@
- #include "addr-util.h"
- #include "rr-util.h"
-=20
-+#ifdef HAVE_SYS_RANDOM_H
-+#include <sys/random.h>
-+#endif
-+#ifndef HAVE_GETRANDOM
-+#  define getrandom(d, len, flags) (-1)
-+#endif
-+
- #define CACHE_ENTRIES_MAX 500
-=20
- typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
-@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
-     int fd_ipv4, fd_ipv6;
-     AvahiWatch *watch_ipv4, *watch_ipv6;
-=20
--    uint16_t next_id;
--
-     /* Cache */
-     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
-     AvahiHashmap *cache_by_key;
-@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent =
*e, void *userdata) {
-     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
- }
-=20
-+static uint16_t get_random_uint16(void) {
-+    uint16_t next_id;
-+
-+    if (getrandom(&next_id, sizeof(next_id), 0) =3D=3D -1)
-+        next_id =3D (uint16_t) rand();
-+    return next_id;
-+}
-+
-+static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
-+    uint16_t next_id;
-+
-+    next_id =3D get_random_uint16();
-+    while (find_lookup(e, next_id)) {
-+        /* This ID is already used, get new. */
-+        next_id =3D get_random_uint16();
-+    }
-+    return next_id;
-+}
-+
-+
- AvahiWideAreaLookup *avahi_wide_area_lookup_new(
-     AvahiWideAreaLookupEngine *e,
-     AvahiKey *key,
-@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
-     /* If more than 65K wide area quries are issued simultaneously,
-      * this will break. This should be limited by some higher level */
-=20
--    for (;; e->next_id++)
--        if (!find_lookup(e, e->next_id))
--            break; /* This ID is not yet used. */
--
--    l->id =3D e->next_id++;
-+    l->id =3D avahi_wide_area_next_id(e);
-=20
-     /* We keep the packet around in case we need to repeat our query */
-     l->packet =3D avahi_dns_packet_new(0);
-@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_ne=
w(AvahiServer *s) {
-         e->watch_ipv6 =3D s->poll_api->watch_new(e->server->poll_api, e=
->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
-=20
-     e->n_dns_servers =3D e->current_dns_server =3D 0;
--    e->next_id =3D (uint16_t) rand();
-=20
-     /* Initialize cache */
-     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
-diff --git a/configure.ac b/configure.ac
-index a3211b80e..31bce3d76 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
- # whether libc's malloc does too. (Same for realloc.)
- #AC_FUNC_MALLOC
- #AC_FUNC_REALLOC
--AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket s=
trchr strcspn strdup strerror strrchr strspn strstr uname setresuid setre=
uid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy=
 gethostbyname seteuid setegid setproctitle getprogname])
-+AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket s=
trchr strcspn strdup strerror strrchr strspn strstr uname setresuid setre=
uid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy=
 gethostbyname seteuid setegid setproctitle getprogname getrandom])
-+AC_CHECK_HEADERS([sys/random.h])
-=20
- AC_FUNC_CHOWN
- AC_FUNC_STAT
-
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
deleted file mode 100644
index b3e11f9597f..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Wed, 17 Dec 2025 08:11:23 +0000
-Subject: [PATCH] core: refuse to create wide-area record browsers when
- wide-area is off
-
-It fixes a bug where it was possible for unprivileged local users to
-crash avahi-daemon (with wide-area disabled) by creating record browsers
-with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by callin=
g
-the RecordBrowserNew method directly or by creating hostname/address/ser=
vice
-resolvers/browsers that create those browsers internally themselves).
-
-```
-$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --met=
hod org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
-Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient=
 disconnected from message bus without replying
-```
-```
-dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, mem=
ber=3DResolveHostName
-avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e'=
 failed.
-=3D=3D307948=3D=3D
-=3D=3D307948=3D=3D Process terminating with default action of signal 6 (=
SIGABRT)
-=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pthre=
ad_kill.c:44)
-=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
-=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
-=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:11=
8)
-=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-are=
a.c:725)
-=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
-=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
-=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
-=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
-=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447=
)
-=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple-w=
atch.c:563)
-=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-wa=
tch.c:605)
-=3D=3D307948=3D=3D
-```
-
-wide-area has been disabled by default since
-9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
-
-https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
-
-CVE: CVE-2025-68276
-Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commi=
ts/0c013e2e819be3bda74cecf48b5f64956cf8a760]
-
-Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
----
- avahi-core/browse.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c
-index e8a915e..59d53cb 100644
---- a/avahi-core/browse.c
-+++ b/avahi-core/browse.c
-@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare=
(
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, A=
VAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_=
FLAGS);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE=
_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_F=
LAGS);
-=20
-+    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_look=
up_engine) {
-+        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
-+        return NULL;
-+    }
-+
-     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
-         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
-         return NULL;
---=20
-2.34.1
-
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
deleted file mode 100644
index 3635cc8d53e..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
-From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
-Date: Sun, 2 Mar 2025 18:06:24 +0100
-Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
-
-Closes https://github.com/avahi/avahi/issues/683
-
-CVE: CVE-2025-68468
-
-Upstream-Status: Backport
-[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b672401=
79d309a]
-
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
----
- avahi-core/browse.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c
-index 86e4432..79595fe 100644
---- a/avahi-core/browse.c
-+++ b/avahi-core/browse.c
-@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
-                 lookup_drop_cname(l, interface, protocol, 0, r);
-             else {
-                 /* It's a normal record, so let's call the user callbac=
k */
--                assert(avahi_key_equal(b->key, l->key));
-=20
-                 b->callback(b, interface, protocol, event, r, flags, b-=
>userdata);
-             }
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
deleted file mode 100644
index 210565cdd61..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
-From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
-Date: Sun, 2 Mar 2025 18:06:24 +0100
-Subject: [PATCH] core: fix DoS bug by changing assert to return
-
-Closes https://github.com/avahi/avahi/issues/678
-
-CVE: CVE-2025-68471
-
-Upstream-Status: Backport
-[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c5=
4cc0aa1]
-
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
----
- avahi-core/browse.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c
-index 2941e57..86e4432 100644
---- a/avahi-core/browse.c
-+++ b/avahi-core/browse.c
-@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
-     assert(l);
-=20
-     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) !=3D !(l->flags & A=
VAHI_LOOKUP_USE_MULTICAST));
--    assert(!l->wide_area && !l->multicast);
-+    if (l->wide_area || l->multicast) {
-+        /* Avoid starting a duplicate lookup */
-+        return 0;
-+    }
-=20
-     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
-=20
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
deleted file mode 100644
index 1a442966fc9..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 5eea2640324928c15936b7a2bcbf8ea0de7b08f7 Mon Sep 17 00:00:00 2001
-From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
-Date: Sun, 2 Mar 2025 18:06:24 +0100
-Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loo=
p
- detection algorithm
-
-Closes https://github.com/avahi/avahi/issues/501
-
-CVE: CVE-2026-24401
-Upstream-Status: Backport [https://github.com/avahi/avahi/commit/78eab31=
128479f06e30beb8c1cbf99dd921e2524]
-(cherry picked from commit 78eab31128479f06e30beb8c1cbf99dd921e2524)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 40 insertions(+)
-
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c
-index f461083..975b3e9 100644
---- a/avahi-core/browse.c
-+++ b/avahi-core/browse.c
-@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {
-     return n;
- }
-=20
-+static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup=
* from, AvahiSRBLookup* to) {
-+    AvahiRList* rl;
-+    if (from =3D=3D to)
-+        return 0;
-+    for (rl =3D from->cname_lookups; rl; rl =3D rl->rlist_next) {
-+        int r =3D lookup_exists_in_path(lookup, rl->data, to);
-+        if (r =3D=3D 1) {
-+            /* loop detected, propagate result */
-+            return r;
-+        } else if (r =3D=3D 0) {
-+            /* is loop detected? */
-+            return lookup =3D=3D from;
-+        } else {
-+	        /* `to` not found, continue */
-+            continue;
-+        }
-+    }
-+    /* no path found */
-+    return -1;
-+}
-+
-+static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n=
) {
-+    int ret;
-+    if (l =3D=3D n)
-+        /* Loop to self */
-+        return 1;
-+
-+    ret =3D lookup_exists_in_path(n, l->record_browser->root_lookup, l)=
;
-+
-+    /* Path to n always exists */
-+    assert(ret !=3D -1);
-+    return ret;
-+}
-+
- static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interfa=
ce, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r) {
-     AvahiKey *k;
-     AvahiSRBLookup *n;
-@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l, =
AvahiIfIndex interface, Avahi
-         return;
-     }
-=20
-+    if (cname_would_create_loop(l, n)) {
-+        /* CNAME loops are not allowed */
-+        lookup_unref(n);
-+        return;
-+    }
-+
-     l->cname_lookups =3D avahi_rlist_prepend(l->cname_lookups, lookup_r=
ef(n));
-=20
-     lookup_go(n);
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
deleted file mode 100644
index 208345a3258..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Wed, 1 Apr 2026 05:31:58 +0000
-Subject: [PATCH] core: refuse to accept publish flags where both wide_ar=
ea and
- multicast are set
-
-It fixes a bug where it was possible for unprivileged local users to
-crash avahi-daemon via D-Bus by calling EntryGroup methods accepting
-flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and
-AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was
-invoked like that avahi-daemon crashed with
-```
-dbus-entry-group.c: interface=3Dorg.freedesktop.Avahi.EntryGroup, path=3D=
/Client0/EntryGroup1, member=3DAddRecord
-avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion `!((*fl=
ags & AVAHI_PUBLISH_USE_MULTICAST) && (*flags & AVAHI_PUBLISH_USE_WIDE_AR=
EA))' failed.
-=3D=3D84944=3D=3D
-=3D=3D84944=3D=3D Process terminating with default action of signal 6 (S=
IGABRT)
-=3D=3D84944=3D=3D    at 0x4B353BC: __pthread_kill_implementation (pthrea=
d_kill.c:44)
-=3D=3D84944=3D=3D    by 0x4ADE941: raise (raise.c:26)
-=3D=3D84944=3D=3D    by 0x4AC64AB: abort (abort.c:77)
-=3D=3D84944=3D=3D    by 0x4AC641F: __assert_fail_base.cold (assert.c:118=
)
-=3D=3D84944=3D=3D    by 0x48A9404: transport_flags_from_domain (entry.c:=
57)
-=3D=3D84944=3D=3D    by 0x48A9F8F: server_add_internal (entry.c:224)
-=3D=3D84944=3D=3D    by 0x48AA49F: avahi_server_add (entry.c:324)
-=3D=3D84944=3D=3D    by 0x401A670: avahi_dbus_msg_entry_group_impl (dbus=
-entry-group.c:348)
-=3D=3D84944=3D=3D    by 0x4A70741: ??? (in /usr/lib/x86_64-linux-gnu/lib=
dbus-1.so.3.38.3)
-=3D=3D84944=3D=3D    by 0x4A5FB22: dbus_connection_dispatch (in /usr/lib=
/x86_64-linux-gnu/libdbus-1.so.3.38.3)
-=3D=3D84944=3D=3D    by 0x401D01D: dispatch_timeout_callback (dbus-watch=
-glue.c:105)
-=3D=3D84944=3D=3D    by 0x488E3AE: timeout_callback (simple-watch.c:447)
-=3D=3D84944=3D=3D
-```
-It's a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where
-those flags were introduced and consistent with the other places
-where wide_area/multicast flags are used.
-
-It was discovered by
-Guillaume Meunier - Head of Vulnerability Operations Center France - Ora=
nge Cyberdefense
-
-https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc
-
-CVE-2026-34933
-
-Upstream-Status: Backport [https://github.com/avahi/avahi/commit/0be89b6=
bb5c3983837b5e0febcbbbf452ecf7675]
-CVE: CVE-2026-34933
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-core/entry.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/avahi-core/entry.c b/avahi-core/entry.c
-index 0d862133d..06eb12076 100644
---- a/avahi-core/entry.c
-+++ b/avahi-core/entry.c
-@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(
-                                          AVAHI_PUBLISH_UPDATE|
-                                          AVAHI_PUBLISH_USE_WIDE_AREA|
-                                          AVAHI_PUBLISH_USE_MULTICAST), =
AVAHI_ERR_INVALID_FLAGS);
-+    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WID=
E_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAG=
S);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_domain_name(r->k=
ey->name), AVAHI_ERR_INVALID_HOST_NAME);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r->ttl !=3D 0, AVAHI_ERR_INVALI=
D_TTL);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_pattern(r->key), =
AVAHI_ERR_IS_PATTERN);
-@@ -454,6 +455,7 @@ int avahi_server_add_address(
-                                               AVAHI_PUBLISH_UPDATE|
-                                               AVAHI_PUBLISH_USE_WIDE_AR=
EA|
-                                               AVAHI_PUBLISH_USE_MULTICA=
ST), AVAHI_ERR_INVALID_FLAGS);
-+    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !=
(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
-     AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(name), AVAHI_E=
RR_INVALID_HOST_NAME);
-=20
-     /* Prepare the host naem */
-@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(
-                                                                 AVAHI_P=
UBLISH_UPDATE|
-                                                                 AVAHI_P=
UBLISH_USE_WIDE_AREA|
-                                                                 AVAHI_P=
UBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
-+    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_U=
SE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALI=
D_FLAGS);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_na=
me(name), AVAHI_ERR_INVALID_SERVICE_NAME);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_ty=
pe_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid=
_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
-@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(
-                                                                 AVAHI_P=
UBLISH_NO_COOKIE|
-                                                                 AVAHI_P=
UBLISH_USE_WIDE_AREA|
-                                                                 AVAHI_P=
UBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
-+    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_U=
SE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALI=
D_FLAGS);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_na=
me(name), AVAHI_ERR_INVALID_SERVICE_NAME);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_ty=
pe_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid=
_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
-@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VALID(interface)=
, AVAHI_ERR_INVALID_INTERFACE);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_PROTO_VALID(protoco=
l), AVAHI_ERR_INVALID_PROTOCOL);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_VALID(flags, =
AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVAL=
ID_FLAGS);
-+    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_U=
SE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALI=
D_FLAGS);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_na=
me(name), AVAHI_ERR_INVALID_SERVICE_NAME);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_ty=
pe_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
-     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid=
_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
-@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(
-     assert(name);
-=20
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(flags, AVAHI_=
PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLA=
GS);
-+    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WID=
E_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAG=
S);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type =3D=3D AVAHI_DNS_SERVER_UP=
DATE || type =3D=3D AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port !=3D 0, AVAHI_ERR_INVALID_=
PORT);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqdn(name), AVAH=
I_ERR_INVALID_HOST_NAME);
-@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(
-     AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALI=
D_INTERFACE);
-     AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) && AVAHI_PROTO_=
VALID(address->proto), AVAHI_ERR_INVALID_PROTOCOL);
-     AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_=
MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
-+    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !=
(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
-     AVAHI_CHECK_VALIDITY(s, type =3D=3D AVAHI_DNS_SERVER_UPDATE || type=
 =3D=3D AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
-     AVAHI_CHECK_VALIDITY(s, port !=3D 0, AVAHI_ERR_INVALID_PORT);
-     AVAHI_CHECK_VALIDITY(s, !domain || avahi_is_valid_domain_name(domai=
n), AVAHI_ERR_INVALID_DOMAIN_NAME);
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch=
 b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
deleted file mode 100644
index 479d0d7e932..00000000000
--- a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From a93fdd980d2db5d453475c0aa2b39946bd6611bd Mon Sep 17 00:00:00 2001
-From: Evgeny Vereshchagin <evvers@ya.ru>
-Date: Wed, 1 Apr 2026 05:30:58 +0000
-Subject: [PATCH] tests: make sure AVAHI_PUBLISH_USE_WIDE_AREA is refused
-
-Upstream-Status: Backport [https://github.com/avahi/avahi/commit/a93fdd9=
80d2db5d453475c0aa2b39946bd6611bd]
-CVE: CVE-2026-34933
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- avahi-client/client-test.c | 25 +++++++++++++++++++++++++
- avahi-core/avahi-test.c    | 12 +++++++++++-
- 2 files changed, 36 insertions(+), 1 deletion(-)
-
-diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
-index 9a015d7..c80e12f 100644
---- a/avahi-client/client-test.c
-+++ b/avahi-client/client-test.c
-@@ -212,6 +212,28 @@ static void terminate(AVAHI_GCC_UNUSED AvahiTimeout=
 *timeout, AVAHI_GCC_UNUSED v
-     avahi_simple_poll_quit(simple_poll);
- }
-=20
-+static void test_refuse_publish_flags(AvahiEntryGroup *g, AvahiPublishF=
lags flags, int expected) {
-+    AvahiAddress a;
-+    AvahiStringList *l =3D NULL;
-+    int r;
-+
-+    r =3D avahi_entry_group_add_record(g, AVAHI_IF_UNSPEC, AVAHI_PROTO_=
UNSPEC, flags, "test.local", AVAHI_DNS_CLASS_IN, AVAHI_DNS_TYPE_CNAME, 12=
0, "\0", 1);
-+    assert(r =3D=3D expected);
-+
-+    avahi_address_parse("224.0.0.251", AVAHI_PROTO_UNSPEC, &a);
-+    r =3D avahi_entry_group_add_address(g, AVAHI_IF_UNSPEC, AVAHI_PROTO=
_UNSPEC, flags, "test.local", &a);
-+    assert(r =3D=3D expected);
-+
-+    r =3D avahi_entry_group_add_service_strlst(g, AVAHI_IF_UNSPEC, AVAH=
I_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, NULL, 80, l);
-+    assert(r =3D=3D expected);
-+
-+    r =3D avahi_entry_group_update_service_txt_strlst(g, AVAHI_IF_UNSPE=
C, AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, l);
-+    assert(r =3D=3D expected);
-+
-+    r =3D avahi_entry_group_add_service_subtype(g, AVAHI_IF_UNSPEC, AVA=
HI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, "_magic._sub._http._t=
cp");
-+    assert(r =3D=3D expected);
-+}
-+
- int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
-     AvahiClient *avahi;
-     AvahiEntryGroup *group, *group2;
-@@ -275,6 +297,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSE=
D char *argv[]) {
-     error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVA=
HI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
-     assert(error !=3D AVAHI_OK);
-=20
-+    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA, AVAHI=
_ERR_NOT_SUPPORTED);
-+    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_=
PUBLISH_USE_MULTICAST, AVAHI_ERR_INVALID_FLAGS);
-+
-     avahi_entry_group_commit (group);
-=20
-     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_=
PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_=
callback, (char*) "omghai3u");
-diff --git a/avahi-core/avahi-test.c b/avahi-core/avahi-test.c
-index 2a7872b..2bae82b 100644
---- a/avahi-core/avahi-test.c
-+++ b/avahi-core/avahi-test.c
-@@ -30,6 +30,7 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
-=20
-+#include <avahi-common/error.h>
- #include <avahi-common/malloc.h>
- #include <avahi-common/simple-watch.h>
- #include <avahi-common/alternative.h>
-@@ -150,6 +151,7 @@ static void remove_entries(void) {
- static void create_entries(int new_name) {
-     AvahiAddress a;
-     AvahiRecord *r;
-+    int error;
-=20
-     remove_entries();
-=20
-@@ -181,7 +183,15 @@ static void create_entries(int new_name) {
-         goto fail;
-     }
-=20
--    if (avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNS=
PEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, avahi_address=
_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a), 53) < 0) {
-+    avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a);
-+
-+    error =3D avahi_server_add_dns_server_address(server, group, AVAHI_=
IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA, NULL, AVAHI_D=
NS_SERVER_RESOLVE, &a, 53);
-+    assert(error =3D=3D AVAHI_ERR_NOT_SUPPORTED);
-+
-+    error =3D avahi_server_add_dns_server_address(server, group, AVAHI_=
IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_=
USE_MULTICAST, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53);
-+    assert(error =3D=3D AVAHI_ERR_INVALID_FLAGS);
-+
-+    if (avahi_server_add_dns_server_address(server, group, AVAHI_IF_UNS=
PEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, &a, 53) < 0) =
{
-         avahi_log_error("Failed to add new DNS Server address");
-         goto fail;
-     }
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/avahi/files/avahi-daemon.in b/meta=
/recipes-connectivity/avahi/files/avahi-daemon.in
new file mode 100644
index 00000000000..49ec3586896
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/avahi-daemon.in
@@ -0,0 +1,198 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          avahi
+# Required-Start:    $remote_fs dbus
+# Required-Stop:     $remote_fs dbus
+# Should-Start:	     $syslog
+# Should-Stop:       $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Avahi mDNS/DNS-SD Daemon
+# Description:       Zeroconf daemon for configuring your network=20
+#                    automatically
+### END INIT INFO
+#
+# This file is part of avahi.
+#
+# avahi is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as
+# published by the Free Software Foundation; either version 2 of the
+# License, or (at your option) any later version.
+#
+# avahi is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
+# License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with avahi; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+# USA.
+
+#
+# avahi     avahi daemon
+#                               Daemon for ZeroConf
+#
+# Authors:      <sebastien.estienne@gmail.com>
+#
+
+if [ -f /lib/lsb/init-functions ]
+then
+    . /lib/lsb/init-functions
+else
+    # int log_begin_message (char *message)
+    log_begin_msg () {
+        if [ -z "$1" ]; then
+	    return 1
+        fi
+        echo " * $@"
+    }
+
+    # int log_end_message (int exitstatus)
+    log_end_msg () {
+=09
+    # If no arguments were passed, return
+	[ -z "$1" ] && return 1
+=09
+    # Only do the fancy stuff if we have an appropriate terminal
+    # and if /usr is already mounted
+	TPUT=3D/usr/bin/tput
+	EXPR=3D/usr/bin/expr
+	if [ -x $TPUT ] && [ -x $EXPR ] && $TPUT hpa 60 >/dev/null 2>&1; then
+	    COLS=3D`$TPUT cols`
+	    if [ -n "$COLS" ]; then
+		COL=3D`$EXPR $COLS - 7`
+	    else
+		COL=3D73
+	    fi
+	    UP=3D`$TPUT cuu1`
+	    END=3D`$TPUT hpa $COL`
+	    START=3D`$TPUT hpa 0`
+	    RED=3D`$TPUT setaf 1`
+	    NORMAL=3D`$TPUT op`
+	    if [ $1 -eq 0 ]; then
+		echo "$UP$END[ ok ]"
+	    else
+		echo -e "$UP$START $RED*$NORMAL$END[${RED}fail${NORMAL}]"
+	    fi
+	else
+	    if [ $1 -eq 0 ]; then
+		echo "   ...done."
+	    else
+		echo "   ...fail!"
+	    fi
+	fi
+	return $1
+    }
+   =20
+    log_warning_msg () {
+	if log_use_fancy_output; then
+	    YELLOW=3D`$TPUT setaf 3`
+	    NORMAL=3D`$TPUT op`
+	    echo "$YELLOW*$NORMAL $@"
+	else
+	    echo "$@"
+	fi
+    }
+
+fi
+
+#set -e
+
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+DESC=3D"Avahi mDNS/DNS-SD Daemon"
+NAME=3D"avahi-daemon"
+DAEMON=3D"@sbindir@/$NAME"
+SCRIPTNAME=3D/etc/init.d/$NAME
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+# don't start if /etc/default/avahi-daemon says so.
+AVAHI_DAEMON_START=3D1
+test -f /etc/default/avahi-daemon && . /etc/default/avahi-daemon
+
+if [ "$AVAHI_DAEMON_START" !=3D "1" -a "$1" !=3D "stop" ]; then
+    log_warning_msg "Not starting $DESC $NAME, disabled via /etc/default=
/$NAME"
+    exit 0
+fi
+
+#
+#       Function that starts the daemon/service.
+#
+d_start() {
+    modprobe capability >/dev/null 2>&1 || true
+
+    $DAEMON -c && return 0
+
+    if [ -s /etc/localtime ]; then
+	if [ ! -d /etc/avahi/etc ]; then
+	    mkdir -p @sysconfdir@/avahi/etc >/dev/null 2>&1
+	fi
+	cp -fp /etc/localtime @sysconfdir@/avahi/etc >/dev/null 2>&1
+    fi;
+   =20
+    $DAEMON -D
+}
+
+#
+#       Function that stops the daemon/service.
+#
+d_stop() {
+    $DAEMON -c && $DAEMON -k
+}
+
+#
+#       Function that reload the config file for the daemon/service.
+#
+d_reload() {
+    $DAEMON -c && $DAEMON -r
+}
+
+#
+#       Function that check the status of the daemon/service.
+#
+d_status() {
+    $DAEMON -c
+    status=3D$?
+    if [ $status =3D 0 ]; then
+        echo "$DESC is running"
+        return 0
+    else
+        echo "$DESC is not running"
+        return 3
+    fi
+}
+
+case "$1" in
+    start)
+        log_begin_msg "Starting $DESC: $NAME"
+        d_start
+        log_end_msg $?
+        ;;
+    stop)
+        log_begin_msg "Stopping $DESC: $NAME"
+        d_stop
+        log_end_msg $?
+        ;;
+    reload)
+        log_begin_msg "Reloading services for $DESC: $NAME"
+        d_reload
+        log_end_msg $?
+        ;;
+    restart|force-reload)
+        log_begin_msg "Restarting $DESC: $NAME"
+        $DAEMON -c && d_stop
+        d_start
+        log_end_msg $?
+        ;;
+    status)
+        d_status
+	;;
+    *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|reload=
|status}" >&2
+        exit 1
+        ;;
+esac
+
+exit $?
diff --git a/meta/recipes-connectivity/avahi/files/avahi-dnsconfd.in b/me=
ta/recipes-connectivity/avahi/files/avahi-dnsconfd.in
new file mode 100644
index 00000000000..2529a75bda5
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/avahi-dnsconfd.in
@@ -0,0 +1,197 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          avahi-dnsconfd
+# Required-Start:    $remote_fs avahi
+# Required-Stop:     $remote_fs avahi
+# Should-Start:	     $syslog
+# Should-Stop:       $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Avahi mDNS/DNS-SD DNS configuration
+# Description:       Zeroconf daemon for configuring your network=20
+#                    automatically
+### END INIT INFO
+#
+#
+# This file is part of avahi.
+#
+# avahi is free software; you can redistribute it and/or modify it
+# under the terms of the GNU Lesser General Public License as
+# published by the Free Software Foundation; either version 2 of the
+# License, or (at your option) any later version.
+#
+# avahi is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
+# License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with avahi; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+# USA.
+
+#
+# avahi-dnsconfd     avahi dns configuration daemon
+#                               Daemon for ZeroConf
+#
+# Authors:      <sebastien.estienne@gmail.com>
+#
+
+if [ -f /lib/lsb/init-functions ]
+then
+    . /lib/lsb/init-functions
+else
+    # int log_begin_message (char *message)
+    log_begin_msg () {
+        if [ -z "$1" ]; then
+	    return 1
+        fi
+        echo " * $@"
+    }
+
+    # int log_end_message (int exitstatus)
+    log_end_msg () {
+=09
+    # If no arguments were passed, return
+	[ -z "$1" ] && return 1
+=09
+    # Only do the fancy stuff if we have an appropriate terminal
+    # and if /usr is already mounted
+	TPUT=3D/usr/bin/tput
+	EXPR=3D/usr/bin/expr
+	if [ -x $TPUT ] && [ -x $EXPR ] && $TPUT hpa 60 >/dev/null 2>&1; then
+	    COLS=3D`$TPUT cols`
+	    if [ -n "$COLS" ]; then
+		COL=3D`$EXPR $COLS - 7`
+	    else
+		COL=3D73
+	    fi
+	    UP=3D`$TPUT cuu1`
+	    END=3D`$TPUT hpa $COL`
+	    START=3D`$TPUT hpa 0`
+	    RED=3D`$TPUT setaf 1`
+	    NORMAL=3D`$TPUT op`
+	    if [ $1 -eq 0 ]; then
+		echo "$UP$END[ ok ]"
+	    else
+		echo -e "$UP$START $RED*$NORMAL$END[${RED}fail${NORMAL}]"
+	    fi
+	else
+	    if [ $1 -eq 0 ]; then
+		echo "   ...done."
+	    else
+		echo "   ...fail!"
+	    fi
+	fi
+	return $1
+    }
+   =20
+    log_warning_msg () {
+	if log_use_fancy_output; then
+	    YELLOW=3D`$TPUT setaf 3`
+	    NORMAL=3D`$TPUT op`
+	    echo "$YELLOW*$NORMAL $@"
+	else
+	    echo "$@"
+	fi
+    }
+
+fi
+
+#set -e
+
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+DESC=3D"Avahi Unicast DNS Configuration Daemon"
+NAME=3D"avahi-dnsconfd"
+DAEMON=3D"@sbindir@/$NAME"
+SCRIPTNAME=3D/etc/init.d/$NAME
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+# don't start if /etc/default/avahi-dnsconfd says so.
+AVAHI_DNSCONFD_START=3D1
+test -f /etc/default/avahi-dnsconfd && . /etc/default/avahi-dnsconfd
+
+if [ "$AVAHI_DNSCONFD_START" !=3D "1" -a "$1" !=3D "stop" ]; then
+    log_warning_msg "Not starting $DESC $NAME, disabled via /etc/default=
/$NAME"
+    exit 0
+fi
+
+#
+#       Function that starts the daemon/service.
+#
+d_start() {
+    $DAEMON -c
+    [ $? =3D 0 ] && exit 0
+
+    if [ -s /etc/localtime ]; then
+	if [ ! -d /etc/avahi/etc ]; then
+	    mkdir -p @sysconfdir@/avahi/etc >/dev/null 2>&1
+	fi
+	cp -fp /etc/localtime @sysconfdir@/avahi/etc >/dev/null 2>&1
+    fi;
+   =20
+    $DAEMON -D
+}
+
+#
+#       Function that stops the daemon/service.
+#
+d_stop() {
+    $DAEMON -c
+    [ $? !=3D 0 ] && exit 0
+
+    $DAEMON -k
+}
+
+#
+#       Function that reload the config file for the daemon/service.
+#
+d_refresh() {
+    $DAEMON -c
+    [ $? !=3D 0 ] && exit 0
+
+    $DAEMON -r
+}
+
+#
+#       Function that check the status of the daemon/service.
+#
+d_status() {
+    $DAEMON -c
+    [ $? =3D 0 ]  && echo "$DESC is running" || echo "$DESC is not runni=
ng"
+}
+
+case "$1" in
+    start)
+        log_begin_msg "Starting $DESC: $NAME"
+        d_start
+        log_end_msg $?
+        ;;
+    stop)
+        log_begin_msg "Stopping $DESC: $NAME"
+        d_stop
+        log_end_msg $?
+        ;;
+    refresh)
+        log_begin_msg "Refreshing $DESC: $NAME"
+        d_refresh
+        log_end_msg $?
+        ;;
+    reload|restart|force-reload)
+        log_begin_msg "Restarting $DESC: $NAME"
+        $DAEMON -c && d_stop
+        d_start
+        log_end_msg $?
+        ;;
+    status)
+        d_status
+	;;
+    *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|reload=
}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta/recipes-connectivity/avahi/files/handle-hup.patch b/met=
a/recipes-connectivity/avahi/files/handle-hup.patch
deleted file mode 100644
index 26632e5443d..00000000000
--- a/meta/recipes-connectivity/avahi/files/handle-hup.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-CVE: CVE-2021-3468
-Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/330]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 447affe29991ee99c6b9732fc5f2c1048a611d3b Mon Sep 17 00:00:00 2001
-From: Riccardo Schirone <sirmy15@gmail.com>
-Date: Fri, 26 Mar 2021 11:50:24 +0100
-Subject: [PATCH] Avoid infinite-loop in avahi-daemon by handling HUP eve=
nt in
- client_work
-
-If a client fills the input buffer, client_work() disables the
-AVAHI_WATCH_IN event, thus preventing the function from executing the
-`read` syscall the next times it is called. However, if the client then
-terminates the connection, the socket file descriptor receives a HUP
-event, which is not handled, thus the kernel keeps marking the HUP event
-as occurring. While iterating over the file descriptors that triggered
-an event, the client file descriptor will keep having the HUP event and
-the client_work() function is always called with AVAHI_WATCH_HUP but
-without nothing being done, thus entering an infinite loop.
-
-See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D984938
----
- avahi-daemon/simple-protocol.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/avahi-daemon/simple-protocol.c b/avahi-daemon/simple-protoc=
ol.c
-index 3e0ebb11..6c0274d6 100644
---- a/avahi-daemon/simple-protocol.c
-+++ b/avahi-daemon/simple-protocol.c
-@@ -424,6 +424,11 @@ static void client_work(AvahiWatch *watch, AVAHI_GC=
C_UNUSED int fd, AvahiWatchEv
-         }
-     }
-=20
-+    if (events & AVAHI_WATCH_HUP) {
-+        client_free(c);
-+        return;
-+    }
-+
-     c->server->poll_api->watch_update(
-         watch,
-         (c->outbuf_length > 0 ? AVAHI_WATCH_OUT : 0) |
diff --git a/meta/recipes-connectivity/avahi/files/initscript.patch b/met=
a/recipes-connectivity/avahi/files/initscript.patch
deleted file mode 100644
index e1176888df1..00000000000
--- a/meta/recipes-connectivity/avahi/files/initscript.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Note: upcoming avahi 0.9 drops debian initscripts altogether,
-so any version update would probably have to copy the last
-upstream versions into oe-core, and install them from the recipe.
-
-Upstream-Status: Inappropriate [upstream removed the files]
-
-Index: avahi-0.7/initscript/debian/avahi-daemon.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.7.orig/initscript/debian/avahi-daemon.in
-+++ avahi-0.7/initscript/debian/avahi-daemon.in
-@@ -1,5 +1,17 @@
- #!/bin/sh
--
-+### BEGIN INIT INFO
-+# Provides:          avahi
-+# Required-Start:    $remote_fs dbus
-+# Required-Stop:     $remote_fs dbus
-+# Should-Start:	     $syslog
-+# Should-Stop:       $syslog
-+# Default-Start:     2 3 4 5
-+# Default-Stop:      0 1 6
-+# Short-Description: Avahi mDNS/DNS-SD Daemon
-+# Description:       Zeroconf daemon for configuring your network=20
-+#                    automatically
-+### END INIT INFO
-+#
- # This file is part of avahi.
- #
- # avahi is free software; you can redistribute it and/or modify it
-Index: avahi-0.7/initscript/debian/avahi-dnsconfd.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- avahi-0.7.orig/initscript/debian/avahi-dnsconfd.in
-+++ avahi-0.7/initscript/debian/avahi-dnsconfd.in
-@@ -1,4 +1,17 @@
- #!/bin/sh
-+### BEGIN INIT INFO
-+# Provides:          avahi-dnsconfd
-+# Required-Start:    $remote_fs avahi
-+# Required-Stop:     $remote_fs avahi
-+# Should-Start:	     $syslog
-+# Should-Stop:       $syslog
-+# Default-Start:     2 3 4 5
-+# Default-Stop:      0 1 6
-+# Short-Description: Avahi mDNS/DNS-SD DNS configuration
-+# Description:       Zeroconf daemon for configuring your network=20
-+#                    automatically
-+### END INIT INFO
-+#
-=20
- # This file is part of avahi.
- #
diff --git a/meta/recipes-connectivity/avahi/files/invalid-service.patch =
b/meta/recipes-connectivity/avahi/files/invalid-service.patch
deleted file mode 100644
index 8f188aff2c6..00000000000
--- a/meta/recipes-connectivity/avahi/files/invalid-service.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 46490e95151d415cd22f02565e530eb5efcef680 Mon Sep 17 00:00:00 2001
-From: Asger Hautop Drewsen <asger@princh.com>
-Date: Mon, 9 Aug 2021 14:25:08 +0200
-Subject: [PATCH] Fix avahi-browse: Invalid service type
-
-Invalid service types will stop the browse from completing, or
-in simple terms "my washing machine stops me from printing".
-
-Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/472]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- avahi-core/browse-service.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
-index 63e0275a..ac3d2ecb 100644
---- a/avahi-core/browse-service.c
-+++ b/avahi-core/browse-service.c
-@@ -103,7 +103,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_prepar=
e(
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_PROTO_VALID(protocol=
), AVAHI_ERR_INVALID_PROTOCOL);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !domain || avahi_is_valid_=
domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
-     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, A=
VAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_=
FLAGS);
--    AVAHI_CHECK_VALIDITY_RETURN_NULL(server, avahi_is_valid_service_typ=
e_generic(service_type), AVAHI_ERR_INVALID_SERVICE_TYPE);
-+
-+    if (!avahi_is_valid_service_type_generic(service_type))
-+        service_type =3D "_invalid._tcp";
-=20
-     if (!domain)
-         domain =3D server->domain_name;
diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/met=
a/recipes-connectivity/avahi/files/local-ping.patch
deleted file mode 100644
index 8f102815df0..00000000000
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-CVE: CVE-2021-3502
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 9d31939e55280a733d930b15ac9e4dda4497680c Mon Sep 17 00:00:00 2001
-From: Tommi Rantala <tommi.t.rantala@nokia.com>
-Date: Mon, 8 Feb 2021 11:04:43 +0200
-Subject: [PATCH] Fix NULL pointer crashes from #175
-
-avahi-daemon is crashing when running "ping .local".
-The crash is due to failing assertion from NULL pointer.
-Add missing NULL pointer checks to fix it.
-
-Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bde=
cd
----
- avahi-core/browse-dns-server.c   | 5 ++++-
- avahi-core/browse-domain.c       | 5 ++++-
- avahi-core/browse-service-type.c | 3 +++
- avahi-core/browse-service.c      | 3 +++
- avahi-core/browse.c              | 3 +++
- avahi-core/resolve-address.c     | 5 ++++-
- avahi-core/resolve-host-name.c   | 5 ++++-
- avahi-core/resolve-service.c     | 5 ++++-
- 8 files changed, 29 insertions(+), 5 deletions(-)
-
-diff --git a/avahi-core/browse-dns-server.c b/avahi-core/browse-dns-serv=
er.c
-index 049752e9..c2d914fa 100644
---- a/avahi-core/browse-dns-server.c
-+++ b/avahi-core/browse-dns-server.c
-@@ -343,7 +343,10 @@ AvahiSDNSServerBrowser *avahi_s_dns_server_browser_=
new(
-         AvahiSDNSServerBrowser* b;
-=20
-         b =3D avahi_s_dns_server_browser_prepare(server, interface, pro=
tocol, domain, type, aprotocol, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_dns_server_browser_start(b);
-=20
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/browse-domain.c b/avahi-core/browse-domain.c
-index f145d56a..06fa70c0 100644
---- a/avahi-core/browse-domain.c
-+++ b/avahi-core/browse-domain.c
-@@ -253,7 +253,10 @@ AvahiSDomainBrowser *avahi_s_domain_browser_new(
-         AvahiSDomainBrowser *b;
-=20
-         b =3D avahi_s_domain_browser_prepare(server, interface, protoco=
l, domain, type, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_domain_browser_start(b);
-=20
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/browse-service-type.c b/avahi-core/browse-servic=
e-type.c
-index fdd22dcd..b1fc7af8 100644
---- a/avahi-core/browse-service-type.c
-+++ b/avahi-core/browse-service-type.c
-@@ -171,6 +171,9 @@ AvahiSServiceTypeBrowser *avahi_s_service_type_brows=
er_new(
-         AvahiSServiceTypeBrowser *b;
-=20
-         b =3D avahi_s_service_type_browser_prepare(server, interface, p=
rotocol, domain, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_service_type_browser_start(b);
-=20
-         return b;
-diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
-index 5531360c..63e0275a 100644
---- a/avahi-core/browse-service.c
-+++ b/avahi-core/browse-service.c
-@@ -184,6 +184,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_new(
-         AvahiSServiceBrowser *b;
-=20
-         b =3D avahi_s_service_browser_prepare(server, interface, protoc=
ol, service_type, domain, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_service_browser_start(b);
-=20
-         return b;
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c
-index 2941e579..e8a915e9 100644
---- a/avahi-core/browse.c
-+++ b/avahi-core/browse.c
-@@ -634,6 +634,9 @@ AvahiSRecordBrowser *avahi_s_record_browser_new(
-         AvahiSRecordBrowser *b;
-=20
-         b =3D avahi_s_record_browser_prepare(server, interface, protoco=
l, key, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_record_browser_start_query(b);
-=20
-         return b;
-diff --git a/avahi-core/resolve-address.c b/avahi-core/resolve-address.c
-index ac0b29b1..e61dd242 100644
---- a/avahi-core/resolve-address.c
-+++ b/avahi-core/resolve-address.c
-@@ -286,7 +286,10 @@ AvahiSAddressResolver *avahi_s_address_resolver_new=
(
-         AvahiSAddressResolver *b;
-=20
-         b =3D avahi_s_address_resolver_prepare(server, interface, proto=
col, address, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_address_resolver_start(b);
-=20
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/resolve-host-name.c b/avahi-core/resolve-host-na=
me.c
-index 808b0e72..4e8e5973 100644
---- a/avahi-core/resolve-host-name.c
-+++ b/avahi-core/resolve-host-name.c
-@@ -318,7 +318,10 @@ AvahiSHostNameResolver *avahi_s_host_name_resolver_=
new(
-         AvahiSHostNameResolver *b;
-=20
-         b =3D avahi_s_host_name_resolver_prepare(server, interface, pro=
tocol, host_name, aprotocol, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_host_name_resolver_start(b);
-=20
-         return b;
--}
-\ No newline at end of file
-+}
-diff --git a/avahi-core/resolve-service.c b/avahi-core/resolve-service.c
-index 66bf3cae..43771763 100644
---- a/avahi-core/resolve-service.c
-+++ b/avahi-core/resolve-service.c
-@@ -519,7 +519,10 @@ AvahiSServiceResolver *avahi_s_service_resolver_new=
(
-         AvahiSServiceResolver *b;
-=20
-         b =3D avahi_s_service_resolver_prepare(server, interface, proto=
col, name, type, domain, aprotocol, flags, callback, userdata);
-+        if (!b)
-+            return NULL;
-+
-         avahi_s_service_resolver_start(b);
-=20
-         return b;
--}
-\ No newline at end of file
-+}
--=20
2.43.0


