Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 91CF873695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 05:56:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96840428"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jun 2015 14:01:14 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5B5tQbA031100
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 13:55:26 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 11 Jun 2015 13:57:10 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 13:56:53 +0800
Message-ID: <1434002213-2119-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] iputils: enable rdisc and add systemd support.
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
X-List-Received-Date: Thu, 11 Jun 2015 05:57:03 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../iputils/files/enable-rdisc.patch               | 21 +++++++++++++++++++++
 meta/recipes-extended/iputils/files/rdisc.conf     |  1 +
 meta/recipes-extended/iputils/files/rdisc.service  | 11 +++++++++++
 meta/recipes-extended/iputils/iputils_s20121221.bb | 22 ++++++++++++++++++++--
 4 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/files/enable-rdisc.patch
 create mode 100644 meta/recipes-extended/iputils/files/rdisc.conf
 create mode 100644 meta/recipes-extended/iputils/files/rdisc.service

diff --git a/meta/recipes-extended/iputils/files/enable-rdisc.patch b/meta/recipes-extended/iputils/files/enable-rdisc.patch
new file mode 100644
index 0000000..7e0cb08
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/enable-rdisc.patch
@@ -0,0 +1,21 @@
+diff -Nurp iputils-s20121221.orig/Makefile iputils-s20121221/Makefile
+--- iputils-s20121221.orig/Makefile	2015-02-15 17:50:39.135219862 +0800
++++ iputils-s20121221/Makefile	2015-02-15 17:51:40.843221908 +0800
+@@ -44,7 +44,7 @@ USE_RESOLV=yes
+ ENABLE_PING6_RTHDR=no
+ 
+ # rdisc server (-r option) support [no|yes]
+-ENABLE_RDISC_SERVER=no
++ENABLE_RDISC_SERVER=yes
+ 
+ # -------------------------------------
+ # What a pity, all new gccs are buggy and -Werror does not work. Sigh.
+@@ -108,7 +108,7 @@ endif
+ # -------------------------------------
+ IPV4_TARGETS=tracepath ping clockdiff arping
+ IPV6_TARGETS=tracepath6 traceroute6 ping6
+-TARGETS=$(IPV4_TARGETS) $(IPV6_TARGETS)
++TARGETS=$(IPV4_TARGETS) $(IPV6_TARGETS) rdisc
+ 
+ CFLAGS=$(CCOPTOPT) $(CCOPT) $(GLIBCFIX) $(DEFINES)
+ LDLIBS=$(LDLIB) $(ADDLIB)
diff --git a/meta/recipes-extended/iputils/files/rdisc.conf b/meta/recipes-extended/iputils/files/rdisc.conf
new file mode 100644
index 0000000..2e6b02e
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/rdisc.conf
@@ -0,0 +1 @@
+RDISCOPTS=""
diff --git a/meta/recipes-extended/iputils/files/rdisc.service b/meta/recipes-extended/iputils/files/rdisc.service
new file mode 100644
index 0000000..b799b8a
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/rdisc.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=rdisc daemon which discovers routers on the local subnet
+After=syslog.target network.target
+
+[Service]
+Type=forking
+EnvironmentFile=@SYSCONFDIR@/default/rdisc
+ExecStart=@BASE_BINDIR@/rdisc $RDISCOPTS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index e87a32a..72afd45 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -19,6 +19,9 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/targets.diff \
            file://nsgmls-path-fix.patch \
            file://fix-build-command-line-argument-with-gnutls.patch \
+           file://enable-rdisc.patch \
+           file://rdisc.conf \
+           file://rdisc.service \
           "
 
 SRC_URI[md5sum] = "6072aef64205720dd1893b375e184171"
@@ -43,9 +46,18 @@ do_install () {
 	for i in tracepath.8 traceroute6.8 ping.8 arping.8; do
 	  install -m 0644 doc/$i ${D}${mandir}/man8/ || true
 	done
+        
+	install -m 4555 ${S}/clockdiff ${D}/${base_bindir}/
+	install -m 0755 ${S}/rdisc ${D}/${base_bindir}/
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/rdisc.service ${D}${systemd_unitdir}/system
+	sed -i -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/rdisc.service
+	sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/rdisc.service
+	install -d ${D}${sysconfdir}/default/
+	install -m 0644 ${WORKDIR}/rdisc.conf ${D}${sysconfdir}/default/rdisc
 }
 
-inherit update-alternatives
+inherit update-alternatives systemd
 
 ALTERNATIVE_PRIORITY = "100"
 
@@ -55,7 +67,7 @@ ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 ALTERNATIVE_${PN}-ping6 = "ping6"
 ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
 
-PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
+PACKAGES += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff ${PN}-rdisc"
 
 ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} += "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath ${PN}-tracepath6 ${PN}-traceroute6 ${PN}-clockdiff"
@@ -69,3 +81,9 @@ FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
 FILES_${PN}-doc	= "${mandir}/man8"
+
+FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
+FILES_${PN}-rdisc = "${base_bindir}/rdisc \
+                     ${sysconfdir}/default/rdisc \
+                     ${systemd_unitdir}/system/rdisc.service"
+
-- 
1.8.4.2


