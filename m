Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A849F758F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 06:13:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96907505"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2015 14:17:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5C6CBXl029464
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 14:12:11 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 12 Jun 2015 14:13:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jun 2015 14:13:40 +0800
Message-ID: <1434089620-1683-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] sysstat: add systemd service files
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
X-List-Received-Date: Fri, 12 Jun 2015 06:13:45 -0000
Content-Type: text/plain

Add sysstat.service to support systemd systems.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/sysstat/sysstat.inc             | 11 ++++++++++-
 meta/recipes-extended/sysstat/sysstat/sysstat.service | 12 ++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/sysstat.service

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 4063007..5c761fa 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -6,15 +6,20 @@ SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://99_sysstat \
+           file://sysstat.service \
           "
 
 DEPENDS += "base-passwd"
 
-inherit autotools-brokensep gettext
+inherit autotools-brokensep gettext systemd
 
 EXTRA_OECONF += "--disable-sensors"
 EXTRA_OEMAKE += 'LFLAGS=""'
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "sysstat.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
 do_configure_prepend() {
     export sa_lib_dir=${libdir}/sa
 }
@@ -27,6 +32,10 @@ do_install() {
 	rm -rf ${D}/var
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
+	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/sysstat/sysstat/sysstat.service b/meta/recipes-extended/sysstat/sysstat/sysstat.service
new file mode 100644
index 0000000..aff0710
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/sysstat.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Resets System Activity Logs
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+User=root
+ExecStart=@LIBDIR@/sa/sa1 --boot
+
+[Install]
+WantedBy=multi-user.target
+
-- 
1.8.4.2


