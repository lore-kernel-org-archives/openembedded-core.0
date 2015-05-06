Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9F59373F33
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:05:08 +0000 (UTC)
Received: by iget9 with SMTP id t9so93037578ige.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 00:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BeM9cLsPR2Mk5QcG6SVh1vUoUPiMpquC45fn6iZastY=;
	b=eMwH73fYvPve5ZockxCaakAxBsA27Xx0ydpOLklsyR2Ury3aS6+uy0M+blwHTgvJTz
	kO7mwN4PFN4XYB+ZROeK1WRQYS9h0QLj135lDrTG/5hgBG6p81Us8OGUB31nonzHjmuN
	Cuk4VUNDJT2VXrXoEzxKys2OQFendl6ETH6RmhvDBvAGMYDThCGslv+udgPzGnIfFdCc
	rUbgacJMuA0Su3Qr1x7I+TfU8W+e9gFfNCWK3PqRnoPRBeed3T+/gKBWTG896dy//22q
	qv5mO9rvOpOrjHE2fyIJ4MtcQlSoJGWFaNoq9vWhfdpx7T41xuf9m4J/XNGfNO4YTgW2
	VnRg==
X-Received: by 10.42.200.8 with SMTP id eu8mr1144111icb.65.1430895909667;
	Wed, 06 May 2015 00:05:09 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id m5sm622733ioi.4.2015.05.06.00.05.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 00:05:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 00:04:57 -0700
Message-Id: <3db64b4caceded77e473a4e07d44e18dcb1c7098.1430895556.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
In-Reply-To: <cover.1430895556.git.raj.khem@gmail.com>
References: <cover.1430895556.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] gcc-4.9, gcc-5: Use variable SYSTEMLIBS_DIR instead of hardcoding it for aarch64
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
X-List-Received-Date: Wed, 06 May 2015 07:05:10 -0000

Change-Id: I54dc82a569f02d489137d88f16d6b768c4ab779b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...IBS_DIR-replacement-instead-of-hardcoding.patch | 24 +++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.1.inc              |  1 +
 ...IBS_DIR-replacement-instead-of-hardcoding.patch | 27 ++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index ee31f0b..9ed3e09 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
     file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
     file://0061-target-gcc-includedir.patch \
     file://0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch \
+    file://0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
 "
 SRC_URI[md5sum] = "4df8ee253b7f3863ad0b86359cd39c43"
 SRC_URI[sha256sum] = "2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
new file mode 100644
index 0000000..c48bd48
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -0,0 +1,24 @@
+From 861bcfd4ae814f351e0c668ee26d01d1331e0422 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:15:27 -0700
+Subject: [PATCH 36/37] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+ base_libdir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/aarch64/aarch64-linux.h
++++ gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
+@@ -21,7 +21,7 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}.so.1"
+ 
+ #define CPP_SPEC "%{pthread:-D_REENTRANT}"
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.1.inc
index d38a7d9..db4c795 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
@@ -67,6 +67,7 @@ SRC_URI = "\
            file://0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
            file://0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
            file://0035-Dont-link-the-plugins-with-libgomp-explicitly.patch \
+           file://0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
           "
 
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
new file mode 100644
index 0000000..b691946
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -0,0 +1,27 @@
+From 861bcfd4ae814f351e0c668ee26d01d1331e0422 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:15:27 -0700
+Subject: [PATCH 36/37] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+ base_libdir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 9abb252..79525ee 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,7 +21,7 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+-- 
+2.1.4
+
-- 
2.1.4


