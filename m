Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJix5-0001yM-Kg for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 12:14:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GA57KJ030684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 11:05:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30534-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 11:05:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GA4xjR030662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 11:05:00 +0100
Message-ID: <1334570702.16992.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 11:05:02 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] docbook-utils-native: Fix re-execution of the unpack task
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
X-List-Received-Date: Mon, 16 Apr 2012 10:14:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the do_unpack task is re-executed, the sed_done stamp was not removed, the
sed commands wouldn't re-run and the build would fail in do_compile. This
patch ensures the stamp is in ${S} and that we clean that directory
when unpack runs so it is a build from sctatch at that point.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
index 2a89479..5e1384d 100644
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -21,16 +21,17 @@ inherit autotools native
 
 do_configure_prepend() {
 	# Fix hard-coded references to /etc/sgml
-	if [ ! -e ${WORKDIR}/.sed_done ]; then
+	if [ ! -e ${S}/.sed_done ]; then
 		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" bin/jw.in
 		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/man/Makefile.am
 		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/HTML/Makefile.am
 
 		# Point jw to the native sysroot catalog
 		sed -i -e 's|^SGML_EXTRA_CATALOGS=""|SGML_EXTRA_CATALOGS=":${sysconfdir}/sgml/catalog"|g' bin/jw.in
-		touch ${WORKDIR}/.sed_done
+		touch ${S}/.sed_done
 	fi
 }
+do_unpack[cleandirs] += "${S}"
 
 do_install() {
 	install -d ${D}${bindir}




