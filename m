Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAJos-0001Cn-HB for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 12:35:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LBQHvt001161
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 11:26:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00394-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 11:26:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LBQ7q4001151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 11:26:08 GMT
Message-ID: <1332329169.9740.139.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 11:26:09 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: gzip/pigz-native: Install into a prefix to avoid clashing with system binaries
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
X-List-Received-Date: Wed, 21 Mar 2012 11:35:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Due to the system providing a copy of gzip, we face some issues when we
'shadow' that copy with our own leading to a varient of race type bugs,
and issues for example if a dependency such as libz is missing but the
binary is still present. We usually rely on our dependency logic to protect
us from this but for gzip, we don't have this protection since its not listed
by all its users (and doing so would be impractical).

This patch installed pigz and gzip into their own directory which we only
add to PATH when we explictly want these binaries in much the same way we do
with perl-native. This means dependency logic is correct when we use the binary
and everything should work well.

The patch adds an explict dependency into image.bbclass since the accelerated
speed of compression is most appreciated at rootfs time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/gzipnative.bbclass b/meta/classes/gzipnative.bbclass
new file mode 100644
index 0000000..4a41143
--- a/dev/null
+++ b/meta/classes/gzipnative.bbclass
@@ -0,0 +1,3 @@
+PATH_prepend = "${STAGING_BINDIR_NATIVE}/pigz-native:${STAGING_BINDIR_NATIVE}/gzip-native:"
+DEPENDS += "gzip-native"
+
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ccfcaba..907c59b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -3,6 +3,8 @@ inherit rootfs_${IMAGE_PKGTYPE}
 IMAGETEST ?= "dummy"
 inherit imagetest-${IMAGETEST}
 
+inherit gzipnative
+
 LICENSE = "MIT"
 PACKAGES = ""
 RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 00196ba..bb4cd02 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -74,7 +74,7 @@ baselib = "lib"
 # Libtool's default paths are correct for the native machine
 lt_cv_sys_lib_dlsearch_path_spec[unexport] = "1"
 
-NATIVE_PACKAGE_PATH_SUFFIX = ""
+NATIVE_PACKAGE_PATH_SUFFIX ?= ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index d902b7a..459ccb3 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.gz \
            file://autotools.patch"
 
-inherit autotools lib_package
+inherit autotools lib_package gzipnative
 
 # This package uses an archive format known to have issue with some
 # versions of gzip
diff --git a/meta/recipes-extended/gzip/gzip_1.4.bb b/meta/recipes-extended/gzip/gzip_1.4.bb
index ab8a744..8f4a237 100644
--- a/meta/recipes-extended/gzip/gzip_1.4.bb
+++ b/meta/recipes-extended/gzip/gzip_1.4.bb
@@ -1,6 +1,8 @@
 require gzip.inc
 
-PR = "r0"
+PR = "r1"
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-extended/pigz/pigz_2.2.4.bb
index 598bbe3..eaf00c6 100644
--- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.2.4.bb
@@ -1,6 +1,8 @@
 require pigz.inc
 
-PR = "r0"
+PR = "r1"
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native"
 




