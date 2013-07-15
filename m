Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B2EEC60686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 23:41:55 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so135815pad.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xvv5e87xkyk8JYYFZlMEXzCMZcufFomFwLZpt7A9b0s=;
	b=kTqeqY0Ibv6aykP56ojo3m9tGJVoMsOYEyiO8Z+wTCJ5MOrLfsUjUFKR43UxsMoXtN
	tVCsewwrtyKOI2y7B/nPMzWPW7dCrnABdKYR+QDnL5m9pbJcFWl5rt5vnpGRmZDNIfn9
	xIijZt8FTKnJxDebYBQfTKKNb3Q6gJ8KZLQkBFULZ3aQUL3emhuLwVa4/PcIUARGAM5u
	HpVHLgmogsXvaqIcpZ2HvCDX5l3pe8X+EDS5kMR21i4yljUjGIa34pk0uLJ2UC/c7DbI
	gwFil88AIOCifNT/nQA1Qk5a5Hcwu36AqO2aNO4bXfcGYDl0bsv433q3fvFUZbDq4Fy/
	NuXA==
X-Received: by 10.68.110.227 with SMTP id id3mr55159805pbb.106.1373931715876; 
	Mon, 15 Jul 2013 16:41:55 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id wf7sm515086pac.20.2013.07.15.16.41.54
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Jul 2013 16:41:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 16:41:42 -0700
Message-Id: <1373931703-15925-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-4.8: Fix on-device SDK C++ runtime issue
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
X-List-Received-Date: Mon, 15 Jul 2013 23:41:56 -0000

This fixes the issue where g++ is not able to
find C++ headers when sysroot is '/'

The patch needs to be upstreamed into gcc as well.

[Yocto #4812]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 .../gcc/gcc-4.8/0040-fix-g++-sysroot.patch         |   40 ++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 3219e0c..dafa241 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -69,6 +69,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0037-gcc-4.8-PR56797.patch \
 	   file://0038-gcc-4.8-build-args.patch \
 	   file://0039-gcc-4.8-PR57717.patch \
+	   file://0040-fix-g++-sysroot.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch
new file mode 100644
index 0000000..d50aa5c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch
@@ -0,0 +1,40 @@
+Portions of
+
+http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
+
+are not upstreamed yet. So lets keep missing pieces.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.8.1/gcc/configure.ac
+===================================================================
+--- gcc-4.8.1.orig/gcc/configure.ac	2013-07-15 15:55:49.488399132 -0700
++++ gcc-4.8.1/gcc/configure.ac	2013-07-15 16:02:31.772406679 -0700
+@@ -148,7 +148,9 @@
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+Index: gcc-4.8.1/gcc/configure
+===================================================================
+--- gcc-4.8.1.orig/gcc/configure	2013-07-15 15:55:49.472399132 -0700
++++ gcc-4.8.1/gcc/configure	2013-07-15 16:02:31.780406680 -0700
+@@ -3325,7 +3325,9 @@
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
-- 
1.7.9.5


