Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91F197DA84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 16:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EFEAF1832D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:51 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KOsbAY517OUl
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 85384186F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 351A51A06D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29C471A065
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1E0CD390
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x3CGEnv5023402
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:14:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x3CGEnW3023401
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2019 18:14:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 18:14:47 +0200
Message-Id: <20190412161447.23361-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [master][warrior][PATCH] systemd: Use PACKAGECONFIG definition to depend on libnss-myhostname
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
X-List-Received-Date: Fri, 12 Apr 2019 16:14:52 -0000

Rather than adding the dependency on libnss-myhostname to
RDEPENDS_${PN} if the myhostname PACKAGECONFIG is set, add the runtime
dependency to myhostname's PACKAGECONFIG definition.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This is just a clean up of the last commit to systemd.

meta/recipes-core/systemd/systemd_241.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 3a58f44a3b..562cdc3316 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -144,7 +144,7 @@ PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
 PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
-PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false"
+PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
@@ -547,7 +547,6 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
-RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'libnss-myhostname', '', d)}"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-- 
2.12.0


