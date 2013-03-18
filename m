Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UHPiO-0007Lh-39
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:22:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2EXt8024763; Mon, 18 Mar 2013 02:14:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RR+wpjLI8xHf; Mon, 18 Mar 2013 02:14:33 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2ERj1024745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Mar 2013 02:14:29 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UHPRt-0003Uv-EL; Mon, 18 Mar 2013 02:05:17 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 02:05:00 +0000
Message-Id: <1363572312-13399-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/13] docbook-utils-native: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 02:22:59 -0000

Fix out of tree builds by using full paths to source and built
objects as appropriate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |   23 ++++++++++----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
index 5e1384d..78034dd 100644
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -22,12 +22,12 @@ inherit autotools native
 do_configure_prepend() {
 	# Fix hard-coded references to /etc/sgml
 	if [ ! -e ${S}/.sed_done ]; then
-		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" bin/jw.in
-		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/man/Makefile.am
-		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/HTML/Makefile.am
+		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" ${S}/bin/jw.in
+		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" ${S}/doc/man/Makefile.am
+		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" ${S}/doc/HTML/Makefile.am
 
 		# Point jw to the native sysroot catalog
-		sed -i -e 's|^SGML_EXTRA_CATALOGS=""|SGML_EXTRA_CATALOGS=":${sysconfdir}/sgml/catalog"|g' bin/jw.in
+		sed -i -e 's|^SGML_EXTRA_CATALOGS=""|SGML_EXTRA_CATALOGS=":${sysconfdir}/sgml/catalog"|g' ${S}/bin/jw.in
 		touch ${S}/.sed_done
 	fi
 }
@@ -44,14 +44,15 @@ do_install() {
 		ln -sf docbook2$doctype ${D}${bindir}/docbook-to-$doctype
 	done
 
-	install -m 0755 ${S}/bin/jw ${D}${bindir}/
-	for i in backends/dvi backends/html backends/man \
-		backends/pdf backends/ps backends/rtf backends/tex \
-		backends/texi backends/txt frontends/docbook \
-		helpers/docbook2man-spec.pl helpers/docbook2texi-spec.pl \
-		docbook-utils.dsl
+	install -m 0755 ${B}/bin/jw ${D}${bindir}/
+	for i in ${S}/backends/dvi ${S}/backends/html ${B}/backends/man \
+		${S}/backends/pdf ${S}/backends/ps ${S}/backends/rtf ${S}/backends/tex \
+		${B}/backends/texi ${S}/backends/txt ${B}/frontends/docbook \
+		${S}/helpers/docbook2man-spec.pl ${S}/helpers/docbook2texi-spec.pl \
+		${S}/docbook-utils.dsl
 	do
 		install -d ${D}${datadir}/sgml/docbook/utils-${PV}/`dirname $i`
-		install ${S}/$i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
+		install $i ${D}${datadir}/sgml/docbook/utils-${PV}/$i
 	done
+
 }
-- 
1.7.10.4



