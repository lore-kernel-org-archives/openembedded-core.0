Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EEA2F73F4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 12:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4CC34as032358; Tue, 12 May 2015 13:03:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bmS970gb35w9; Tue, 12 May 2015 13:03:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4CC2nBo032351
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 May 2015 13:03:00 +0100
Message-ID: <1431432169.30971.126.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>
Date: Tue, 12 May 2015 13:02:49 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc5: Add back g++ sysroot patch
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
X-List-Received-Date: Tue, 12 May 2015 12:03:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, g++/c++ compilation doesn't work on target due to missing
header files. Automated sanity tests fail. Add back the gcc4 patch to
address this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.1.inc
index 305736b..1d64f9e 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0035-Dont-link-the-plugins-with-libgomp-explicitly.patch \
            file://0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
            file://0037-pr65779.patch \
+           file://0038-fix-g++-sysroot.patch \
           "
 
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch
new file mode 100644
index 0000000..f024dd5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch
@@ -0,0 +1,44 @@
+Portions of
+
+http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
+
+are not upstreamed yet. So lets keep missing pieces.
+
+Upstream-Status: Pending
+
+Without this, compiling something simple like #include <limits> on target
+with c++ test.cpp fails unable to find the header. strace shows it looking in
+usr/include/xxxx rather than /usr/include/xxxx
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



