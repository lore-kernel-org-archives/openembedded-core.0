Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2D70276A51;
	Tue,  1 Sep 2015 14:28:32 +0000 (UTC)
Received: by laeb10 with SMTP id b10so880341lae.1;
	Tue, 01 Sep 2015 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DySRczxzvuF4vV2CU7lg5T43LEqi/LTP3Jqse+RHg4A=;
	b=c75K9RB/YRBLPqjyVyNzlV1uXdPFNzJsIHG6g5CeDwUCs+tqhw2/PxoGFZx7pzp8wH
	XwgyBfNvsIgTnXodw+fFQu9bJQNXBCJ5ybAkHaAbEFa7LhHJQ8mbs8EA3BfKmdzJvI4y
	xgx+kE8/Hd94YudUzVz1MP9Ioh4JnlBoaMPDh30YeNiduliarvUyXJvSHAh1jBiwUfO0
	ZhOpvcOljD8jYFOUXepy+1fPNlsLwp5QC16U1G0fF9p6ZVwhJsaj8jyX1L5sNiDQ6t0c
	c7uc4tdENiOe/khJPZ3lxNCf0WjGpc6DVuc2KT4k7tNAUgbKGkG3eUKP06dYy7rb+xcd
	L4bQ==
X-Received: by 10.152.9.37 with SMTP id w5mr13222017laa.43.1441117711304;
	Tue, 01 Sep 2015 07:28:31 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id ok2sm4816799lbb.0.2015.09.01.07.28.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 07:28:29 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>,
	Robert Yang <liezhi.yang@windriver.com>,
	Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	Nathan Rossi <nathan.rossi@xilinx.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Tue,  1 Sep 2015 16:28:27 +0200
Message-Id: <1441117708-7744-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/2] python3: Fix python-distutils variables
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
X-List-Received-Date: Tue, 01 Sep 2015 14:28:33 -0000

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
 meta/recipes-devtools/python/python3_3.4.3.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index 6c2e21d6a9c2..f61d278d79d4 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -184,8 +184,10 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 py_package_preprocess () {
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


