Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5C872DF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192621"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:41 -0800
Message-Id: <1423161588-6867-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
References: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 03/10] resolvconf: add fixes for busybox and make it work
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:14 -0000

resolvconf was missing a script and needed readlink which was in
/usr/bin.  Also the /etc/resolv.conf was not being correctly linked
to /etc/resolvconf/run/resolv.conf, which is fixed by the volaties
change which is now a file as opposed to created in do_install.

Ensure that the correct scripts for ifup/ifdown get installed and that
resolvconf is correctly enabled at startup

[YOCTO #5361]

(From OE-Core rev: 853e8d2c7aff6dddc1d555af22f54c4ecef13df1)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
---
 .../resolvconf/resolvconf/99_resolvconf              |  4 ++++
 .../resolvconf/resolvconf/fix-path-for-busybox.patch | 20 ++++++++++++++++++++
 .../resolvconf/resolvconf_1.74.bb                    | 19 +++++++++++++++----
 3 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf b/meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
new file mode 100644
index 0000000..3790d77
--- /dev/null
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
@@ -0,0 +1,4 @@
+d root root 0755 /var/run/resolvconf/interface none
+f root root 0644 /etc/resolvconf/run/resolv.conf none
+f root root 0644 /etc/resolvconf/run/enable-updates none
+l root root 0644 /etc/resolv.conf /etc/resolvconf/run/resolv.conf
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch b/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
new file mode 100644
index 0000000..1aead07
--- /dev/null
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
@@ -0,0 +1,20 @@
+
+busybox installs readlink into /usr/bin, so ensure /usr/bin
+is in the path.
+
+Upstream-Status: Submitted
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: resolvconf-1.76/etc/resolvconf/update.d/libc
+===================================================================
+--- resolvconf-1.76.orig/etc/resolvconf/update.d/libc
++++ resolvconf-1.76/etc/resolvconf/update.d/libc
+@@ -16,7 +16,7 @@
+ #
+ 
+ set -e
+-PATH=/sbin:/bin
++PATH=/sbin:/bin:/usr/bin
+ 
+ [ -x /lib/resolvconf/list-records ] || exit 1
+ 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
index 5897e40..3ae624d 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
@@ -11,7 +11,11 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz \
+           file://fix-path-for-busybox.patch \
+           file://99_resolvconf \
+          "
+
 
 SRC_URI[md5sum] = "2f190d3bb8960b69157f63590c262e93"
 SRC_URI[sha256sum] = "2e72e6884e9105cbf57101ab0f11e768717b6f76b7f5100c6a2a0cc69bb3d4a0"
@@ -24,13 +28,13 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d root root 0755 ${localstatedir}/run/${BPN}/interface none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	install -m 0644 ${WORKDIR}/99_resolvconf ${D}${sysconfdir}/default/volatiles
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/${BPN}/interface - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
 	fi
+	install -d ${D}${base_libdir}/${BPN}
 	install -d ${D}${sysconfdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
 	install -d ${D}${sysconfdir} ${D}${base_sbindir}
@@ -38,6 +42,11 @@ do_install () {
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
+	install -d ${D}/${sysconfdir}/network/if-up.d
+	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
+	install -d ${D}/${sysconfdir}/network/if-down.d
+	install -m 0755 debian/resolvconf.resolvconf.if-down ${D}/${sysconfdir}/network/if-down.d/resolvconf
 	install -m 0644 README ${D}${docdir}/${P}/
 	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
 }
@@ -51,3 +60,5 @@ pkg_postinst_${PN} () {
 		fi
 	fi
 }
+
+FILES_${PN} += "${base_libdir}/${BPN}"
-- 
2.1.0


