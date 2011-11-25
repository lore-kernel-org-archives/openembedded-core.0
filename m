Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTxTQ-0004uI-4G for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 16:13:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF7J88006206
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:07:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05714-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:07:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF79EY006200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:07:10 GMT
Message-ID: <1322233636.22654.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 15:07:16 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] ghostscript: Ensure we run reautoconf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Nov 2011 15:13:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Avoiding the autoreconf with a hardcoded do_configure is bad practise
since it can hide various errors. This patch ensures we do use the
standard do_configure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
index 86d5ef2..7178524 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
@@ -44,18 +44,22 @@ BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
 inherit autotools
 
-do_configure () {
-    mkdir -p obj
-    mkdir -p soobj
-    cp ${WORKDIR}/objarch.h obj/arch.h
-
-    oe_runconf
+do_configure_prepend () {
+	mkdir -p obj
+	mkdir -p soobj
+	if [ -e ${WORKDIR}/objarch.h ]; then
+		cp ${WORKDIR}/objarch.h obj/arch.h
+	fi
+}
 
-    # copy tools from the native ghostscript build
-    mkdir -p obj/aux soobj
-    for i in genarch genconf mkromfs echogs gendev genht; do
-        cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
-    done
+do_configure_append () {
+	# copy tools from the native ghostscript build
+	if [ "${PN}" != "ghostscript-native" ]; then
+		mkdir -p obj/aux soobj
+		for i in genarch genconf mkromfs echogs gendev genht; do
+			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
+		done
+	fi
 }
 
 do_install_append () {
@@ -72,10 +76,6 @@ python do_patch_virtclass-native () {
     pass
 }
 
-do_configure_virtclass-native () {
-    oe_runconf
-}
-
 do_compile_virtclass-native () {
     mkdir -p obj
     for i in genarch genconf mkromfs echogs gendev genht; do




