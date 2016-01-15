Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F00273176
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:29:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F2TENj028419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:29:15 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:29:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:29:07 -0800
Message-ID: <cdfdcdf72f35bf0f0cd55b405e4ee4b462d0f29c.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452824908.git.liezhi.yang@windriver.com>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Fri, 15 Jan 2016 02:29:14 -0000
Content-Type: text/plain

The ${sysconfdir}/* are CONFFILES by default.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    2 --
 meta/recipes-connectivity/bind/bind_9.10.3-P2.bb   |   11 -----------
 .../nfs-utils/nfs-utils_1.3.3.bb                   |    2 +-
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |    3 ---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    1 -
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |    1 -
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
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
index 875a0c8..06165b1 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
@@ -93,14 +93,3 @@ do_install_append() {
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
index 2e0c8b1..30f068d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
@@ -75,7 +75,7 @@ CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
 			   ${localstatedir}/lib/nfs/xtab \
 			   ${localstatedir}/lib/nfs/statd/state \
-			   ${sysconfdir}/nfsmount.conf"
+			   "
 
 FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
index d81127c..cf0bd71 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
@@ -149,9 +149,6 @@ RCONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
-CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
-CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN}-scp = "scp"
 ALTERNATIVE_${PN}-ssh = "ssh"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 5f06034..0a1063e 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -75,7 +75,6 @@ do_install_append () {
 	chmod u+s ${D}${sbindir}/pppd
 }
 
-CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
 FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index 2126377..111429a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -34,7 +34,6 @@ PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
 FILES_${PN} += "${datadir}/dbus-1/system-services/*"
-CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
-- 
1.7.9.5


