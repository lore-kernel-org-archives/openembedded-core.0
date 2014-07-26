Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B2DA370620
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 09:13:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6Q9Ap2b018537 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 10:13:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JZ8E4zmrFqtW
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 10:13:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6Q9DQ9w018567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 10:13:28 +0100
Message-ID: <1406366001.27697.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Jul 2014 10:13:21 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_deb: Fix non x86_64 SDK builds
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
X-List-Received-Date: Sat, 26 Jul 2014 09:13:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If building with SDKMACHINE=i686 and using the deb backend, populate_sdk
would fail. Its clear when looking at the options that the 32 bit values
were overwritten.

Replace this code with code similar to that used in package_deb itself.

[YOCTO #6458]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index acb1f73..6690e2e 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -1,11 +1,16 @@
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
 
-DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
-                [d.getVar('SDK_ARCH', True) in \
-                ["x86", "i486", "i586", "i686", "pentium"]]}"
+python () {
+    # Map TARGET_ARCH to Debian's ideas about architectures
+    darch = d.getVar('SDK_ARCH', True)
+    if darch in ["x86", "i486", "i586", "i686", "pentium"]:
+         d.setVar('DEB_SDK_ARCH', 'i386')
+    elif darch == "x86_64":
+         d.setVar('DEB_SDK_ARCH', 'amd64')
+    elif darch == "arm":
+         d.setVar('DEB_SDK_ARCH', 'armel')
+}
 
-DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "amd64"]\
-                [d.getVar('SDK_ARCH', True) == "x86_64"]}"
 
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 



