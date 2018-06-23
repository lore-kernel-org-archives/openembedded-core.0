Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 19BA17548B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 10:53:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41424601"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2018 18:53:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id DBAD64B41ED0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 18:53:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Sat, 23 Jun 2018 18:53:57 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Jun 2018 03:53:01 +0800
Message-ID: <1529783581-46179-9-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: DBAD64B41ED0.AA7CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 8/8] [PATCH v2] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Sat, 23 Jun 2018 10:53:56 -0000
Content-Type: text/plain

Add dnf-nativesdk and it's runtime dependence to make dnf work on cross-development environment.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/classes/toolchain-scripts.bbclass                             | 1 +
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 0ff5301..63a7ee4 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -97,6 +97,7 @@ toolchain_shared_env_script () {
 	echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
 	echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
+        echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export ARCH=${ARCH}' >> $script
 	echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index e2f6169..1370a82 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,6 +25,10 @@ RDEPENDS_${PN} = "\
     nativesdk-cmake \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     nativesdk-sdk-provides-dummy \
+    nativesdk-libnewt-python \
+    nativesdk-createrepo-c \
+    nativesdk-gpgme \
+    nativesdk-update-rc.d \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
2.7.4




