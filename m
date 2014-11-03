Return-Path: <Shiqun.Lin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F99B65D3C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 09:08:45 +0000 (UTC)
Received: from PEK-SLIN-D1.wrs.com (pek-slin-d1.corp.ad.wrs.com
	[128.224.162.144])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA398iDo007635
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 01:08:45 -0800 (PST)
From: Shiqun Lin <Shiqun.Lin@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Nov 2014 17:08:42 +0800
Message-Id: <1415005722-11692-1-git-send-email-Shiqun.Lin@windriver.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/1] libtool: remove some paths form the build host are encountered on the target rootfs in /usr/bin/libtool.
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
X-List-Received-Date: Mon, 03 Nov 2014 09:08:45 -0000

Resulted libtool contains references about paths from the build host

Below variables contains hard coded build paths from the host:
LTCC=
lt_sysroot=
sys_lib_search_path_spec=
LD=
CC=
compiler_lib_search_dirs=
predep_objects=
postdep_objects=
compiler_lib_search_path=

Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.2.bb b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
index a2eb4ea..268bbe1 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
@@ -7,6 +7,17 @@ PR = "${INC_PR}.0"
 #
 SYSROOT_PREPROCESS_FUNCS += "libtool_sysroot_preprocess"
 
+do_install_append () {
+        sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
+            -e 's@${STAGING_DIR_HOST}@@g' \
+            -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(compiler_lib_search_dirs="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(predep_objects="\).*@\1"@' \
+            -e 's@^\(postdep_objects="\).*@\1"@' \
+            -i ${D}${bindir}/libtool
+}
+
 libtool_sysroot_preprocess () {
 	rm -rf ${SYSROOT_DESTDIR}${bindir}/*
 	rm -rf ${SYSROOT_DESTDIR}${datadir}/aclocal/*
-- 
1.8.5.2.233.g932f7e4


