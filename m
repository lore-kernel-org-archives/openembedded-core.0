Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB5D7964D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:15:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r1-v6so14107924wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=M6d6AxbpsPG212mwO6vC6M4bg194Ke9Mi63JvScSDZ4=;
	b=FL0MATUcbk9E+FPc5ePMcIZG9n7Lad0zniYKTBvHOd8+fWbZXPdiO6ZIBfsHNrDA9G
	iJ43J7eY/YvRvUR4+kQTJUAuoB9QUkuzia0P/dPIUWBNaRSx36maRUTcXfDlnkEuDxzR
	DRhM2Uh6Vi4LUotghJqmc/rI3D7IzQpNyXwsggF5PMExtlbFtUKFWqoTDdgWG+JJEkib
	BfA7z4KNO1HE7FKLXT+LGCSwkM4G0GxChiyXS57xmU8rWPv/FmFWZbtGuS2QDOGIakwC
	tIc/ijF3wR8+6dFF73obZr7upglil6IVX1ul/JPH+LP2ncKPryIRrleWjxx+F2XgJR4i
	rcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M6d6AxbpsPG212mwO6vC6M4bg194Ke9Mi63JvScSDZ4=;
	b=PHlBeRvKoFll42FQwWHsY44H8624ctzyX7vT4dYGnLomK2htmCkCed+GxemOB1AMWS
	iIlkwJiKc5pISOmvUTC6KkXBD1Xzf4BMAyxIeac76rpmy1euodYE+iIXYHOleBoX+ymS
	TDAsYVDWaz8AeSBTCFJLLOoHcLLhB7F6RkyOWXW3/aHiC/PoSCtyFheXRRZ8VbGnQwL1
	1J1uL5oAIJdbn7GlytO/TUwfs47nNPx0J6lPvh1C2F/pM+23X2A/7S9m6YpVrLYmWqoi
	sG0Xz0UAphiEKkmG6Bpe+agc9VRIp2+1vdMh/nrdxTUYEQPN9FXC0S1k/d5D3NYn6NHf
	ck0w==
X-Gm-Message-State: APzg51CQsoe/A0RGhUZgBKwtylsFuIKSZ83S5aMBGxlAZQ+DoH2pFKvx
	39+atdb5+3y49BKiGdzHECNc/epW+mU=
X-Google-Smtp-Source: ANB0VdY7MAaW8y2a3KOBbyrVqt2HcdX5cBatj5tQ8L2rMsC90endz46icYotFq2LBwVCFD6QPSZ7dA==
X-Received: by 2002:a1c:2108:: with SMTP id
	h8-v6mr1745246wmh.108.1536232525863; 
	Thu, 06 Sep 2018 04:15:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm5519173wrr.68.2018.09.06.04.15.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:15:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:15:17 +0100
Message-Id: <20180906111521.20997-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/5] python3: generalise make commands
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
X-List-Received-Date: Thu, 06 Sep 2018 11:15:25 -0000

We're repeating the same make invocation over and over, twice without setting
OPT=${CFLAGS} which doesn't seem right.

Centralise the make invocation to clean up the tasks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 48 +++++++++------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 9e31fa6f299..8e94e38a2d5 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -95,6 +95,18 @@ do_configure_append() {
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
 }
 
+run_make() {
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		OPT="${CFLAGS}" \
+		"$@"
+}
+
 do_compile() {
         # regenerate platform specific files, because they depend on system headers
         cd ${S}/Lib/plat-linux*
@@ -125,14 +137,7 @@ do_compile() {
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
-        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-                STAGING_LIBDIR=${STAGING_LIBDIR} \
-                STAGING_INCDIR=${STAGING_INCDIR} \
-                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-                LIB=${baselib} \
-                ARCH=${TARGET_ARCH} \
-                OPT="${CFLAGS}" profile-opt
+    run_make profile-opt
 
         if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
                 qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
@@ -145,14 +150,7 @@ EOF
                 ./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
 	fi
 
-        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-                STAGING_LIBDIR=${STAGING_LIBDIR} \
-                STAGING_INCDIR=${STAGING_INCDIR} \
-                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-                LIB=${baselib} \
-                ARCH=${TARGET_ARCH} \
-                OPT="${CFLAGS}" clean_and_use_profile
+    run_make clean_and_use_profile
 }
 
 do_install() {
@@ -165,23 +163,9 @@ do_install() {
 
 	# rerun the build once again with original makefile this time
 	# run install in a separate step to avoid compile/install race
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		LIB=${baselib} \
-		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
+	run_make DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
 	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		LIB=${baselib} \
-		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir} install
+	run_make DESTDIR=${D} LIBDIR=${libdir} install
 
 	# avoid conflict with 2to3 from Python 2
 	rm -f ${D}/${bindir}/2to3
-- 
2.11.0


