Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B79BB606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:09:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0429PAM004170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jan 2016 18:09:25 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 3 Jan 2016 18:09:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 10:08:42 +0800
Message-ID: <06cb4a38d169505b4c7432a8e6208016863efad4.1451873095.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451873095.git.hongxu.jia@windriver.com>
References: <cover.1451873095.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: support large-file for stat64
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
X-List-Received-Date: Mon, 04 Jan 2016 02:09:25 -0000
Content-Type: text/plain

While starting dbus-daemon on a 32-bit linux host and it invokes
fstat to load /etc/dbus-1/system.conf through NFS. If system.conf
was created with a large indoe number on 64-bit host. The above
fstat invoking failed. Here is the log of strace:
............
$ ls -i /etc/dbus-1/system.conf
53778558109 /etc/dbus-1/system.conf

$ strace /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
|open("/etc/dbus-1/system.conf", O_RDONLY) = 4
|fstat64(4, {st_mode=S_IFREG|0644, st_size=3340, ...}) = 0
|close(4) = 0
|close(3) = 0
|write(2, "Failed to start message bus: Fai"..., 109Failed to start message bus:
Failed to stat "/etc/dbus-1/system.conf": Value too large for defined data type
|) = 109
|exit_group(1) = ?
|+++ exited with 1 +++
............

In this situation, we should support large-file for stat64. Add marco
AC_SYS_LARGEFILE to do the detection at configure time. It can be disabled
by configuring with the `--disable-largefile' option.

[YOCTO: #8863]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...onfigure.ac-support-large-file-for-stat64.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.8.20.bb              |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch b/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
new file mode 100644
index 0000000..bb73288
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
@@ -0,0 +1,53 @@
+From e18bd3a571be716d90bedc835a014472470ae7bd Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 30 Dec 2015 10:58:39 +0800
+Subject: [PATCH] configure.ac: support large-file for stat64
+
+While starting dbus-daemon on a 32-bit linux host and it invokes
+fstat to load /etc/dbus-1/system.conf through NFS. If system.conf
+was created with a large indoe number on 64-bit host. The above
+fstat invoking failed. Here is the log of strace:
+............
+$ ls -i /etc/dbus-1/system.conf
+53778558109 /etc/dbus-1/system.conf
+
+$ strace /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
+|open("/etc/dbus-1/system.conf", O_RDONLY) = 4
+|fstat64(4, {st_mode=S_IFREG|0644, st_size=3340, ...}) = 0
+|close(4) = 0
+|close(3) = 0
+|write(2, "Failed to start message bus: Fai"..., 109Failed to start message bus:
+Failed to stat "/etc/dbus-1/system.conf": Value too large for defined data type
+|) = 109
+|exit_group(1) = ?
+|+++ exited with 1 +++
+............
+
+In this situation, we should support large-file for stat64. Add marco
+AC_SYS_LARGEFILE to do the detection at configure time. It can be disabled
+by configuring with the `--disable-largefile' option.
+
+Upstream-Status: Submitted
+
+Bug: https://bugs.freedesktop.org/show_bug.cgi?id=93545
+https://bugs.freedesktop.org/attachment.cgi?id=120747
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 82806ba..cb5a60b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,6 +64,7 @@ AC_SUBST(DBUS_VERSION)
+ AC_PROG_CC
+ AM_PROG_CC_C_O
+ AC_PROG_CXX
++AC_SYS_LARGEFILE
+ AC_USE_SYSTEM_EXTENSIONS
+ AC_ISC_POSIX
+ AC_HEADER_STDC
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.8.20.bb
index c0ad48b..0c7f6b1 100644
--- a/meta/recipes-core/dbus/dbus_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.8.20.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://0001-configure.ac-support-large-file-for-stat64.patch \
 "
 
 SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
@@ -92,6 +93,7 @@ EXTRA_OECONF = "--disable-tests \
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
@@ -100,6 +102,7 @@ PACKAGECONFIG_class-nativesdk = ""
 # systemd<->dbus
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 
 do_install() {
 	autotools_do_install
-- 
1.9.1


