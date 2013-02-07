Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U3bXU-0006uA-0u for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 01:10:01 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17NxXKS009144 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 23:59:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pp7vTq+t5IRe
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2013 23:59:33 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17NxPqV009141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 23:59:28 GMT
Message-ID: <1360281231.10722.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 07 Feb 2013 23:53:51 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] dbus-native: Don't install dbus-launch
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
X-List-Received-Date: Fri, 08 Feb 2013 00:10:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

dbus-launch from dbus-native has no X support so lets not install it in
case the host has a more featured and useful version. It can interfere
with running X utils with STAGING_BINDIR_NATIVE is in PATH and we don'
use it anywhere.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 88218b7..292ab29 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -118,6 +118,10 @@ do_install_class-native() {
 
 	# dbus-glib-native and dbus-glib need this xml file
 	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
+	
+	# dbus-launch has no X support so lets not install it in case the host
+	# has a more featured and useful version
+	rm -f ${D}${bindir}/dbus-launch
 }
 
 do_install_class-nativesdk() {




