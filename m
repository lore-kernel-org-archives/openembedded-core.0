Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62D6F6D257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 05:59:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V5xGm7008771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 22:59:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 22:59:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:00:11 +0800
Message-ID: <67bc23cf500fe1ab119107f0d08b9370dfc14161.1383188560.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383188560.git.Qi.Chen@windriver.com>
References: <cover.1383188560.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] groff: fix pkg_postinst and remove unneeded do_install_prepend
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
X-List-Received-Date: Thu, 31 Oct 2013 05:59:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix to take $D into consideration in pkg_postinst so that the postinst
script could run at rootfs time.

The existence of ${D} is ensured by the in base.bbclass.
    do_install[dirs] = "${D} ${S} ${B}"
So there's no need for this do_install_prepend.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/groff/groff_1.18.1.4.bb |   12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index 9838698..28105f8 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -21,16 +21,10 @@ SRC_URI[md5sum] = "ceecb81533936d251ed015f40e5f7287"
 SRC_URI[sha256sum] = "ff3c7c3b6cae5e8cc5062a144de5eff0022e8e970e1774529cc2d5dde46ce50d"
 PARALLEL_MAKE = ""
 
-
 do_configure (){
     oe_runconf
 }
 
-do_install_prepend() {
-	install -m 0755 -d ${D}
-}
-
-
 do_install_append() {
 	mkdir -p ${D}${sysconfdir}/groff
 	cp -rf ${D}${datadir}/groff/site-tmac/* ${D}${sysconfdir}/groff/
@@ -38,8 +32,8 @@ do_install_append() {
 }
 
 pkg_postinst_${PN}() {
-	ln -s ${bindir}/tbl ${bindir}/gtbl
-	echo "export GROFF_FONT_PATH=/usr/share/groff/${PV}/font" >> ${sysconfdir}/profile
-	echo "export GROFF_TMAC_PATH=/usr/share/groff/${PV}/tmac" >> ${sysconfdir}/profile
+	ln -s tbl $D${bindir}/gtbl
+	echo "export GROFF_FONT_PATH=/usr/share/groff/${PV}/font" >> $D${sysconfdir}/profile
+	echo "export GROFF_TMAC_PATH=/usr/share/groff/${PV}/tmac" >> $D${sysconfdir}/profile
 }
 
-- 
1.7.9.5


