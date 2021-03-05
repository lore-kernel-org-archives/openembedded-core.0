Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7838.1614918147367914867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kyj165EkJEw+BaZ1SoNkMYugj5UOF/sdD31TMvefKCakesqTd+XjZxItplBNhaUng0aNMPdMzt
 n8+6w5ec5zLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670932"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:18 -0800
IronPort-SDR: IzVymU3hyIUE2iStTEKItpyhrEvxWjiEYzu+zy5RvZ7Y9kxVvib7diZfTvu0/xQuOy2RXUa0T4
 CAnp1iOEOIDA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128846"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/52] screen: fix CVE-2021-26937
Date: Fri,  5 Mar 2021 12:20:50 +0800
Message-Id: <b8bf4aa43abc931776fa28495d310f317c0ac4d1.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Scott Murray <scott.murray@konsulko.com>

Apply patch from Debian to fix CVE-2021-26937.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d688cc8672b1830ba10966492ab3f8a12d32e17)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../screen/screen/CVE-2021-26937.patch        | 68 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.8.0.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2021-26937.patch b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
new file mode 100644
index 0000000000..983b35c1b0
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
@@ -0,0 +1,68 @@
+Description: [CVE-2021-26937] Fix out of bounds array access
+Author: Michael Schröder <mls@suse.de>
+Bug-Debian: https://bugs.debian.org/982435
+Bug: https://savannah.gnu.org/bugs/?60030
+Bug: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00000.html
+Bug-OSS-Security: https://www.openwall.com/lists/oss-security/2021/02/09/3
+Origin: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00010.html
+
+CVE: CVE-2021-26937
+Upstream-Status: Pending
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+--- a/encoding.c
++++ b/encoding.c
+@@ -43,7 +43,7 @@
+ # ifdef UTF8
+ static int   recode_char __P((int, int, int));
+ static int   recode_char_to_encoding __P((int, int));
+-static void  comb_tofront __P((int, int));
++static void  comb_tofront __P((int));
+ #  ifdef DW_CHARS
+ static int   recode_char_dw __P((int, int *, int, int));
+ static int   recode_char_dw_to_encoding __P((int, int *, int));
+@@ -1263,6 +1263,8 @@
+     {0x30000, 0x3FFFD},
+   };
+ 
++  if (c >= 0xdf00 && c <= 0xdfff)
++    return 1;          /* dw combining sequence */
+   return ((bisearch(c, wide, sizeof(wide) / sizeof(struct interval) - 1)) ||
+           (cjkwidth &&
+            bisearch(c, ambiguous,
+@@ -1330,11 +1332,12 @@
+ }
+ 
+ static void
+-comb_tofront(root, i)
+-int root, i;
++comb_tofront(i)
++int i;
+ {
+   for (;;)
+     {
++      int root = i >= 0x700 ? 0x801 : 0x800;
+       debug1("bring to front: %x\n", i);
+       combchars[combchars[i]->prev]->next = combchars[i]->next;
+       combchars[combchars[i]->next]->prev = combchars[i]->prev;
+@@ -1396,9 +1399,9 @@
+     {
+       /* full, recycle old entry */
+       if (c1 >= 0xd800 && c1 < 0xe000)
+-        comb_tofront(root, c1 - 0xd800);
++        comb_tofront(c1 - 0xd800);
+       i = combchars[root]->prev;
+-      if (c1 == i + 0xd800)
++      if (i == 0x800 || i == 0x801 || c1 == i + 0xd800)
+ 	{
+ 	  /* completely full, can't recycle */
+ 	  debug("utf8_handle_comp: completely full!\n");
+@@ -1422,7 +1425,7 @@
+   mc->font  = (i >> 8) + 0xd8;
+   mc->fontx = 0;
+   debug3("combinig char %x %x -> %x\n", c1, c, i + 0xd800);
+-  comb_tofront(root, i);
++  comb_tofront(i);
+ }
+ 
+ #else /* !UTF8 */
diff --git a/meta/recipes-extended/screen/screen_4.8.0.bb b/meta/recipes-extended/screen/screen_4.8.0.bb
index 4772eb6c7a..fe640c262b 100644
--- a/meta/recipes-extended/screen/screen_4.8.0.bb
+++ b/meta/recipes-extended/screen/screen_4.8.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
+           file://CVE-2021-26937.patch \
           "
 
 SRC_URI[md5sum] = "d276213d3acd10339cd37848b8c4ab1e"
-- 
2.29.2

