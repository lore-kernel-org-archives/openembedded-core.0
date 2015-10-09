Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8A6760F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 02:44:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t992iiDn024518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 19:44:44 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 19:44:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 19:44:38 -0700
Message-ID: <b2de842f73e5dfd32e729f6bc9d14776696e534b.1444358567.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444358567.git.liezhi.yang@windriver.com>
References: <cover.1444358567.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] recipes-connectivity: cleanup CONFFILES
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
X-List-Received-Date: Fri, 09 Oct 2015 02:44:44 -0000
Content-Type: text/plain

The ${sysconfdir}/* are CONFFILES by default.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    2 --
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   11 -----------
 .../nfs-utils/nfs-utils_1.3.1.bb                   |    2 +-
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |    3 ---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    1 -
 .../wpa-supplicant/wpa-supplicant_2.4.bb           |    1 -
 6 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 825197d..966dfe0 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -113,8 +113,6 @@ RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
 
 RRECOMMENDS_avahi-dev[nodeprrecs] = "1"
 
-CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
-
 INITSCRIPT_PACKAGES = "avahi-daemon avahi-dnsconfd"
 INITSCRIPT_NAME_avahi-daemon = "avahi-daemon"
 INITSCRIPT_PARAMS_avahi-daemon = "defaults 21 19"
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index 1e1e726..ee63b28 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -90,14 +90,3 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
 }
 
-CONFFILES_${PN} = " \
-	${sysconfdir}/bind/named.conf \
-	${sysconfdir}/bind/named.conf.local \
-	${sysconfdir}/bind/named.conf.options \
-	${sysconfdir}/bind/db.0 \
-	${sysconfdir}/bind/db.127 \
-	${sysconfdir}/bind/db.empty \
-	${sysconfdir}/bind/db.local \
-	${sysconfdir}/bind/db.root \
-	"
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index 42101de..da44500 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -75,7 +75,7 @@ CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
 			   ${localstatedir}/lib/nfs/xtab \
 			   ${localstatedir}/lib/nfs/statd/state \
-			   ${sysconfdir}/nfsmount.conf"
+			   "
 
 FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
index eeeb4b4..1678d74 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
@@ -145,9 +145,6 @@ RCONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
-CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
-CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN}-scp = "scp"
 ALTERNATIVE_${PN}-ssh = "ssh"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index adc38e1..7fc2d00 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -75,7 +75,6 @@ do_install_append () {
 	chmod u+s ${D}${sbindir}/pppd
 }
 
-CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
 FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index a124cf2..005ec6e 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -42,7 +42,6 @@ PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
 FILES_${PN} += "${datadir}/dbus-1/system-services/*"
-CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
-- 
1.7.9.5


