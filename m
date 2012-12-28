Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tohvj-0007Y0-8q
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:27 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 560F12FEF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:26 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:45 -0800
Message-Id: <be34916d81b71385a560a6990c7b30eba243b356.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 560F12FEF1.3D851
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 12/15] freetype: patches for CVE-2012-5668, 5669, and 5670
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
X-List-Received-Date: Fri, 28 Dec 2012 21:57:28 -0000

For details of these security issues, please see:

http://www.openwall.com/lists/oss-security/2012/12/25/1

Thanks to Eren Turkay <eren@hambedded.org> for submitting source
patches that apply cleanly to freetype 2.4.9.

This fixes denzil bug [YOCTO #3649]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../freetype/freetype-2.4.9/CVE-2012-5668.patch    |   31 ++++++++++++++++++++
 .../freetype/freetype-2.4.9/CVE-2012-5669.patch    |   31 ++++++++++++++++++++
 .../freetype/freetype-2.4.9/CVE-2012-5670.patch    |   29 ++++++++++++++++++
 meta/recipes-graphics/freetype/freetype_2.4.9.bb   |    7 +++--
 4 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5668.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5669.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5670.patch

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5668.patch b/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5668.patch
new file mode 100644
index 0000000..609d73d
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5668.patch
@@ -0,0 +1,31 @@
+From 9b6b5754b57c12b820e01305eb69b8863a161e5a Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 15 Dec 2012 00:34:41 +0000
+Subject: [bdf] Fix Savannah bug #37905.
+
+* src/bdf/bdflib.c (_bdf_parse_start): Reset `props_size' to zero in
+case of allocation error; this value gets used in a loop in
+`bdf_free_font'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Eren Turkay <eren@hambedded.org>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+diff --git a/src/bdf/bdflib.c b/src/bdf/bdflib.c
+index ed08a6e..8d7f9a0 100644
+--- a/src/bdf/bdflib.c
++++ b/src/bdf/bdflib.c
+@@ -2169,7 +2169,10 @@
+       p->cnt = p->font->props_size = _bdf_atoul( p->list.field[1], 0, 10 );
+ 
+       if ( FT_NEW_ARRAY( p->font->props, p->cnt ) )
++      {
++        p->font->props_size = 0;
+         goto Exit;
++      }
+ 
+       p->flags |= _BDF_PROPS;
+       *next     = _bdf_parse_properties;
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5669.patch b/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5669.patch
new file mode 100644
index 0000000..e4a991e
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5669.patch
@@ -0,0 +1,31 @@
+From 07bdb6e289c7954e2a533039dc93c1c136099d2d Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 15 Dec 2012 01:02:23 +0000
+Subject: [bdf] Fix Savannah bug #37906.
+
+* src/bdf/bdflib.c (_bdf_parse_glyphs): Use correct array size for
+checking `glyph_enc'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Eren Turkay <eren@hambedded.org>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+diff --git a/src/bdf/bdflib.c b/src/bdf/bdflib.c
+index 8d7f9a0..f9c06ca 100644
+--- a/src/bdf/bdflib.c
++++ b/src/bdf/bdflib.c
+@@ -1628,8 +1628,9 @@
+ 
+       /* Check that the encoding is in the Unicode range because  */
+       /* otherwise p->have (a bitmap with static size) overflows. */
+-      if ( p->glyph_enc > 0                               &&
+-           (size_t)p->glyph_enc >= sizeof ( p->have ) * 8 )
++      if ( p->glyph_enc > 0                                      &&
++           (size_t)p->glyph_enc >= sizeof ( p->have ) /
++                                   sizeof ( unsigned long ) * 32 )
+       {
+         FT_ERROR(( "_bdf_parse_glyphs: " ERRMSG5, lineno, "ENCODING" ));
+         error = BDF_Err_Invalid_File_Format;
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5670.patch b/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5670.patch
new file mode 100644
index 0000000..73a41ca
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype-2.4.9/CVE-2012-5670.patch
@@ -0,0 +1,29 @@
+From 7f2e4f4f553f6836be7683f66226afac3fa979b8 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 15 Dec 2012 08:39:41 +0000
+Subject: [bdf] Fix Savannah bug #37907.
+
+* src/bdf/bdflib.c (_bdf_parse_glyphs) <ENCODING>: Normalize
+negative second parameter of `ENCODING' field also.
+
+Upstream-Status: Pending
+
+Signed-off-by: Eren Turkay <eren@hambedded.org>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+---
+diff --git a/src/bdf/bdflib.c b/src/bdf/bdflib.c
+index f9c06ca..365e671 100644
+--- a/src/bdf/bdflib.c
++++ b/src/bdf/bdflib.c
+@@ -1624,6 +1624,9 @@
+       if ( p->glyph_enc == -1 && p->list.used > 2 )
+         p->glyph_enc = _bdf_atol( p->list.field[2], 0, 10 );
+ 
++      if ( p->glyph_enc < -1 )
++        p->glyph_enc = -1;
++
+       FT_TRACE4(( DBGMSG2, p->glyph_enc ));
+ 
+       /* Check that the encoding is in the Unicode range because  */
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.9.bb b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
index 31bee80..6aa0f60 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.9.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
@@ -13,10 +13,13 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
 
 SECTION = "libs"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
-           file://no-hardcode.patch"
+           file://no-hardcode.patch \
+           file://CVE-2012-5668.patch \
+           file://CVE-2012-5669.patch \
+           file://CVE-2012-5670.patch"
 
 SRC_URI[md5sum] = "77a893dae81fd5b896632715ca041179"
 SRC_URI[sha256sum] = "c4204ac1d48e99d4375a2f32bf4f3f92780a9d9f015e64e57e852f6c004859b9"
-- 
1.7.9.5



