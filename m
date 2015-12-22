Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 247F57317D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 01:17:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM1HlUr020442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 17:17:47 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 17:17:46 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Dec 2015 09:04:53 +0800
Message-ID: <c6a805868ee998d3c727573ac74f3e080ecf2eda.1450746244.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1450746244.git.kai.kang@windriver.com>
References: <cover.1450746244.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] guile: remove redundant replacement of .pc file
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
X-List-Received-Date: Tue, 22 Dec 2015 01:17:47 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove redundant replacement of pkgconfig file and only modify the .pc
file which is installed in ${D}.

Replace /usr/bin with ${bindir} at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index 98b465b..fa45008 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -57,19 +57,6 @@ do_configure_prepend() {
 
 export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
 
-do_compile_append() {
-	# just for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-		sed -i -e s:${STAGING_DIR_TARGET}::g \
-	               -e s:/${TARGET_SYS}::g \
-	               -e s:-L/usr/lib::g \
-        	       -e s:-isystem/usr/include::g \
-	               -e s:,/usr/lib:,\$\{libdir\}:g \
-	                  meta/guile-2.0.pc
-	fi
-}
-
 do_install_append_class-native() {
 	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
 
@@ -83,8 +70,10 @@ do_install_append_class-native() {
 
 do_install_append_class-target() {
 	# cleanup buildpaths in scripts
-	sed -i -e 's:${STAGING_DIR_NATIVE}::' ${D}/usr/bin/guile-config
-	sed -i -e 's:${STAGING_DIR_HOST}::' ${D}/usr/bin/guile-snarf
+	sed -i -e 's:${STAGING_DIR_NATIVE}::' ${D}${bindir}/guile-config
+	sed -i -e 's:${STAGING_DIR_HOST}::' ${D}${bindir}/guile-snarf
+
+	sed -i -e 's:${STAGING_DIR_TARGET}::g' ${D}${libdir}/pkgconfig/guile-2.0.pc
 }
 
 SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
-- 
2.6.1


