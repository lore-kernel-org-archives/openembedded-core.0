Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E434B71DE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 18:42:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 09 Oct 2017 11:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,501,1500966000"; d="scan'208";a="1228851066"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2017 11:42:41 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Oct 2017 11:42:40 -0700
Message-Id: <20171009184240.31948-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] bitbake.conf: Adds ipv6 to DISTRO_FEATURES_NATIVE
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
X-List-Received-Date: Mon, 09 Oct 2017 18:42:41 -0000

Before we introduced DISTRO_FEATURES_NATIVE on commit:
db1f1adace58763c35774e3fdfeaac5c3ca646fd

ipv6 was enabled by default on DISTRO_FEATURES via DISTRO_FEATURES_LIBC
hence for example python-native was built with ipv6 support.

After this, ipv6 was automatically disabled on DISTRO_FEATURES.

On some packages (python) this may cause errors when they try to download
something on their do_compile stage.

This patch adds ipv6 to DISTRO_FEATURES_NATIVE leaving it as it was
before, to avoid errors like the one mentioned above

[YOCTO #11978]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f41680b27e2..2af2fa5c59b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -807,7 +807,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?= "x11"
+DISTRO_FEATURES_NATIVE ?= "x11 ipv6"
 DISTRO_FEATURES_NATIVESDK ?= "x11 libc-charsets libc-locales libc-locale-code"
 
 # Normally target distro features will not be applied to native builds:
-- 
2.12.3


