Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7DA60602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 23:33:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 16:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,438,1500966000"; d="scan'208";a="139352693"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2017 16:33:38 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 16:33:45 -0700
Message-Id: <1506382426-2135-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506382426-2135-1-git-send-email-juro.bystricky@intel.com>
References: <1506382426-2135-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/3] libxml2-ptest: support for encoding ISO-8859-5
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
X-List-Received-Date: Mon, 25 Sep 2017 23:33:39 -0000

This fixes the error:

./test/errors/759398.xml:1: parser error : Unsupported encoding ISO-8859-5
<?xml version='1.0' encoding='ISO-8859-5' standalone='no'?>
                                         ^
./test/errors/759398.xml : failed to parse
FAIL: Error cases stream regression tests

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 15d5e36..ec2d25a 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -53,11 +53,11 @@ RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'l
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
 
-RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-ebcdic-us glibc-gconv-ibm1141 glibc-gconv-iso8859-5"
 
 export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
 
-# WARNING: zlib is require for RPM use
+# WARNING: zlib is required for RPM use
 EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
 EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-- 
2.7.4


