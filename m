Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TvnIB-0004HI-F5
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 12:06:04 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 0C538D22E8; Thu, 17 Jan 2013 11:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BB09BD22B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 11:50:13 +0100 (CET)
Message-ID: <50F7D75F.5020207@linaro.org>
Date: Thu, 17 Jan 2013 11:50:07 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Automatic generation of circular deps sucks
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
X-List-Received-Date: Thu, 17 Jan 2013 11:06:07 -0000
X-Groupsio-MsgNum: 33944
Content-Type: multipart/mixed; boundary="------------020507010402040507020907"

--------------020507010402040507020907
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As part of work I need to get libelf and libdwarf in one rootfs. So I
started with split of elfutils into separate packages. After some
rebuilds and checking how it got sorted out in Debian I got version in
attachment working.

So I started build of rootfs:

|  * check_data_file_clashes: Package libdw-dev wants to install file
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/genericarmv8-oe-linux/linaro-image-sdk/1.0-r2/rootfs/usr/include/dwarf.h
|       But that file is already provided by package  * libdwarf-dev

WTH? was my first though. So I checked deeper...

Libdwarf (recipe) DEPENDS on elfutils and gives static library in
libdwarf-staticdev package, headers in libdwarf-dev package. OK, it
works. So I looked at dependencies of resulting packages.

Why libdwarf-dev recommends elfutils-dev is beyond my knowledge...

In effect installing libdwarf-dev fetches elfutils-dev which fetches
libdw-dev which conflicts with libdwarf-dev. Magically without any
RRECOMMENDS_${PN}-dev = "elfutils-dev" in libdwarf recipe...

What is wrong and how to fix it?

--------------020507010402040507020907
Content-Type: text/x-diff;
 name="0001-elfutils-split-libraries-into-separate-packages.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-elfutils-split-libraries-into-separate-packages.patch"

From d0b2edecbe66e6e9721f14ac84abdf8e8c82cad4 Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 17 Jan 2013 11:44:40 +0100
Subject: [PATCH] elfutils: split libraries into separate packages

libdw-dev conflicts with libdwarf-dev

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 45931b0..8bd32f8 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -66,7 +66,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-PACKAGES =+ "${PN}-binutils"
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdw-dev libasm-dev libelf-dev"
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
     ${bindir}/eu-ld \
@@ -75,11 +75,16 @@ FILES_${PN}-binutils = "\
     ${bindir}/eu-size \
     ${bindir}/eu-strip"
 
+FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
+FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
+FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
+FILES_libelf-dev = "${libdir}/libelf.so ${includedir}"
+FILES_libasm-dev = "${libdir}/libasm.so ${includedir}/elfutils/libasm.h"
+FILES_libdw-dev  = "${libdir}/libdw.so  ${includedir}/dwarf.h ${includedir}/elfutils/libdw*.h"
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
-FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
-FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
+#FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
+#FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
 
 # The package contains symlinks that trip up insane
-INSANE_SKIP_${PN} = "dev-so"
-
+INSANE_SKIP_libdw = "dev-so"
-- 
1.8.0


--------------020507010402040507020907--
