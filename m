Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TVMbf-0003LB-Aj
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 14:20:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Nov 2012 05:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,714,1344236400"; d="scan'208";a="244279793"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2012 05:07:01 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2012 15:06:59 +0200
Message-Id: <1352120820-21261-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] populate_sdk_base.bbclass: use SDK_ARCH instead of SDKMACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2012 13:20:51 -0000

If SDKMACHINE is not set, the toolchain will be built but the tarball
installer will not run. A better choice is to use SDK_ARCH because, even
if SDKMACHINE is not set, SDK_ARCH is set, by default, to BUILD_HOST.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index dc715c4..ac34c32 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -119,9 +119,9 @@ fakeroot create_shar() {
 #!/bin/bash
 
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-SDKMACHINE=$(echo ${SDKMACHINE} | sed -e "s/i[5-6]86/ix86/")
+SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[5-6]86/ix86/")
 
-if [ "$INST_ARCH" != "$SDKMACHINE" ]; then
+if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
 	echo "Error: Installation machine not supported!"
 	exit -1
 fi
-- 
1.7.9.5



