Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZX-0001h3-TZ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344555"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:19 -0700
Message-Id: <c35323a70e452d18e965f7aeb6508775ff2d9630.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/20] native.bbclass: correct PATH to have native-intercept be prepended
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:28 -0000

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



