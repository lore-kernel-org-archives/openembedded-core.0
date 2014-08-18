Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC52C70D30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:06:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I66cKa029471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:06:38 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:06:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:06:32 -0700
Message-ID: <d1677fe9182bce306f87965c813ce2af4856d9be.1408341623.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408341623.git.liezhi.yang@windriver.com>
References: <cover.1408341623.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] meta: fix RDEPNEDS for the test related pkgs
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
X-List-Received-Date: Mon, 18 Aug 2014 06:06:41 -0000
Content-Type: text/plain

Add bash, python or perl to the ptest pkgs to fix the RDEPENDS issues.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc           |    2 ++
 meta/recipes-core/udev/udev.inc                |    2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb      |   11 +++++++++--
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb |    2 +-
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 2dffc5a..10f3d34 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -27,6 +27,8 @@ BINCONFIG = "${bindir}/xml2-config"
 
 inherit autotools pkgconfig binconfig-disabled pythonnative ptest
 
+RDEPENDS_${PN}-ptest += "python-core"
+
 RDEPENDS_${PN}-ptest_append_libc-glibc += "eglibc-gconv-ebcdic-us eglibc-gconv-ibm1141"
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 11204aa..280da10 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://init"
 
 inherit autotools pkgconfig update-rc.d ptest
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl"
 
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c06709f..d7033d0 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -72,8 +72,15 @@ libpam_suffix = "suffix${@get_multilib_bit(d)}"
 RPROVIDES_${PN} += "${PN}-${libpam_suffix}"
 RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
 
-RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
-RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
+RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} \
+    pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} \
+    pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix} \
+    "
+RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} \
+    pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} \
+    pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} \
+    pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} \
+    coreutils bash"
 #RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
index 14e5f9e..560a243 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust libxml2"
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl bash"
 
 SRCREV = "8b27cacb277c2cdab791139b08da8eb87ab14a88"
 PV = "v2.5.0"
-- 
1.7.9.5


