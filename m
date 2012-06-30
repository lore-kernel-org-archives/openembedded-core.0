Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Skpw8-0004b2-Vd
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 07:09:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5U4wd9C008307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 21:58:39 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 21:58:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jun 2012 00:07:42 -0500
Message-ID: <23f14a5a6cf07dde812dfe54a5732f0c486f7bac.1341032578.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341032578.git.mark.hatle@windriver.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/6] populate_sdk: Allow for attempt only packages in the SDK
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
X-List-Received-Date: Sat, 30 Jun 2012 05:09:37 -0000
Content-Type: text/plain

We want to be able to supply attempt only packages in the SDK in order to
support more advanced SDK images that more closely match specific image
recipes.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 ++
 meta/classes/populate_sdk_deb.bbclass  |    4 ++--
 meta/classes/populate_sdk_ipk.bbclass  |    3 ++-
 meta/classes/populate_sdk_rpm.bbclass  |    4 ++--
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a3bf8c2..a0a0a80 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -8,7 +8,9 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
+TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
 
 RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 920c89a..c3b3e0c 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -28,7 +28,7 @@ populate_sdk_deb () {
 	export INSTALL_BASEARCH_DEB="${DPKG_ARCH}"
 	export INSTALL_ARCHS_DEB="${PACKAGE_ARCHS}"
 	export INSTALL_PACKAGES_DEB="${TOOLCHAIN_TARGET_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-target"
 
@@ -44,7 +44,7 @@ populate_sdk_deb () {
 	export INSTALL_BASEARCH_DEB="${DEB_SDK_ARCH}"
 	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
 	export INSTALL_PACKAGES_DEB="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-nativesdk"
 
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index c256c69..aa3efde 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -11,7 +11,6 @@ populate_sdk_ipk() {
 	package_update_index_ipk
 	package_generate_ipkg_conf
 
-	export INSTALL_PACKAGES_ATTEMPTONLY_IPK=""
 	export INSTALL_PACKAGES_LINGUAS_IPK=""
 	export INSTALL_TASK_IPK="populate_sdk"
 
@@ -19,6 +18,7 @@ populate_sdk_ipk() {
 	export INSTALL_ROOTFS_IPK="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_PACKAGES_IPK="${TOOLCHAIN_TARGET_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 
 	export D=${INSTALL_ROOTFS_IPK}
 	export OFFLINE_ROOT=${INSTALL_ROOTFS_IPK}
@@ -31,6 +31,7 @@ populate_sdk_ipk() {
 	export INSTALL_ROOTFS_IPK="${SDK_OUTPUT}"
 	export INSTALL_CONF_IPK="${IPKGCONF_SDK}"
 	export INSTALL_PACKAGES_IPK="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}"
 
 	package_install_internal_ipk
 
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index e0adb8f..b115c27 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -33,7 +33,7 @@ populate_sdk_rpm () {
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_TARGET_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig pkgconfig(pkg-config)"
 	export INSTALL_TASK_RPM="populate_sdk-target"
@@ -82,7 +82,7 @@ EOF
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_HOST_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
-- 
1.7.3.4



