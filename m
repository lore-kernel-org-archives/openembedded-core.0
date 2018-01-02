Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 485E2606CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 08:59:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 00:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,496,1508828400"; d="scan'208";a="20701986"
Received: from anujm-desk.png.intel.com ([172.30.199.130])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2018 00:59:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 16:59:15 +0800
Message-Id: <1514883555-14935-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] boost: fix build with x32 and musl
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
X-List-Received-Date: Tue, 02 Jan 2018 08:59:26 -0000

Make sure that boost picks up correct address model value
for x32 even when musl is enabled.

Fixes [YOCTO #12119]

Suggested-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index f4ecc10..41fc90f 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -169,7 +169,7 @@ BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 
 # Adjust the build for x32
-BJAM_OPTS_append_linux-gnux32 = " abi=x32 address-model=64"
+BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
 
 do_configure() {
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
-- 
2.7.4


