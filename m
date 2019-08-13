Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 966537D597
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 15:28:48 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d1so18618323pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vr/HY++EfVnGGPPfkgA0b+2r+JHnEWSnE65TX0VBuoA=;
	b=GppsPwpKoMmC6pYgO9tGHbAPFxefw5u87uHc+ZaxLHTtmyumWe68PGLfBuUTqKzIql
	kchwAPssQmonxxrPUUSv7ROMI5KEv3BCD54YAcorVj8Zl235gHH8QJquFu0Oju2+jBX+
	aKR+z9yWo5f2LWdZasd9vkE2DHrB65TZ5TKJPDnRuhnTRCIAjxMla0//abEoPeVgnlYd
	lqT47PZ2Ws5n/AWEmEzmcYgzdGzK47CCDRyzeKqCbYEEPctBn7cjCGceUJJk2zdQHsx6
	bVdYioQzxcARRcZ+c23tbKFN+XdZwDas5xBOkC1iJSGHo/5/oMcfQSHISB5nVHzRGktL
	pQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vr/HY++EfVnGGPPfkgA0b+2r+JHnEWSnE65TX0VBuoA=;
	b=G3SvS+sNyZCdd140fE6Xxcvu2NNHHq6xb+lyOH+G45wquf1iV314r+UvDWgseezh4p
	dFemNDuPuXh5AkXiFLc6IXox6noeZ37NC4c2zuSvHb3FD6PmZTmzgvurkAu330LlK9/P
	ezr8gRSG9S1+YVHxSxd7Gy70XvM8/bResvszxCHfPXML0W0LLfugXEcp7XzX00D/XEIJ
	3x1W+Z5nvJBDmRVbHBJOWbO3uhpmOyGUom7h28VpS7U2MKdfdTkLPHgujVrch6UrzRVg
	7eCalAr3/1hoqyX2PCJsqIEH9WhusJBYo++J9Cxejgwg7LJNGt3rIm9W8F6DEZpucA/G
	noYg==
X-Gm-Message-State: APjAAAXm60wo1oYoztH9ZwbcQR9mkcBLpxs1UIFNW2AWouwvbuIbCKZ1
	aGK7d2Qw4kEnfUJfQ+1pG1uVuKNUg1U=
X-Google-Smtp-Source: APXvYqzuWptQQi+L9nAdg9JJ+HA9VPP6nZtLD46WduKCfF7gc1kqZVsRFZQ/cSLC5qg3+/npIRWxwA==
X-Received: by 2002:a65:5183:: with SMTP id h3mr35065709pgq.250.1565710129008; 
	Tue, 13 Aug 2019 08:28:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f72sm2069924pjg.10.2019.08.13.08.28.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 08:28:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 08:28:35 -0700
Message-Id: <20190813152835.12578-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V2] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Tue, 13 Aug 2019 15:28:48 -0000
Content-Transfer-Encoding: 8bit

OE does not use the traditional /usr/lib/gcc prefix to store gcc-runtime
it basically is moved into libdir, however some newer files were
installed by newer versions of gcc especially libgomp ( omp.h openacc.h )
into gcclibdir, so we have content in both directories, this confuses
other tools which are trying to guess the gcc installation and its
runtime location, since now we have two directories, the tools either
choose one or other and we get inconsistent behavior, e.g. clang for
aarch64 uses /usr/lib but same clang for riscv64 chose /usr/lib/gcc

This change ensures that OE ends up with single valid location for gcc
runtime files

Move more common bits into common inc file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Divert packaging to use new path in whole recipe

 meta/recipes-devtools/gcc/gcc-runtime.inc    | 18 +++++++++++++++---
 meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 10 ----------
 meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 10 ----------
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index a5c2600d7f..22c1d78dd1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,12 @@ EXTRA_OECONF_PATHS = "\
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 
+# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
+EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
+
+# Building with thumb enabled on armv6t fails
+ARM_INSTRUCTION_SET_armv6 = "arm"
+
 RUNTIMELIBITM = "libitm"
 RUNTIMELIBITM_arc = ""
 RUNTIMELIBITM_mipsarch = ""
@@ -77,6 +83,11 @@ do_install () {
 		cd ${B}/${TARGET_SYS}/$d/
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
 	done
+	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
+		install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include 
+		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
+	fi
 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
@@ -205,7 +216,7 @@ FILES_libssp-dev = "\
     ${libdir}/libssp*.so \
     ${libdir}/libssp*_nonshared.a \
     ${libdir}/libssp*.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/ssp \
 "
 SUMMARY_libssp-dev = "GNU stack smashing protection library - development files"
 FILES_libssp-staticdev = "${libdir}/libssp*.a"
@@ -214,7 +225,7 @@ SUMMARY_libssp-staticdev = "GNU stack smashing protection library - static devel
 FILES_libquadmath = "${libdir}/libquadmath*.so.*"
 SUMMARY_libquadmath = "GNU quad-precision math library"
 FILES_libquadmath-dev = "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/quadmath* \
     ${libdir}/libquadmath*.so \
     ${libdir}/libquadmath.la \
 "
@@ -239,7 +250,8 @@ FILES_libgomp-dev = "\
     ${libdir}/libgomp*${SOLIBSDEV} \
     ${libdir}/libgomp*.la \
     ${libdir}/libgomp.spec \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
 SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library - development files"
 FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
index a1c7a76d0b..dd430b57eb 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
@@ -1,12 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-runtime.inc
-
-# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
-EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
-
-FILES_libgomp-dev += "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
-"
-
-# Building with thumb enabled on armv6t fails
-ARM_INSTRUCTION_SET_armv6 = "arm"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
index a1c7a76d0b..dd430b57eb 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
@@ -1,12 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-runtime.inc
-
-# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
-EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
-
-FILES_libgomp-dev += "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
-"
-
-# Building with thumb enabled on armv6t fails
-ARM_INSTRUCTION_SET_armv6 = "arm"
-- 
2.22.0


