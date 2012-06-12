Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SeT1E-0002Le-Lz
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:28:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Jun 2012 08:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111200976"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jun 2012 08:17:56 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 18:17:51 +0300
Message-Id: <1339514272-7427-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339514272-7427-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339514272-7427-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] sanity.bbclass: warn the user if BBPATH contains wrong entries
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
X-List-Received-Date: Tue, 12 Jun 2012 15:28:32 -0000

If BBPATH references the working directory, the user is warned and asked
to fix the problem.

[Yocto #1465]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/sanity.bbclass |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f79fc3f..6ed1e6f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -387,6 +387,17 @@ def check_sanity(sanity_data):
     if "." in paths or "" in paths:
         messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
 
+    bbpaths = sanity_data.getVar('BBPATH', True).split(":")
+    if "." in bbpaths or "" in bbpaths:
+        # TODO: change the following message to fatal when all BBPATH issues
+        # are fixed
+        bb.warn("BBPATH references the current directory, either through "    \
+                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
+                "layer configuration is adding empty elements to BBPATH.\n\t "\
+                "Please check your layer.conf files and other BBPATH "        \
+                "settings to remove the current working directory "           \
+                "references.");
+
     if sanity_data.getVar('TARGET_ARCH', True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
-- 
1.7.9.5



