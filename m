Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUhh2-0007y3-Pw for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 18:02:48 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUhdm-00085W-94
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:59:26 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Thu, 09 Jun 2011 16:59:21 +0100
Message-ID: <1307635161.2529.4972.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] busybox: backport distro-features handling from oe master
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
X-List-Received-Date: Thu, 09 Jun 2011 16:02:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a backport from oe master of the code which adjusts the busybox
config according to DISTRO_FEATURES etc.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/busybox/busybox.inc       |   80 ++++++++++++++++++++++++++-
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 86fbdae..b697e88 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -35,8 +35,85 @@ RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
 inherit cml1 update-rc.d
 
+# internal helper
+def busybox_cfg(feature, features, tokens, cnf, rem):
+	if type(tokens) == type(""):
+		tokens = [tokens]
+	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
+	if type(features) == type([]) and feature in features:
+		cnf.extend([token + '=y' for token in tokens])
+	else:
+		cnf.extend(['# ' + token + ' is not set' for token in tokens])
+
+# Map distro and machine features to config settings
+def features_to_busybox_settings(d):
+	cnf, rem = ([], [])
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
+	machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
+	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf, rem)
+	busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
+	busybox_cfg('largefile', distro_features, 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
+	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
+	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
+	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	busybox_cfg('kernel24', machine_features, 'CONFIG_FEATURE_2_4_MODULES', cnf, rem)
+	return "\n".join(cnf), "\n".join(rem)
+
+# X, Y = ${@features_to_uclibc_settings(d)}
+# unfortunately doesn't seem to work with bitbake, workaround:
+def features_to_busybox_conf(d):
+	cnf, rem = features_to_busybox_settings(d)
+	return cnf
+def features_to_busybox_del(d):
+	cnf, rem = features_to_busybox_settings(d)
+	return rem
+
+configmangle = '/CROSS_COMPILER_PREFIX/d; \
+		/CONFIG_EXTRA_CFLAGS/d; \
+		'
+OE_FEATURES := "${@features_to_busybox_conf(d)}"
+OE_DEL      := "${@features_to_busybox_del(d)}"
+DO_IPv4 := ${@base_contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}
+DO_IPv6 := ${@base_contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}
+
+python () {
+  if "${OE_DEL}":
+    bb.data.setVar('configmangle_append', "${OE_DEL}" + "\n", d)
+  if "${OE_FEATURES}":
+    bb.data.setVar('configmangle_append',
+                   "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
+                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))),
+                   d)
+  bb.data.setVar('configmangle_append',
+                 "/^### CROSS$/a\\\n%s\n" %
+                  ("\\n".join(["CONFIG_CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
+			       "CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\""
+                        ])
+                  ),
+                 d)
+}
+
+do_prepare_config () {
+	sed -e 's#@DATADIR@#${datadir}#g' \
+		< ${WORKDIR}/defconfig > ${S}/.config
+	sed -i -e '/CONFIG_STATIC/d' .config
+	echo "# CONFIG_STATIC is not set" >> .config
+	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
+		${S}/.config
+	sed -i -e '${configmangle}' ${S}/.config
+	if test ${DO_IPv4} -eq 0 && test ${DO_IPv6} -eq 0; then
+	  # disable networking applets
+	  mv ${S}/.config ${S}/.config.oe-tmp
+	  awk 'BEGIN{net=0}
+	  /^# Networking Utilities/{net=1}
+	  /^#$/{if(net){net=net+1}}
+	  {if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
+		  ${S}/.config.oe-tmp > ${S}/.config
+	fi
+}
+
 do_configure () {
-	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+	do_prepare_config
 	cml1_do_configure
 }
 
@@ -184,4 +261,3 @@ pkg_prerm_${PN}-syslog () {
 	update-alternatives --remove syslog-init syslog.${PN}
 	update-alternatives --remove syslog-conf syslog.conf.${PN}
 }
-
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index a5080d5..a999490 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.2.5





