Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T2Dfg-0004uE-FI
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 05:56:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2012 20:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,782,1336374000"; d="scan'208";a="203251920"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2012 20:44:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 06:44:21 +0300
Message-Id: <f816e741fd76acb79b4f807a47bba6f159d13189.1345174354.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345174354.git.laurentiu.palcu@intel.com>
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1345174354.git.laurentiu.palcu@intel.com>
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/3] package.bbclass: change RPATHs for cross-canadian binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 03:56:28 -0000

When building the meta-toolchain, the binaries didn't get relocatable
RPATHs. They were hardcoded to the default path. Hence, if one had
already installed one SDK in the default path and one in another
location, the later toolchain's binaries would search and load libraries
from the first location, ending in a "Segmentation Fault".

[YOCTO #2927]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/package.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d122cd9..278f0f0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -448,7 +448,7 @@ python perform_packagecopy () {
     subprocess.call('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar), shell=True)
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
-    if bb.data.inherits_class('nativesdk', d):
+    if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):
         rpath_replace (dvar, d)
 }
 
-- 
1.7.9.5



