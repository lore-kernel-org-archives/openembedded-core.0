Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TZ5AC-00074p-Qp
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 20:31:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAFJHorT026471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 11:17:50 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 15 Nov 2012 11:17:50 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 11:17:50 -0800
Message-ID: <1353007070-29984-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] curl: eliminate forced setting of -g0 when compiling
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
X-List-Received-Date: Thu, 15 Nov 2012 19:31:49 -0000
Content-Type: text/plain

Do not invoke CURL_SET_COMPILER_DEBUG_OPTS in configure.ac.
This will allow debug options set in our CFLAGS to be
used.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/curl/curl/configure_ac.patch |   11 +++++++++++
 meta/recipes-support/curl/curl_7.26.0.bb          |    7 ++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/configure_ac.patch

diff --git a/meta/recipes-support/curl/curl/configure_ac.patch b/meta/recipes-support/curl/curl/configure_ac.patch
new file mode 100644
index 0000000..98d8387
--- /dev/null
+++ b/meta/recipes-support/curl/curl/configure_ac.patch
@@ -0,0 +1,11 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -281,7 +281,7 @@ dnl ************************************
+ 
+ CURL_CHECK_COMPILER
+ CURL_SET_COMPILER_BASIC_OPTS
+-CURL_SET_COMPILER_DEBUG_OPTS
++dnl CURL_SET_COMPILER_DEBUG_OPTS
+ CURL_SET_COMPILER_OPTIMIZE_OPTS
+ CURL_SET_COMPILER_WARNING_OPTS
+ 
diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
index 9a0e7ce..fef247c 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.26.0.bb
@@ -8,11 +8,16 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_class-native = "zlib-native openssl-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch"
 
+# curl likes to set -g0 in CFLAGS, so we stop it
+# from mucking around with debug options
+#
+SRC_URI += " file://configure_ac.patch"
+
 SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
 SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
 
-- 
1.7.3.4



