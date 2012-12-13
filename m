Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tiyaz-0004fU-4K
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 03:32:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBD2HmC0020837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 18:17:48 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 18:17:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 10:17:43 +0800
Message-ID: <475c322eafe0f825ead42e582dfa0ed1a4497f06.1355363862.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355363862.git.hongxu.jia@windriver.com>
References: <cover.1355363862.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript-native:fix host underlinking issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 02:32:39 -0000
Content-Type: text/plain

The ghostscript-native will check libtiff
automatically at configure time and libtiff
needs libjpeg. If libtiff and libjpeg is
just populated to staging native directories
and the host doesn't install them, the libjpeg
could not be linked, fail with:

|libjpeg.so.8, needed by libtiff.so, not found
|libtiff.so: undefined reference to
`jpeg_set_defaults@LIBJPEG_8.0'
|collect2: error: ld returned 1 exit status

Disable libtiff support to fix this issue and
modify configure to let disable system libtiff
could work.
We also explicity disable fontconfig, freetype,
cups for ghostscript-native to avoid the similar
issues.

[YOCTO #3562]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...tscript-native-fix-disable-system-libtiff.patch |   51 ++++++++++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |   15 ++++--
 2 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
new file mode 100644
index 0000000..ce254f6
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
@@ -0,0 +1,51 @@
+ghostscript-native:fix disable-system-libtiff
+
+Modify configure to add the check to make sure
+ghostscrip could work while system-libtiff is
+disabled.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+diff --git a/base/configure.ac b/base/configure.ac
+index bb05105..4b817ac 100644
+--- a/base/configure.ac
++++ b/base/configure.ac
+@@ -814,17 +814,23 @@ Disabling tiff output devices.])
+ esac
+ 
+ if test $SHARE_LIBTIFF -eq 0; then
+-      echo
+-      echo "Running libtiff configure script..."
+-      olddir=`pwd`
+-      cd $LIBTIFFDIR && ./configure --disable-jbig $SUBCONFIG_OPTS
+-      status=$?
+-      if test "$status" -ne 0 ; then
+-        AC_MSG_ERROR([libtiff configure script failed], $status)
+-      fi
+-      cd $olddir
+-      echo
+-      echo "Continuing with Ghostscript configuration..."
++    if test -e $LIBTIFFDIR/configure; then
++        echo
++        echo "Running libtiff configure script..."
++        olddir=`pwd`
++        cd $LIBTIFFDIR && ./configure --disable-jbig $SUBCONFIG_OPTS
++        status=$?
++        if test "$status" -ne 0 ; then
++          AC_MSG_ERROR([libtiff configure script failed], $status)
++        fi
++        cd $olddir
++        echo
++        echo "Continuing with Ghostscript configuration..."
++    else
++        AC_MSG_NOTICE([Could not find local copy of libtiff.
++Disabling tiff output devices.])
++    fi
++
+ fi
+ 
+ AC_SUBST(SHARE_LIBTIFF)
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 2789897..93c503f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_class-native = ""
@@ -31,8 +31,9 @@ SRC_URI = "${SRC_URI_BASE} \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-		        file://0001-make-ghostscript-work-with-long-building-directory.patch \
-		        "
+                        file://0001-make-ghostscript-work-with-long-building-directory.patch \
+                        file://ghostscript-native-fix-disable-system-libtiff.patch \
+                        "
 
 SRC_URI[md5sum] = "f7c6f0431ca8d44ee132a55d583212c1"
 SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a15cc207"
@@ -40,6 +41,14 @@ SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a1
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper \
                 --with-fontpath=${datadir}/fonts --with-install-cups --without-libidn"
 
+# Explicity disable libtiff, fontconfig,
+# freetype, cups for ghostscript-native
+EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
+                             --without-jbig2dec --without-jasper \
+                             --with-fontpath=${datadir}/fonts \
+                             --without-libidn --disable-fontconfig \
+                             --disable-freetype --disable-cups"
+
 # This has been fixed upstream but for now we need to subvert the check for time.h
 # http://bugs.ghostscript.com/show_bug.cgi?id=692443
 # http://bugs.ghostscript.com/show_bug.cgi?id=692426
-- 
1.7.10.4



