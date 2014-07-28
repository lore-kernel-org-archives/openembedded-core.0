Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD420708A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 18:33:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6SIXjdY011250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:33:45 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 11:33:44 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 13:39:09 -0500
Message-ID: <c49369320ca271d42175888f5b9daccf45c297bf.1406572002.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1406572002.git.peter.seebach@windriver.com>
References: <cover.1406572002.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Add support for ld.so.conf.d
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
X-List-Received-Date: Mon, 28 Jul 2014 18:33:50 -0000
Content-Type: text/plain

The default behavior for USE_LDCONFIG is to use an empty ld.so.conf.
In some cases, it might be desireable to have an ld.so.conf.d directory,
and inherit files from there. This is a common enough use case to
justify support in the recipe, but not common enough to make it the
default. So, eglibc gets a new USE_LDCONFIG_CONF_D value, default 0.
If it's set to 1, we create the directory and add an "include" line
for it to ld.so.conf.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index c357a13..8026199 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -16,6 +16,9 @@ python __anonymous () {
 
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
+# Set this to one if you want ld.so.conf to include ld.so.conf.d/*
+# by default.
+USE_LDCONFIG_CONF_D ?= "0"
 
 PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
@@ -33,7 +36,7 @@ RPROVIDES_${PN}-pcprofile = "glibc-pcprofile"
 RPROVIDES_${PN}-dbg = "glibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
+FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf ${sysconfdir}/ld.so.conf.d', '', d)}"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
@@ -99,6 +102,11 @@ do_install_append () {
 		if [ -d ${D}${sysconfdir} ]; then
 			rmdir ${D}${sysconfdir}
 		fi
+	else
+		if [ "${USE_LDCONFIG_CONF_D}" = "1" ]; then
+			mkdir -p ${D}${sysconfdir}/ld.so.conf.d
+			echo "include  ld.so.conf.d/*.conf" >> ${D}${sysconfdir}/ld.so.conf
+		fi
 	fi
 }
 
-- 
1.7.1


