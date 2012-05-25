Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXqra-0000eZ-QJ for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 11:31:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4P9L2No032341
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 10:21:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31893-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 10:20:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4P9Krh3032335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 10:20:54 +0100
Message-ID: <1337937653.20169.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2012 10:20:53 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libxml2/libxslt: Don't depend on ansidecl.h header
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2012 09:31:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We don't DEPEND on binutils for ansidecl.h so ensure we should never
use the header. This makes builds determinstic and means something like:

bitbake binutils
bitbake libxml2 -c configure
bitbake binutils -c clean
bitbake libxml2

doen't fail to build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
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




