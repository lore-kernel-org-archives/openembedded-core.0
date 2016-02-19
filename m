Return-Path: <Jun.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFDF60588
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:00:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J80mVX028703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:00:48 -0800 (PST)
Received: from pek-lpd-ccm1.wrs.com (128.224.179.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Feb 2016 00:00:47 -0800
From: Jun Zhang <jun.zhang@windriver.com>
To: <jun.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 16:00:43 +0800
Message-ID: <1455868843-27119-1-git-send-email-jun.zhang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] toolchain-scripts.bbclass: add three other path to PATH in env.sh
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
X-List-Received-Date: Fri, 19 Feb 2016 08:00:49 -0000
Content-Type: text/plain

in sdk,there are some utils in sysroot/host-os/bin, sysroot/host-os/sbin/,sysroot/host-os/usr/bin need to use, so add these three paths to PATH in env.sh.

Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 5 ++++-
 meta/conf/bitbake.conf                 | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 835422f..33fb4e3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -9,6 +9,9 @@ TARGET_CC_ARCH_append_libc-musl = " -mmusl"
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
+	base_sbindir=${10:-${base_sbindir_nativesdk}}
+	base_bindir=${9:-${base_bindir_nativesdk}}
+	sbindir=${8:-${sbindir_nativesdk}}
 	sdkpathnative=${7:-${SDKPATHNATIVE}}
 	prefix=${6:-${prefix_nativesdk}}
 	bindir=${5:-${bindir_nativesdk}}
@@ -23,7 +26,7 @@ toolchain_create_sdk_env_script () {
 	for i in ${CANADIANEXTRAOS}; do
 		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
-	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
+	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
 	echo "export CCACHE_PATH=$sdkpathnative$bindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$CCACHE_PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2b81be1..6b18ae8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -62,6 +62,9 @@ bindir_cross = "/bin"
 bindir_crossscripts = "${bindir}/crossscripts"
 prefix_nativesdk = "/usr"
 bindir_nativesdk = "${prefix_nativesdk}/bin"
+sbindir_nativesdk = "${prefix_nativesdk}/sbin"
+base_bindir_nativesdk = "/bin"
+base_sbindir_nativesdk = "/sbin"
 includedir_nativesdk = "${prefix_nativesdk}/include"
 libdir_nativesdk = "${prefix_nativesdk}/lib"
 base_libdir_nativesdk = "/lib"
-- 
1.9.1


