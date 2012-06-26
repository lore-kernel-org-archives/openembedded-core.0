Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjaAk-0007bB-Fb
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 20:07:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jun 2012 10:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="158455160"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.180])
	by orsmga001.jf.intel.com with ESMTP; 26 Jun 2012 10:56:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 10:56:04 -0700
Message-Id: <1340733364-29968-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] native.bbclass: correct PATH to have native-intercept be prepended
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
X-List-Received-Date: Tue, 26 Jun 2012 18:07:31 -0000

This was needed since it was after the sysroots and thus in some cases
the native sysroot chown was being found and used instead of the script
provided by native-intercept/chown.  This was noticed by the non-gplv3
build since it's coreutils depends on coreutils-native.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/native.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index bca48d4..eb30b5a 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -99,7 +99,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
 LIBCOVERRIDE = ""
 CLASSOVERRIDE = "class-native"
 
-PATH =. "${COREBASE}/scripts/native-intercept:"
+PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 
 python native_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
-- 
1.7.7.6



