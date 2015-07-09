Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8C16E648
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 17:52:46 +0000 (UTC)
Received: by iggp10 with SMTP id p10so19297258igg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+cyABgOWMWSqM38WFAdgVfD6jNlpxdCpEtwbQCbcoCE=;
	b=eShzYP/hJ1ExCTN5VsDocKGCp8cthDoYIe312zFejn6U/F4+tW1C5GL8hVoNa2QLi4
	eX50MAfFx2cNH2thLpdYjRut7+ddX3OYBt8Y8WuKPQKLKU2eC981EhS+gdtjUHB3Jr7E
	0tYpMb5gp3PaYo9mRyEY+W1xH8SVaf1QOxOmhsIUyXG6g2DHGzy7kZCSfbkkvO41C3bn
	xhW3gflJ3fLKuHUxX4xbGqNTVKhNqz2wEIofyBqG6iIqF3Qslvd9Uon9DlwsNx3cBP3c
	Wi1LpgFYNoEuIuc1ZlmOwCfktZLQRN6hgtDOQ0X8de972ZveOTJxtsCaz7uDYChduERK
	eXFw==
X-Received: by 10.107.3.33 with SMTP id 33mr959141iod.132.1436464366891;
	Thu, 09 Jul 2015 10:52:46 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	c12sm4637051ioj.39.2015.07.09.10.52.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jul 2015 10:52:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:38 -0700
Message-Id: <ba4775eeebab2aec8f81970e61903a35a46eb4ce.1436464186.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436464186.git.raj.khem@gmail.com>
References: <cover.1436464186.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gcc-4.9: Upgrade to 4.9.3
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
X-List-Received-Date: Thu, 09 Jul 2015 17:52:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upsteamed patch for
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66483 which is already in
4.9.3

rename 0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
to 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch to
keep the sequence

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              | 11 +++---
 ...BS_DIR-replacement-instead-of-hardcoding.patch} |  0
 ...racking.c-backport-from-gcc-trunk-r212178.patch | 39 ----------------------
 3 files changed, 5 insertions(+), 45 deletions(-)
 rename meta/recipes-devtools/gcc/gcc-4.9/{0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch => 0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 9ed3e09..d61eca7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "4.9.2"
+PV = "4.9.3"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "4.9.2"
+BINV = "4.9.3"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-4.9:"
 
@@ -77,11 +77,10 @@ SRC_URI = "\
     file://0059-gcc-PR-rtl-optimization-63348.patch \
     file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
     file://0061-target-gcc-includedir.patch \
-    file://0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch \
-    file://0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+    file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
 "
-SRC_URI[md5sum] = "4df8ee253b7f3863ad0b86359cd39c43"
-SRC_URI[sha256sum] = "2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd"
+SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
+SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-4.9/0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch b/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
deleted file mode 100644
index c0ea62f..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b30ffb8097749fdb55704aa7d8307ca1a58255d6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
-Date: Tue, 7 Apr 2015 16:15:11 +0200
-Subject: [PATCH] gcc/var-tracking.c: backport from gcc trunk r212178
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-resolves a bug seen on cortexa8 building qt5 libraries.
-
-2014-06-30  Joseph Myers  <joseph@codesourcery.com>
-
-    * var-tracking.c (add_stores): Return instead of asserting if old
-    and new values for conditional store are the same.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
----
- gcc/var-tracking.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/var-tracking.c b/gcc/var-tracking.c
-index 65d8285..7c38910 100644
---- a/gcc/var-tracking.c
-+++ b/gcc/var-tracking.c
-@@ -5997,7 +5997,8 @@ add_stores (rtx loc, const_rtx expr, void *cuip)
-     {
-       cselib_val *oval = cselib_lookup (oloc, GET_MODE (oloc), 0, VOIDmode);
- 
--      gcc_assert (oval != v);
-+      if (oval == v)
-+        return;
-       gcc_assert (REG_P (oloc) || MEM_P (oloc));
- 
-       if (oval && !cselib_preserved_value_p (oval))
--- 
-1.9.1
-
-- 
2.1.4


