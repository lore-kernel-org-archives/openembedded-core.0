Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TFP38-0004gI-RO
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:43:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2012 05:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,467,1344236400"; d="scan'208";a="196428774"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.225])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2012 05:30:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 13:29:56 +0100
Message-Id: <cf0d3814e3a9e96a6358caa109c0c1e1554a1467.1348316945.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348316945.git.paul.eggleton@linux.intel.com>
References: <cover.1348316945.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1348316945.git.paul.eggleton@linux.intel.com>
References: <cover.1348316945.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/2] classes/multilib: ensure MLPREFIX is set for image recipes
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
X-List-Received-Date: Sat, 22 Sep 2012 12:43:11 -0000

We need MLPREFIX to be set so that oe.utils.prune_suffix() (as used for
the value of BPN) can derive the bare name from the multilib-extended
name for image recipes. BPN being set correctly avoids missing file
warnings during parse from the file checksum code for (unusual) images
that set SRC_URI, such as build-appliance-image.

First half of the fix for [YOCTO #3146].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/multilib.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index b1a593e..4d3f889 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -12,6 +12,7 @@ python multilib_virtclass_handler () {
         raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
 
     if bb.data.inherits_class('image', e.data):
+        e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
         return
 
-- 
1.7.9.5



