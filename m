Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id DA74278C10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:24:38 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w6QDObNG001218
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:24:38 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w6QDObhq013214;
	Thu, 26 Jul 2018 15:24:37 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 7555F98F56B;
	Thu, 26 Jul 2018 15:24:37 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 15:24:27 +0200
Message-Id: <20180726132427.21041-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] freetype: fix potential numeric overflow
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
X-List-Received-Date: Thu, 26 Jul 2018 13:24:39 -0000

bug: 54023
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../freetype/fix-potential-numeric-overflow.patch  | 28 ++++++++++++++++++++++
 meta/recipes-graphics/freetype/freetype_2.9.bb     |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch

diff --git a/meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch b/meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch
new file mode 100644
index 0000000000..0b5b3c625f
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch
@@ -0,0 +1,28 @@
+freetype-2.9: Fix potential numeric overflow
+
+[No upstream tracking] -- https://savannah.nongnu.org/bugs/index.php?54023
+
+ttcmap: (tt_cmap2_validate): Fix potential numeric overflow
+
+The dead loop appears in the function tt_cmap2_char_next()
+in "src\sfnt\ttcmap.c" in version 2.9 when "charcode == 256".
+According to the notes, is seems that "subheader" should
+not be NULL when "charcode == 256".
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/src/sfnt/ttcmap.c?id=5bd76524ef786d942b28dc52618aeda3aebfa3d6]
+bug: 54023
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/src/sfnt/ttcmap.c b/src/sfnt/ttcmap.c
+index 5afa6ae..8fb9542 100644
+--- a/src/sfnt/ttcmap.c
++++ b/src/sfnt/ttcmap.c
+@@ -358,7 +358,7 @@
+       /* check range within 0..255 */
+       if ( valid->level >= FT_VALIDATE_PARANOID )
+       {
+-        if ( first_code >= 256 || first_code + code_count > 256 )
++        if ( first_code >= 256 || code_count > 256 - first_code )
+           FT_INVALID_DATA;
+       }
+ 
diff --git a/meta/recipes-graphics/freetype/freetype_2.9.bb b/meta/recipes-graphics/freetype/freetype_2.9.bb
index da05916b36..216ecf31d1 100644
--- a/meta/recipes-graphics/freetype/freetype_2.9.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.9.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
-           file://use-right-libtool.patch"
+           file://use-right-libtool.patch \
+           file://fix-potential-numeric-overflow.patch \
+          "
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
-- 
2.11.0


