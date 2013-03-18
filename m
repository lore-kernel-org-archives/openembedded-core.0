Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHNo6-00030f-O5 for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 01:20:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I0CKLg018337 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:12:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bh31EnJ4EBOk
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:12:20 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I0CC2S018316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:12:15 GMT
Message-ID: <1363564983.4315.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 00:03:03 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] bison: Use PATH to locate m4
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
X-List-Received-Date: Mon, 18 Mar 2013 00:20:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We can specify no path to m4 at configure time and thus avoiding
having a wrapper for that particular problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/bison/bison_2.7.bb b/meta/recipes-devtools/bison/bison_2.7.bb
index ee2effb..373651e 100644
--- a/meta/recipes-devtools/bison/bison_2.7.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.bb
@@ -16,6 +16,9 @@ BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
                 file://dont-depend-on-help2man.patch \
 	       "
 
+# No point in hardcoding path to m4, just use PATH
+EXTRA_OECONF += "M4=m4"
+
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
           "
@@ -32,8 +35,6 @@ acpaths = "-I ${S}/m4"
 
 do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/bison \
-		M4=${STAGING_BINDIR_NATIVE}/m4 \
 		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
 }
-#bison-native encodes the staging M4 path
 BBCLASSEXTEND = "native nativesdk"




