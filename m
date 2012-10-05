Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TK5Fl-0000w7-C6
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 12:35:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Oct 2012 03:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="152754554"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Oct 2012 03:22:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 13:22:27 +0300
Message-Id: <1349432547-23974-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] cross-canadian.bbclass: add native chrpath dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 10:35:33 -0000

In order for the RPATHs in 32bit toolchain binaries to be relocated
properly, chrpath >=0.14 is needed.

[YOCTO #3161]
[YOCTO #3201]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/cross-canadian.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index aec7301..47fb0ab 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -54,6 +54,13 @@ LDFLAGS = "${BUILDSDK_LDFLAGS} \
 
 DEPENDS_GETTEXT = "gettext-native nativesdk-gettext"
 
+#
+# We need chrpath >= 0.14 to ensure we can deal with 32 and 64 bit
+# binaries
+#
+DEPENDS_append = " chrpath-replacement-native"
+EXTRANATIVEPATH += "chrpath-native"
+
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
 # target paths.
-- 
1.7.9.5



