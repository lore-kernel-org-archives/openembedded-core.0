Return-Path: <vernon.mauery@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 75F7079343
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 21:18:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2018 14:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,303,1534834800"; d="scan'208";a="93671792"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
	([10.7.150.62])
	by orsmga001.jf.intel.com with ESMTP; 25 Sep 2018 14:18:08 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:17:59 -0700
Message-Id: <20180925211759.1345-1-vernon.mauery@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] boost: build context and coroutine for arm
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
X-List-Received-Date: Tue, 25 Sep 2018 21:18:07 -0000

When cross-compiling for arm architecture, bjam fails to properly
detect the abi, which causes a failed conditional to omit the
assembly code that supports the platform.

Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 meta/recipes-support/boost/boost.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 6984bee777..c4faea211f 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -33,6 +33,7 @@ BOOST_LIBS = "\
 BOOST_LIBS_append_x86 = " context coroutine"
 BOOST_LIBS_append_x86-64 = " context coroutine"
 BOOST_LIBS_append_powerpc = " context coroutine"
+BOOST_LIBS_append_arm = " context coroutine"
 # need consistent settings for native builds (x86 override not applied for native)
 BOOST_LIBS_remove_class-native = " context coroutine"
 # does not compile
@@ -149,6 +150,9 @@ BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 # Adjust the build for x32
 BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
 
+# cross compiling for arm fails to detect abi, so provide some help
+BJAM_OPTS_append_arm = " abi=aapcs architecture=arm"
+
 do_configure() {
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
 
-- 
2.17.1


