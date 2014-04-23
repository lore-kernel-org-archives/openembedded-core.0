Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91BA365D98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:39:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3N9dqmk008696
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 02:39:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 02:39:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Apr 2014 17:40:52 +0800
Message-ID: <934c5d102f5824b3198de1116433b5e88d7d8e97.1398245851.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398245851.git.Qi.Chen@windriver.com>
References: <cover.1398245851.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] ppp: add systemd support
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
X-List-Received-Date: Wed, 23 Apr 2014 09:39:52 -0000
Content-Type: text/plain

Add systemd support for ppp.
The unit file mostly comes from ArchLinux.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/ppp/ppp/ppp@.service |    9 +++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.6.bb     |    9 +++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp@.service

diff --git a/meta/recipes-connectivity/ppp/ppp/ppp@.service b/meta/recipes-connectivity/ppp/ppp/ppp@.service
new file mode 100644
index 0000000..2bf0b5e
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/ppp@.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=PPP link to %I
+Before=network.target
+
+[Service]
+ExecStart=@SBINDIR@/pppd call %I nodetach nolog
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.6.bb b/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
index b98abec..8bc3672 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
@@ -28,12 +28,13 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
+           file://ppp@.service \
 "
 
 SRC_URI[md5sum] = "3434d2cc9327167a0723aaaa8670083b"
 SRC_URI[sha256sum] = "1b33181a03962c8a092c055fb9980e9722728a8d98a4bb7ec7acda17c1b1b49d"
 
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
 
 TARGET_CC_ARCH += " ${LDFLAGS}"
 EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
@@ -61,13 +62,17 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/pap ${D}${sysconfdir}/chatscripts
 	install -m 0755 ${WORKDIR}/ppp_on_boot ${D}${sysconfdir}/ppp/ppp_on_boot
 	install -m 0755 ${WORKDIR}/provider ${D}${sysconfdir}/ppp/peers/provider
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/ppp@.service
 	rm -rf ${D}/${mandir}/man8/man8
 	chmod u+s ${D}${sbindir}/pppd
 }
 
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
-FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd"
+FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
 FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
 FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
 FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
-- 
1.7.9.5


