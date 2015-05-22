Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6D2C606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 09:26:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4M9QxZD012609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 02:26:59 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 22 May 2015 02:26:58 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 May 2015 17:21:43 +0800
Message-ID: <1432286503-10891-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gettext-minimal-native: Disable the unnecessary check in iconv.m4
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
X-List-Received-Date: Fri, 22 May 2015 09:26:59 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Disable the test "Test against HP-UX 11.11 bug: No converter from EUC-JP
to UTF-8 is provided" since we don't support HP-UX and if the euc-jp is
not installed on the host, the dependence will be built without iconv
support and will cause guile-native building fail.

The patch is similar as 0470bd7a9658d3[libunistring: remove the test to
convert euc-jp in configure]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-PATCH-Disable-the-test-to-convert-euc-jp.patch | 38 ++++++++++++++++++++++
 .../gettext/gettext-minimal-native_0.19.4.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.4/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/gettext-minimal-0.19.4/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
new file mode 100644
index 0000000..29ef2a5
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.4/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
@@ -0,0 +1,38 @@
+[PATCH] Disable the test to convert euc-jp
+
+Remove the test "Test against HP-UX 11.11 bug:
+No converter from EUC-JP to UTF-8 is provided"
+since we don't support HP-UX and if the euc-jp is not
+installed on the host, the dependence will be built without
+iconv support and will cause guile-native building fail.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ iconv.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/iconv.m4 b/iconv.m4
+index 4e37363..35f54bd 100644
+--- a/iconv.m4
++++ b/iconv.m4
+@@ -165,6 +165,7 @@ AC_DEFUN([AM_ICONV_LINK],
+       }
+   }
+ #endif
++#if 0
+   /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
+      provided.  */
+   if (/* Try standardized names.  */
+@@ -176,6 +177,7 @@ AC_DEFUN([AM_ICONV_LINK],
+       /* Try HP-UX names.  */
+       && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
+     result |= 16;
++#endif
+   return result;
+ ]])],
+           [am_cv_func_iconv_works=yes], ,
+-- 
+2.0.1
+
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
index ca97315..1d4a443 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
@@ -8,6 +8,7 @@ SRC_URI = "file://aclocal.tgz \
            file://Makefile.in.in \
            file://remove-potcdate.sin \
            file://COPYING \
+           file://0001-PATCH-Disable-the-test-to-convert-euc-jp.patch \
 "
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.9.1


