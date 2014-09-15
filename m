Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBA6B60144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 06:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8F6BrwE018874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 23:11:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 14 Sep 2014 23:11:53 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Sep 2014 14:05:31 +0800
Message-ID: <1410761131-18885-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] irda: add systemd service file
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
X-List-Received-Date: Mon, 15 Sep 2014 06:12:03 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Add irda.service file to support systemd systems

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../irda-utils/irda-utils-0.9.18/irda.service               | 12 ++++++++++++
 meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb   | 13 +++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/irda.service

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/irda.service b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/irda.service
new file mode 100644
index 0000000..889391f
--- /dev/null
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/irda.service
@@ -0,0 +1,12 @@
+[Unit]
+Description= irda
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/irda.pid
+EnvironmentFile=-/etc/sysconfig/irda
+ExecStart=@SBINDIR@/irattach /dev/ttyS1
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index 7403dc9..10b19d2 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -12,18 +12,22 @@ LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
                     file://irdadump/irdadump.c;beginline=1;endline=24;md5=d78b9dce3cd78c2220250c9c7a2be178"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
-          file://init"
+          file://init \
+          file://irda.service \
+"
 
 SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
 SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
 
 export SYS_INCLUDES="-I${STAGING_INCDIR}"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d systemd
 
 INITSCRIPT_NAME = "irattach"
 INITSCRIPT_PARAMS = "defaults 20"
 
+SYSTEMD_SERVICE_${PN} = "irda.service"
+
 do_compile () {
     oe_runmake -e -C irattach
     oe_runmake -e -C irdaping
@@ -36,4 +40,9 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/irda.service ${D}${systemd_unitdir}/system
+	sed -i  -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/irda.service
 }
-- 
1.9.1


