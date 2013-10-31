Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5FA56D44E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 05:59:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V5xH2t008774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 22:59:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 22:59:17 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:00:12 +0800
Message-ID: <6c896b3102f4d17cf8e7dce16bd9b75fc08918bf.1383188560.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383188560.git.Qi.Chen@windriver.com>
References: <cover.1383188560.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] sgml-common: make postinst run successfully at rootfs time
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
X-List-Received-Date: Thu, 31 Oct 2013 05:59:16 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Take $D into consideration and make postinst run successfully at
rootfs time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sgml-common/sgml-common_0.6.3.bb               |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
index 4355379..6098673 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
@@ -32,6 +32,7 @@ do_compile_append() {
 FILES_${PN} += "${datadir}/sgml"
 
 pkg_postinst_${PN}() {
+    if [ "x$D" = "x" ]; then
 	install-catalog \
 		--add ${sysconfdir}/sgml/sgml-ent.cat \
 		${datadir}/sgml/sgml-iso-entities-8879.1986/catalog
@@ -39,6 +40,21 @@ pkg_postinst_${PN}() {
 	install-catalog \
 		--add ${sysconfdir}/sgml/sgml-docbook.cat \
 		${sysconfdir}/sgml/sgml-ent.cat
+    else
+	if ! grep -q ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog $D${sysconfdir}/sgml/sgml-ent.cat; then
+	    echo "CATALOG ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog" >> $D${sysconfdir}/sgml/sgml-ent.cat
+	fi
+	if ! grep -q ${sysconfdir}/sgml/sgml-ent.cat $D${sysconfdir}/sgml/catalog; then
+	    echo "CATALOG ${sysconfdir}/sgml/sgml-ent.cat" >> $D${sysconfdir}/sgml/catalog
+	fi
+
+	if ! grep -q ${sysconfdir}/sgml/sgml-ent.cat $D${sysconfdir}/sgml/sgml-docbook.cat; then
+	    echo "CATALOG ${sysconfdir}/sgml/sgml-ent.cat" >> $D${sysconfdir}/sgml/sgml-docbook.cat
+	fi
+	if ! grep -q ${sysconfdir}/sgml/sgml-docbook.cat $D${sysconfdir}/sgml/catalog; then
+	    echo "CATALOG ${sysconfdir}/sgml/sgml-docbook.cat" >> $D${sysconfdir}/sgml/catalog
+	fi
+    fi
 }
 
 pkg_postrm_${PN}() {
-- 
1.7.9.5


