Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 47EFB76802
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:42 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id 6so270213908qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nt1xYDqE3cSkBi/Oc7F3rCuUtfeCXL92fUlrytgzZbA=;
	b=DyHSSeiV4qDOLn1r3UK4Jixm0EqlvW1RFSgU4CzpL2tzQ56wn6R3c4USJA13g21E8N
	OR9bpkAwCepV8g30QJAGOUIpVc6HBClINKp5vsBSU2dBNimAj/eGC5eoQuTBLwUXHzGu
	vQtToMGL5dkFUh63kz98dGB/ndtlRVxU/Ooxe82qTHwsTNaUfQ22wFbrGCrfB3DILAUi
	ovOr1re8vIBKlsUzdHsOtDkZcXvOPRcYqiViw7wViF8wPGsDPlE0/Fu7tWuBA3M09ATJ
	lVV492uzS0UQtX2mYWo41xWi4hrYFFzAdKbqBi4czXGYXy6oWxqoTILbsGYbQ8ezELDZ
	Ul0w==
X-Received: by 10.140.231.137 with SMTP id b131mr128827189qhc.63.1452248382905;
	Fri, 08 Jan 2016 02:19:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:51 +0000
Message-Id: <29990369744ee6e7d9c86b3b3f051a0d75e60b50.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 23/53] libdrm: Upgrade 2.4.65 -> 2.4.66
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:42 -0000

Fix test build failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tests-kms-steal-crtc-Include-sys-select.h.patch | 33 ++++++++++++++++++++++
 .../recipes-graphics/drm/libdrm/installtests.patch | 24 +++++-----------
 .../drm/{libdrm_2.4.65.bb => libdrm_2.4.66.bb}     |  8 ++++--
 3 files changed, 45 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.65.bb => libdrm_2.4.66.bb} (86%)

diff --git a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch b/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
new file mode 100644
index 0000000..c18228e
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
@@ -0,0 +1,33 @@
+From 46fb5516fb0ab17bcf46a0306a11e8966bb36e14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Dec 2015 22:17:21 +0000
+Subject: [PATCH] tests/kms-steal-crtc: Include sys/select.h
+
+Fixes errors e.g.
+
+error: implicit declaration of function 'select'
+
+and missing definitions of FD_* defines
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ tests/kms/kms-steal-crtc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/kms/kms-steal-crtc.c b/tests/kms/kms-steal-crtc.c
+index 2f7f327..24d70ab 100644
+--- a/tests/kms/kms-steal-crtc.c
++++ b/tests/kms/kms-steal-crtc.c
+@@ -31,6 +31,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <sys/select.h>
+ 
+ #include <drm_fourcc.h>
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
index f460ef5..30e0a61 100644
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
@@ -4,22 +4,12 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
-Index: libdrm-2.4.65/tests/Makefile.am
+Index: libdrm-2.4.66/tests/Makefile.am
 ===================================================================
---- libdrm-2.4.65.orig/tests/Makefile.am
-+++ libdrm-2.4.65/tests/Makefile.am
-@@ -29,9 +29,11 @@ AM_CFLAGS = \
- 
- LDADD = $(top_builddir)/libdrm.la
- 
--check_PROGRAMS = \
--	dristat \
--	drmstat
-+bin_PROGRAMS = \
-+        dristat \
-+        drmstat
-+ 
-+check_PROGRAMS =
- 
- dristat_LDADD = -lm
+--- libdrm-2.4.66.orig/tests/Makefile.am
++++ libdrm-2.4.66/tests/Makefile.am
+@@ -73,3 +73,4 @@ TESTS +=					\
+ endif
  
+ check_PROGRAMS += $(TESTS)
++bin_PROGRAMS = $(check_PROGRAMS)
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.65.bb b/meta/recipes-graphics/drm/libdrm_2.4.66.bb
similarity index 86%
rename from meta/recipes-graphics/drm/libdrm_2.4.65.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.66.bb
index e5ed260..214dccc 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.65.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.66.bb
@@ -11,10 +11,12 @@ PROVIDES = "drm"
 DEPENDS = "libpthread-stubs udev libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://installtests.patch "
+           file://installtests.patch \
+           file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
+          "
 
-SRC_URI[md5sum] = "de49916e5f8aef4eba55223c79709b05"
-SRC_URI[sha256sum] = "71960ac8bde7d710992b1bc8879935e8300a870c36bd06f22412d0447e3d96c4"
+SRC_URI[md5sum] = "c6809c48538d6e5999588832045ff014"
+SRC_URI[sha256sum] = "79cb8e988749794edfb2d777b298d5292eff353bbbb71ed813589e61d2bc2d76"
 
 inherit autotools pkgconfig
 
-- 
2.7.0


