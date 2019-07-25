Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 332DD6C102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:03:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 21:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189233229"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 21:03:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 12:02:59 +0800
Message-Id: <1564027386-8107-4-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
References: <1564027386-8107-1-git-send-email-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [warrior][PATCH 04/11] libxslt: fix CVE-2019-13117 CVE-2019-13118
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
X-List-Received-Date: Thu, 25 Jul 2019 04:03:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

(From OE-Core rev: 7dc3048fec88dd62ef49ef16517b7382ab7cf2a5)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxslt/files/CVE-2019-13117.patch             | 33 ++++++++++
 .../libxslt/files/CVE-2019-13118.patch             | 76 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13117.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13118.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2019-13117.patch b/meta/recipes-support/libxslt/files/CVE-2019-13117.patch
new file mode 100644
index 0000000..ef3f270
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-13117.patch
@@ -0,0 +1,33 @@
+From c5eb6cf3aba0af048596106ed839b4ae17ecbcb1 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 27 Apr 2019 11:19:48 +0200
+Subject: [PATCH] Fix uninitialized read of xsl:number token
+
+Found by OSS-Fuzz.
+
+CVE: CVE-2019-13117
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/c5eb6cf3aba0af048596106ed839b4ae17ecbcb1]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ libxslt/numbers.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libxslt/numbers.c b/libxslt/numbers.c
+index 89e1f668..75c31eba 100644
+--- a/libxslt/numbers.c
++++ b/libxslt/numbers.c
+@@ -382,7 +382,10 @@ xsltNumberFormatTokenize(const xmlChar *format,
+ 		tokens->tokens[tokens->nTokens].token = val - 1;
+ 		ix += len;
+ 		val = xmlStringCurrentChar(NULL, format+ix, &len);
+-	    }
++	    } else {
++                tokens->tokens[tokens->nTokens].token = (xmlChar)'0';
++                tokens->tokens[tokens->nTokens].width = 1;
++            }
+ 	} else if ( (val == (xmlChar)'A') ||
+ 		    (val == (xmlChar)'a') ||
+ 		    (val == (xmlChar)'I') ||
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/libxslt/files/CVE-2019-13118.patch b/meta/recipes-support/libxslt/files/CVE-2019-13118.patch
new file mode 100644
index 0000000..595e6c2
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-13118.patch
@@ -0,0 +1,76 @@
+From 6ce8de69330783977dd14f6569419489875fb71b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon, 3 Jun 2019 13:14:45 +0200
+Subject: [PATCH] Fix uninitialized read with UTF-8 grouping chars
+
+The character type in xsltFormatNumberConversion was too narrow and
+an invalid character/length combination could be passed to
+xsltNumberFormatDecimal, resulting in an uninitialized read.
+
+Found by OSS-Fuzz.
+
+CVE: CVE-2019-13118
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/6ce8de69330783977dd14f6569419489875fb71b]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ libxslt/numbers.c         | 5 +++--
+ tests/docs/bug-222.xml    | 1 +
+ tests/general/bug-222.out | 2 ++
+ tests/general/bug-222.xsl | 6 ++++++
+ 4 files changed, 12 insertions(+), 2 deletions(-)
+ create mode 100644 tests/docs/bug-222.xml
+ create mode 100644 tests/general/bug-222.out
+ create mode 100644 tests/general/bug-222.xsl
+
+diff --git a/libxslt/numbers.c b/libxslt/numbers.c
+index f1ed8846..20b99d5a 100644
+--- a/libxslt/numbers.c
++++ b/libxslt/numbers.c
+@@ -1298,13 +1298,14 @@ OUTPUT_NUMBER:
+     number = floor((scale * number + 0.5)) / scale;
+     if ((self->grouping != NULL) &&
+         (self->grouping[0] != 0)) {
++        int gchar;
+ 
+ 	len = xmlStrlen(self->grouping);
+-	pchar = xsltGetUTF8Char(self->grouping, &len);
++	gchar = xsltGetUTF8Char(self->grouping, &len);
+ 	xsltNumberFormatDecimal(buffer, floor(number), self->zeroDigit[0],
+ 				format_info.integer_digits,
+ 				format_info.group,
+-				pchar, len);
++				gchar, len);
+     } else
+ 	xsltNumberFormatDecimal(buffer, floor(number), self->zeroDigit[0],
+ 				format_info.integer_digits,
+diff --git a/tests/docs/bug-222.xml b/tests/docs/bug-222.xml
+new file mode 100644
+index 00000000..69d62f2c
+--- /dev/null
++++ b/tests/docs/bug-222.xml
+@@ -0,0 +1 @@
++<doc/>
+diff --git a/tests/general/bug-222.out b/tests/general/bug-222.out
+new file mode 100644
+index 00000000..e3139698
+--- /dev/null
++++ b/tests/general/bug-222.out
+@@ -0,0 +1,2 @@
++<?xml version="1.0"?>
++1⠢0
+diff --git a/tests/general/bug-222.xsl b/tests/general/bug-222.xsl
+new file mode 100644
+index 00000000..e32dc473
+--- /dev/null
++++ b/tests/general/bug-222.xsl
+@@ -0,0 +1,6 @@
++<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
++  <xsl:decimal-format name="f" grouping-separator="⠢"/>
++  <xsl:template match="/">
++    <xsl:value-of select="format-number(10,'#⠢0','f')"/>
++  </xsl:template>
++</xsl:stylesheet>
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 42b21c7..92d3099 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -10,6 +10,8 @@ DEPENDS = "libxml2"
 
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://0001-Fix-security-framework-bypass.patch \
+           file://CVE-2019-13117.patch \
+           file://CVE-2019-13118.patch \
 "
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
-- 
2.7.4


