Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B20226AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:40:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0HBeNnQ014085 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:40:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3hOqoh7zz_Gw
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:40:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0HBdknP014042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:39:47 GMT
Message-ID: <1389958780.14987.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 11:39:40 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] opkg-utils: Add basic PACKAGECONFIG for python dependencies
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
X-List-Received-Date: Fri, 17 Jan 2014 11:40:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In small configurations its useful not to have python dependencies. This
patch adds code to disable those using PACKAGECONFIG. This allows us to
fix poky-tiny after the recent move of update-alternatives to opkg-utils.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 6aa5fb8..6a3cf55 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -16,6 +16,12 @@ S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
+PYTHONRDEPS_class-native = ""
+
+PACKAGECONFIG = "python"
+PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
+
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
@@ -25,9 +31,6 @@ PACKAGES_class-native = ""
 
 PACKAGES =+ "update-alternatives-opkg"
 FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
-
-RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
-RDEPENDS_${PN}_class-native = ""
 RPROVIDES_update-alternatives-opkg = "update-alternatives"
 
 BBCLASSEXTEND = "native nativesdk"



