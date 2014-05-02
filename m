Return-Path: <Tudor.Florea@enea.com>
X-Greylist: delayed 334 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 22:27:05 UTC
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 16DFA602DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 22:27:04 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Sat, 3 May 2014
	00:21:25 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 1B19A28C882;
	Sat,  3 May 2014 00:21:26 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 May 2014 00:21:23 +0200
Message-ID: <1399069283-22753-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] curl: Backport a fix for a build issue
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
X-List-Received-Date: Fri, 02 May 2014 22:27:06 -0000
Content-Type: text/plain

mkhelp: generate code for --disable-manual as well

This allows configure --disable-manual to run and build without having
to regenerate the src/tool_hugehelp.c file which otherwise is necessary
since we ship tarballs with that file present.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../curl/generate_code_for_disable_manual.patch    |   38 ++++++++++++++++++++
 meta/recipes-support/curl/curl_7.36.0.bb           |    1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch

diff --git a/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch b/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
new file mode 100644
index 0000000..dc755e4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
@@ -0,0 +1,38 @@
+Upsteam-Status Backport [fixed in 7.37.0]
+commit 38d582ff541353d738858299d4a2b78bafac03ed
+Author: Daniel Stenberg <daniel@haxx.se>
+Date:   Wed Mar 26 13:22:10 2014 +0100
+
+    mkhelp: generate code for --disable-manual as well
+    
+    This allows configure --disable-manual to run and build without having
+    to regenerate the src/tool_hugehelp.c file which otherwise is necessary
+    since we ship tarballs with that file present.
+    
+    Reported-by: Remi Gacogne
+    Bug: http://curl.haxx.se/bug/view.cgi?id=1350
+
+diff --git a/src/mkhelp.pl b/src/mkhelp.pl
+index 444b669..7ed86f7 100644
+--- a/src/mkhelp.pl
++++ b/src/mkhelp.pl
+@@ -6,7 +6,7 @@
+ #                            | (__| |_| |  _ <| |___
+ #                             \___|\___/|_| \_\_____|
+ #
+-# Copyright (C) 1998 - 2011, Daniel Stenberg, <daniel@haxx.se>, et al.
++# Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
+ #
+ # This software is licensed as described in the file COPYING, which
+ # you should have received as part of this distribution. The terms
+@@ -256,6 +256,10 @@ foot();
+ 
+ sub foot {
+   print <<FOOT
++#else /* !USE_MANUAL */
++/* built-in manual is disabled, blank function */
++#include "tool_hugehelp.h"
++void hugehelp(void) {}
+ #endif /* USE_MANUAL */
+ FOOT
+   ;
diff --git a/meta/recipes-support/curl/curl_7.36.0.bb b/meta/recipes-support/curl/curl_7.36.0.bb
index 6f55463..bd7191d 100644
--- a/meta/recipes-support/curl/curl_7.36.0.bb
+++ b/meta/recipes-support/curl/curl_7.36.0.bb
@@ -11,6 +11,7 @@ DEPENDS_class-nativesdk = "nativesdk-zlib"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
+           file://generate_code_for_disable_manual.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.7.10.4


