Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TFP37-0004gI-TX
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:43:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2012 05:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,467,1344236400"; d="scan'208";a="196428782"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.225])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2012 05:30:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 13:29:57 +0100
Message-Id: <29c686d2d3a1f87254d62226b0e6b30d58005986.1348316945.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348316945.git.paul.eggleton@linux.intel.com>
References: <cover.1348316945.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1348316945.git.paul.eggleton@linux.intel.com>
References: <cover.1348316945.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/2] classes/multilib: prevent multilib extension of nativesdk recipes
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
X-List-Received-Date: Sat, 22 Sep 2012 12:43:10 -0000

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
index 4d3f889..7d5fc41 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -19,6 +19,9 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('native', e.data):
         raise bb.parse.SkipPackage("We can't extend native recipes")
 
+    if bb.data.inherits_class('nativesdk', e.data):
+        raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
+
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
     for name in save_var_name.split():
         val=e.data.getVar(name, True)
-- 
1.7.9.5



