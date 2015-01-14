Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13CC472ABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lh06022117
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:25 -0800
Message-ID: <c546c86af6bfd971427f2be0d17ec8c99c9b7492.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/27] apr-util: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

And bump PR to avoid:
x86_64-linux-libtool:   error: 'dbm/apr_dbm_gdbm.la' is not a valid libtool archive

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 1cd47b1..ac01b63 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -28,22 +28,25 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
 
-inherit autotools-brokensep lib_package binconfig
+inherit autotools lib_package binconfig
+
+PR = "r1"
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
 do_configure_append() {
 	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
-		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${B}/build/rules.mk
 	fi
 }
 do_configure_prepend_class-native() {
-	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${S}/build/rules.mk
+	mkdir ${B}/build
+	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${B}/build/rules.mk
 }
 do_configure_append_class-native() {
-	sed -i "s#LIBTOOL=\$(SHELL) \$(apr_builddir)#LIBTOOL=\$(SHELL) ${STAGING_BINDIR_NATIVE}#" ${S}/build/rules.mk
+	sed -i "s#LIBTOOL=\$(SHELL) \$(apr_builddir)#LIBTOOL=\$(SHELL) ${STAGING_BINDIR_NATIVE}#" ${B}/build/rules.mk
 	# sometimes there isn't SHELL
-	sed -i "s#LIBTOOL=\$(apr_builddir)#LIBTOOL=${STAGING_BINDIR_NATIVE}#" ${S}/build/rules.mk
+	sed -i "s#LIBTOOL=\$(apr_builddir)#LIBTOOL=${STAGING_BINDIR_NATIVE}#" ${B}/build/rules.mk
 }
 
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
@@ -54,7 +57,7 @@ FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
 inherit ptest
 
 do_compile_ptest() {
-	cd ${S}/test
+	cd ${B}/test
 	oe_runmake
 }
 
@@ -62,6 +65,6 @@ do_install_ptest() {
 	t=${D}${PTEST_PATH}/test
 	mkdir $t
 	for i in testall data; do \
-	  cp -r ${S}/test/$i $t; \
+	  cp -r ${B}/test/$i $t; \
 	done
 }
-- 
1.7.9.5


