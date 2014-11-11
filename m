Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFE5865D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 02:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAB29V8D022138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 18:09:31 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 10 Nov 2014 18:09:30 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Nov 2014 20:09:29 -0600
Message-ID: <1415671769-24658-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] meta-environment: Fix config-site with a multilib config
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
X-List-Received-Date: Tue, 11 Nov 2014 02:09:33 -0000
Content-Type: text/plain

[YOCTO #6951]

The TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value was defaulting to the nativesdk
path and not the associated target path.  Set the value in toolchain-scripts
to the target path.

Be sure to set the MLPREFIX within the meta-environment script as multilibs
are processed.

Update the config_site file name to use -BPN- not PN.  Otherwise the
environment processing can't find the correct filename.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/siteconfig.bbclass            | 8 ++++----
 meta/classes/toolchain-scripts.bbclass     | 4 +++-
 meta/recipes-core/meta/meta-environment.bb | 1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 9a4d03b..45dce48 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -18,13 +18,13 @@ siteconfig_do_siteconfig_gencache () {
 		>${WORKDIR}/site_config_${MACHINE}/configure.ac
 	cd ${WORKDIR}/site_config_${MACHINE}
 	autoconf
-	rm -f ${PN}_cache
-        CONFIG_SITE="" ${EXTRASITECONFIG} ./configure ${CONFIGUREOPTS} --cache-file ${PN}_cache
+	rm -f ${BPN}_cache
+	CONFIG_SITE="" ${EXTRASITECONFIG} ./configure ${CONFIGUREOPTS} --cache-file ${BPN}_cache
 	sed -n -e "/ac_cv_c_bigendian/p" -e "/ac_cv_sizeof_/p" \
 		-e "/ac_cv_type_/p" -e "/ac_cv_header_/p" -e "/ac_cv_func_/p" \
-		< ${PN}_cache > ${PN}_config
+		< ${BPN}_cache > ${BPN}_config
 	mkdir -p ${SYSROOT_DESTDIR}${datadir}/${TARGET_SYS}_config_site.d
-	cp ${PN}_config ${SYSROOT_DESTDIR}${datadir}/${TARGET_SYS}_config_site.d
+	cp ${BPN}_config ${SYSROOT_DESTDIR}${datadir}/${TARGET_SYS}_config_site.d
 
 }
 
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 2244cf7..96fd93d 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -91,7 +91,7 @@ EOF
 
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
-TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
+TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
 
 #This function create a site config file
@@ -131,5 +131,7 @@ python __anonymous () {
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
+        for variant in (d.getVar('MULTILIB_VARIANTS', True) or "").split():
+            deps += " %s-%s:do_populate_sysroot" % (variant, dep)
     d.appendVarFlag('do_configure', 'depends', deps)
 }
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 9d8bcb7..bb208a3 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -42,6 +42,7 @@ python do_generate_content() {
         # Load overrides from 'd' to avoid having to reset the value...
         overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
         localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", item + "-")
         bb.data.update_data(localdata)
         bb.build.exec_func("create_sdk_files", localdata)
 }
-- 
1.9.3


