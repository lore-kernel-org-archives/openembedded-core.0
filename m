Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A21127BF70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 06:13:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,336,1549900800"; d="scan'208";a="59011145"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Apr 2019 14:13:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id DDB554CD83B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 14:13:15 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 11 Apr 2019 14:13:19 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2019 23:12:25 +0800
Message-ID: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: DDB554CD83B7.AA33C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Thu, 11 Apr 2019 06:13:13 -0000
Content-Type: text/plain

Make dnf work on nativesdk environment.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/classes/toolchain-scripts.bbclass |  1 +
 meta/recipes-devtools/dnf/dnf_4.1.0.bb | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 1a2ec4f..de50b7e 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -101,6 +101,7 @@ toolchain_shared_env_script () {
 	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+	echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
diff --git a/meta/recipes-devtools/dnf/dnf_4.1.0.bb b/meta/recipes-devtools/dnf/dnf_4.1.0.bb
index d45023e..a5bded0 100644
--- a/meta/recipes-devtools/dnf/dnf_4.1.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.1.0.bb
@@ -49,6 +49,29 @@ RDEPENDS_${PN}_class-target += " \
   python3-gpg \
   "
 
+RDEPENDS_${PN}_class-nativesdk += " \
+  python3-core \
+  python3-codecs \
+  python3-netclient \
+  python3-email \
+  python3-threading \
+  python3-distutils \
+  python3-logging \
+  python3-fcntl \
+  librepo \
+  python3-shell \
+  libcomps \
+  libdnf \
+  python3-sqlite3 \
+  python3-compression \
+  python3-rpm \
+  python3-iniparse \
+  python3-json \
+  python3-curses \
+  python3-misc \
+  python3-gpg \
+  "
+
 RRECOMMENDS_${PN}_class-target += "gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
@@ -66,6 +89,12 @@ do_install_append_class-native() {
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
+do_install_append_class-nativesdk() {
+        create_wrapper ${D}/${bindir}/dnf \
+                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic.service dnf-automatic.timer \
                          dnf-automatic-download.service dnf-automatic-download.timer \
-- 
1.8.3.1




