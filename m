Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01F5679005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:53:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7K8rRPY010582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 01:53:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 20 Aug 2018 01:53:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2018 16:57:54 +0800
Message-ID: <e11e027ec35999b0745b5da51a1433f620c35ae4.1534755428.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1534755428.git.Qi.Chen@windriver.com>
References: <cover.1534755428.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cmake-native: fix to function correctly in case of eSDK
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
X-List-Received-Date: Mon, 20 Aug 2018 08:53:26 -0000
Content-Type: text/plain

Our eSDK is expected to provide traditional SDK's functionality. But
for cmake, it could not function well in eSDK.

This problem is discovered by the assimp.py test case. The error message
is as below.

  testsdkext/tmp/sysroots/x86_64/usr/lib/libz.so: error adding symbols: file in wrong format
  collect2: error: ld returned 1 exit status

The problem is about cmake-native being unable to find the correct lib.
nativesdk-cmake has solved this problem. So make use of the solution to
solve the eSDK problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.11.4.bb | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
index 9f371e9..f55c519 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
@@ -3,7 +3,12 @@ inherit native
 
 DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native"
 
-SRC_URI += "file://0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch"
+SRC_URI += "file://0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
+            file://OEToolchainConfig.cmake \
+            file://environment.d-cmake.sh \
+            file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+            "
+
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
@@ -31,6 +36,15 @@ do_compile() {
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
+
+	# The following codes are here because eSDK needs to provide compatibilty
+	# for SDK. That is, eSDK could also be used like traditional SDK.
+	mkdir -p ${D}${datadir}/cmake
+	install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
+	mkdir -p ${D}${base_prefix}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${base_prefix}/environment-setup.d/cmake.sh
 }
 
 do_compile[progress] = "percent"
+
+SYSROOT_DIRS_NATIVE += "${datadir}/cmake ${base_prefix}/environment-setup.d"
-- 
1.9.1


