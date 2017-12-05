Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA0C56E672
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:18:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB51IlSv016968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 17:18:47 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 4 Dec 2017 17:18:46 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Dec 2017 09:17:04 +0800
Message-ID: <1512436624-15959-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512436624-15959-1-git-send-email-yi.zhao@windriver.com>
References: <1512436624-15959-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH V2] icu: fix libicudata corruption on big endian system
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
X-List-Received-Date: Tue, 05 Dec 2017 01:18:45 -0000
Content-Type: text/plain

ICU library libicudata is created with a wrong endianness if the host
and target have different endianness. (e.g. build ICU for qemuppc on
x86-64 host)
See upstream bug report: http://bugs.icu-project.org/trac/ticket/11758

The discussion in oe-core mailing list:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg65155.html

The root cause is the native pkgdata can not generate correct icu data
for different endianness. By default, this data is built into the shared
library libicudata that would cause it corrupt. But ICU also provides
additional options for loading the data. With option
--with-data-packaging=archive, ICU outputs a single icudt.dat file which
can be loaded by the library.
See document: http://userguide.icu-project.org/icudata

So for big endian system, we can use the separated data file which
re-generates by icupkg and set the correct ICU_DATA environment variable
to make sure the library can load the data without problems.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/icu/icu.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index a1ef9ec..3fb16b0 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -17,6 +17,8 @@ STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 BINCONFIG = "${bindir}/icu-config"
 
+ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
+
 inherit autotools pkgconfig binconfig
 
 # ICU needs the native build directory as an argument to its --with-cross-build option when
@@ -26,6 +28,8 @@ EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
+EXTRA_OECONF_append_class-target = "${@base_conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
+TARGET_CXXFLAGS_append = "${@base_conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
 
 # strtod_l() is not supported by musl; also xlocale.h is missing
 # It is not possible to disable its use via configure switches or env vars
@@ -44,6 +48,15 @@ do_install_append_class-native() {
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 }
 
+do_install_append_class-target() {
+    # The native pkgdata can not generate the correct data file.
+    # Use icupkg to re-generate it.
+    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
+        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+    fi
+}
+
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
 
 FILES_${PN}-dev += "${libdir}/${BPN}/"
-- 
2.7.4


