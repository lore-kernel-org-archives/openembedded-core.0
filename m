Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04FC37866B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:01:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB8520cY012603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Dec 2017 21:02:00 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 7 Dec 2017 21:02:00 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Dec 2017 13:03:13 +0800
Message-ID: <4a7017828068dcc39cfc1c5766681e2553ce645b.1512709294.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1512709294.git.Qi.Chen@windriver.com>
References: <cover.1512709294.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] dbus: upgrade to 1.12.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 05:02:00 -0000
Content-Type: text/plain

1. os-test.patch is removed because current dbus has removed
   distro specific init script.

2. Add autoconf-archive to DEPENDS to fix do_configure failure as below.
     error: Unexpanded AX_ macro found.

3. Modify FILES variable to fix installed-vs-shipped QA issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/dbus/os-test.patch          | 35 ----------------------
 .../dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb}       | 12 ++++----
 2 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/os-test.patch
 rename meta/recipes-core/dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus/os-test.patch b/meta/recipes-core/dbus/dbus/os-test.patch
deleted file mode 100644
index 54c257f..0000000
--- a/meta/recipes-core/dbus/dbus/os-test.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-dbus: remove build host test in configure script
-
-The dbus build tests the build host to detect what initscript
-environment it expects.  Remove the test and set it to "redhat"
-unconditionally as the oe-core initscript has a redhat-style pid file
-path.
-
-Signed-off-by: Andy Ross <andy.ross@windriver.com>
-Upstream-Status: Inappropriate [embedded]
-
-diff -u a/configure.ac b/configure.ac
---- a/configure.ac	2012-08-28 11:23:43.040609874 -0700
-+++ b/configure.ac	2012-08-28 11:54:25.602913945 -0700
-@@ -1348,19 +1348,8 @@
- AS_AC_EXPAND(EXPANDED_LIBEXECDIR, "$libexecdir")
- AS_AC_EXPAND(EXPANDED_DATADIR, "$datadir")
- 
--#### Check our operating system
--operating_system=unknown
--if test -f /etc/redhat-release || test -f $EXPANDED_SYSCONFDIR/redhat-release ; then
--   operating_system=redhat
--fi
--
--if test -f /etc/slackware-version || test -f $EXPANDED_SYSCONFDIR/slackware-version ; then
--   operating_system=slackware
--fi
--
--if test -f /usr/bin/cygwin1.dll || test -f $EXPANDED_BINDIR/cygwin1.dll ; then
--   operating_system=cygwin
--fi
-+#### Build host test removed from upstream code, openembedded initscript is redhat-like:
-+operating_system=redhat
- 
- #### Sort out init scripts
- 
diff --git a/meta/recipes-core/dbus/dbus_1.10.20.bb b/meta/recipes-core/dbus/dbus_1.12.2.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus_1.10.20.bb
rename to meta/recipes-core/dbus/dbus_1.12.2.bb
index 9ddedc1..d923d33 100644
--- a/meta/recipes-core/dbus/dbus_1.10.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.2.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
-DEPENDS = "expat virtual/libintl"
+DEPENDS = "expat virtual/libintl autoconf-archive"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
 PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
@@ -15,13 +15,12 @@ RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
-           file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            file://0001-configure.ac-explicitely-check-stdint.h.patch \
 "
 
-SRC_URI[md5sum] = "94c991e763d4f9f13690416b2dcd9411"
-SRC_URI[sha256sum] = "e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48"
+SRC_URI[md5sum] = "3361456cadb99aa6601bed5b48964254"
+SRC_URI[sha256sum] = "272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
@@ -69,12 +68,15 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${datadir}/dbus-1/session.conf \
                ${datadir}/dbus-1/system.d \
                ${datadir}/dbus-1/system.conf \
+               ${datadir}/xml/dbus-1 \
                ${systemd_system_unitdir} \
                ${systemd_user_unitdir} \
+               ${nonarch_libdir}/sysusers.d/dbus.conf \
+               ${nonarch_libdir}/tmpfiles.d/dbus.conf \
 "
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
-FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${libdir}/cmake/DBus1 ${bindir}/dbus-test-tool"
 
 PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
 pkg_postinst_dbus() {
-- 
1.9.1


