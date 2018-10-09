Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id AC9C7796BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 07:39:34 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w997dZIe009671
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 09:39:35 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.93])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w997dZtg007790;
	Tue, 9 Oct 2018 09:39:35 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E2F029550DC;
	Tue,  9 Oct 2018 09:39:34 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 09:38:48 +0200
Message-Id: <20181009073848.8492-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181009073848.8492-1-andrej.valek@siemens.com>
References: <20181009073848.8492-1-andrej.valek@siemens.com>
In-Reply-To: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
References: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
Subject: [PATCH v2 3/3] busybox: unify recipe style
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
X-List-Received-Date: Tue, 09 Oct 2018 07:39:35 -0000

- change spaces to tabs and unify indent level

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/busybox/busybox.inc | 98 +++++++++++++++++------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 97b73c1dc0..10582a7534 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -117,13 +117,13 @@ do_prepare_config () {
 		${S}/.config
 	sed -i -e '${configmangle}' ${S}/.config
 	if test ${DO_IPv4} -eq 0 && test ${DO_IPv6} -eq 0; then
-	  # disable networking applets
-	  mv ${S}/.config ${S}/.config.oe-tmp
-	  awk 'BEGIN{net=0}
-	  /^# Networking Utilities/{net=1}
-	  /^#$/{if(net){net=net+1}}
-	  {if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
-		  ${S}/.config.oe-tmp > ${S}/.config
+		# disable networking applets
+		mv ${S}/.config ${S}/.config.oe-tmp
+		awk 'BEGIN{net=0}
+		/^# Networking Utilities/{net=1}
+		/^#$/{if(net){net=net+1}}
+		{if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
+		${S}/.config.oe-tmp > ${S}/.config
 	fi
 	sed -i 's/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"/' ${S}/.config
 	sed -i 's|${DEBUG_PREFIX_MAP}||g' ${S}/.config
@@ -151,7 +151,7 @@ do_compile() {
 		export KCONFIG_NOTIMESTAMP=1
 	fi
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
-	# split the .config into two parts, and make two busybox binaries
+		# split the .config into two parts, and make two busybox binaries
 		if [ -e .config.orig ]; then
 			# Need to guard again an interrupted do_compile - restore any backup
 			cp .config.orig .config
@@ -303,51 +303,51 @@ do_install () {
 		sed -i "s:/usr/sbin/:${sbindir}/:" ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
-        if grep -q "CONFIG_MDEV=y" ${B}/.config; then
-               install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
-               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
-                       install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
-                       install -d ${D}${sysconfdir}/mdev
-                       install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
-                       install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
-               fi
+	if grep -q "CONFIG_MDEV=y" ${B}/.config; then
+		install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
+		if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
+			install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
+			install -d ${D}${sysconfdir}/mdev
+			install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
+			install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
+		fi
+	fi
+	if grep -q "CONFIG_INIT=y" ${B}/.config; then
+		install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
+		install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
+			install -d ${D}${systemd_unitdir}/system
+			sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+			> ${D}${systemd_unitdir}/system/busybox-klogd.service
+		fi
+
+		if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
+			install -d ${D}${systemd_unitdir}/system
+			sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+			> ${D}${systemd_unitdir}/system/busybox-syslog.service
+			if  [ ! -e ${D}${systemd_unitdir}/system/busybox-klogd.service ] ; then
+				sed -i '/klog/d' ${D}${systemd_unitdir}/system/busybox-syslog.service
+			fi
+			if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
+				install -d ${D}${sysconfdir}/default
+				install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+			fi
+		fi
+	fi
+
+	# Remove the sysvinit specific configuration file for systemd systems to avoid confusion
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+		rm -f ${D}${sysconfdir}/syslog-startup.conf
 	fi
-        if grep -q "CONFIG_INIT=y" ${B}/.config; then
-                install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
-                install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
-        fi
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
-            install -d ${D}${systemd_unitdir}/system
-            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-            > ${D}${systemd_unitdir}/system/busybox-klogd.service
-        fi
-
-        if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
-            install -d ${D}${systemd_unitdir}/system
-            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-		> ${D}${systemd_unitdir}/system/busybox-syslog.service
-            if  [ ! -e ${D}${systemd_unitdir}/system/busybox-klogd.service ] ; then
-                sed -i '/klog/d' ${D}${systemd_unitdir}/system/busybox-syslog.service
-            fi
-            if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
-		install -d ${D}${sysconfdir}/default
-		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
-            fi
-        fi
-    fi
-
-    # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
-	rm -f ${D}${sysconfdir}/syslog-startup.conf
-    fi
 }
 
 do_install_ptest () {
-        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
-        cp ${B}/.config      ${D}${PTEST_PATH}/
-        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+	cp ${B}/.config      ${D}${PTEST_PATH}/
+	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
 }
 
 inherit update-alternatives
-- 
2.11.0


