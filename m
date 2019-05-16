Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93B5B7DE04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 02:43:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4G2h87L012730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 19:43:18 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 19:42:57 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 15 May 2019 22:41:40 -0400
Message-ID: <1557974500-224120-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mdadm: install the systemd service through Makefile
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
X-List-Received-Date: Thu, 16 May 2019 02:43:27 -0000
Content-Type: text/plain

The original mdadm service may include variable like BINDIR,
It should use the real value of it, since the install method
"install-systemd" in Makefile can easily do such work, so don't
install it in bb file manually, use "make install-systemd" to
install all the service of mdadm.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 4168ce4d0cb8..a4b9ef94799f 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -55,13 +55,15 @@ do_install() {
 do_install_append() {
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
-        install -m 644 ${S}/systemd/mdmon@.service ${D}/${systemd_unitdir}/system
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
 }
 
+do_install_append() {
+        oe_runmake install-systemd DESTDIR=${D}
+}
+
+
 do_compile_ptest() {
 	oe_runmake test
 }
@@ -88,3 +90,5 @@ RRECOMMENDS_${PN}-ptest += " \
     kernel-module-raid10 \
     kernel-module-raid456 \
 "
+
+FILES_${PN} += "/lib/systemd/*"
-- 
2.7.4


