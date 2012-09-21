Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TF6To-0006UK-9V
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 18:53:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2012 09:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,463,1344236400"; d="scan'208";a="147626878"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.241])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2012 09:40:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 17:40:37 +0100
Message-Id: <2364b5deb93745b2964fb46aebc460094fd227b6.1348245594.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348245594.git.paul.eggleton@linux.intel.com>
References: <cover.1348245594.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1348245594.git.paul.eggleton@linux.intel.com>
References: <cover.1348245594.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/multilib: prevent multilib extension of nativesdk recipes
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
X-List-Received-Date: Fri, 21 Sep 2012 16:53:28 -0000

It isn't supported to mix multilib and nativesdk in the same target, so
explicitly skip multilib processing if nativesdk is inherited. As a
bonus this fixes a bunch of related "missing file" warnings from the
file checksum code during parsing because BPN was not correctly stripped
for these targets.

Second half of the fix for [YOCTO #3146].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/multilib.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 25cf068..6923822 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -14,6 +14,9 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('native', e.data):
         raise bb.parse.SkipPackage("We can't extend native recipes")
 
+    if bb.data.inherits_class('nativesdk', e.data):
+        raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
+
     # Set variables suitable for image recipes (as well as everything else)
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-- 
1.7.9.5



