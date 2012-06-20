Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1ShJVe-0001lA-0a
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:55:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5K7HHj1019108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 00:17:17 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 20 Jun 2012 00:17:17 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jun 2012 15:17:17 +0800
Message-ID: <1340176637-19586-1-git-send-email-xin.ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] xinetd: Add default options.
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
X-List-Received-Date: Wed, 20 Jun 2012 11:55:42 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

Currently, xinetd cannot start if no service enabled.

 # /etc/init.d/xinetd start
 # ps aux | grep xinetd
 # cat /var/log/syslog
 xinetd[862]: 862 {init_services} no services. Exiting...

So add -stayalive option by default, as most distos do. 

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd/xinetd.default |   12 ++++++++++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    3 +++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.default

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.default b/meta/recipes-extended/xinetd/xinetd/xinetd.default
new file mode 100644
index 0000000..20a38e3
--- /dev/null
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd.default
@@ -0,0 +1,12 @@
+# Default settings for xinetd. This file is sourced by /bin/sh from
+# /etc/init.d/xinetd
+
+# enable xinetd Inetd compat mode
+INETD_COMPAT=Yes
+
+# Options to pass to xinetd
+#
+# -stayalive comes by default : it can be removed if xinetd is expected
+# not to start when no service is configured
+#
+XINETD_OPTS="-stayalive"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 3d55e99..a142143 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -12,6 +12,7 @@ PR = "r0"
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
       file://xinetd.conf \
+      file://xinetd.default \
       file://Various-fixes-from-the-previous-maintainer.patch \
       file://Disable-services-from-inetd.conf-if-a-service-with-t.patch \
       file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
@@ -40,8 +41,10 @@ do_install() {
 	install -d "${D}/usr/sbin"
 	install -d "${D}/etc/init.d"
 	install -d "${D}/etc/xinetd.d"
+	install -d "${D}/etc/default"
 	install -m 644 "${WORKDIR}/xinetd.conf" "${D}/etc"
 	install -m 755 "${WORKDIR}/xinetd.init" "${D}/etc/init.d/xinetd"
+	install -m 644 "${WORKDIR}/xinetd.default" "${D}/etc/default/xinetd"
 	install -m 755 "${S}/xinetd/xinetd" "${D}/usr/sbin"
 	install -m 755 "${S}/xinetd/itox" "${D}/usr/sbin"
 }
-- 
1.7.9.5



