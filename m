Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83C9860232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 08:41:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8N8fkKt017260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 01:41:46 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 23 Sep 2015 01:41:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Sep 2015 16:41:57 +0800
Message-ID: <1442997717-12539-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] guile: cleanup buildpaths and add RDEPENDS on pkgconfig
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
X-List-Received-Date: Wed, 23 Sep 2015 08:41:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* fix the path for "define %pkg-config-program" in guile-config
* clean the --sysroot in guile-snarf
* add RDEPENDS on pkgconfig

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index a485fe3..00553b5 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -39,7 +39,11 @@ DEPENDS = "libunistring bdwgc gmp libtool libffi ncurses readline"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS_append_class-target = " guile-native libatomic-ops"
 
-RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
+# The comment of the script guile-config said it has been deprecated but we should
+# at least add the required dependency to make it work since we still provide the script.
+RDEPENDS_${PN} = "pkgconfig"
+
+RDEPENDS_${PN}_append_libc-glibc_class-target = " glibc-gconv-iso8859-1"
 
 # Workaround when DEBUG_BUILD = "1"
 CFLAGS_append_arm = " -O2"
@@ -80,6 +84,12 @@ do_install_append_class-native() {
 		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
 }
 
+do_install_append_class-target() {
+	# cleanup buildpaths in scripts
+	sed -i -e 's:${STAGING_DIR_NATIVE}::' ${D}/usr/bin/guile-config
+	sed -i -e 's:${STAGING_DIR_HOST}::' ${D}/usr/bin/guile-snarf
+}
+
 SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
 
 guile_cross_config() {
-- 
2.3.5


