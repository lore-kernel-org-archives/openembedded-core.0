Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 28ABB7306D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 14:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id EF9F5260F5F
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 15:31:39 +0100
Message-Id: <20170309143139.2785-2-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170309143139.2785-1-andrew.shadura@collabora.co.uk>
References: <20170309143139.2785-1-andrew.shadura@collabora.co.uk>
Subject: [PATCH v3 2/2] ghostscript: build and install libgs
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
X-List-Received-Date: Thu, 09 Mar 2017 14:31:50 -0000

From: Joshua Lock <joshua.lock@collabora.co.uk>

Build and install libgs library, which is a build dependency
of a few other libraries, such as libspectre.

We don't want to ship the executable binaries, only the library and its
headers, hence oe_runmake install-so + rm -rf, not e.g. oe_libinstall.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/recipes-extended/ghostscript/ghostscript_9.20.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index 210e9a7..3c95ed9 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -70,15 +70,17 @@ do_configure_prepend () {
 	mkdir -p soobj
 	if [ -e ${WORKDIR}/objarch.h ]; then
 		cp ${WORKDIR}/objarch.h obj/arch.h
+		cp ${WORKDIR}/objarch.h soobj/arch.h
 	fi
 }
 
 do_configure_append () {
 	# copy tools from the native ghostscript build
 	if [ "${PN}" != "ghostscript-native" ]; then
-		mkdir -p obj/aux soobj
+		mkdir -p obj/aux soobj/aux
 		for i in genarch genconf mkromfs echogs gendev genht; do
 			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
+			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i soobj/aux/$i
 		done
 	fi
 }
@@ -96,6 +98,10 @@ do_compile_class-native () {
     done
 }
 
+do_compile_class-target_append () {
+    oe_runmake so
+}
+
 do_install_class-native () {
     install -d ${D}${bindir}/ghostscript-${PV}
     for i in genarch genconf mkromfs echogs gendev genht; do
@@ -103,4 +109,13 @@ do_install_class-native () {
     done
 }
 
+do_install_class-target_append () {
+    oe_runmake install-so DESTDIR=${D}
+    rm -rf ${D}${bindir}
+}
+
+PACKAGES =+ "${PN}-lib"
+
+FILES_${PN}-lib = "${libdir}/lib*.so.*"
+
 BBCLASSEXTEND = "native"
-- 
1.8.3.1


