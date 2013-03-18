Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHPGa-00065A-5l for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 02:53:43 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I1joAg022759 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:45:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6b3GTqHVL2JC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:45:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I1jjOX022753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 01:45:48 GMT
Message-ID: <1363570595.4315.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 01:36:35 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] rpm: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 01:53:53 -0000
X-List-Received-Date: Mon, 18 Mar 2013 01:53:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fix out of tree builds by removing assumptions about cwd and using
full paths to files in ${S}.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index cdfb5ff..6286771 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -358,13 +358,13 @@ FILES_${PN}-staticdev = " \
 
 do_configure() {
 	# Disable tests!
-	echo "all:" > tests/Makefile.am
+	echo "all:" > ${S}/tests/Makefile.am
 
-	./autogen.sh
+	${S}/autogen.sh
 
 	# NASTY hack to make sure configure files the right pkg-config file...
 	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
-	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i configure
+	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i ${S}/configure
 
 	export varprefix=${localstatedir}
 	oe_runconf




