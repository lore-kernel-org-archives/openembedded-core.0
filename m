Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOrTV-0005H3-Kz for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 15:16:41 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOrQc-0002MA-Dn
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 15:13:42 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 14:13:41 +0100
Message-ID: <1306242821.2525.175.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] busybox: sync do_install() with oe master (mostly)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2011 13:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is basically a backport of the current state of the art from the
openembedded master repo.  In particular this fixes an installation
error on micro:

| + cp -dPr /home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image/bin /home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image/sbin /home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image /home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image/busybox/
| cp: will not create hard link `/home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image/busybox/image/bin' to directory `/home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image/busybox/bin'
| cp: cannot copy a directory, `/home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image', into itself, `/home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/image/busybox/image'
| ERROR: Function 'do_install' failed (see /home/pb/oe/build-meta/tmp-eglibc/work/i586-oe-linux/busybox-1.18.4-r1.2/temp/log.do_install.3808 for further information)

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/busybox/busybox.inc |  100 ++++++++++++++++++---------------
 1 files changed, 54 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 341c5c4..dd763fd 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -46,75 +46,83 @@ do_compile() {
 }
 
 do_install () {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	oe_runmake busybox.links
+	if [ "${prefix}" != "/usr" ]; then
+		sed "s:^/usr/:${prefix}/:" busybox.links > busybox.links.new
+		mv busybox.links.new busybox.links
+	fi
+	if [ "${base_sbindir}" != "/sbin" ]; then
+		sed "s:^/sbin/:${base_sbindir}/:" busybox.links > busybox.links.new
+		mv busybox.links.new busybox.links
+	fi
+
 	install -d ${D}${sysconfdir}/init.d
-	oe_runmake "PREFIX=${D}" install
-	cp -pPR ${S}/_install/* ${D}/
-
-	# Move everything to /busybox (not supposed to end up in any package)
-	install -d ${D}/busybox
-	ls ${D} -R
-
-	cp -dPr ${D}${base_bindir} ${D}${base_sbindir} ${D}${prefix} ${D}/busybox/
-	# Move the busybox binary back to /bin
-	install -d ${D}${base_bindir}
-	mv ${D}/busybox${base_bindir}/busybox ${D}${base_bindir}/
-	# Move back the sh symlink
-	test -h ${D}/busybox${base_bindir}/sh && mv ${D}/busybox${base_bindir}/sh ${D}${base_bindir}/
-
-	install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
-	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${PN}
-	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
-		# Move crond back to /usr/sbin/crond
-		install -d ${D}${sbindir}
-		mv ${D}/busybox${sbindir}/crond ${D}${sbindir}/
 
+	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/defconfig; then
+		# Install /bin/busybox, and the /bin/sh link so the postinst script
+		# can run. Let update-alternatives handle the rest.
+		install -d ${D}${base_bindir}
+		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
+			install -m 4755 ${S}/busybox ${D}${base_bindir}
+		else
+			install -m 0755 ${S}/busybox ${D}${base_bindir}
+		fi
+		ln -sf busybox ${D}${base_bindir}/sh
+	else
+		install -d ${D}${base_bindir} ${D}${base_sbindir}
+		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
+		cat busybox.links | while read FILE; do
+			NAME=`basename "$FILE"`
+			install -m 0755 "0_lib/$NAME" "${D}$FILE.${PN}"
+		done
+		# add suid bit where needed
+		for i in `grep -E "APPLET.*_BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f 1 -d ','`; do
+			find ${D} -name $i.${PN} -exec chmod a+s {} \;
+		done
+		install -m 0755 0_lib/libbusybox.so.${PV} ${D}${libdir}/libbusybox.so.${PV}
+		ln -sf sh.${PN} ${D}${base_bindir}/sh
+		ln -sf ln.${PN} ${D}${base_bindir}/ln
+		ln -sf test.${PN} ${D}${bindir}/test
+		if [ -f ${D}/linuxrc.${PN} ]; then
+			mv ${D}/linuxrc.${PN} ${D}/linuxrc
+		fi
+	fi
+
+	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
+		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
+		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${PN}
+	fi
+	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_HTTPD=y" ${WORKDIR}/defconfig; then
-		# Move httpd back to /usr/sbin/httpd
-		install -d ${D}${sbindir}
-		mv ${D}/busybox${sbindir}/httpd ${D}${sbindir}/
-
 		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
 	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
-		# Move udhcpd back to /usr/sbin/udhcpd
-		install -d ${D}${sbindir}
-		mv ${D}/busybox${sbindir}/udhcpd ${D}${sbindir}/
-
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
-		# Move hwclock back to /sbin/hwclock
-		install -d ${D}${base_sbindir}
-		mv ${D}/busybox${base_sbindir}/hwclock ${D}${base_sbindir}/
-
+		install -d ${D}${sysconfdir}/default
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
-		# Move dhcpc back to /usr/sbin/udhcpc
-		install -d ${D}${base_sbindir}
-		mv ${D}/busybox${base_sbindir}/udhcpc ${D}${base_sbindir}/
-
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
-		install -m 0755 ${S}/examples/udhcp/simple.script ${D}${sysconfdir}/udhcpc.d/50default
+                install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
-		install -m 0755 ${WORKDIR}/busybox-udhcpc ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
-		install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
-		if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
-			install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
-		fi
+	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
+		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${PN}
+		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
+	fi
+        if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
+               install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
+               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
+                       install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
+               fi
 	fi
-
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
-
-	# remove the temp dir to suppress warning, we are done with it
-	rm -rf ${D}/busybox
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.1





