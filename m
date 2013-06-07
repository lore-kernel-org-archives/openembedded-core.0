Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1F822620C2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 14:25:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57EUZht023795 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 15:30:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P324LMmrLeWq
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 15:30:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57EUVn8023792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 15:30:32 +0100
Message-ID: <1370615117.6864.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 15:25:17 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: python-external-tarball: Moderise and rename
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
X-List-Received-Date: Fri, 07 Jun 2013 14:25:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The external-python-tarball was intended to provide python for those users who
didn't have python 2.6. It has been unloved for a while so this refreshes
it a bit. Specifically:

* Include git and tar since these can have version issues on some systems
* Rename to buildtools-tarball to better reflect its purpose
* Remove the site-config file from the tarball, its pointless
* Prune down the environment file to just cover PATH and OECORE_NATIVE
  (which is needed to correctly install the tarball)
* Add missing grp module (used by do_package) from the unixadmin package

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 5f8cc96..076fe36 100644
--- a/meta/recipes-core/meta/external-python-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -1,10 +1,8 @@
-DESCRIPTION = "Meta package for building a standalone python tarball"
+DESCRIPTION = "Meta package for building a standalone python tarball and other key build tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r2"
-
 TOOLCHAIN_TARGET_TASK ?= ""
 
 TOOLCHAIN_HOST_TASK ?= "\
@@ -26,10 +24,13 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-netclient \
     nativesdk-python-netserver \
     nativesdk-python-distutils \
+    nativesdk-python-unixadmin \
     nativesdk-chrpath \
+    nativesdk-tar \
+    nativesdk-git \
     "
 
-TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-python-nativesdk-standalone-${DISTRO_VERSION}"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
 RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
@@ -37,3 +38,10 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit meta
 inherit populate_sdk
+
+create_sdk_files_append () {
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config*
+	
+	cat ${SDK_OUTPUT}/${SDKPATH}/environment-setup* | grep " PATH=\|OECORE_NATIVE_SYSROOT" > ${WORKDIR}/envtmp
+	mv ${WORKDIR}/envtmp ${SDK_OUTPUT}/${SDKPATH}/environment-setup*
+}



