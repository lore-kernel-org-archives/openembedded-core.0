Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A683565D26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:18:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3O9IFNp005387 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:18:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bPXO0-YCBxze
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:18:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3O9I9J0005381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:18:10 +0100
Message-ID: <1398331083.16672.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:18:03 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Convert to use hardlinkdir
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
X-List-Received-Date: Thu, 24 Apr 2014 09:18:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 777c970..165230b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -178,7 +178,7 @@ do_install () {
 	case ${PN} in
 		*gcc-cross|*gcc-crosssdk)
 			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
-			cp -fpPR . $dest
+			hardlinkdir . $dest
 		;;
 	esac
 }
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index f8c1109..2e82a09 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,7 +22,7 @@ do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
 	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
+	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/$target/$d/
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 96f1969..1a1fbcc 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -27,7 +27,7 @@ FILES_${PN}-dbg += "${base_libdir}/.debug/"
 do_configure () {
 	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
+	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/ ${B}
 	mkdir -p ${B}/${BPN}
 	cd ${B}/${BPN}
 	chmod a+x ${S}/${BPN}/configure
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 3ae0632..30e5ffe 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -7,9 +7,7 @@ EXTRA_OECONF_PATHS = " \
 do_configure () {
 	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	#cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
-	(cd ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/; find . -print0 | cpio --null -pdlu ${B})
-	(cd ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/; find . -type l -print0 | cpio -pd0mLu --no-preserve-owner ${B})
+	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
 
 	echo "Configuring libgfortran"
 	rm -rf ${B}/$target/libgfortran/



