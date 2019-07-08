Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0717D3B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 07:25:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x687PM8x007607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2019 00:25:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 8 Jul 2019 00:25:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2019 15:37:55 +0800
Message-ID: <0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562570956.git.Qi.Chen@windriver.com>
References: <cover.1562570956.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Mon, 08 Jul 2019 07:25:25 -0000
Content-Type: text/plain

For build-sysroots.bb, the xmlcatalog would not be in its
staging directory. Causing the following error for eSDK.

ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.
ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function failed: do_build_native_sysroot

The problem could be reproduced by the following steps.
1. Add in local.conf:
   IMAGE_INSTALL_append = " btrfs-tools"
   DISTRO_FEATURES_append = " api-documentation"
   INHERIT += "testsdk"
2. bitbake core-image-minimal -c populate_sdk_ext
3. bitbake core-image-minimal -c testsdkext

So we add nativesdk-libxml2-utils to buildtools-tarball
to ensure the existence of xmlcatalog. Also add it
to HOSTTOOLS_NONFATAL so it could be seen by bitbake.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf                       | 3 +++
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 2 files changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5e93f5c..2f64eae 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -517,6 +517,9 @@ HOSTTOOLS_NONFATAL += "scp"
 # Link to git-lfs if present
 HOSTTOOLS_NONFATAL += "git-lfs"
 
+# build-sysroot needs xmlcatalog in order for eSDK installation
+HOSTTOOLS_NONFATAL += "xmlcatalog"
+
 CCACHE ??= ""
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 91df6f1..d39d6f7 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-texinfo \
     nativesdk-libnss-nis \
     nativesdk-rpcsvc-proto \
+    nativesdk-libxml2-utils \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
1.9.1


