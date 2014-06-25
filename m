Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CD55D65DDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482009"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:15 -0700
Message-Id: <759accf7b0ae2f5da59d67f97c350df09dc3d1ed.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 05/10] curl: Update to 7.37
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:40 -0000

Remove patches that are fixed upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../curl/generate_code_for_disable_manual.patch    | 38 ----------------------
 .../curl/{curl_7.36.0.bb => curl_7.37.0.bb}        |  6 ++--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
 rename meta/recipes-support/curl/{curl_7.36.0.bb => curl_7.37.0.bb} (89%)

diff --git a/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch b/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
deleted file mode 100644
index dc755e4..0000000
--- a/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upsteam-Status Backport [fixed in 7.37.0]
-commit 38d582ff541353d738858299d4a2b78bafac03ed
-Author: Daniel Stenberg <daniel@haxx.se>
-Date:   Wed Mar 26 13:22:10 2014 +0100
-
-    mkhelp: generate code for --disable-manual as well
-    
-    This allows configure --disable-manual to run and build without having
-    to regenerate the src/tool_hugehelp.c file which otherwise is necessary
-    since we ship tarballs with that file present.
-    
-    Reported-by: Remi Gacogne
-    Bug: http://curl.haxx.se/bug/view.cgi?id=1350
-
-diff --git a/src/mkhelp.pl b/src/mkhelp.pl
-index 444b669..7ed86f7 100644
---- a/src/mkhelp.pl
-+++ b/src/mkhelp.pl
-@@ -6,7 +6,7 @@
- #                            | (__| |_| |  _ <| |___
- #                             \___|\___/|_| \_\_____|
- #
--# Copyright (C) 1998 - 2011, Daniel Stenberg, <daniel@haxx.se>, et al.
-+# Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
- #
- # This software is licensed as described in the file COPYING, which
- # you should have received as part of this distribution. The terms
-@@ -256,6 +256,10 @@ foot();
- 
- sub foot {
-   print <<FOOT
-+#else /* !USE_MANUAL */
-+/* built-in manual is disabled, blank function */
-+#include "tool_hugehelp.h"
-+void hugehelp(void) {}
- #endif /* USE_MANUAL */
- FOOT
-   ;
diff --git a/meta/recipes-support/curl/curl_7.36.0.bb b/meta/recipes-support/curl/curl_7.37.0.bb
similarity index 89%
rename from meta/recipes-support/curl/curl_7.36.0.bb
rename to meta/recipes-support/curl/curl_7.37.0.bb
index 54ea6d4..1dc4ff3 100644
--- a/meta/recipes-support/curl/curl_7.36.0.bb
+++ b/meta/recipes-support/curl/curl_7.37.0.bb
@@ -11,8 +11,6 @@ DEPENDS_class-nativesdk = "nativesdk-zlib"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
-           file://generate_code_for_disable_manual.patch \
-           file://remove_inappropriate_file_from_rel.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
@@ -20,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "e6d1f9d1b59da5062109ffe14e0569a4"
-SRC_URI[sha256sum] = "1fbe82b89bcd6b7ccda8cb0ff076edc60e911595030e27689f4abd5ef7f3cfcd"
+SRC_URI[md5sum] = "7dda0cc2e4136f78d5801ac347be696b"
+SRC_URI[sha256sum] = "24502492de3168b0556d8e1a06f14f7589e57b204917d602a572e14239b3e09e"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.8.3.1


