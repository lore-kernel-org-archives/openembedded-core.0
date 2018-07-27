Return-Path: <daniel.gomez@silicon-gears.com>
X-Greylist: delayed 554 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jul 2018 13:17:12 UTC
Received: from relay.cloudcontrol.es (relay.cloudcontrol.es [93.90.30.95])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFAB71AB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:17:12 +0000 (UTC)
Received: from Twenty.silicon-gears.com (mx1.silicon-gears.com [81.47.169.96])
	by relay.cloudcontrol.es (Postfix) with ESMTP id 92CF7D9120
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:07:53 +0200 (CEST)
Received: from [10.200.199.3] (10.200.199.3) by Twenty.silicon-gears.com
	(10.20.0.101) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Fri, 27 Jul 2018 15:07:53 +0200
Message-ID: <1532696872.1070.2.camel@silicon-gears.com>
From: Daniel Gomez <daniel.gomez@silicon-gears.com>
Reply-To: <daniel.gomez@silicon-gears.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 15:07:52 +0200
Organization: Silicon Gears
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
X-Originating-IP: [10.200.199.3]
X-ClientProxiedBy: Phantom.silicon-gears.com (10.20.0.102) To
	Twenty.silicon-gears.com (10.20.0.101)
X-ProcessControl-SpamMailControl-Information: Por favor,
	contacte con el administrador
X-ProcessControl-SpamMailControl-ID: 92CF7D9120.A6ED7
X-ProcessControl-SpamMailControl: Not scanned: please contact your Internet
	E-Mail Service Provider for details
X-ProcessControl-SpamMailControl-From: daniel.gomez@silicon-gears.com
X-Spam-Status: No
Subject: [morty][PATCH] Check libcc1 directory before disabling hardcoding of RPATHs
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
X-List-Received-Date: Fri, 27 Jul 2018 13:17:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Check if libcc1 directory exits before disabling hardcode_into_libs
configuration because of broken libtool in gcc recipes.

Signed-off-by: Daniel Gomez <daniel.gomez@silicon-gears.com>
---
 meta/recipes-devtools/gcc/gcc_5.4.bb | 3 ++-
 meta/recipes-devtools/gcc/gcc_6.4.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc_5.4.bb b/meta/recipes-devtools/gcc/gcc_5.4.bb
index b0a523c..9da8ece 100644
--- a/meta/recipes-devtools/gcc/gcc_5.4.bb
+++ b/meta/recipes-devtools/gcc/gcc_5.4.bb
@@ -9,7 +9,8 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 do_configure_prepend() {
 	# Easiest way to stop bad RPATHs getting into the library since we have a
 	# broken libtool here
-	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
+	if [ -d "${S}/libcc1" ]; then
+		sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
 }
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/gcc_6.4.bb b/meta/recipes-devtools/gcc/gcc_6.4.bb
index b0a523c..9da8ece 100644
--- a/meta/recipes-devtools/gcc/gcc_6.4.bb
+++ b/meta/recipes-devtools/gcc/gcc_6.4.bb
@@ -9,7 +9,8 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 do_configure_prepend() {
 	# Easiest way to stop bad RPATHs getting into the library since we have a
 	# broken libtool here
-	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
+	if [ -d "${S}/libcc1" ]; then
+		sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


