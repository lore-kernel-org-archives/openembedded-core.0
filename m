Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27AC56E57A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 03:28:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBH3SDBG015751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 19:28:14 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 16 Dec 2013 19:28:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2013 19:33:58 +0800
Message-ID: <f677358d229897036b768ab9e342a9bb5cd812b1.1387279561.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1387279561.git.liezhi.yang@windriver.com>
References: <cover.1387279561.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc-4.7/gcc: disable sdt from configure.ac to keep compatibility with configure
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
X-List-Received-Date: Tue, 17 Dec 2013 03:28:14 -0000
Content-Type: text/plain

We had disabled the sdt from configure, let's also disable it from
confgure.ac to keep them compatible.

BTW, the libstdc++-v3 of gcc-4.7 doesn't use the sdt, so we don't need
to edit libstdc++-v3/configure as gcc-4.8.

NOTE, this commit edit the patch gcc-4.7/disablesdt.patch directly.

[YOCTO #5657]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch | 44 +++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch b/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
index 8946afc..8f5b061 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
@@ -6,12 +6,15 @@ but before libgcc is compiled for example.
 RP 2012/8/7
 
 Upstream-Status: Inappropriate [hack]
+---
+ gcc/configure    | 12 ++++++------
+ gcc/configure.ac | 18 +++++++++---------
+ 2 files changed, 15 insertions(+), 15 deletions(-)
 
-Index: git/gcc/configure
-===================================================================
---- git.orig/gcc/configure	2012-08-07 21:18:42.319247701 +0000
-+++ git/gcc/configure	2012-08-07 21:19:08.939247082 +0000
-@@ -26758,12 +26758,12 @@
+diff --git a/gcc/configure b/gcc/configure
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -26817,12 +26817,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -30,3 +33,34 @@ Index: git/gcc/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
  $as_echo "$have_sys_sdt_h" >&6; }
  
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -4688,15 +4688,15 @@ if test x$gcc_cv_libc_provides_ssp = xyes; then
+ fi
+ 
+ # Test for <sys/sdt.h> on the target.
+-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
+-AC_MSG_CHECKING(sys/sdt.h in the target C library)
+-have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
+-            [Define if your target C library provides sys/sdt.h])
+-fi
+-AC_MSG_RESULT($have_sys_sdt_h)
++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
++#have_sys_sdt_h=no
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
++#            [Define if your target C library provides sys/sdt.h])
++#fi
++#AC_MSG_RESULT($have_sys_sdt_h)
+ 
+ # Check if TFmode long double should be used by default or not.
+ # Some glibc targets used DFmode long double, but with glibc 2.4
+-- 
+1.8.3.1
+
-- 
1.8.3.1


