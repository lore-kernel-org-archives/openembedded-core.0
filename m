Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 541057E39A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:51 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 196so651154pgc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gm1k5jekUgR2pAzcvu3oEbZUelW7kgNcMvAlVDFzXzk=;
	b=rbBevzE3A0wOBIZW5vsdL4Oet83714cBlCCeKRF5545Wz0V8rPc1TjZA0X0d5c3DUv
	GfMHCE2uAsQADxIuqf5LIuYRfvikkzC/OCMcbAuHxYWHb+pp5OM66eCPCW2hgiiufnt6
	b0SOE8XPEilOGPWlLnBSv4mRZeWd3vCCNfxqVaKZ3dwqMjJ/6HlFhEufQsEW099DUT6F
	Ai1qInbsmHpMagYsfx05KA9NunBGQBbXhP900qXL/q12BBm8WTEh17VnJgw84hGhLOvi
	W8VQUdo0jDAy5Nku/vne7rbU7HqKTKUNlo+JquNQpeGLhmbeR1ZFyHGT3qkkB9vptJje
	ebZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gm1k5jekUgR2pAzcvu3oEbZUelW7kgNcMvAlVDFzXzk=;
	b=rtHtUBc+EPxDDKPvbps1hLidW5lHbF9ADjg2qsWv68sDdZzo3LV9QeozTXQiJwmEtd
	1GWqIIORyj1TJFeOBg/Hu52bziNwmYxjkr02vQwOAgK0Dq3H6/VFX95r3QC2kIgDTmaz
	NskHm8Pz0tWhBeYversp/7nTd1XEzmW6UN0B18G7orwJjvWkHw3vSpa5Efq7m4fIeoRB
	eVZbkybAhfY4KqP3+0NoVvzyHhAZkWhPoywhOWpT25NElQk9kvxO/9FE2kKbvVMBl+Go
	VDbGBQDuT3KFgY19qrcJZKzl6LKze09KNV/k5uQupwLQQOnAcPABpWGd1q8+zjm+eM27
	echg==
X-Gm-Message-State: APjAAAWRqYt7uhuRYSMS+o8KA/SDns9a0JB632XT3RrMvtyIh4svSq4q
	pkXzIvTR1h1y7zFaFPWvAUEe2JHI
X-Google-Smtp-Source: APXvYqw4dKD3Rt0T3KnyhSWcub3LzbxJyKD8rBlSSLNKLgQ3JvhjYg7veah/iS+xkFHyMiyt+qJ7XA==
X-Received: by 2002:a63:480f:: with SMTP id v15mr12563565pga.373.1559137847615;
	Wed, 29 May 2019 06:50:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:36 -0700
Message-Id: <1559137838-8972-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 7/9] nettle: fix ptest failure
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
X-List-Received-Date: Wed, 29 May 2019 13:50:51 -0000

From: Mingli Yu <Mingli.Yu@windriver.com>

Remove dlopen-test.patch which originally used
to fix the test dlopen-test, but autually the
patch didn't resolve the issue as dlopen-test.patch
supposes the file /usr/lib/libnettle.so exists.
Instead deploy ${D}${PTEST_PATH}/libnettle.so to
fix the dlopen-test failure.

Update the initialization for the salt to fix
below Segmentation fault and also nettle-pbkdf2-test
failure.
 # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
 [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
 [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
 Segmentation fault

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...kdf2.c-change-the-initialization-for-salt.patch | 39 ++++++++++++++++++++++
 .../nettle/nettle-3.4.1/dlopen-test.patch          | 20 -----------
 meta/recipes-support/nettle/nettle_3.4.1.bb        |  9 ++---
 3 files changed, 44 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch
 delete mode 100644 meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch

diff --git a/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch b/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch
new file mode 100644
index 0000000..713823e
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch
@@ -0,0 +1,39 @@
+From 7510ee2877368464ecce7de515ce056e08c75245 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 12 Apr 2019 10:30:14 +0800
+Subject: [PATCH] nettle-pbkdf2.c: change the initialization for salt
+
+use malloc and strncpy altogether to replace
+strdup for salt initialization to fix below
+Segmentation fault:
+ # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
+ [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
+ [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
+ Segmentation fault
+
+Upstream-Status: Submitted[http://lists.lysator.liu.se/pipermail/nettle-bugs/2019/007467.html]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tools/nettle-pbkdf2.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/nettle-pbkdf2.c b/tools/nettle-pbkdf2.c
+index 1f0a301..000acd3 100644
+--- a/tools/nettle-pbkdf2.c
++++ b/tools/nettle-pbkdf2.c
+@@ -141,7 +141,10 @@ main (int argc, char **argv)
+       return EXIT_FAILURE;
+     }
+ 
+-  salt = strdup (argv[0]);
++  salt = malloc (strlen(argv[0]) + 1);
++  if (! salt)
++     die ("Failed to allocate memory for salt\n");
++  strncpy(salt, argv[0], sizeof(salt) - 1);
+   salt_length = strlen(argv[0]);
+   
+   if (hex_salt)
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
deleted file mode 100644
index c4f0b7e..0000000
--- a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Replace relative path of libnettle.so with absolute path so the test
-program can find it.
-Relative paths are not suitable, as the folder strucure for ptest
-is different from the one expected by the nettle testsuite.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000 -0700
-+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860 -0700
-@@ -9,7 +9,7 @@
- main (int argc UNUSED, char **argv UNUSED)
- {
- #if HAVE_LIBDL
--  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
-+  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
-   int (*get_version)(void);
-   if (!handle)
-     {
diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
index dd49c30..612e058 100644
--- a/meta/recipes-support/nettle/nettle_3.4.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -14,12 +14,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
+           file://0001-nettle-pbkdf2.c-change-the-initialization-for-salt.patch \
            "
 
-SRC_URI_append_class-target = "\
-            file://dlopen-test.patch \
-            "
-
 SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
 SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
 
@@ -47,6 +44,10 @@ do_install_ptest() {
         # tools can be found in PATH, not in ../tools/
         sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+        # libnettle.so is needed for dlopen-test
+        if [ -f ${D}${libdir}/libnettle.so.6.* ]; then
+            cp ${D}${libdir}/libnettle.so.6.* ${D}${PTEST_PATH}/libnettle.so
+        fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


