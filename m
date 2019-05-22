Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3A687E3B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 09:06:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4M95q41002714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 02:06:02 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 22 May 2019 02:05:41 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2019 05:04:24 -0400
Message-ID: <1558515865-69865-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] mdadm: guarded with systemd when install mdadm service
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
X-List-Received-Date: Wed, 22 May 2019 09:06:11 -0000
Content-Type: text/plain

install mdadm related service only when systemd was included
in DISTRO_FEATURES.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 597faf787a67..8ca42a89ddc5 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -59,13 +59,11 @@ do_install_append() {
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true', 'false', d)}; then
+               oe_runmake install-systemd DESTDIR=${D}
+        fi
 }
 
-do_install_append() {
-        oe_runmake install-systemd DESTDIR=${D}
-}
-
-
 do_compile_ptest() {
 	oe_runmake test
 }
@@ -93,4 +91,4 @@ RRECOMMENDS_${PN}-ptest += " \
     kernel-module-raid456 \
 "
 
-FILES_${PN} += "/lib/systemd/*"
+FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','/lib/systemd/*', '', d)}"
-- 
2.7.4


