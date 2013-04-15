Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1URhWn-0007li-Uc
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:25:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7c87003452; Mon, 15 Apr 2013 12:07:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PU3yY7mr-NfC; Mon, 15 Apr 2013 12:07:38 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7ZuP003435
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Apr 2013 12:07:36 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1URhFg-0006Uv-H7; Mon, 15 Apr 2013 12:07:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:04 +0100
Message-Id: <1366024028-24911-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/7] ttf-bitstream-vera: Use fontcache class for postinstall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000

Using the fontcache class means we can run the postinstall at build time
so this is generally more efficient.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 71e85e4..ccd865c 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 PR = "r7"
 RDEPENDS_${PN} = "fontconfig-utils"
 
-inherit allarch
+inherit allarch fontcache
+
+FONT_PACKAGES = "${PN}"
 
 SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2" 
 
@@ -31,12 +33,6 @@ do_install () {
         done 
 } 
 
-pkg_postinst_${PN} () {
-#!/bin/sh
-fc-cache
-}
-
-
 FILES_${PN} = "/etc ${datadir}/fonts"
 
 SRC_URI[md5sum] = "bb22bd5b4675f5dbe17c6963d8c00ed6"
-- 
1.7.10.4



