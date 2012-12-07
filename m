Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbY-0001Lp-SC
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:09 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id F3417303F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:41 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:02:06 -0800
Message-Id: <54d27bbc26d1e45e51ee8ef0f051a2bd8f627cc0.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: F3417303F2.357FE
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 13/16] libxml2/libxslt: Don't depend on ansidecl.h header
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
X-List-Received-Date: Fri, 07 Dec 2012 05:36:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't DEPEND on binutils for ansidecl.h so ensure we should never
use the header. This makes builds determinstic and means something like:

bitbake binutils
bitbake libxml2 -c configure
bitbake binutils -c clean
bitbake libxml2

doen't fail to build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxml/libxml2.inc           |    5 +++++
 meta/recipes-support/libxslt/libxslt_1.1.26.bb |    7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 2eecbd3..32d6e8c 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -18,6 +18,11 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
 
 inherit autotools pkgconfig binconfig
 
+# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
+do_configure_prepend () {
+	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
+}
+
 EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n"
 EXTRA_OECONF_virtclass-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n"
 EXTRA_OECONF_virtclass-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index 8986e20..e4cc214 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
@@ -18,6 +18,11 @@ S = "${WORKDIR}/libxslt-${PV}"
 
 inherit autotools pkgconfig binconfig lib_package
 
+# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
+do_configure_prepend () {
+	sed -i -e 's/ansidecl.h//' ${S}/configure.in
+}
+
 EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES_${PN}-bin += "${PN}-utils"
-- 
1.7.9.5



