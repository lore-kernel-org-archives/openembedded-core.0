Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxqZx-0002Zh-T3
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 04:00:56 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so3560379dak.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 18:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=9mdK4ibjU6Jw87E/7TMHF83XMRZXciu20Rvik6Pv1Gg=;
	b=qvct3BzumbPG9V6MJ+uuQcLs430EoihCSMXBirBU9U1rNUp9hW1TLacxpDGbCjnUur
	fM/rcRAtoUoFXdk4EO12JA14feF9grzIq5XQ2GvqKRWiTV2r/Rmc+27mEy4gmWsA0WtR
	hgeLLKWUsUDm9b3AEZdg+RpreeJst/oQYEdcCct53ZwG/5n6/8avjnMG/qowjwIxWriA
	UB4afS6qtc4sW/KKdcH+FgOn1pRhwvUdIi9Lu3umedWHuL/K+BFisvCrZqxNG0mrDH63
	2pP6Z7xxTeqrqYeZb7BMBLFUh3N6COnxoW6MeMxeK2D924JpNq5Qmjw5JvGyDEiWNr8e
	N4XA==
X-Received: by 10.66.78.100 with SMTP id a4mr607224pax.4.1358909114211;
	Tue, 22 Jan 2013 18:45:14 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id az8sm12555826pab.3.2013.01.22.18.45.13
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 18:45:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2013 18:45:00 -0800
Message-Id: <1358909100-21633-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: Fix build on ppc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 03:00:56 -0000

ppc discovers an interesting issue in linking systemd where a library is
missing in link cmdline and linker barfs

./.libs/libsystemd-core.a(libsystemd_core_la-manager.o): In function
`manager_check_finished':
/builddir/build/BUILD/systemd-196/src/core/manager.c:2092: undefined
reference to `sd_notifyf'
collect2: error: ld returned 1 exit status

For more info see

https://bugzilla.redhat.com/show_bug.cgi?id=888255

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |   32 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_196.bb           |    3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch b/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
new file mode 100644
index 0000000..4cd2ee6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted
+
+From f3e0a95b6b3fe516e43ec72045c2fad239184392 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Jan 2013 18:25:46 -0800
+Subject: [PATCH] test-unit-file: Add libsystemd-daemon.la to LDADD
+
+test-unit-file links with libsystemd-core which needs
+sd_* symbols from libsystemd-daemon
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7d5bd5a..884227a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1270,7 +1270,8 @@ test_unit_file_CFLAGS = \
+ 	$(DBUS_CFLAGS)
+ 
+ test_unit_file_LDADD = \
+-	libsystemd-core.la
++	libsystemd-core.la \
++	libsystemd-daemon.la
+ 
+ test_log_SOURCES = \
+ 	src/test/test-log.c
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index a78a8a6..9801fc5 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
+PR = "r1"
+
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -23,6 +25,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://var-run.conf \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
+           file://0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch \
           "
 SRC_URI[md5sum] = "05ebd7f108e420e2b4e4810ea4b3c810"
 SRC_URI[sha256sum] = "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcffdfc6f058b55e4bf"
-- 
1.7.9.5



