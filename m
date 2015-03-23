Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AA84C73BD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:42:00 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:34:17 +0100
Message-Id: <1427124857-6829-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pigz: fix alternatives handling, use symlinks, provide zcat
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
X-List-Received-Date: Mon, 23 Mar 2015 15:42:00 -0000

The installed unpigz is a hardlink to pigz.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-extended/pigz/pigz.inc | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index b5caa95..c271f70 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -13,20 +13,26 @@ PROVIDES_class-native += "gzip-native"
 
 DEPENDS = "zlib"
 
+inherit update-alternatives
+
 do_install_class-target() {
 	# Install files into /bin (FHS), which is typical place for gzip
 	install -d ${D}${base_bindir}
-	install ${B}/pigz ${D}${base_bindir}/gzip
-	install ${B}/unpigz ${D}${base_bindir}/gunzip
+	install ${B}/pigz ${D}${base_bindir}/pigz
+	ln -nsf pigz ${D}${base_bindir}/unpigz
+	ln -nsf pigz ${D}${base_bindir}/pigzcat
 }
 
 do_install() {
 	install -d ${D}${bindir}
 	install ${B}/pigz ${D}${bindir}/gzip
-	install ${B}/unpigz ${D}${bindir}/gunzip
+	ln -nsf gzip ${D}${bindir}/gunzip
+	ln -nsf gzip ${D}${bindir}/zcat
 }
 
-ALTERNATIVE_${PN} = "gzip gunzip"
-ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
-ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
 ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_${PN} = "gunzip gzip zcat"
+ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
+ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
+ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
+ALTERNATIVE_TARGET = "${base_bindir}/pigz"
-- 
1.9.1


