Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TLiOP-00011s-Cm
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 00:35:13 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id AD73621323;
	Tue,  9 Oct 2012 15:22:05 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 15:21:54 -0700
Message-Id: <1349821315-18006-2-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1349821315-18006-1-git-send-email-andy.ross@windriver.com>
References: <1349821315-18006-1-git-send-email-andy.ross@windriver.com>
Subject: [PATCH 1/2] busybox: Factor out defconfig and binary name
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
X-List-Received-Date: Tue, 09 Oct 2012 22:35:14 -0000

Allow recipes that require busybox.inc to specificy custom defconfig
files and binary names such that multiple busybox configurations may
coexist.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc       | 92 +++++++++++++++--------------
 meta/recipes-core/busybox/busybox_1.20.2.bb |  8 ++-
 2 files changed, 55 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 972e7d0..1aa54b3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -13,7 +13,7 @@ SECTION = "base"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-mdev ${PN}-hwclock"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf*"
@@ -33,8 +33,6 @@ INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
-RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
-
 inherit cml1 update-rc.d
 
 # internal helper
@@ -95,7 +93,7 @@ python () {
 
 do_prepare_config () {
 	sed -e 's#@DATADIR@#${datadir}#g' \
-		< ${WORKDIR}/defconfig > ${S}/.config
+		< ${WORKDIR}/${DEFCONFIG} > ${S}/.config
 	sed -i -e '/CONFIG_STATIC/d' .config
 	echo "# CONFIG_STATIC is not set" >> .config
 	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
@@ -120,7 +118,7 @@ do_configure () {
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake busybox_unstripped
-	cp busybox_unstripped busybox
+	cp busybox_unstripped ${BPN}
 }
 
 do_install () {
@@ -136,17 +134,21 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d
 
-	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/defconfig; then
+	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/${DEFCONFIG}; then
 		# Install /bin/busybox, and the /bin/sh link so the postinst script
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
-		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
-			install -m 4755 ${S}/busybox ${D}${base_bindir}
+		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/${DEFCONFIG}; then
+			install -m 4755 ${S}/${BPN} ${D}${base_bindir}
 		else
-			install -m 0755 ${S}/busybox ${D}${base_bindir}
+			install -m 0755 ${S}/${BPN} ${D}${base_bindir}
+		fi
+		if grep -q "${base_bindir}/sh" ${WORKDIR}/${DEFCONFIG}; then
+			ln -sf ${BPN} ${D}${base_bindir}/sh
 		fi
-		ln -sf busybox ${D}${base_bindir}/sh
 	else
+		# FEATURE_INDIVIDUAL=y means every tool is a separate binary, no links
+		# ... Is this code used/tested in any known configuration?
 		install -d ${D}${base_bindir} ${D}${base_sbindir}
 		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
 		cat busybox.links | while read FILE; do
@@ -166,40 +168,40 @@ do_install () {
 		fi
 	fi
 
-	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
+	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
 		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
 	fi
-	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_CROND=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HTTPD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HTTPD=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
-	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
                 install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 	fi
-	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_INETD=y" ${WORKDIR}/${DEFCONFIG}; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
-        if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
+        if grep "CONFIG_MDEV=y" ${WORKDIR}/${DEFCONFIG}; then
                install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
-               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
+               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/${DEFCONFIG}; then
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
                fi
 	fi
-	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
+	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}/${BPN}.links
 }
 
 inherit update-alternatives
@@ -214,7 +216,7 @@ ALTERNATIVE_TARGET[syslog-init] = "${sysconfdir}/init.d/syslog.${BPN}"
 ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
 ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
 
-ALTERNATIVE_TARGET = "/bin/busybox"
+ALTERNATIVE_TARGET = "/bin/${BPN}"
 
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
@@ -222,7 +224,7 @@ python do_package_prepend () {
 
     dvar = d.getVar('D', True)
     pn = d.getVar('PN', True)
-    f = open('%s/etc/busybox.links' % (dvar), 'r')
+    f = open(('%s/etc/' % (dvar)) + pn + '.links', 'r')
 
     for alt_link_name in f:
         alt_link_name = alt_link_name.strip()
@@ -241,28 +243,7 @@ pkg_postinst_${PN} () {
 	# so the update-alternatives script will get the utilities it needs
 	# (update-alternatives have no problem replacing links later anyway)
 	test -n 2> /dev/null || alias test='busybox test'
-	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; esac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
-}
-
-pkg_prerm_${PN} () {
-	# This is so you can make busybox commit suicide - removing busybox with no other packages
-	# providing its files, this will make update-alternatives work, but the update-rc.d part
-	# for syslog, httpd and/or udhcpd will fail if there is no other package providing sh
-	tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
-	ln -s /bin/busybox $tmpdir/[
-	ln -s /bin/busybox $tmpdir/test
-	ln -s /bin/busybox $tmpdir/head
-	ln -s /bin/busybox $tmpdir/sh
-	ln -s /bin/busybox $tmpdir/basename
-	ln -s /bin/busybox $tmpdir/echo
-	ln -s /bin/busybox $tmpdir/mv
-	ln -s /bin/busybox $tmpdir/ln
-	ln -s /bin/busybox $tmpdir/dirname
-	ln -s /bin/busybox $tmpdir/rm
-	ln -s /bin/busybox $tmpdir/sed
-	ln -s /bin/busybox $tmpdir/sort
-	ln -s /bin/busybox $tmpdir/grep
-	export PATH=$PATH:$tmpdir
+	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/${BPN}";; /bin/*) to="${BPN}";; /*/*) to="../bin/${BPN}";; esac; busybox ln -s $to $link; fi; done </etc/${BPN}.links; fi
 }
 
 pkg_prerm_${PN}-syslog () {
@@ -273,3 +254,26 @@ pkg_prerm_${PN}-syslog () {
 		fi
 	fi
 }
+
+pkg_prerm_${PN} () {
+       # This is so you can make busybox commit suicide - removing busybox with no other packages
+       # providing its files, this will make update-alternatives work, but the update-rc.d part
+       # for syslog, httpd and/or udhcpd will fail if there is no other package providing sh
+       if grep -q '/bin/sh' /etc/${BPN}.links; then
+	       tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
+	       ln -s /bin/busybox $tmpdir/[
+	       ln -s /bin/busybox $tmpdir/test
+	       ln -s /bin/busybox $tmpdir/head
+	       ln -s /bin/busybox $tmpdir/sh
+	       ln -s /bin/busybox $tmpdir/basename
+	       ln -s /bin/busybox $tmpdir/echo
+	       ln -s /bin/busybox $tmpdir/mv
+	       ln -s /bin/busybox $tmpdir/ln
+	       ln -s /bin/busybox $tmpdir/dirname
+	       ln -s /bin/busybox $tmpdir/rm
+	       ln -s /bin/busybox $tmpdir/sed
+	       ln -s /bin/busybox $tmpdir/sort
+	       ln -s /bin/busybox $tmpdir/grep
+	       export PATH=$PATH:$tmpdir
+       fi
+}
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 3814dcf..49bff36 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -32,3 +32,9 @@ SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
+
+DEFCONFIG = "defconfig"
+
+PACKAGES += "${PN}-syslog"
+
+RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
-- 
1.7.11.4



