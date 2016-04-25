Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from ducie-dc1.codethink.co.uk (ducie-dc1.codethink.co.uk
	[185.25.241.215])
	by mail.openembedded.org (Postfix) with ESMTP id 66F2862137
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTP id 81AF7462582;
	Mon, 25 Apr 2016 21:36:47 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at ducie-dc1.codethink.co.uk
Received: from ducie-dc1.codethink.co.uk ([127.0.0.1])
	by localhost (ducie-dc1.codethink.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6hEXMjUsT6q8; Mon, 25 Apr 2016 21:36:45 +0100 (BST)
Received: from localhost.localdomain (unknown [208.113.48.59])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTPSA id CA126461496;
	Mon, 25 Apr 2016 21:36:44 +0100 (BST)
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 16:36:26 -0400
Message-Id: <1461616586-25202-1-git-send-email-tristan.vanberkom@codethink.co.uk>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [meta-oe][PATCH] cross-localedef-native_2.22.bb: Use autotools configure
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
X-List-Received-Date: Mon, 25 Apr 2016 20:43:20 -0000

Use the autotools default configure commands and just tell autotools
where to run configure from.

This fixes the build when running on an aarch64 host, which the prebuilt
configure scripts with glibc 2.22 do not recognize.
---
 meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 3aefe74..7e484fa 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -9,6 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 
+# Tell autotools that we're working in the localedef directory
+#
+AUTOTOOLS_SCRIPT_PATH = "${S}/localedef"
+
 inherit native
 inherit autotools
 
@@ -49,11 +53,6 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF = "--with-glibc=${S}"
 CFLAGS += "-fgnu89-inline -std=gnu99 -DIS_IN\(x\)='0'"
 
-do_configure () {
-	${S}/localedef/configure ${EXTRA_OECONF}
-}
-
-
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${B}/localedef ${D}${bindir}/cross-localedef
-- 
2.8.0.rc3


