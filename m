Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZoNK-0003Kt-3x
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 20:11:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5NI7sct003953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:07:54 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Jun 2011 11:07:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 13:19:27 -0500
Message-ID: <7d78b67e2c97fca2463eafaae06112a42bde98af.1308852888.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308852888.git.mark.hatle@windriver.com>
References: <cover.1308852888.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/9] native/nativesdk: Add a simple chown intercept command
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
X-List-Received-Date: Thu, 23 Jun 2011 18:11:34 -0000
Content-Type: text/plain

During native and nativesdk package we want to intercept any calls to chown
and do nothing.  This prevents errors and allows the same recipes to be
used for both native and target recipes.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/native.bbclass    |    2 ++
 meta/classes/nativesdk.bbclass |    2 ++
 scripts/native-intercept/chown |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100755 scripts/native-intercept/chown

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 90fcd13..11ec6dc 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -85,6 +85,8 @@ EXTRA_NATIVE_PKGCONFIG_PATH ?= ""
 PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
 PKG_CONFIG_SYSROOT_DIR = ""
 
+PATH =. "${COREBASE}/scripts/native-intercept:"
+
 python native_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
         return
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 3fe4bf9..a0302b9 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -54,6 +54,8 @@ FILES_${PN}-dbg += "${prefix}/.debug \
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
+PATH =. "${COREBASE}/scripts/native-intercept:"
+
 python nativesdk_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
         return
diff --git a/scripts/native-intercept/chown b/scripts/native-intercept/chown
new file mode 100755
index 0000000..4f43271
--- /dev/null
+++ b/scripts/native-intercept/chown
@@ -0,0 +1,2 @@
+#! /bin/sh
+echo "Intercept $0: $@ -- do nothing"
-- 
1.7.3.4



