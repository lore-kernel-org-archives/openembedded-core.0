Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BAF7661EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 15:49:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57Fs8tl029753 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 16:54:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9fKNUhgPrwds
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 16:54:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57Fs5f1029749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 16:54:07 +0100
Message-ID: <1370620131.6864.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 16:48:51 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package_*.bbclass: Drop fakeroot from setscene calls
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
X-List-Received-Date: Fri, 07 Jun 2013 15:49:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Back in 2010, I added these in commit: http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=36f1ae42fe13dae174b7fb5eb85dc49d7d7b516b
however the package_write tasks sstate only consists of package files and no
fakeroot privileges are needed to write these out, only originally create them.

We can therefore drop these for some small performance gains and a less
convoluted depenency chain.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 313758f..949432e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -402,7 +402,6 @@ python () {
         deps = ' dpkg-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_deb', 'depends', deps)
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
-        d.setVarFlag('do_package_write_deb_setscene', 'fakeroot', "1")
 
     # Map TARGET_ARCH to Debian's ideas about architectures
     darch = d.getVar('DPKG_ARCH', True)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index f6797ad..55628e4 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -416,7 +416,6 @@ python () {
         deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_ipk', 'depends', deps)
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
-        d.setVarFlag('do_package_write_ipk_setscene', 'fakeroot', "1")
 }
 
 python do_package_write_ipk () {
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 8935c9f..648327f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1128,7 +1128,6 @@ python () {
         deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_rpm', 'depends', deps)
         d.setVarFlag('do_package_write_rpm', 'fakeroot', 1)
-        d.setVarFlag('do_package_write_rpm_setscene', 'fakeroot', 1)
 }
 
 SSTATETASKS += "do_package_write_rpm"



