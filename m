Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02200727E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 06:47:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3S6m1on004519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 23:48:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 23:48:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 14:48:00 +0800
Message-ID: <1cbf2ad83fa3a65693707b98922fc10187f0a16b.1430203645.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430203645.git.Qi.Chen@windriver.com>
References: <cover.1430203645.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pigz: set ALTERNATIVE for nativesdk package to empty
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
X-List-Received-Date: Tue, 28 Apr 2015 06:48:00 -0000
Content-Type: text/plain

Set ALTERNATIVE for nativesdk package to empty to avoid warnings like below.

     WARNING: pigz: NOT adding alternative provide xxx/bin/gunzip: xxx/bin/pigz does not exist

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/pigz/pigz.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index c271f70..6a6a553 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -15,6 +15,7 @@ DEPENDS = "zlib"
 
 inherit update-alternatives
 
+# do_install for target
 do_install_class-target() {
 	# Install files into /bin (FHS), which is typical place for gzip
 	install -d ${D}${base_bindir}
@@ -23,6 +24,7 @@ do_install_class-target() {
 	ln -nsf pigz ${D}${base_bindir}/pigzcat
 }
 
+# do_install for native and nativesdk package
 do_install() {
 	install -d ${D}${bindir}
 	install ${B}/pigz ${D}${bindir}/gzip
@@ -32,6 +34,7 @@ do_install() {
 
 ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN} = "gunzip gzip zcat"
+ALTERNATIVE_${PN}_class-nativesdk = ""
 ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
 ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
 ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
-- 
1.9.1


