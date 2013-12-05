Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5602B6DFBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:58:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5MwOEI018131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 14:58:24 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 14:58:23 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:57:46 -0600
Message-ID: <4ed751b1a59aa26734d438561762fdb50a4daf7d.1386283669.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386283669.git.mark.hatle@windriver.com>
References: <cover.1386283669.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 7/7][dora] bind: use volatiles for managing /var/ subdirs
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
X-List-Received-Date: Thu, 05 Dec 2013 22:58:24 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

-- Sent for YP compliance --

Also changes ownerships of subdirs from root to bind and move chroot
entries to volatiles.

Based on meta-selinux commit: 0c2d3c680b1d43d73e4187f326990ae900b9055b

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-connectivity/bind/bind-9.8.1/bind9    | 10 +++---
 .../init.d-normalize-for-volatiles.patch           | 37 ++++++++++++++++++++++
 .../bind/bind-9.8.1/volatiles.98_bind              |  5 +++
 .../bind/bind-9.8.1/volatiles.99_bind-chroot       | 10 ++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       | 17 +++++-----
 5 files changed, 65 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/init.d-normalize-for-volatiles.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/volatiles.98_bind
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/volatiles.99_bind-chroot

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind9 b/meta/recipes-connectivity/bind/bind-9.8.1/bind9
index 2774334..0ca6552 100644
--- a/meta/recipes-connectivity/bind/bind-9.8.1/bind9
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind9
@@ -2,10 +2,10 @@
 # ~~~~~~~~~~~~~~~~~~~~~~~~~~
 # Currently, you can use the following options:
 #
-# ROOTDIR="/var/named/chroot"  --  will run named in a chroot environment.
-#                            you must set up the chroot environment 
-#                            (install the bind-chroot package) before
-#                            doing this.
+# ROOTDIR="/var/run/named-chroot"  --  will run named in a chroot environment.
+#                                      you must set up the chroot environment 
+#                                      (install the bind-chroot package) before
+#                                      doing this.
 #	NOTE:
 #         Those directories are automatically mounted to chroot if they are
 #         empty in the ROOTDIR directory. It will simplify maintenance of your
@@ -25,7 +25,7 @@
 #
 # OPTIONS="whatever"     --  These additional options will be passed to named
 #                            at startup. Don't add -t here, use ROOTDIR instead.
-ROOTDIR="/var/named/chroot"
+ROOTDIR="/var/run/named-chroot"
 OPTIONS="-u bind"
 
 # When using a read-only rootfs additional setup may be required
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/init.d-normalize-for-volatiles.patch b/meta/recipes-connectivity/bind/bind-9.8.1/init.d-normalize-for-volatiles.patch
new file mode 100644
index 0000000..bb502c8
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/init.d-normalize-for-volatiles.patch
@@ -0,0 +1,37 @@
+bind: normalize for volatiles changes
+
+Upstream-Status: Pending
+
+init.d needs to be normalized for using volatiles for managing /var/
+subdirs.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ init.d |    8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff -urpN a/init.d b/init.d
+--- a/init.d
++++ b/init.d
+@@ -4,7 +4,7 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
+ 
+ . /etc/init.d/functions
+ 
+-# for a chrooted server: "-u bind -t /var/lib/named"
++# for a chrooted server: "-u bind -t /var/run/named-chroot"
+ # Don't modify this line, change or create /etc/default/bind9.
+ OPTIONS=""
+ 
+@@ -126,12 +126,6 @@ case "$1" in
+ 	    ps `cat /var/run/named/named.pid` > /dev/null && exit 1
+ 	fi
+ 
+-	# dirs under /var/run can go away on reboots.
+-	mkdir -p /var/run/named
+-	mkdir -p /var/cache/bind
+-	chmod 775 /var/run/named
+-	chown root:bind /var/run/named >/dev/null 2>&1 || true
+-
+ 	if [ ! -x /usr/sbin/named ]; then
+ 	    echo "named binary missing - not starting"
+ 	    exit 1
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/volatiles.98_bind b/meta/recipes-connectivity/bind/bind-9.8.1/volatiles.98_bind
new file mode 100644
index 0000000..fa4c4e9
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/volatiles.98_bind
@@ -0,0 +1,5 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d bind bind 0755 /var/run/named none
+d bind bind 0755 /var/run/bind none
+d bind bind 0755 /var/run/bind/run none
+d bind bind 0755 /var/cache/bind none
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/volatiles.99_bind-chroot b/meta/recipes-connectivity/bind/bind-9.8.1/volatiles.99_bind-chroot
new file mode 100644
index 0000000..0a150a7
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/volatiles.99_bind-chroot
@@ -0,0 +1,10 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d bind bind 0755 /var/run/named-chroot/dev none
+d bind bind 0755 /var/run/named-chroot/etc none
+d bind bind 0755 /var/run/named-chroot/etc/bind none
+d bind bind 0755 /var/run/named-chroot/var none
+d bind bind 0755 /var/run/named-chroot/var/cache none
+d bind bind 0755 /var/run/named-chroot/var/cache/bind none
+d bind bind 0755 /var/run/named-chroot/var/run none
+d bind bind 0755 /var/run/named-chroot/var/run/bind none
+d bind bind 0755 /var/run/named-chroot/var/run/named none
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 45695e4..93b41d2 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -24,7 +24,10 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://init.d-fix-indentation.patch \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind-add-init-bind-status-command.patch \
-	   "
+           file://volatiles.98_bind \
+           file://volatiles.99_bind-chroot \
+           file://init.d-normalize-for-volatiles.patch \
+           "
 
 SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
 SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395ee7c92c"
@@ -48,7 +51,7 @@ PARALLEL_MAKE = ""
 PACKAGES_prepend = "${PN}-utils ${PN}-chroot "
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
-FILES_${PN}-chroot = "${localstatedir}/named/chroot ${sysconfdir}/default/bind9"
+FILES_${PN}-chroot = "${sysconfdir}/default/bind9 ${sysconfdir}/default/volatiles/99_bind_chroot"
 
 RDEPENDS_${PN} = "bind-chroot"
 
@@ -70,13 +73,9 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/default"
 	install -m 755 "${WORKDIR}/bind9" "${D}${sysconfdir}/default/bind9"
 
-	# chroot
-	chroot_prefix="${localstatedir}/named/chroot"
-	install -d "${D}${chroot_prefix}/dev"
-	install -d "${D}${chroot_prefix}/etc/bind"
-	install -d "${D}${chroot_prefix}/var/cache/bind"
-	install -d "${D}${chroot_prefix}/var/run/bind"
-	install -d "${D}${chroot_prefix}/var/run/named"
+	install -d ${D}/${sysconfdir}/default/volatiles
+	install -m 644 ${WORKDIR}/volatiles.98_bind ${D}/${sysconfdir}/default/volatiles/98_bind
+	install -m 644 ${WORKDIR}/volatiles.99_bind-chroot ${D}/${sysconfdir}/default/volatiles/99_bind_chroot
 }
 
 CONFFILES_${PN} = " \
-- 
1.8.1.2.545.g2f19ada


