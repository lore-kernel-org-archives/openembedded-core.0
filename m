Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D80D1731AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:49 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cy9so418763997pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vriqLWQh/tLn/GnzvSXgCNmJQVH3m4VMIeXT08hN+PI=;
	b=mqWap5728xl6Qdsi6NFcz43r8/js4g1Lx62oIL1mo9EQMraSsdbjgMRj1yh4dnPClv
	v/QRyn3b7zxK60J8gA0vRR/PcYsDF3QaFJ9oy8NriL6dRxYMd/XQI00tppERYTCIeysg
	HubD4ajJv/Q8TmYNxdMSW8Kr5/t4fVBJbcs0hhLcpFjvTpg1v72NTqhAlZ0PZ6I273dl
	Ix6BC9d3rx/+9UzXRNNOeamPRGktwFij1IoKXA+Ei9mRXcBlcufIkL2bAmhwPCoSj/PF
	MPBYXJuycNpVExxJ7O/8AOk5BS+XVh5uGqW/d2zzQqcdTWcQI4WQhcoBs7oRhovSlEq9
	kiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vriqLWQh/tLn/GnzvSXgCNmJQVH3m4VMIeXT08hN+PI=;
	b=bPT7hULMxsqPxzLAh46RNGCgxtDHI8UYnd2bvrWIBiH3mBFCLUYdOF+hK581jNG3Lc
	rIMSC08LR/BScxQxpqxM/YrWGuqvnTVrKZy3+kdKRbTOz4N3Q5kcQBpIO0pzmOyEtELJ
	JlZ4XowcltevD5Q9aoyNWrJALHiLuoxmdAo7o/27Ey38WD9YqNOH4Sg9bguVXf+arLah
	/4PoDBHWe7nttVX0YlPAWCrmm+8Z5vmGs4/oUlwN4kXcgBaon5hBdIi0WPsctl35reMq
	Xf+9uKC+ONIC6CgEbKG3MaqFZtmxYIcTF7VcrKp0E6Wmqo5qMaO0mJ2uxjNgEgAe9XwZ
	9qEg==
X-Gm-Message-State: ALoCoQmeAkhfXXV05k3WNBS9WJUXf/Hil3y/MQASauu6HgVUcSi1EPLluorxV0XWzdvfDg7WpGr3/haMMZguvZS8j+DsFJRRBQ==
X-Received: by 10.66.117.199 with SMTP id kg7mr28560786pab.105.1453030670918; 
	Sun, 17 Jan 2016 03:37:50 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:30 -0800
Message-Id: <3193cc140b0cb51b07ae9307e5c8048a32bbdf2c.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 57/73] dosfstools: Correct cross-compile CFLAGS and fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:50 -0000

enable largefile support if its in DISTRO_FEATURES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-mkfs.fat-fix-incorrect-int-type.patch     | 46 ++++++++++++++++++++++
 .../dosfstools/dosfstools/largefile.patch          | 19 +++++++++
 .../dosfstools/dosfstools_3.0.28.bb                |  7 +++-
 3 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/largefile.patch

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch b/meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
new file mode 100644
index 0000000..3497ca5
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
@@ -0,0 +1,46 @@
+From 3b95786af13e28157d889bd90a384ee255f2d91d Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 16 Aug 2015 15:55:43 +0200
+Subject: [PATCH] mkfs.fat: fix incorrect int type
+
+u_int32_t is not a stanard type, while uint32_t is. This fixes builds
+with the musl C library, which only defines so-called "clean" headers;
+build failures are like (back-quotes and elision manually added for
+readability):
+
+    http://autobuild.buildroot.org/results/a09/a0923d7f6d4dbae02eba4c5024bbdae3a52aa85a/build-end.log
+
+    /home/peko/autobuild/instance-1/output/host/usr/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE \
+        -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_GNU_SOURCE -D_LARGEFILE_SOURCE \
+        -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -c -o mkfs.fat.o src/mkfs.fat.c
+    src/mkfs.fat.c: In function 'main':
+    src/mkfs.fat.c:1415:18: error: 'u_int32_t' undeclared (first use in this function)
+         volume_id = (u_int32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec); [...]
+                      ^
+    src/mkfs.fat.c:1415:18: note: each undeclared identifier is reported only once for each
+    function it appears in
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Andreas Bombe <aeb@debian.org>
+---
+Upstream-Status: Backport
+
+ src/mkfs.fat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mkfs.fat.c b/src/mkfs.fat.c
+index b38d116..dddbe24 100644
+--- a/src/mkfs.fat.c
++++ b/src/mkfs.fat.c
+@@ -1412,7 +1412,7 @@ int main(int argc, char **argv)
+ 
+     gettimeofday(&create_timeval, NULL);
+     create_time = create_timeval.tv_sec;
+-    volume_id = (u_int32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec);	/* Default volume ID = creation time, fudged for more uniqueness */
++    volume_id = (uint32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec);	/* Default volume ID = creation time, fudged for more uniqueness */
+     check_atari();
+ 
+     printf("mkfs.fat " VERSION " (" VERSION_DATE ")\n");
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/largefile.patch b/meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
new file mode 100644
index 0000000..7f7d835
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
@@ -0,0 +1,19 @@
+defer setting largefile flags to build makery
+in a cross build we can not do runtime config tests
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate[Cross compile Specific]
+Index: dosfstools-3.0.28/Makefile
+===================================================================
+--- dosfstools-3.0.28.orig/Makefile
++++ dosfstools-3.0.28/Makefile
+@@ -27,8 +27,7 @@ SBINDIR = $(PREFIX)/sbin
+ DOCDIR = $(PREFIX)/share/doc
+ MANDIR = $(PREFIX)/share/man
+ 
+-#OPTFLAGS = -O2 -fomit-frame-pointer -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
+-OPTFLAGS = -O2 -fomit-frame-pointer -D_GNU_SOURCE $(shell getconf LFS_CFLAGS)
++OPTFLAGS = -O2 -fomit-frame-pointer
+ #WARNFLAGS = -Wall -pedantic -std=c99
+ WARNFLAGS = -Wall -Wextra -Wno-sign-compare -Wno-missing-field-initializers -Wmissing-prototypes -Wstrict-prototypes -Wwrite-strings
+ DEBUGFLAGS = -g
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
index addcbf6..6fc3e41 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
@@ -9,12 +9,17 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz"
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz \
+           file://largefile.patch \
+           file://0001-mkfs.fat-fix-incorrect-int-type.patch \
+          "
 SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
 SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
+CFLAGS += "-D_GNU_SOURCE ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+
 FILES_${PN} = "${base_sbindir}"
 FILES_${PN}-doc = "${mandir} ${docdir}"
 
-- 
2.7.0


