Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 73A2D6B446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 12:41:20 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W2gpR-0001m0-VO
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jan 2014 13:41:20 +0100
Message-ID: <1389616877.9182.177.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 12:41:17 +0000
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: Delete patches that have been applied upstream or are
	no longer
	necessary. Update LIC_FILES_CHKSUM to match new COPYING (whitespace
	changes only). Signed-off-by: Phil Blundell <pb@pbcl.net> ---
	.../libproxy/libproxy/g++-namepace.patch
	| 22 .../libproxy/libproxy-0.4.7-CVE-2012-4504.patch | 29
	.../libproxy/libproxy_fix_for_gcc4.7.patch
	| 30 .../{libproxy_0.4.7.bb => libproxy_0.4.11.bb} | 11 +++----- 4
	files changed, 3 insertions(+),
	89 deletions(-) delete mode 100644
	meta/recipes-support/libproxy/libproxy/g++-namepace.patch
	delete mode 100644
	meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
	delete mode 100644
	meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
	rename meta/recipes-support/libproxy/{libproxy_0.4.7.bb =>
	libproxy_0.4.11.bb} (77%) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] libproxy: Update to 0.4.11
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
X-List-Received-Date: Mon, 13 Jan 2014 12:41:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Delete patches that have been applied upstream or are no longer necessary.
Update LIC_FILES_CHKSUM to match new COPYING (whitespace changes only).

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 .../libproxy/libproxy/g++-namepace.patch           | 22 ----------------
 .../libproxy/libproxy-0.4.7-CVE-2012-4504.patch    | 29 ---------------------
 .../libproxy/libproxy_fix_for_gcc4.7.patch         | 30 ----------------------
 .../{libproxy_0.4.7.bb => libproxy_0.4.11.bb}      | 11 +++-----
 4 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-support/libproxy/libproxy/g++-namepace.patch
 delete mode 100644 meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
 delete mode 100644 meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.7.bb => libproxy_0.4.11.bb} (77%)

diff --git a/meta/recipes-support/libproxy/libproxy/g++-namepace.patch b/meta/recipes-support/libproxy/libproxy/g++-namepace.patch
deleted file mode 100644
index cb90ab7..0000000
--- a/meta/recipes-support/libproxy/libproxy/g++-namepace.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-include unistd.h to get prototypes of close() and read()
-otherwise g++ complains
-
-libproxy/url.cpp:439:13: error: 'close' was not declared in this scope
-libproxy/url.cpp:398:37: error: 'read' was not declared in this scope
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: libproxy-0.4.7/libproxy/url.cpp
-===================================================================
---- libproxy-0.4.7.orig/libproxy/url.cpp	2012-03-01 09:51:11.254156247 -0800
-+++ libproxy-0.4.7/libproxy/url.cpp	2012-03-01 09:56:12.058171256 -0800
-@@ -33,6 +33,7 @@
- #include <cstdlib>    // For atoi()
- #include <sys/stat.h> // For stat()
- #include <algorithm> // For transform()
-+#include <unistd.h> // For close(), read()
- 
- #ifdef WIN32
- #include <io.h>
diff --git a/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch b/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
deleted file mode 100644
index 7f2d93a..0000000
--- a/meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-
-libproxy - CVE-2012-4504:
-
-Reference:https://code.google.com/p/libproxy/source/detail?r=853
-
-Stack-based buffer overflow in the url::get_pac function in url.cpp
-in libproxy 0.4.x before 0.4.9 allows remote servers to have an
-unspecified impact via a large proxy.pac file.
-
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504
-
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
-
-diff -urpN a/libproxy/url.cpp b/libproxy/url.cpp
---- a/libproxy/url.cpp	2012-11-26 10:08:47.000000000 +0800
-+++ b/libproxy/url.cpp	2012-11-26 10:05:54.000000000 +0800
-@@ -472,9 +472,10 @@ char* url::get_pac() {
- 				// Add this chunk to our content length,
- 				// ensuring that we aren't over our max size
- 				content_length += chunk_length;
--				if (content_length >= PAC_MAX_SIZE) break;
- 			}
- 
-+			if (content_length >= PAC_MAX_SIZE) break;
-+
- 			while (recvd != content_length) {
- 				int r = recv(sock, buffer + recvd, content_length - recvd, 0);
- 				if (r < 0) break;
diff --git a/meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch b/meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
deleted file mode 100644
index a772f09..0000000
--- a/meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/04/20
-Fixes this issue with gcc 4.7
-
-| cd /srv/home/nitin/builds/bERROR: Function failed: do_compile (see /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/temp/log.do_compile.7514 for further information)
-| uild-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy && /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++   -Dlibproxy_EXPORTS -D_POSIX_C_SOURCE=1 -DLIBEXECDIR=\"/usr/libexec\" -DMM_MODULE_BUILTIN=config_sysconfig -fvisibility=hidden    -m64  --sysroot=/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86-64  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fpermissive -O2 -g -fPIC -I/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7 -I/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86-64/usr/include/glib-2.0 -I/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/include    -o CMakeFiles/libproxy.dir/modules/config_sysconfig.cpp.o -c /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp
-| /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp: In function 'bool should_use_sysconfig()':
-| /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp:107:18: error: 'getuid' was not declared in this scope
-| make[2]: *** [libproxy/CMakeFiles/libproxy.dir/modules/config_sysconfig.cpp.o] Error 1
-| make[2]: Leaving directory `/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7'
-| make[1]: *** [libproxy/CMakeFiles/libproxy.dir/all] Error 2
-| make[1]: Leaving directory `/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7'
-| make: *** [all] Error 2
-| ERROR: oe_runmake failed
-NOTE: package libproxy-0.4.7-r3: task do_compile: Failed
-
-Index: libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp
-===================================================================
---- libproxy-0.4.7.orig/libproxy/modules/config_sysconfig.cpp
-+++ libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp
-@@ -21,6 +21,7 @@
- #include <cstdlib>
- #include <map>
- #include <fstream>
-+#include <unistd.h>
- 
- #include "../extension_config.hpp"
- using namespace libproxy;
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
similarity index 77%
rename from meta/recipes-support/libproxy/libproxy_0.4.7.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.11.bb
index 3838cb8..aecb7b5 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -3,21 +3,16 @@ HOMEPAGE = "http://code.google.com/p/libproxy/"
 BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
 SECTION = "libs"
 LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
 DEPENDS = "gconf glib-2.0"
 
-PR = "r6"
-
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
-           file://g++-namepace.patch \
-           file://libproxy_fix_for_gcc4.7.patch \
-           file://libproxy-0.4.7-CVE-2012-4504.patch \
           "
 
-SRC_URI[md5sum] = "62585570de17d10f03a5a63b701ffd52"
-SRC_URI[sha256sum] = "429a19c57d9990349d622beecc805b23051caa62a478066bff5d9a312a8937be"
+SRC_URI[md5sum] = "06be230b8b612e64997f8f15af6373aa"
+SRC_URI[sha256sum] = "3175abcb49c0b37fd82c697927783bf7d53de3884a8559bc594e59caa09bdb04"
 
 inherit cmake pkgconfig
 
-- 
1.8.5




