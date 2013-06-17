Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB4A361FB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:49:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5H5ncPO026220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:49:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 16 Jun 2013 22:49:38 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 13:49:31 +0800
Message-ID: <2f1d7dd000abd338f6e2380017fee2f0314ce7f7.1371447869.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371447869.git.Qi.Chen@windriver.com>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 5/9] busybox: add the ability to split the busybox binary
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
X-List-Received-Date: Mon, 17 Jun 2013 05:49:37 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch enables us to split the busybox into two binaries, one
containing suid applications, and the other containing nosuid apps.

Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the
busybox binary into two parts. We default it to "1" to enable the
splitting, but users could still override it to disable the splitting.
After all, busybox has no internal support for this suid apps splitting,
so there might be users out there who want just one busybox binary.

The basic idea here is to build the busybox twice, each with the correct
configuration items. We extract the non-app part of the original .config
file, and merge this part with the suid-app part to form a .config which
contains only suid apps. The same strategy applies to the non-suid apps.

[YOCTO #4207]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   96 +++++++++++++++++++++++----------
 1 file changed, 68 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 99d4e99..65e1642 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 
 SECTION = "base"
 
+# Whether to split the suid apps into a seperate binary
+BUSYBOX_SPLIT_SUID ?= "1"
+
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
@@ -136,19 +139,43 @@ do_configure () {
 
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake busybox_unstripped
-	cp busybox_unstripped busybox
+	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
+	# split the .config into two parts, and make two busybox binaries
+		cp .config .config.orig
+		oe_runmake busybox.cfg.suid
+		oe_runmake busybox.cfg.nosuid
+		for i in `cat busybox.cfg.suid busybox.cfg.nosuid`; do
+			echo "# $i is not set" >> .config.disable.apps
+		done
+		merge_config.sh -m .config.orig .config.disable.apps
+		cp .config .config.nonapps
+		for s in suid nosuid; do
+			cat busybox.cfg.$s | while read item; do
+				grep -w "$item" .config.orig
+			done > .config.app.$s
+			merge_config.sh -m .config.nonapps .config.app.$s
+			oe_runmake busybox_unstripped
+			mv busybox_unstripped busybox.$s
+			oe_runmake busybox.links
+			mv busybox.links busybox.links.$s
+		done
+		# copy .config.orig back to .config, because the install process may check this file
+		cp .config.orig .config
+		# cleanup
+		rm .config.orig .config.app.suid .config.app.nosuid .config.disable.apps .config.nonapps
+	else
+		oe_runmake busybox_unstripped
+		cp busybox_unstripped busybox
+		oe_runmake busybox.links
+	fi
 }
 
 do_install () {
-	oe_runmake busybox.links
 	if [ "${prefix}" != "/usr" ]; then
-		sed "s:^/usr/:${prefix}/:" busybox.links > busybox.links.new
-		mv busybox.links.new busybox.links
+		sed -i "s:^/usr/:${prefix}/:" busybox.links*
 	fi
 	if [ "${base_sbindir}" != "/sbin" ]; then
-		sed "s:^/sbin/:${base_sbindir}/:" busybox.links > busybox.links.new
-		mv busybox.links.new busybox.links
+		sed -i "s:^/sbin/:${base_sbindir}/:" busybox.links*
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
@@ -157,12 +184,21 @@ do_install () {
 		# Install /bin/busybox, and the /bin/sh link so the postinst script
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
-		if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
-			install -m 4755 ${B}/busybox ${D}${base_bindir}
+		if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
+			install -m 4755 ${B}/busybox.suid ${D}${base_bindir}
+			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
+			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
+			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
+			ln -sf busybox.nosuid ${D}${base_bindir}/sh
 		else
-			install -m 0755 ${B}/busybox ${D}${base_bindir}
+			if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
+				install -m 4755 ${B}/busybox ${D}${base_bindir}
+			else
+				install -m 0755 ${B}/busybox ${D}${base_bindir}
+			fi
+			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
+			ln -sf busybox ${D}${base_bindir}/sh
 		fi
-		ln -sf busybox ${D}${base_bindir}/sh
 	else
 		install -d ${D}${base_bindir} ${D}${base_sbindir}
 		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
@@ -181,6 +217,7 @@ do_install () {
 		if [ -f ${D}/linuxrc.${BPN} ]; then
 			mv ${D}/linuxrc.${BPN} ${D}/linuxrc
 		fi
+		install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 	fi
 
 	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
@@ -217,7 +254,6 @@ do_install () {
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
                fi
 	fi
-	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 
     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
@@ -248,22 +284,26 @@ python do_package_prepend () {
 
     dvar = d.getVar('D', True)
     pn = d.getVar('PN', True)
-    f = open('%s/etc/busybox.links' % (dvar), 'r')
-
-    if os.path.exists('%s/bin/busybox' % (dvar)):
-        d.setVar('ALTERNATIVE_TARGET', "/bin/busybox")
-
-    for alt_link_name in f:
-        alt_link_name = alt_link_name.strip()
-        alt_name = os.path.basename(alt_link_name)
-
-        # Match coreutils
-        if alt_name == '[':
-            alt_name = 'lbracket'
-
-        d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
-    f.close()
+    def set_alternative_vars(links, target):
+        f = open('%s%s' % (dvar, links), 'r')
+        for alt_link_name in f:
+            alt_link_name = alt_link_name.strip()
+            alt_name = os.path.basename(alt_link_name)
+            # Match coreutils
+            if alt_name == '[':
+                alt_name = 'lbracket'
+            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+            d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
+            if os.path.exists('%s%s' % (dvar, target)):
+                d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
+        f.close()
+        return
+
+    if os.path.exists('%s/etc/busybox.links' % (dvar)):
+        set_alternative_vars("/etc/busybox.links", "/bin/busybox")
+    else:
+        set_alternative_vars("/etc/busybox.links.nosuid", "/bin/busybox.nosuid")
+        set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
 }
 
 pkg_prerm_${PN} () {
-- 
1.7.9.5


