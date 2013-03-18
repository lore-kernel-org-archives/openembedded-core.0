Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHOuF-0005JE-W4 for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 02:30:34 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I1MjPT021494 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:22:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6WxNOsImpDkx
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:22:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I1Mek8021484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:22:43 GMT
Message-ID: <1363569210.4315.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 01:13:30 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: cross-localedef-native: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 01:30:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This change allows ${B} != ${S} builds to work since otherwise configure
isn't found.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
index 0fedfad..1d3c22b 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
@@ -39,11 +39,11 @@ EXTRA_OECONF = "--with-glibc=${WORKDIR}/eglibc-${PV}/libc"
 CFLAGS += "-DNOT_IN_libc=1"
 
 do_configure () {
-	./configure ${EXTRA_OECONF}
+	${S}/configure ${EXTRA_OECONF}
 }
 
 
 do_install() {
 	install -d ${D}${bindir} 
-	install -m 0755 ${S}/localedef ${D}${bindir}/cross-localedef
+	install -m 0755 ${B}/localedef ${D}${bindir}/cross-localedef
 }




