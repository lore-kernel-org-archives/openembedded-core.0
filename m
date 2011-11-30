Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVfxH-00021i-UH
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 09:55:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAU8n8EM024833
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:49:11 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 30 Nov 2011 00:49:08 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 16:45:44 +0800
Message-ID: <38fb9d9b4cccead6a5f17950ae3bc4f92ae95b59.1322642187.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322642187.git.wenzong.fan@windriver.com>
References: <cover.1322642187.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/5] autoconf: Extend to provide nativesdk recipe
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
X-List-Received-Date: Wed, 30 Nov 2011 08:55:52 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

As the same reason with automake, extend autoconf to provide
nativesdk recipe too.

This patch was only used for autoconf that running on target:
    * path_prog_fixes.patch: replace '@PERL@' with '@bindir@/env perl'

It's unavailable for autoconf-native and autoconf-nativesdk, so
exclude it for those two recipes.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 21b5fb3..9028e83 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r3"
+PR = "r4"
 
 PARALLEL_MAKE = ""
 
@@ -14,7 +14,7 @@ SRC_URI += "file://autoreconf-include.patch \
 	    file://autoreconf-foreign.patch \
 	    file://autoreconf-gnuconfigize.patch \
 	    file://autoheader-nonfatal-warnings.patch \
-	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d)]} \
+	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d)]} \
             file://config_site.patch \
             file://remove-usr-local-lib-from-m4.patch \
            "
@@ -25,8 +25,11 @@ SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e57145
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
 
+DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
 EXTRA_OECONF += "ac_cv_path_M4=m4"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.0.4



