Return-Path: <chin.huat.ang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B14547F450
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:59:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 22:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="168519884"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 06 Aug 2019 22:52:33 -0700
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed,  7 Aug 2019 13:52:28 +0800
Message-Id: <1565157150-7729-2-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
References: <1565157150-7729-1-git-send-email-chin.huat.ang@intel.com>
Subject: [warrior][PATCH 2/4] efivar: ensure that target security flags are not used to build native code
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
X-List-Received-Date: Wed, 07 Aug 2019 05:59:38 -0000

From: Ross Burton <ross.burton@intel.com>

Also set LDFLAGS=BUILD_LDFLAGS when compiling makeguids to ensure that any
target compiler flags are not passed to the native compiler.

[ YOCTO #13423 ]

(From OE-Core rev: f61e0676aabba9e006c32f0e53c69426368cd4f0)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/efivar/efivar_37.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index c4254c7..9b95721 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -23,7 +23,10 @@ LDFLAGS += "-fuse-ld=bfd"
 
 do_compile_prepend() {
     # Remove when https://github.com/rhboot/efivar/issues/130 is fixed
-    oe_runmake CFLAGS="${BUILD_CFLAGS}" -C src makeguids
+    oe_runmake \
+        CFLAGS="${BUILD_CFLAGS}" \
+        LDFLAGS="${BUILD_LDFLAGS}" \
+        -C src makeguids
 }
 
 do_install() {
-- 
2.7.4


