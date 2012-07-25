Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1StwoS-0002sS-A0
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 10:19:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6P87oxj011805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 01:07:50 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 25 Jul 2012 01:07:50 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2012 16:07:49 +0800
Message-ID: <1343203669-23792-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] slang 2.2.4: fix the pcre existence checking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 08:19:20 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO #2820]

when check if there is pcre, the configure file always check
the host dir. now we make it work by adding correct prefix for
cross-compile environment.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../slang/slang/fix-check-pcre.patch               |  108 ++++++++++++++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 2 files changed, 110 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/slang/slang/fix-check-pcre.patch

diff --git a/meta/recipes-extended/slang/slang/fix-check-pcre.patch b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
new file mode 100644
index 0000000..0c1553a
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
@@ -0,0 +1,108 @@
+fix the pcre existence checking
+
+when check if there is pcre, the configure file always check
+the host dir. now we make it work by adding correct prefix for
+cross-compile environment.
+
+When enable pcre-module, we see a QA warning because rpaths
+hardcoded into the build, rpaths are not needed, so lets turn
+this off.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ configure |   60 ++++++------------------------------------------------------
+ 1 files changed, 6 insertions(+), 54 deletions(-)
+
+diff --git a/configure b/configure
+index f1586c3..d22814f 100755
+--- a/configure
++++ b/configure
+@@ -6991,6 +6991,7 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
+ 	 /usr/include/pcre,/usr/lib \
+ 	 /usr/pcre/include,/usr/pcre/lib \
+ 	 /usr/include,/usr/lib \
++	 /usr/include,/usr/lib64 \
+ 	 /opt/include/pcre,/opt/lib \
+ 	 /opt/pcre/include,/opt/pcre/lib \
+ 	 /opt/include,/opt/lib"
+@@ -7021,14 +7022,14 @@ $as_echo_n "checking for the pcre library and header files ... " >&6; }
+         xincdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $1}'`
+ 	xlibdir=`echo $include_and_lib | tr ',' ' ' | awk '{print $2}'`
+ 	found=0
+-	if test -r $xincdir/$xincfile
++	if test -r $PKG_CONFIG_SYSROOT_DIR/$xincdir/$xincfile
+ 	then
+ 	  for E in $exts
+ 	  do
+-	    if test -r "$xlibdir/$xlibfile.$E"
++	    if test -r "$PKG_CONFIG_SYSROOT_DIR/$xlibdir/$xlibfile.$E"
+ 	    then
+-	      jd_pcre_include_dir="$xincdir"
+-	      jd_pcre_library_dir="$xlibdir"
++	      jd_pcre_include_dir="$PKG_CONFIG_SYSROOT_DIR/$xincdir"
++	      jd_pcre_library_dir="$PKG_CONFIG_SYSROOT_DIR/$xlibdir"
+ 	      jd_with_pcre_library="yes"
+ 	      found=1
+ 	      break
+@@ -7054,56 +7055,7 @@ $as_echo "yes: $jd_pcre_library_dir and $jd_pcre_include_dir" >&6; }
+     then
+       PCRE_LIB=""
+     else
+-
+-if test "X$jd_pcre_library_dir" != "X"
+-then
+-  if test "X$RPATH" = "X"
+-  then
+-
+-case "$host_os" in
+-  *linux*|*solaris* )
+-    if test "X$GCC" = Xyes
+-    then
+-      if test "X$ac_R_nospace" = "Xno"
+-      then
+-        RPATH="-Wl,-R,"
+-      else
+-        RPATH="-Wl,-R"
+-      fi
+-    else
+-      if test "X$ac_R_nospace" = "Xno"
+-      then
+-        RPATH="-R "
+-      else
+-	RPATH="-R"
+-      fi
+-    fi
+-  ;;
+-  *osf*|*openbsd*)
+-    if test "X$GCC" = Xyes
+-    then
+-      RPATH="-Wl,-rpath,"
+-    else
+-      RPATH="-rpath "
+-    fi
+-  ;;
+-  *netbsd*)
+-    if test "X$GCC" = Xyes
+-    then
+-      RPATH="-Wl,-R"
+-    fi
+-  ;;
+-esac
+-
+-    if test "X$RPATH" != "X"
+-    then
+-      RPATH="$RPATH$jd_pcre_library_dir"
+-    fi
+-  else
+-    RPATH="$RPATH:$jd_pcre_library_dir"
+-  fi
+-fi
+-
++      RPATH=""
+     fi
+ 
+     PCRE_INC=-I$jd_pcre_include_dir
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 72dd99f..7082611 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -10,7 +10,7 @@ to recode S-Lang procedures in C if you need to."
 HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre"
-PR = "r9"
+PR = "r10"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
 SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://rpathfix.patch \
+           file://fix-check-pcre.patch \
           "
 SRC_URI_append_arm = " file://change-char-type-to-signed-char-in-macros.patch"
 
-- 
1.7.4.1



