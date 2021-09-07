Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.32582.1630998136647915212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344480"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804504"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/11] sdk: Decouple default install path from built in path
Date: Tue,  7 Sep 2021 15:02:00 +0800
Message-Id: <1b4309ee196c45661ddb79d8529517a8777a8d53.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630997270.git.anuj.mittal@intel.com>
References: <cover.1630997270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add SDKPATHINSTALL which is used as the default install location of the SDK
instead of SDKPATH. This means the default install path isn't encoded into
every SDK binary, meaning if a date is used there the entire SDK doesn't
have to rebuild. Most distros can switch to only customise SDKPATHINSTALL
meaning more sstate reuse too.

[YOCTO #14100]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc4ee5453560dcefc4a4ecc5657df5cc1666e153)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 meta/conf/bitbake.conf                 | 4 +++-
 meta/files/toolchain-shar-extract.sh   | 3 ++-
 meta/files/toolchain-shar-relocate.sh  | 2 +-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f8072a9d37..2d33611ddd 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -280,6 +280,7 @@ EOF
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
+		-e 's#@SDKPATHINSTALL@#${SDKPATHINSTALL}#g' \
 		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5b52e9307e..d0b92a996a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -422,8 +422,10 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
 SDK_NAME_PREFIX ?= "oecore"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
-SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
+SDKPATH = "/usr/local/oe-sdk-hardcoded-buildpath"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
+# The path to default to installing the SDK to
+SDKPATHINSTALL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 
 ##################################################################
 # Kernel info.
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index dd9342758b..4386b985bb 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -56,7 +56,8 @@ if ! xz -V > /dev/null 2>&1; then
 	exit 1
 fi
 
-DEFAULT_INSTALL_DIR="@SDKPATH@"
+SDK_BUILD_PATH="@SDKPATH@"
+DEFAULT_INSTALL_DIR="@SDKPATHINSTALL@"
 SUDO_EXEC=""
 EXTRA_TAR_OPTIONS=""
 target_sdk_dir=""
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index ba873373e2..3ece04db0a 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -61,7 +61,7 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
              -e "$target_sdk_dir/post-relocate-setup" \
              -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
-        -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
+        -e "s:$SDK_BUILD_PATH:$target_sdk_dir:g" \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
         -e "s: /usr/bin/perl: /usr/bin/env perl:g"
 
-- 
2.31.1

