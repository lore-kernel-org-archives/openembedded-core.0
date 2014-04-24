Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5E22865D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:19:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3O9JnPR005494 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:19:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8s-dgxTjMpyP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:19:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3O9Jlna005472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:19:49 +0100
Message-ID: <1398331182.16672.175.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:19:42 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-cross: Improve handling of unwind.h
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
X-List-Received-Date: Thu, 24 Apr 2014 09:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rather than building the whole of libgcc to obtain the unwind.h header
file, simply configure it and then install the file. This avoids copying
chunks of data around when we don't need to and building the same thing
twice.

After doing this we need to make sure the target build directory exists
in the libgcc case since it will no longer be created automatically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index c320600..855ec26 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -71,7 +71,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
 	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
 	   file://0050-PR-target-58595.patch \
-	   file://0051-fix-unwind-race.patch \
 	  "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 165230b..27ebcf6 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -41,7 +41,7 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
-	oe_runmake all-host all-target-libgcc
+	oe_runmake all-host configure-target-libgcc
 	# now generate script to drive testing
 	echo "#!/usr/bin/env sh" >${B}/${TARGET_PREFIX}testgcc
 	set >> ${B}/${TARGET_PREFIX}testgcc
@@ -141,6 +141,7 @@ INHIBIT_PACKAGE_STRIP = "1"
 BINRELPATH = "${@os.path.relpath(d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
 
 do_install () {
+	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h )
 	oe_runmake 'DESTDIR=${D}' install-host
 
 	install -d ${D}${target_base_libdir}
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index c4ab885..b30bcfe 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -7,6 +7,7 @@ do_configure () {
 	install -d ${D}${base_libdir} ${D}${libdir}
 	hardlinkdir ${STAGING_INCDIR_NATIVE}/${LIBGCCBUILDTREENAME}$target/ ${B}
 	mkdir -p ${B}/${BPN}
+	mkdir -p ${B}/$target/${BPN}/
 	cd ${B}/${BPN}
 	chmod a+x ${S}/${BPN}/configure
 	${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}



