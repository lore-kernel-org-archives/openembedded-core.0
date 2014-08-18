Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5796B60169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:12:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7IACJXV005903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 03:12:19 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 03:12:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 06:12:17 -0400
Message-ID: <1408356737-8743-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] openssl: add DEPENDS on openssl-native for rehash
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
X-List-Received-Date: Mon, 18 Aug 2014 10:12:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

'make rehash' used the compiled openssl to get hash value
for files, it always failed when cross compiling:

/path/to/openssl/1.0.1i-r0/openssl-1.0.1i/util/shlib_wrap.sh:
line 96: /path/to/openssl/1.0.1i-r0/openssl-1.0.1i/util/../apps/openssl:
cannot execute binary file

so add DEPENDS on openssl-native for target package and use it
instead of the one compiled from target package.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index a99953e..6b3fb7e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -9,6 +9,7 @@ LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
 DEPENDS = "perl-native-runtime"
+DEPENDS_class-target = "openssl-native"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
@@ -137,6 +138,10 @@ do_configure () {
 	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=`basename ${libdir}` $target
 }
 
+do_compile_prepend_class-target () {
+    sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
+}
+
 do_compile () {
 	oe_runmake
 }
-- 
2.0.0


