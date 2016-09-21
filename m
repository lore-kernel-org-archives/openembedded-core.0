Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA916E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:35:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 21 Sep 2016 12:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="1034348353"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 12:35:52 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 20:35:36 +0100
Message-Id: <0066e9094d7f4a0fc2db37bfb5625ec73cec1b98.1474484610.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/4] runqemu: validate paths and attempt to infer unset paths
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
X-List-Received-Date: Wed, 21 Sep 2016 19:35:52 -0000

We need to validate and ensure all paths are set regardless of
whether runqemu was invoked with a .qemuboot.conf file or
otherwise. Split this logic out into a separate method called
during check_and_set()

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 08dc306..5170d87 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -536,6 +536,7 @@ class BaseConfig(object):
 
     def check_and_set(self):
         """Check configs sanity and set when needed"""
+        self.validate_paths()
         check_tun()
         # Check audio
         if self.audio_enabled:
@@ -598,6 +599,8 @@ class BaseConfig(object):
             k_upper = k.upper()
             self.set(k_upper, v)
 
+    def validate_paths(self):
+        """Ensure all relevant path variables are set"""
         # When we're started with a *.qemuboot.conf arg assume that image
         # artefacts are relative to that file, rather than in whatever
         # directory DEPLOY_DIR_IMAGE in the conf file points to.
-- 
2.7.4


