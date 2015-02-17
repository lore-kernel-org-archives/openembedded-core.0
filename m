Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2544973586
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:08:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 05:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,594,1418112000"; d="scan'208";a="686780958"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2015 05:08:17 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:08:03 +0200
Message-Id: <b05c7ef06c8a8d75583b1a3b9ef3b89bf5dfe488.1424178303.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
Subject: [PATCH v2 10/11] default-providers: Set the preferred provider for bluez based on version
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
X-List-Received-Date: Tue, 17 Feb 2015 13:08:44 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

bitbake will currently 'selecting bluez4 to satisfy runtime
libasound-module-bluez due to PREFERRED_PROVIDER_bluez4 = bluez4'
which in the case of bluez5 isn't correct.
This slightly unusual construct avoids this.
Ultimately this is a bitbake issue that needs fixing in
a better way but this means we can merge the bluez5 changes
until bitbake gets fixed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 25118fa..8d92c2e 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -43,7 +43,7 @@ PREFERRED_PROVIDER_make ?= "make"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
-PREFERRED_PROVIDER_bluez4 ?= "bluez4"
+PREFERRED_PROVIDER_bluez4 ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez4',d)}"
 PREFERRED_PROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
-- 
2.1.0


