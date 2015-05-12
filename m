Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6745473F5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:42:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C7gfJ4020356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 00:42:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 12 May 2015 00:42:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 May 2015 15:38:09 +0800
Message-ID: <1431416289-617-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] elfutils: Disable the unnecessary check in iconv.m4
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
X-List-Received-Date: Tue, 12 May 2015 07:42:41 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Disable the test "Test against HP-UX 11.11 bug: No converter from EUC-JP
to UTF-8 is provided" since we don't support HP-UX and if the euc-jp is
not installed on the host, the dependence will be built without iconv
support and will cause guild-native building fail.

The patch is similar as 0470bd7a9658d3[libunistring: remove the test to
convert euc-jp in configure]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-remove-the-unneed-checking.patch          | 38 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-remove-the-unneed-checking.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-remove-the-unneed-checking.patch
new file mode 100644
index 0000000..5be92d7
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-remove-the-unneed-checking.patch
@@ -0,0 +1,38 @@
+Disable the test to convert euc-jp
+
+Remove the test "Test against HP-UX 11.11 bug:
+No converter from EUC-JP to UTF-8 is provided"
+since we don't support HP-UX and if the euc-jp is not
+installed on the host, the dependence will be built without
+iconv support and will cause guild-native building fail.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ m4/iconv.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/iconv.m4 b/m4/iconv.m4
+index a503646..299f1eb 100644
+--- a/m4/iconv.m4
++++ b/m4/iconv.m4
+@@ -159,6 +159,7 @@ int main ()
+       }
+   }
+ #endif
++#if 0
+   /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
+      provided.  */
+   if (/* Try standardized names.  */
+@@ -170,6 +171,7 @@ int main ()
+       /* Try HP-UX names.  */
+       && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
+     result |= 16;
++#endif
+   return result;
+ }]])],
+         [am_cv_func_iconv_works=yes],
+-- 
+2.0.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
index e111b34..70a3c16 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
         file://fixheadercheck.patch \
         file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
         file://0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch \
+        file://0001-remove-the-unneed-checking.patch \
 "
 
 # pick the patch from debian
-- 
1.9.1


