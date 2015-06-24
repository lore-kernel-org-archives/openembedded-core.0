Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1BB75ABD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 03:14:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97680205"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jun 2015 11:18:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5O3DG9v029694
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 11:13:16 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 24 Jun 2015 11:14:58 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 11:14:42 +0800
Message-ID: <1435115682-1625-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] glibc: add systemd support
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
X-List-Received-Date: Wed, 24 Jun 2015 03:14:56 -0000
Content-Type: text/plain

add systemd service files nscd.service and nscd.socket

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-core/glibc/glibc-package.inc  |  2 +-
 meta/recipes-core/glibc/glibc.inc          | 20 +++++++++++++++++++-
 meta/recipes-core/glibc/glibc/nscd.service | 16 ++++++++++++++++
 meta/recipes-core/glibc/glibc/nscd.socket  |  8 ++++++++
 meta/recipes-core/glibc/glibc_2.21.bb      |  2 ++
 5 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/nscd.service
 create mode 100644 meta/recipes-core/glibc/glibc/nscd.socket

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 984362e..4897479 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -47,7 +47,7 @@ FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
-FILES_nscd = "${sbindir}/nscd*"
+FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/nscd.conf ${sysconfdir}/init.d/nscd ${localstatedir}/db ${systemd_unitdir}/system/nscd.*"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index da56bc9..4c28461 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -41,7 +41,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools texinfo distro_features_check
+inherit autotools texinfo distro_features_check systemd
 require glibc-options.inc
 
 # The main purpose of setting this variable is to prevent users from accidently
@@ -95,4 +95,22 @@ do_configure_append() {
 	sed -i 's/^OPTION_EGLIBC_NSSWITCH_FIXED_\(.*\)="\(.*\)"$/OPTION_EGLIBC_NSSWITCH_FIXED_\1=\2/' option-groups.config
 }
 
+do_install_append() {
+	install -d ${D}/${sysconfdir}
+	install -m 0644 ${S}/nscd/nscd.conf ${D}/${sysconfdir}/nscd.conf
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 0755 ${S}/nscd/nscd.init ${D}/${sysconfdir}/init.d/nscd
+	install -m 755 -d ${D}/${localstatedir}/db
+	install -m 755 -d ${D}/${localstatedir}/db/nscd
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/nscd.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/nscd.socket ${D}${systemd_unitdir}/system/
+	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/*
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*
+	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/*
+}
+
+
 GLIBC_ADDONS ?= "nptl,libidn"
+
diff --git a/meta/recipes-core/glibc/glibc/nscd.service b/meta/recipes-core/glibc/glibc/nscd.service
new file mode 100644
index 0000000..014103e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/nscd.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=Name Service Cache Daemon
+After=syslog.target
+
+[Service]
+Type=forking
+ExecStartPre=@base_bindir@/mkdir -p @localstatedir@/run/nscd
+ExecStartPre=@base_bindir@/mkdir -p @localstatedir@/db/nscd
+ExecStart=@SBINDIR@/nscd
+ExecStop=@SBINDIR@/nscd --shutdown
+Restart=always
+PIDFile=@localstatedir@/run/nscd/nscd.pid
+
+[Install]
+WantedBy=multi-user.target
+Also=nscd.socket
diff --git a/meta/recipes-core/glibc/glibc/nscd.socket b/meta/recipes-core/glibc/glibc/nscd.socket
new file mode 100644
index 0000000..fc63453
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/nscd.socket
@@ -0,0 +1,8 @@
+[Unit]
+Description=Name Service Cache Daemon Socket
+
+[Socket]
+ListenDatagram=@localstatedir@/run/nscd/socket
+ 
+[Install]
+WantedBy=sockets.target
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 8197c29..4230630 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -30,6 +30,8 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
            ${EGLIBCPATCHES} \
            ${CVEPATCHES} \
+           file://nscd.service \
+           file://nscd.socket \
           "
 EGLIBCPATCHES = "\
            file://timezone-re-written-tzselect-as-posix-sh.patch \
-- 
1.8.4.2


