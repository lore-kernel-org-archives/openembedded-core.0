Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 95D9660896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:39:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 07:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="285865685"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 07:39:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:41:36 +0300
Message-Id: <35f8641371aa93729d304989f6f531f93303fbac.1377268510.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377268510.git.cristian.iorga@intel.com>
References: <cover.1377268510.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377268510.git.cristian.iorga@intel.com>
References: <cover.1377268510.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/1] default-providers: Set the preferred provider for bluez
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
X-List-Received-Date: Fri, 23 Aug 2013 14:39:48 -0000

There is a need for a default provider for bluez
now that bluez5 recipe is also present.

After the introduction of bluez5 recipe,
the following warnings are displayed:

"NOTE: multiple providers are available for runtime libasound-module-bluez (bluez4, bluez5)
 NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound-module-bluez"

Upon debug, bitbake shows:
DEBUG: checking PREFERRED_PROVIDER_bluez4 (value None) against ['bluez4', 'bluez5']
DEBUG: checking PREFERRED_PROVIDER_bluez4-4.101 (value None) against ['bluez4', 'bluez5']
DEBUG: checking PREFERRED_PROVIDER_bluez4-4.101-r5 (value None) against ['bluez4', 'bluez5']
DEBUG: checking PREFERRED_PROVIDER_bluez5 (value None) against ['bluez4', 'bluez5']
DEBUG: checking PREFERRED_PROVIDER_bluez5-5.7 (value None) against ['bluez4', 'bluez5']
DEBUG: checking PREFERRED_PROVIDER_bluez5-5.7-r0 (value None) against ['bluez4', 'bluez5']

Bitbake is faced with "what should provide libasound-module-bluez"
which is a runtime name. It needs to try and find a PREFERRED_PROVIDER
entry which matches this but those use *build time* naming.
So it converts "libasound-module-bluez" into
the canonical ${PN} of bluez4 and bluez5 and then
tries to look those up.
What it actually should do is go one step further
of mapping bluez4/bluex5 into the virtual/bluez
But that does not happen;

Bug opened on this issue: YB5044
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5044

Fixes [YOCTO #5030].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 67cc5f5..9255fd6 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -39,3 +39,4 @@ PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
 PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
+PREFERRED_PROVIDER_bluez4 ?= "bluez4"
-- 
1.8.1.2


