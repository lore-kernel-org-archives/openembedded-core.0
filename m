Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5CFB6D77A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:39:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7dTqk014832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:39:30 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 23:39:29 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 15:39:26 +0800
Message-ID: <4d489a2d6b0f8dbfd65c65fd0c62a1cf47b2b696.1385019181.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1385019181.git.jackie.huang@windriver.com>
References: <cover.1385019181.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gettext-minimal-native/iconv.m4: remove the test to convert euc-jp
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
X-List-Received-Date: Thu, 21 Nov 2013 07:39:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Remove the test "Test against HP-UX 11.11 bug: No converter from
EUC-JP to UTF-8 is provided" since we don't support HP-UX and it
causes guile-native compile failure if the euc-jp is not installed
on the host.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch | 43 ++++++++++++++++++++++
 .../gettext/gettext-minimal-native_0.18.3.1.bb     |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch
new file mode 100644
index 0000000..d453a74
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch
@@ -0,0 +1,43 @@
+From 0bfade685783ccd193b2e1b94d0e4ef5ce449432 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 20 Nov 2013 17:52:50 +0800
+Subject: [PATCH] remove the test to convert euc-jp
+
+Remove the test "Test against HP-UX 11.11 bug:
+No converter from EUC-JP to UTF-8 is provided"
+since we don't support HP-UX and it causes
+guile-native compile failure if the euc-jp is not
+installed on the host
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ iconv.m4 | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/iconv.m4 b/iconv.m4
+index a503646..dbe7ca1 100644
+--- a/iconv.m4
++++ b/iconv.m4
+@@ -159,17 +159,6 @@ int main ()
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
+-    result |= 16;
+   return result;
+ }]])],
+         [am_cv_func_iconv_works=yes],
+--
+1.8.3
+
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
index e46b19e..2b43b97 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.1.bb
@@ -7,7 +7,9 @@ SRC_URI = "file://aclocal.tgz \
            file://config.rpath \
            file://Makefile.in.in \
            file://remove-potcdate.sin \
-           file://COPYING"
+           file://COPYING \
+           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
+"
 
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
-- 
1.8.3


