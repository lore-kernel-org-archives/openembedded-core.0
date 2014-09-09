Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0D276B8F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 05:38:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s895cYFL014547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 22:38:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 22:38:33 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 13:32:36 +0800
Message-ID: <3ce7cbed40ec5f20f202d0b37d9dcf8b9ac6d6f6.1410240620.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410240620.git.Chong.Lu@windriver.com>
References: <cover.1410240620.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xinetd: add systemd unit file
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
X-List-Received-Date: Tue, 09 Sep 2014 05:38:39 -0000
Content-Type: text/plain

Add systemd unit file for xinetd.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd/xinetd.service | 13 +++++++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      | 12 +++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.service b/meta/recipes-extended/xinetd/xinetd/xinetd.service
new file mode 100644
index 0000000..d5fdc5b
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
+EnvironmentFile=-/etc/sysconfig/xinetd
+ExecStart=@SBINDIR@/xinetd -stayalive -pidfile /var/run/xinetd.pid "$EXTRAOPTIONS"
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 1928949..288186e 100644
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
@@ -52,6 +55,13 @@ do_install() {
 	install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
 	install -m 755 "${B}/xinetd/xinetd" "${D}${sbindir}"
 	install -m 755 "${B}/xinetd/itox" "${D}${sbindir}"
+
+	# Install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/xinetd.service
 }
 
 CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
1.9.1


