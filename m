Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGg-0000rc-Ni
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so5654878pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9mdK4ibjU6Jw87E/7TMHF83XMRZXciu20Rvik6Pv1Gg=;
	b=Dyf3v9ournP+6DJkT4TolJLElrgUb5Mk56fyaKmkm4nYoIPCAmZh6hEdKJY2zkbbWz
	oZkrQiF6+gGH+zrpZrX7kVTmsc8aUo5C5BsFbWYZJ+fXi3dEaU015aBo355JRlO8td3S
	8cNapdZlo6eiXKrFxBx9Ob3KLV/EXbGNBngz0mUNbRzL4P6DDu+ZM/h2/lDS1T+f+ZAk
	f0truotqDytGKC9bavno5NjPgQ9vat9x9eTMKIWfsH+sH3XjUUY0IEKSYhaQGLQlvFB9
	BLTvzE/eae04zplVWev2xnCdXcYl7PlZ0xsC8R2vtzw75pfmE9YuGw7Pn1BpW0SCkDKj
	j0JA==
X-Received: by 10.66.84.195 with SMTP id b3mr8092606paz.30.1359061676865;
	Thu, 24 Jan 2013 13:07:56 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.55
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:30 -0800
Message-Id: <1735d421a283960573c7c9af3989cfb37a7750c3.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 09/11] systemd: Fix build on ppc
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
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

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



