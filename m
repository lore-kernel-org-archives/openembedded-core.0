Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B53DC731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:04:33 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v186so163224388wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uF1Z1wKnMtsxE6OxOLRokbPRSUjbTE9oA6L3U4RmVug=;
	b=MahMTh9ZO5Ed6Ju6ETJ5aJi3/NxuMh/c7+2lU9RVhbVF2nQMRxDhNVabYVFFyWrRlA
	gnO23IbwbAaUW9bDVtuqw1swFqiuuvtn5PIg5wXGd0395nbcykUWqY8CFNCbO5GDNYr9
	nkao1IdrnPqH3hIvbAcKf7H5LxXZ0+hS0vArTIC1flJ/M8QtAkA68lBCLPR/R+ruWcVv
	uCJukBfk9TK+bsfh+M8DL5j4ySHHn9lOAEEOuXZwoJ615FQmO08cO2fjuBf2P63i7/8f
	Fx5zzViVMVehQSrBrtB0M3jJFQK1CHe7VXLfhEbM7MBOBFJcdx1RWDVdCJHUNyEYJVu1
	kD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uF1Z1wKnMtsxE6OxOLRokbPRSUjbTE9oA6L3U4RmVug=;
	b=FQIoILBeGUe9blykZD7zDD2vz2oS8AygVXXKD7HBdtM4lrlt1XCKB5Fx8Tgw8xkX35
	9QzXp4PIks0/HZ2dojZdTeTUKz+zTxH/1jseTNx6qI3P0vG2NEZPmtJLnN534wwzO7CK
	GpG886dufZkihYvQt8Z9gM+6Mkgr3uW+9WpmoVxIbAZIz44w+eWoT82sJYQNGJWusYo4
	mc7+FjMjh7jCEO4G07ZezyLxuta+3tRzWfWtACufbwCjNwo4q4wHGAkBg0iEbtsoAMLM
	1/mm/RQd4SxhUrhTpu1zzG0uUmFAyrv9jXXCypV7bMQgbPwS7CZSN8LMwhhzC984s7EM
	6PWg==
X-Gm-Message-State: AMke39kvnZa2Dygjr57H/xRCpLgrQdWvF7Okn8++fGc/vdb/l8BjO4LNBSeaoJrNYi18aWnw
X-Received: by 10.28.224.213 with SMTP id x204mr18632631wmg.82.1487005472863; 
	Mon, 13 Feb 2017 09:04:32 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	h75sm14579707wrh.37.2017.02.13.09.04.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 09:04:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:04:28 +0000
Message-Id: <1487005468-30797-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] slang: rewrite recipe to run autoconf
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
X-List-Received-Date: Mon, 13 Feb 2017 17:04:35 -0000

I discovered that we were not running autoreconf (and cannot due to the
unconvential file structure upstream), so manually run autoconf and move the
generated configure to the right place as we do already for gnu-configize.

Update no-x.patch (now that it is actually being used) so that it doesn't break
the build.

Patch out the use of INST_LIB_DIR in slsh/Makefile.in as this is the *target*
path, so is inappropriate to link to. This means we can remove the custom
do_install() which was working around the problem.

Remove all rpath patches (now overwritten by autoconf) and replace
with just passing RPATH='' via oe_runmake.

Remove the library search path patches (now overwritten by autoconf) and replace
with passing explicit pointers to the sysroot in the options.

[ YOCTO #10969 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../slang/slang/dont-link-to-host.patch            |  16 +++
 .../slang/slang/fix-check-pcre.patch               | 116 -------------------
 meta/recipes-extended/slang/slang/no-x.patch       |   4 +
 meta/recipes-extended/slang/slang/rpathfix.patch   |  82 --------------
 .../slang-fix-the-iconv-existence-checking.patch   | 125 ---------------------
 meta/recipes-extended/slang/slang_2.3.1.bb         |  23 ++--
 6 files changed, 31 insertions(+), 335 deletions(-)
 create mode 100644 meta/recipes-extended/slang/slang/dont-link-to-host.patch
 delete mode 100644 meta/recipes-extended/slang/slang/fix-check-pcre.patch
 delete mode 100644 meta/recipes-extended/slang/slang/rpathfix.patch
 delete mode 100644 meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch

diff --git a/meta/recipes-extended/slang/slang/dont-link-to-host.patch b/meta/recipes-extended/slang/slang/dont-link-to-host.patch
new file mode 100644
index 0000000..42dba0f
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/dont-link-to-host.patch
@@ -0,0 +1,16 @@
+SLANG_INST_LIB is the location of where slang will end up, but when building for
+packaging this doesn't have DESTDIR appended so can potentially link to the host
+for cross builds and will trigger QA errors.
+
+As this is obviously wrong, delete it.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/slsh/Makefile.in b/slsh/Makefile.in
+index cba9d81..4c1c370 100644
+--- a/slsh/Makefile.in
++++ b/slsh/Makefile.in
+@@ -80 +80 @@ SHELL = /bin/sh
+-INST_LIBS = $(DEST_LIB_DIR) $(RPATH) $(SLANG_INST_LIB) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
++INST_LIBS = $(DEST_LIB_DIR) $(RPATH) -lslang $(READLINE_LIB) $(DYNAMIC_LIBS)
diff --git a/meta/recipes-extended/slang/slang/fix-check-pcre.patch b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
deleted file mode 100644
index a0ec0ff..0000000
--- a/meta/recipes-extended/slang/slang/fix-check-pcre.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-fix the pcre existence checking
-
-when check if there is pcre, the configure file always check
-the host dir. now we make it work by adding correct prefix for
-cross-compile environment.
-
-When enable pcre-module, we see a QA warning because rpaths
-hardcoded into the build, rpaths are not needed, so lets turn
-this off.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- configure |   72 +++++---------------------------------------------------------
- 1 file changed, 6 insertions(+), 66 deletions(-)
-
-diff --git a/configure b/configure
---- a/configure
-+++ b/configure
-@@ -7191,6 +7191,7 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
- 	 /usr/include/pcre,/usr/lib \
- 	 /usr/pcre/include,/usr/pcre/lib \
- 	 /usr/include,/usr/lib \
-+	 /usr/include,/usr/lib64 \
- 	 /opt/include/pcre,/opt/lib \
- 	 /opt/pcre/include,/opt/pcre/lib \
- 	 /opt/include,/opt/lib"
-@@ -7221,14 +7222,14 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
-         xincdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $1}'`
- 	xlibdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $2}'`
- 	found=0
--	if test -r $xincdir/$xincfile
-+	if test -r $PKG_CONFIG_SYSROOT_DIR/$xincdir/$xincfile
- 	then
- 	  for E in $exts
- 	  do
--	    if test -r "$xlibdir/$xlibfile.$E"
-+	    if test -r "$PKG_CONFIG_SYSROOT_DIR/$xlibdir/$xlibfile.$E"
- 	    then
--	      jd_pcre_include_dir="$xincdir"
--	      jd_pcre_library_dir="$xlibdir"
-+	      jd_pcre_include_dir="$PKG_CONFIG_SYSROOT_DIR/$xincdir"
-+	      jd_pcre_library_dir="$PKG_CONFIG_SYSROOT_DIR/$xlibdir"
- 	      jd_with_pcre_library="yes"
- 	      found=1
- 	      break
-@@ -7255,68 +7255,7 @@ $as_echo "yes: $jd_pcre_library_dir and $jd_pcre_include_dir" >&6; }
-     then
-       PCRE_LIB=""
-     else
--
--if test "X$jd_pcre_library_dir" != "X"
--then
--  if test "X$RPATH" = "X"
--  then
--
--case "$host_os" in
--  *linux*|*solaris* )
--    if test "X$GCC" = Xyes
--    then
--      if test "X$ac_R_nospace" = "Xno"
--      then
--        RPATH="-Wl,-R,"
--      else
--        RPATH="-Wl,-R"
--      fi
--    else
--      if test "X$ac_R_nospace" = "Xno"
--      then
--        RPATH="-R "
--      else
--	RPATH="-R"
--      fi
--    fi
--  ;;
--  *osf*|*openbsd*|*freebsd*)
--    if test "X$GCC" = Xyes
--    then
--      RPATH="-Wl,-rpath,"
--    else
--      RPATH="-rpath "
--    fi
--  ;;
--  *netbsd*)
--    if test "X$GCC" = Xyes
--    then
--      RPATH="-Wl,-R"
--    fi
--  ;;
--esac
--
--    if test "X$RPATH" != "X"
--    then
--      RPATH="$RPATH$jd_pcre_library_dir"
--    fi
--  else
--    _already_there=0
--    for X in `echo $RPATH | sed 's/:/ /g'`
--    do
--      if test "$X" = "$jd_pcre_library_dir"
--      then
--        _already_there=1
--	break
--      fi
--    done
--    if test $_already_there = 0
--    then
--      RPATH="$RPATH:$jd_pcre_library_dir"
--    fi
--  fi
--fi
--
-+      RPATH=""
-     fi
- 
-     PCRE_INC=-I$jd_pcre_include_dir
diff --git a/meta/recipes-extended/slang/slang/no-x.patch b/meta/recipes-extended/slang/slang/no-x.patch
index d7666bf..7dc1602 100644
--- a/meta/recipes-extended/slang/slang/no-x.patch
+++ b/meta/recipes-extended/slang/slang/no-x.patch
@@ -12,3 +12,7 @@ index b61e974..a3e5db2 100644
 -# For the socket module
 -AC_PATH_XTRA
 -
+--- a/modules/Makefile.in
++++ b/modules/Makefile.in
+@@ -67 +66,0 @@ ZLIB_LIB        = @Z_LIB@ -lz
+-SOCKET_LIBS = @X_EXTRA_LIBS@
diff --git a/meta/recipes-extended/slang/slang/rpathfix.patch b/meta/recipes-extended/slang/slang/rpathfix.patch
deleted file mode 100644
index f82a531..0000000
--- a/meta/recipes-extended/slang/slang/rpathfix.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-Without this patch we see rpaths hardcoded into the build which results in QA
-warnings. These rpaths are not needed so lets turn this off.
-
-Upstream-Status: Inappropriate
-(but could be turned into a proper configure option)
-
-RP 2012/03/14
-
-Index: slang-2.2.4/configure
-===================================================================
---- slang-2.2.4.orig/configure	2012-03-14 23:40:01.283560679 +0000
-+++ slang-2.2.4/configure	2012-03-14 23:41:18.023558900 +0000
-@@ -6246,68 +6246,7 @@ esac
- ELF_CFLAGS="$ELF_CFLAGS $IEEE_CFLAGS"
- CFLAGS="$CFLAGS $IEEE_CFLAGS"
- 
--
--if test "X$libdir" != "X"
--then
--  if test "X$RPATH" = "X"
--  then
--
--case "$host_os" in
--  *linux*|*solaris* )
--    if test "X$GCC" = Xyes
--    then
--      if test "X$ac_R_nospace" = "Xno"
--      then
--        RPATH="-Wl,-R,"
--      else
--        RPATH="-Wl,-R"
--      fi
--    else
--      if test "X$ac_R_nospace" = "Xno"
--      then
--        RPATH="-R "
--      else
--	RPATH="-R"
--      fi
--    fi
--  ;;
--  *osf*|*openbsd*|*freebsd*)
--    if test "X$GCC" = Xyes
--    then
--      RPATH="-Wl,-rpath,"
--    else
--      RPATH="-rpath "
--    fi
--  ;;
--  *netbsd*)
--    if test "X$GCC" = Xyes
--    then
--      RPATH="-Wl,-R"
--    fi
--  ;;
--esac
--
--    if test "X$RPATH" != "X"
--    then
--      RPATH="$RPATH$libdir"
--    fi
--  else
--    _already_there=0
--    for X in `echo $RPATH | sed 's/:/ /g'`
--    do
--      if test "$X" = "$libdir"
--      then
--        _already_there=1
--	break
--      fi
--    done
--    if test $_already_there = 0
--    then
--      RPATH="$RPATH:$libdir"
--    fi
--  fi
--fi
--
-+RPATH=""
- 
- # The cast to long int works around a bug in the HP C Compiler
- # version HP92453-01 B.11.11.23709.GP, which incorrectly rejects
diff --git a/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch b/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
deleted file mode 100644
index 850551e..0000000
--- a/meta/recipes-extended/slang/slang/slang-fix-the-iconv-existence-checking.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 4588f4a0287787788eb86fb16f326cbaa7454e1d Mon Sep 17 00:00:00 2001
-From: Zheng Junling <zhengjunling@huawei.com>
-Date: Mon, 16 Jun 2014 12:51:25 +0000
-Subject: [PATCH] slang: fix the iconv existence checking
-
-When checking whether there is iconv, the configure file always check 
-the host env.
-
-Now we make it working properly by adding correct prefix for cross-
-compiling environment.
-
-When enabling iconv-module, we see a QA warning because rpaths hardcoded
-into the build. And rpaths are not needed, so let's turn this off.
-
-This patch is generated by referencing the existing "fix-check-pcre"
-patch.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Zheng Junling <zhengjunling@huawei.com>
----
- configure |   72 +++++---------------------------------------------------------
- 1 file changed, 6 insertions(+), 66 deletions(-)
-
-diff --git a/configure b/configure
-index fa395ff..7fa769c 100755
---- a/configure
-+++ b/configure
-@@ -8259,6 +8259,7 @@ $as_echo_n "checking for the iconv library and header files ... " >&6; }
- 	 /usr/include/iconv,/usr/lib \
- 	 /usr/iconv/include,/usr/iconv/lib \
- 	 /usr/include,/usr/lib \
-+	 /usr/include,/usr/lib64 \
- 	 /opt/include/iconv,/opt/lib \
- 	 /opt/iconv/include,/opt/iconv/lib \
- 	 /opt/include,/opt/lib"
-@@ -8289,14 +8290,14 @@ $as_echo_n "checking for the iconv library and header files ... " >&6; }
-         xincdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $1}'`
- 	xlibdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $2}'`
- 	found=0
--	if test -r $xincdir/$xincfile
-+	if test -r $PKG_CONFIG_SYSROOT_DIR/$xincdir/$xincfile
- 	then
- 	  for E in $exts
- 	  do
--	    if test -r "$xlibdir/$xlibfile.$E"
-+	    if test -r "$PKG_CONFIG_SYSROOT_DIR/$xlibdir/$xlibfile.$E"
- 	    then
--	      jd_iconv_include_dir="$xincdir"
--	      jd_iconv_library_dir="$xlibdir"
-+	      jd_iconv_include_dir="$PKG_CONFIG_SYSROOT_DIR/$xincdir"
-+	      jd_iconv_library_dir="$PKG_CONFIG_SYSROOT_DIR/$xlibdir"
- 	      jd_with_iconv_library="yes"
- 	      found=1
- 	      break
-@@ -8201,68 +8201,7 @@ $as_echo "yes: $jd_iconv_library_dir and $jd_iconv_include_dir" >&6; }
-     then
-       ICONV_LIB=""
-     else
--
--if test "X$jd_iconv_library_dir" != "X"
--then
--  if test "X$RPATH" = "X"
--  then
--
--case "$host_os" in
--  *linux*|*solaris* )
--    if test "X$GCC" = Xyes
--    then
--      if test "X$ac_R_nospace" = "Xno"
--      then
--        RPATH="-Wl,-R,"
--      else
--        RPATH="-Wl,-R"
--      fi
--    else
--      if test "X$ac_R_nospace" = "Xno"
--      then
--        RPATH="-R "
--      else
--	RPATH="-R"
--      fi
--    fi
--  ;;
--  *osf*|*openbsd*|*freebsd*)
--    if test "X$GCC" = Xyes
--    then
--      RPATH="-Wl,-rpath,"
--    else
--      RPATH="-rpath "
--    fi
--  ;;
--  *netbsd*)
--    if test "X$GCC" = Xyes
--    then
--      RPATH="-Wl,-R"
--    fi
--  ;;
--esac
--
--    if test "X$RPATH" != "X"
--    then
--      RPATH="$RPATH$jd_iconv_library_dir"
--    fi
--  else
--    _already_there=0
--    for X in `echo $RPATH | sed 's/:/ /g'`
--    do
--      if test "$X" = "$jd_iconv_library_dir"
--      then
--        _already_there=1
--	break
--      fi
--    done
--    if test $_already_there = 0
--    then
--      RPATH="$RPATH:$jd_iconv_library_dir"
--    fi
--  fi
--fi
--
-+      RPATH=""
-     fi
- 
-     ICONV_INC=-I$jd_iconv_include_dir
diff --git a/meta/recipes-extended/slang/slang_2.3.1.bb b/meta/recipes-extended/slang/slang_2.3.1.bb
index 7bf3af6..3a50303 100644
--- a/meta/recipes-extended/slang/slang_2.3.1.bb
+++ b/meta/recipes-extended/slang/slang_2.3.1.bb
@@ -14,12 +14,9 @@ DEPENDS = "ncurses virtual/libiconv"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
-
 SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
-           file://rpathfix.patch \
-           file://fix-check-pcre.patch \
-           file://slang-fix-the-iconv-existence-checking.patch \
            file://no-x.patch \
+           file://dont-link-to-host.patch \
           "
 
 SRC_URI[md5sum] = "bd46d1dc17a50c72004ad842829d7b1f"
@@ -32,24 +29,26 @@ inherit autotools-brokensep
 CLEANBROKEN = "1"
 
 EXTRA_OECONF = "--without-onig"
+# There's no way to turn off rpaths and slang will -rpath to the default search
+# path. Unset RPATH to stop this.
+EXTRA_OEMAKE = "RPATH=''"
 
 PACKAGECONFIG ??= "pcre"
-PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,pcre"
-PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
-PACKAGECONFIG[zlib] = "--with-z,--without-z,zlib"
+PACKAGECONFIG[pcre] = "--with-pcre=${STAGING_DIR_HOST}${prefix},--without-pcre,pcre"
+PACKAGECONFIG[png] = "--with-png=${STAGING_DIR_HOST}${prefix},--without-png,libpng"
+PACKAGECONFIG[zlib] = "--with-z=${STAGING_DIR_HOST}${prefix},--without-z,zlib"
 
 do_configure_prepend() {
+    cd ${S}/autoconf
     # slang keeps configure.ac and rest of autoconf files in autoconf/ directory
     # we have to go there to be able to run gnu-configize cause it expects configure.{in,ac}
     # to be present. Resulting files land in autoconf/autoconf/ so we need to move them.
-    cd ${S}/autoconf && gnu-configize --force && mv autoconf/config.* .
+    gnu-configize --force && mv autoconf/config.* .
+    # For the same reason we also need to run autoconf manually.
+    autoconf && mv configure ..
     cd ${B}
 }
 
-do_install() {
-	oe_runmake install DESTDIR=${D} -e 'INST_LIB_DIR=${STAGING_DIR_HOST}/usr/lib'
-}
-
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 
 PARALLEL_MAKE = ""
-- 
2.8.1


