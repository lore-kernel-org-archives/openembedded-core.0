Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 924E16DCF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:49:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB50nKOt021270 for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 00:49:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QCfZuO76Pr7Z
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:49:20 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB50nHpB021263
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 00:49:19 GMT
Message-ID: <1386204552.4463.162.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Dec 2013 00:49:12 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/native.bbclass: Use FC instead of F77 for fortran
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
X-List-Received-Date: Thu, 05 Dec 2013 00:49:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gcc tooling appears to be standardising around the FC variable naming.
This patch changes the F77 namespace to FC instead and use the default
gfortran compiler. If anyone needs the F77 variables or tools, those
can still be made on a case by case basis.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 7c4e8c3..b2d85ef 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -59,7 +59,7 @@ export CONFIG_SITE = "${COREBASE}/meta/site/native"
 # set the compiler as well. It could have been set to something else
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
-export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
+export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"
 export CPP = "${HOST_PREFIX}gcc ${HOST_CC_ARCH} -E"
 export LD = "${HOST_PREFIX}ld ${HOST_LD_ARCH} "
 export CCLD = "${CC}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bbb1df6..386c935 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -446,7 +446,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
@@ -462,7 +462,7 @@ PYTHON = "${@sys.executable}"
 
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
-export BUILD_F77 = "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
+export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
 export BUILD_CPP = "${BUILD_PREFIX}cpp ${BUILD_CC_ARCH}"
 export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
 export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
--
cgit v0.9.1



