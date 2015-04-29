Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 22D0473D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:02:41 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 11:02:42 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 4B5C128BA1E;
	Wed, 29 Apr 2015 11:02:42 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 11:02:19 +0200
Message-ID: <1430298142-9117-3-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
References: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [daisy 2/5] libpng16: CVE-2015-0973
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
X-List-Received-Date: Wed, 29 Apr 2015 09:02:43 -0000
Content-Type: text/plain

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes CVE-2015-0973 (duplicate of CVE-2014-9495), a heap-based overflow
vulnerability in the png_combine_row() function of the libpng library,
when very large interlaced images were used.

Upstream patch:
http://sourceforge.net/p/libpng/code/ci/dc294204b641373bc6eb603075a8b98f51a75dd8/

External Reference:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-0973
http://seclists.org/oss-sec/2014/q4/1133

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../libpng/libpng/libpng16-CVE-2015-0973.patch     | 47 ++++++++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.8.bb     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/libpng/libpng16-CVE-2015-0973.patch

diff --git a/meta/recipes-multimedia/libpng/libpng/libpng16-CVE-2015-0973.patch b/meta/recipes-multimedia/libpng/libpng/libpng16-CVE-2015-0973.patch
new file mode 100644
index 0000000..d66ac0c
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng/libpng16-CVE-2015-0973.patch
@@ -0,0 +1,47 @@
+libpng16: Fixed an overflow in png_combine_row with very wide interlaced
+
+Fixes CVE-2015-0973 (duplicate of CVE-2014-9495), a heap-based overflow 
+vulnerability in the png_combine_row() function of the libpng library, 
+when very large interlaced images were used. 
+
+Upstream patch:
+http://sourceforge.net/p/libpng/code/ci/dc294204b641373bc6eb603075a8b98f51a75dd8/
+
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff --git a/pngrutil.c b/pngrutil.c
+index e9fdd62..4c26be4 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -3003,7 +3003,7 @@ png_combine_row(png_const_structrp png_ptr, png_bytep dp, int display)
+ {
+    unsigned int pixel_depth = png_ptr->transformed_pixel_depth;
+    png_const_bytep sp = png_ptr->row_buf + 1;
+-   png_uint_32 row_width = png_ptr->width;
++   png_alloc_size_t row_width = png_ptr->width;
+    unsigned int pass = png_ptr->pass;
+    png_bytep end_ptr = 0;
+    png_byte end_byte = 0;
+@@ -3278,7 +3278,7 @@ png_combine_row(png_const_structrp png_ptr, png_bytep dp, int display)
+ 
+             /* But don't allow this number to exceed the actual row width. */
+             if (bytes_to_copy > row_width)
+-               bytes_to_copy = row_width;
++               bytes_to_copy = (unsigned int)/*SAFE*/row_width;
+          }
+ 
+          else /* normal row; Adam7 only ever gives us one pixel to copy. */
+@@ -3458,7 +3458,7 @@ png_combine_row(png_const_structrp png_ptr, png_bytep dp, int display)
+                   dp += bytes_to_jump;
+                   row_width -= bytes_to_jump;
+                   if (bytes_to_copy > row_width)
+-                     bytes_to_copy = row_width;
++                     bytes_to_copy = (unsigned int)/*SAFE*/row_width;
+                }
+          }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.8.bb b/meta/recipes-multimedia/libpng/libpng_1.6.8.bb
index d063495..bb7745b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.8.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.8.bb
@@ -10,6 +10,7 @@ LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
            file://0001-configure-lower-automake-requirement.patch \
+           file://libpng16-CVE-2015-0973.patch \
           "
 
 SRC_URI[md5sum] = "51ce71a1642cdde1f4485a7ff82193c0"
-- 
1.9.1


