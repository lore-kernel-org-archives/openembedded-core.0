Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 718187DF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 08:55:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4L8tr7h010195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 May 2019 01:55:53 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 01:55:52 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>
Date: Tue, 21 May 2019 04:54:36 -0400
Message-ID: <1558428876-169757-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] mdadm: install the systemd service through Makefile
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
X-List-Received-Date: Tue, 21 May 2019 08:55:53 -0000
Content-Type: text/plain

The original mdadm service may include variable like BINDIR,
It should use the real value of it, since the install method
"install-systemd" in Makefile can easily do such work, so don't
install it in bb file manually, use "make install-systemd" to
install all the service of mdadm.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index ef5ddf55db39..8ca42a89ddc5 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -57,11 +57,11 @@ do_install() {
 do_install_append() {
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
-        install -m 644 ${S}/systemd/mdmon@.service ${D}/${systemd_unitdir}/system
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true', 'false', d)}; then
+               oe_runmake install-systemd DESTDIR=${D}
+        fi
 }
 
 do_compile_ptest() {
@@ -90,3 +90,5 @@ RRECOMMENDS_${PN}-ptest += " \
     kernel-module-raid10 \
     kernel-module-raid456 \
 "
+
+FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','/lib/systemd/*', '', d)}"
-- 
2.7.4


