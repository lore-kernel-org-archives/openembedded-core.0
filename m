Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7191C718FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 05:41:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9H5f1Rv010232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 22:41:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 22:41:01 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Oct 2014 13:38:41 +0800
Message-ID: <004a19f1b0a77546117476eb849e77c2b158b485.1413524194.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413524194.git.Chong.Lu@windriver.com>
References: <cover.1413524194.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] xinetd: add systemd unit file
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
X-List-Received-Date: Fri, 17 Oct 2014 05:41:01 -0000
Content-Type: text/plain

Add systemd unit file for xinetd.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd/xinetd.service | 13 +++++++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      | 18 +++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.service b/meta/recipes-extended/xinetd/xinetd/xinetd.service
new file mode 100644
index 0000000..2e71d23
--- /dev/null
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Xinetd A Powerful Replacement For Inetd
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/xinetd.pid
+EnvironmentFile=-@SYSCONFDIR@/default/xinetd
+ExecStart=@SBINDIR@/xinetd $XINETD_OPTS -pidfile /var/run/xinetd.pid
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 1928949..4e242ba 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -17,12 +17,15 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://Disable-services-from-inetd.conf-if-a-service-with-t.patch \
       file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
       file://xinetd-CVE-2013-4342.patch \
+      file://xinetd.service \
       "
 
 SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
 SRC_URI[sha256sum] = "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "xinetd.service"
 
 INITSCRIPT_NAME = "xinetd"
 INITSCRIPT_PARAMS = "defaults"
@@ -52,6 +55,19 @@ do_install() {
 	install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
 	install -m 755 "${B}/xinetd/xinetd" "${D}${sbindir}"
 	install -m 755 "${B}/xinetd/itox" "${D}${sbindir}"
+
+	# Remove sysinit script if sysvinit is not in DISTRO_FEATURES
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+	    rm -rf ${D}${sysconfdir}/init.d/
+	fi
+
+	# Install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+	       ${D}${systemd_unitdir}/system/xinetd.service
 }
 
 CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
1.9.1


