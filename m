Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5B86877059
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 04:20:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3219686"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Feb 2016 12:20:15 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 01C6A41896E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 12:19:26 +0800 (CST)
Received: from localhost.localdomain (10.167.226.72) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Feb 2016 12:20:13 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Feb 2016 07:19:57 +0300
Message-ID: <1454386797-1807-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.72]
X-yoursite-MailScanner-ID: 01C6A41896E9.A0EC9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] iptables: Add systemd support
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
X-List-Received-Date: Tue, 02 Feb 2016 04:20:23 -0000
Content-Type: text/plain

Add iptables.service & ip6tables.service to support systemd systems.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../iptables/iptables/ip6tables.service                 | 17 +++++++++++++++++
 .../recipes-extended/iptables/iptables/iptables.service | 17 +++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.4.21.bb       | 16 +++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.service
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.service

diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.service b/meta/recipes-extended/iptables/iptables/ip6tables.service
new file mode 100644
index 0000000..148a1b9
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=IPv6 firewall with ip6tables
+After=syslog.target
+ConditionPathExists=/etc/default/iptables
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/usr/libexec/iptables/ip6tables.init start
+ExecStop=/usr/libexec/iptables/ip6tables.init stop
+Environment=BOOTUP=serial
+Environment=CONSOLETYPE=serial
+StandardOutput=syslog
+StandardError=syslog
+
+[Install]
+WantedBy=basic.target
diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/meta/recipes-extended/iptables/iptables/iptables.service
new file mode 100644
index 0000000..9745c71
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=IPv4 firewall with iptables
+After=syslog.target
+ConditionPathExists=/etc/default/iptables
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/usr/libexec/iptables/iptables.init start
+ExecStop=/usr/libexec/iptables/iptables.init stop
+Environment=BOOTUP=serial
+Environment=CONSOLETYPE=serial
+StandardOutput=syslog
+StandardError=syslog
+
+[Install]
+WantedBy=basic.target
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index deea5e5..84c95ea 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -24,12 +24,14 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0001-fix-build-with-musl.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
+           file://iptables.service \
+           file://ip6tables.service \
           "
 
 SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
 SRC_URI[sha256sum] = "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
                "
@@ -46,3 +48,15 @@ do_configure_prepend() {
 	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
 	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/ip6tables.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_unitdir}/system/
+    sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
+               ${D}${systemd_unitdir}/system/iptables.service
+    sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
+               ${D}${systemd_unitdir}/system/ip6tables.service
+}
+
+SYSTEMD_SERVICE_${PN} = "iptables.service ip6tables.service"
-- 
1.8.4.2




