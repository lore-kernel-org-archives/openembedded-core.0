Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8E04F76B7C;
	Tue,  1 Sep 2015 14:28:33 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so649171lbc.3;
	Tue, 01 Sep 2015 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ok36UOHWt0pxW2Nve9hXiXg5EwZIEAOkJ9Yj7GEvYac=;
	b=iI/K4MgvrGVDwPi/Df8zh4tShSXgHRIHysEbvY/fKBtYEICfJMh+GBLx2OeBMgjXJ/
	cWrIw1YERGJY4q6IwZ+zu9tcQ0hBYHyTu04syzEO24VdqbZnRNjGPhKel6N56bpnZS4o
	cCwPBvmvmfcrQGhz2eU5TW0qYuBI+X/n3HJ8mv6/frvcliSeZ0P/YiOPcGgf2ndSjoVC
	+RZrLhtH01o4y9MbmnhMr6G4GabmLZp61QpCooIi5NVzo/OXWsIrRhcM8J3ub/LUzWuu
	+/mdbT31V9Eew5fMsZxuQHcu7Ypz566AoGf0ciXLBEcbkzzanCyys0o7GI588WXpoUL3
	0sCw==
X-Received: by 10.153.8.140 with SMTP id dk12mr5922492lad.83.1441117712349;
	Tue, 01 Sep 2015 07:28:32 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id ok2sm4816799lbb.0.2015.09.01.07.28.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 07:28:31 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>,
	Robert Yang <liezhi.yang@windriver.com>,
	Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	Nathan Rossi <nathan.rossi@xilinx.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Tue,  1 Sep 2015 16:28:28 +0200
Message-Id: <1441117708-7744-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1441117708-7744-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1441117708-7744-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] python: Fix python-distutils variables
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
X-List-Received-Date: Tue, 01 Sep 2015 14:28:34 -0000

python-distutils uses the information from this file for setting the
system variables.

Whithout this patch:

root@qt5022:~# pip install pyzmq

...

x86_64-poky-linux-gcc -m64 -march=btver1 -mtune=btver1
--sysroot=/var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/sysroots/qt5022
-fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types
-DNDEBUG -g -O3 -Wall -Wstrict-prototypes -fPIC -DNATIVE_LITTLE_ENDIAN=1
-Ibundled/libsodium/src/libsodium/include
-Ibundled/libsodium/src/libsodium/include/sodium
-I/usr/include/python2.7 -c buildutils/initlibsodium.c -o
build/temp.linux-x86_64-2.7/buildutils/initlibsodium.o
    In file included from /usr/include/python2.7/Python.h:8:0,
                         from buildutils/initlibsodium.c:10:
    /usr/include/python2.7/pyconfig.h:24:27: fatal error: bits/wordsize.h: No such
file or directory
    #include <bits/wordsize.h>
root@qt5022:~# ls /usr/include/bits/wordsize.h
/usr/include/bits/wordsize.h

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.9.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 803a1fc7497b..ae455771653e 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -137,8 +137,10 @@ py_package_preprocess () {
 	# copy back the old Makefile to fix target package
 	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 
-	# Remove references to buildmachine paths in target Makefile
-	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
2.5.0


