Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 487476105E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:07:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8I27wm6009653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 19:07:58 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 17 Sep 2013 19:07:56 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 10:07:53 +0800
Message-ID: <821a6e27edb0eddc919d1e3d67199e81bbec4eaa.1379469908.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1379469908.git.jackie.huang@windriver.com>
References: <cover.1379469908.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libunistring: remove the test to convert euc-jp in configure
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
X-List-Received-Date: Wed, 18 Sep 2013 02:07:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Remove the test "Test against HP-UX 11.11 bug:
No converter from EUC-JP to UTF-8 is provided"
since we don't support HP-UX and if the euc-jp is not
installed on the host, libunistring will be built without
iconv support and will cause guild-native configure fail.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   42 ++++++++++++++++++++
 .../libunistring/libunistring_0.9.3.bb             |    4 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch

diff --git a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
new file mode 100644
index 0000000..a330c73
--- /dev/null
+++ b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
@@ -0,0 +1,42 @@
+From 8d99a368615656a835f5502326afd31cec2cebfe Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 16 Sep 2013 18:16:12 +0800
+Subject: [PATCH] remove the test to convert euc-jp
+
+Remove the test "Test against HP-UX 11.11 bug:
+No converter from EUC-JP to UTF-8 is provided"
+since we don't support HP-UX and if the euc-jp is not
+installed on the host, libunistring will be built without
+iconv support and will cause guild-native configure fail.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ gnulib-m4/iconv.m4 |   11 -----------
+ 1 files changed, 0 insertions(+), 11 deletions(-)
+
+diff --git a/gnulib-m4/iconv.m4 b/gnulib-m4/iconv.m4
+index f46ff14..de0a5e9 100644
+--- a/gnulib-m4/iconv.m4
++++ b/gnulib-m4/iconv.m4
+@@ -126,17 +126,6 @@ int main ()
+       }
+   }
+ #endif
+-  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
+-     provided.  */
+-  if (/* Try standardized names.  */
+-      iconv_open ("UTF-8", "EUC-JP") == (iconv_t)(-1)
+-      /* Try IRIX, OSF/1 names.  */
+-      && iconv_open ("UTF-8", "eucJP") == (iconv_t)(-1)
+-      /* Try AIX names.  */
+-      && iconv_open ("UTF-8", "IBM-eucJP") == (iconv_t)(-1)
+-      /* Try HP-UX names.  */
+-      && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
+-    return 1;
+   return 0;
+ }], [am_cv_func_iconv_works=yes], [am_cv_func_iconv_works=no],
+         [case "$host_os" in
+--
+1.7.4
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
index 454a0e6..6cffef4 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
@@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://parallelmake.patch \
-           file://libunistring_fix_for_automake_1.12.patch"
+           file://libunistring_fix_for_automake_1.12.patch \
+           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
+"
 
 SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
 SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
-- 
1.7.4.1


