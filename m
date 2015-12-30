Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6B4260616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 01:39:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBU1dCZ2016043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 17:39:12 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Dec 2015 17:39:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Dec 2015 17:39:11 -0800
Message-ID: <fdc1036bf695c32d2c515815968924464f3c054e.1451439524.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451439524.git.liezhi.yang@windriver.com>
References: <cover.1451439524.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python3: fix installed-vs-shipped when 64bit + multilib
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
X-List-Received-Date: Wed, 30 Dec 2015 01:39:12 -0000
Content-Type: text/plain

Fixed:
python3-3.5.0: python3: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.5
  /usr/lib/python3.5/config-3.5m
  /usr/lib/python3.5/config-3.5m/python.o
  /usr/lib/python3.5/config-3.5m/Setup.local
  /usr/lib/python3.5/config-3.5m/Setup
  /usr/lib/python3.5/config-3.5m/python-config.py
  /usr/lib/python3.5/config-3.5m/install-sh
  /usr/lib/python3.5/config-3.5m/config.c.in
  /usr/lib/python3.5/config-3.5m/makesetup
  /usr/lib/python3.5/config-3.5m/Setup.config
  /usr/lib/python3.5/config-3.5m/config.c
  /usr/lib/python3.5/config-3.5m/Makefile
  /usr/lib/python3.5/config-3.5m/libpython3.5m.a
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
python3: 14 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3/configure.ac-fix-LIBPL.patch    |   30 ++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.0.bb      |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch

diff --git a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
new file mode 100644
index 0000000..97214f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
@@ -0,0 +1,30 @@
+From 7c4f8d87473d6238c120ec6031b58f83a17a39a5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 28 Dec 2015 22:52:06 -0800
+Subject: [PATCH] configure.ac: fix LIBPL
+
+Use LIBDIR rather than prefix/lib, so that it would work when lib64.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 63aef8e..aefb27f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4366,7 +4366,7 @@ AC_MSG_RESULT($LDVERSION)
+ 
+ dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
+ AC_SUBST(PY_ENABLE_SHARED)
+-LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
++LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
+ AC_SUBST(LIBPL)
+ 
+ # Check whether right shifting a negative integer extends the sign bit
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python3_3.5.0.bb b/meta/recipes-devtools/python/python3_3.5.0.bb
index a5663a1..d5e26ff 100644
--- a/meta/recipes-devtools/python/python3_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3_3.5.0.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://use_packed_importlib.patch \
+            file://configure.ac-fix-LIBPL.patch \
            "
 SRC_URI[md5sum] = "d149d2812f10cbe04c042232e7964171"
 SRC_URI[sha256sum] = "d6d7aa1634a5eeeca6ed4fca266982a04f84bd8f3945a9179e20b24ad2e2be91"
-- 
1.7.9.5


