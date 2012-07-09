Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMi-000659-3z
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292887"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:26 -0700
Message-Id: <8ab79ffc2755930e6f36b94092015adb456f006f.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/41] curl: upgrade to 7.26.0
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:12 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Config system changed from 7.24.0 and the noldlibpatch
is no longer needed, thus deleted.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-support/curl/curl/noldlibpath.patch   |   76 --------------------
 .../curl/{curl_7.24.0.bb => curl_7.26.0.bb}        |    7 +-
 2 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/noldlibpath.patch
 rename meta/recipes-support/curl/{curl_7.24.0.bb => curl_7.26.0.bb} (90%)

diff --git a/meta/recipes-support/curl/curl/noldlibpath.patch b/meta/recipes-support/curl/curl/noldlibpath.patch
deleted file mode 100644
index f4c72a1..0000000
--- a/meta/recipes-support/curl/curl/noldlibpath.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Manipulating LD_LIBRARY_PATH can totally break builds when cross compiling.
-Since we never run compiled binaries for the target, we should *never* need
-to change LD_LIBRARY_PATH.
-
-RP 9/6/2010
-
-Index: curl-7.20.0/configure.ac
-===================================================================
---- curl-7.20.0.orig/configure.ac	2010-06-09 11:06:30.000000000 +0100
-+++ curl-7.20.0/configure.ac	2010-06-09 11:04:25.000000000 +0100
-@@ -1461,9 +1461,10 @@
-        dnl linker doesn't search through, we need to add it to LD_LIBRARY_PATH
-        dnl to prevent further configure tests to fail due to this
- 
--       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
--       export LD_LIBRARY_PATH
--       AC_MSG_NOTICE([Added $LIB_OPENSSL to LD_LIBRARY_PATH])
-+       #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
-+       #export LD_LIBRARY_PATH
-+       #AC_MSG_NOTICE([Added $LIB_OPENSSL to LD_LIBRARY_PATH])
-+       :
-     fi
-   fi
- 
-@@ -1684,9 +1686,10 @@
-           dnl LD_LIBRARY_PATH to prevent further configure tests to fail
-           dnl due to this
- 
--          LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
--          export LD_LIBRARY_PATH
--          AC_MSG_NOTICE([Added $gtlslib to LD_LIBRARY_PATH])
-+          #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
-+          #export LD_LIBRARY_PATH
-+          #AC_MSG_NOTICE([Added $gtlslib to LD_LIBRARY_PATH])
-+          :
-         fi
-       fi
- 
-@@ -1696,6 +1699,8 @@
- 
- fi dnl OPENSSL != 1
- 
-+AC_SUBST(GNUTLS_REQUIRED)
-+
- dnl ----------------------------------------------------
- dnl NSS. Only check if GnuTLS and OpenSSL are not enabled
- dnl ----------------------------------------------------
-@@ -1781,9 +1786,10 @@
-         dnl LD_LIBRARY_PATH to prevent further configure tests to fail
-         dnl due to this
- 
--        LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$nssprefix/lib$libsuff"
--        export LD_LIBRARY_PATH
--        AC_MSG_NOTICE([Added $nssprefix/lib$libsuff to LD_LIBRARY_PATH])
-+        #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$nssprefix/lib$libsuff"
-+        #export LD_LIBRARY_PATH
-+        #AC_MSG_NOTICE([Added $nssprefix/lib$libsuff to LD_LIBRARY_PATH])
-+        :
-       fi
- 
-     fi
-@@ -1881,9 +1887,9 @@
-        dnl libssh2_version is a post 1.0 addition
-        AC_CHECK_FUNCS( libssh2_version )
- 
--       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR_SSH2"
--       export LD_LIBRARY_PATH
--       AC_MSG_NOTICE([Added $DIR_SSH2 to LD_LIBRARY_PATH])
-+       #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR_SSH2"
-+       #export LD_LIBRARY_PATH
-+       #AC_MSG_NOTICE([Added $DIR_SSH2 to LD_LIBRARY_PATH])
-     fi
-   else
-     dnl no libssh2, revert back to clean variables
diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
similarity index 90%
rename from meta/recipes-support/curl/curl_7.24.0.bb
rename to meta/recipes-support/curl/curl_7.26.0.bb
index 832254f..f04b400 100644
--- a/meta/recipes-support/curl/curl_7.24.0.bb
+++ b/meta/recipes-support/curl/curl_7.26.0.bb
@@ -8,14 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native openssl-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-           file://noldlibpath.patch \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "f912221d75eb8d8fe08900eaf011b023"
-SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01812c16"
+SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
+SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.7.6



