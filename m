Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 196497C556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 23:22:45 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t14so48440664plr.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9PODyxzuVbDjnKE3WdS6foSs4XEcbqkM6OXPQ+DMvyY=;
	b=A8j4is0bepZqAAC5vjii2+0y1/VNOuHe7Rx+NkWW8g5htTbbMQ2xzoqxpx3DDX09Uz
	qot7jTygVcUGvAqSrEKtiLzsXDm2ZZ5AyS+TfYQdV/+eKifz1wcwtpw9Vv18jFcS6Lb+
	usS3DrKrjK+p5J6GESTxXMf5vRxFu633VAwqdiAfvKTSeQIwkDDxvUS9Ztum+at+8TqF
	HL3nuOzAULOI83YZlHiR1JoMaSJCGOEqlWpl/PDK+DtIyKpHxNBTexGITSuxae5o75Q4
	IKkneU5U8YJU3L1whuLNlFbtVnN8WYQlREaR8nD0spjPJLs7RSsY6Zi8YjMucS12ZkLw
	vyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9PODyxzuVbDjnKE3WdS6foSs4XEcbqkM6OXPQ+DMvyY=;
	b=k5Hlo5yNToxJn3N5QrONytK1vHyRq2lEjAOoC6gbKl8XxVXu//TAqs4DjDZqll5Zxp
	m5JfsdngDoTrGmSta1gMummdy59ObfGoN7Uujc7ulhsHWl6WgWUBynbt7amnrv+r5DWH
	C3LgC0kM1xi6A3bZcm4EcunaZ9CioqWMHEZBFU0heJiJ9qzw4nv14qETedTACeZeoL2I
	X+kU1l1Ea3iMIF6K2N20E6K5otNxSZD+5opAJ8BrfZ0JfUL91ahk0zDMRBBQKzfaEJk6
	sf3uqorcii+qKSYIHnX3UCM4UPLgstCLyx9McUCkuZO68MPD+cOvhECRy+ahGnU8II/3
	yECA==
X-Gm-Message-State: APjAAAUjLs6GPzEcdQyGc+ph7oWzqgd1Ot5QJMibdnnA1tdmhZCxd6ED
	FaCOPqTqEDZHceXX5GvwJapsV6F6T9c=
X-Google-Smtp-Source: APXvYqwx+fQck+XzH+VWhC8OaPa0fD4ZJX9p+IhGmxzm2w2+LdUcv9CrnPSuBGHWakYch2Mj0uusVQ==
X-Received: by 2002:a17:902:bd09:: with SMTP id
	p9mr10422904pls.96.1565652165651; 
	Mon, 12 Aug 2019 16:22:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	x67sm112048225pfb.21.2019.08.12.16.22.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 16:22:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 16:22:34 -0700
Message-Id: <20190812232234.41199-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Mon, 12 Aug 2019 23:22:46 -0000
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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc    | 5 +++++
 meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 3 ++-
 meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 3 ++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index a5c2600d7f..ebba774108 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -77,6 +77,11 @@ do_install () {
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
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
index a1c7a76d0b..172af4e7e1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
@@ -5,7 +5,8 @@ require gcc-runtime.inc
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 
 FILES_libgomp-dev += "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
 
 # Building with thumb enabled on armv6t fails
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
index a1c7a76d0b..172af4e7e1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
@@ -5,7 +5,8 @@ require gcc-runtime.inc
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 
 FILES_libgomp-dev += "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
+    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
 
 # Building with thumb enabled on armv6t fails
-- 
2.22.0


