Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27D0271B4D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 03:24:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 31 Oct 2016 20:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,577,1473145200"; d="scan'208";a="1053317620"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2016 20:24:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 16:24:23 +1300
Message-Id: <f3635dee8a440ebe0e796c2b3ca3c6bb0ee35af9.1477970643.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477970643.git.paul.eggleton@linux.intel.com>
References: <cover.1477970643.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477970643.git.paul.eggleton@linux.intel.com>
References: <cover.1477970643.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/nativesdk: set SDK_OLDEST_KERNEL appropriately
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
X-List-Received-Date: Tue, 01 Nov 2016 03:24:55 -0000

SDK_OLDEST_KERNEL currently only controls the check on SDK installation,
however as with OLDEST_KERNEL it should be controlling the OLDEST_KERNEL
value for building glibc used in the SDK. Thus, set it in
nativesdk.bbclass. This means we need to move the default to
bitbake.conf so that it can be seen in both places.

Also set a more reasonable default for SDK_OLDEST_KERNEL for x86/x86-64 as
glibc 2.24 still supports back to 2.6.32 there and there are still
people wanting to build SDKs that will install on older distros (e.g.
CentOS 6). However it's not possible to set this with overrides since
there aren't any for the SDK_ARCH, however we can instead set the variable
from conf files in conf/machine-sdk especially as there is now a soft
default for SDKMACHINE.

Fixes [YOCTO #10561].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/nativesdk.bbclass         | 2 ++
 meta/classes/populate_sdk_base.bbclass | 5 -----
 meta/conf/bitbake.conf                 | 5 +++++
 meta/conf/machine-sdk/i586.conf        | 1 +
 meta/conf/machine-sdk/i686.conf        | 1 +
 meta/conf/machine-sdk/x86_64.conf      | 1 +
 6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index a78257c..31dde4a 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -97,3 +97,5 @@ do_populate_sysroot[stamp-extra-info] = ""
 do_packagedata[stamp-extra-info] = ""
 
 USE_NLS = "${SDKUSE_NLS}"
+
+OLDEST_KERNEL = "${SDK_OLDEST_KERNEL}"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a762655..69aae26 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -89,11 +89,6 @@ POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
 
-# Some archs override this, we need the nativesdk version
-# turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
-# manipulation.
-SDK_OLDEST_KERNEL = "3.2.0"
-
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 54a587f..9f445bb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -408,6 +408,11 @@ OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 OLDEST_KERNEL_nios2 = "3.19"
 
+# SDK_OLDEST_KERNEL can't be set using overrides since there are
+# none for the SDK architecture. Best to set it from a machine-sdk
+# include file if you need an SDK arch-specific value
+SDK_OLDEST_KERNEL = "3.2.0"
+
 # Define where the kernel headers are installed on the target as well as where
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586.conf
index 41e5e15..99083fb 100644
--- a/meta/conf/machine-sdk/i586.conf
+++ b/meta/conf/machine-sdk/i586.conf
@@ -1,4 +1,5 @@
 SDK_ARCH = "i586"
 SDK_CC_ARCH = "-march=i586"
 ABIEXTENSION_class-nativesdk = ""
+SDK_OLDEST_KERNEL = "2.6.32"
 
diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686.conf
index fe40697..cf22784 100644
--- a/meta/conf/machine-sdk/i686.conf
+++ b/meta/conf/machine-sdk/i686.conf
@@ -1,3 +1,4 @@
 SDK_ARCH = "i686"
 SDK_CC_ARCH = "-march=i686"
 ABIEXTENSION_class-nativesdk = ""
+SDK_OLDEST_KERNEL = "2.6.32"
diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
index 61439b4..7d2e717 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1,2 +1,3 @@
 SDK_ARCH = "x86_64"
 ABIEXTENSION_class-nativesdk = ""
+SDK_OLDEST_KERNEL = "2.6.32"
-- 
2.5.5


