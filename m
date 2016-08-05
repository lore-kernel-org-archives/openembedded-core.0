Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id B346D73243
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 11:40:42 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u75BGij4016103
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2016 13:16:44 +0200
Received: from dev.sbt.siemens.com ([163.242.50.167])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u75BGiWS005709;
	Fri, 5 Aug 2016 13:16:44 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 0610210A5B3;
	Fri,  5 Aug 2016 13:16:44 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 13:16:33 +0200
Message-Id: <1470395793-21638-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: fix add missing `make depend` command before `make` library
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
X-List-Received-Date: Fri, 05 Aug 2016 11:40:44 -0000

Settings from EXTRA_OECONF like en/disable no-ssl3, are transferred
only into DEPFLAGS. It means that settings have no effect on output files.
DEPFLAGS will be transferred into output files with make depend command.

https://wiki.openssl.org/index.php/Compilation_and_Installation#Dependencies

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 1a0031e..620673a 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -8,7 +8,7 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-DEPENDS = "hostperl-runtime-native"
+DEPENDS = "makedepend-native hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
@@ -149,6 +149,7 @@ do_compile_prepend_class-target () {
 }
 
 do_compile () {
+	oe_runmake depend
 	oe_runmake
 }
 
-- 
2.1.4


