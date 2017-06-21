Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AE8FA6E672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 19:50:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 21 Jun 2017 12:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,370,1493708400"; d="scan'208";a="100223417"
Received: from novakdie-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.51.165])
	by orsmga004.jf.intel.com with ESMTP; 21 Jun 2017 12:50:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2017 21:49:54 +0200
Message-Id: <8bfdc82b618ab4e097bd49de5157e21e581dc854.1498074579.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1498074579.git.paul.eggleton@linux.intel.com>
References: <cover.1498074579.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-init-build-env-memres: swap parameter order
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
X-List-Received-Date: Wed, 21 Jun 2017 19:50:26 -0000

This script expected the port number to be specified first, which is
somewhat counter-intuitive especially if you're used to
oe-init-build-env; besides, in local usage you are unlikely to need to
specify a custom port. Given that few people are using this yet (based
on the issues I have recently fixed), switch the arguments around so
that the two scripts behave consistently.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 oe-init-build-env-memres | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 9e1425e..3f0d239 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -19,18 +19,18 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
 #
-# Normally this is called as '. ./oe-init-build-env-memres <portnumber> <builddir>'
+# Normally this is called as '. ./oe-init-build-env-memres <builddir> [portnumber]'
 #
 # This works in most shells (not dash), but not all of them pass the arguments
-# when being sourced.  To workaround the shell limitation use "set <portnumber>
-# <builddir>" prior to sourcing this script.
+# when being sourced.  To workaround the shell limitation use "set <builddir>
+# [portnumber]" prior to sourcing this script.
 #
-if [ -z "$1" ]; then
+if [ -z "$2" ]; then
     echo "No port specified, using dynamically selected port"
     port=-1
 else
-    port=$1
-    shift
+    port=$2
+    set -- "$1" "$3" "$4" "$5" "$6"
 fi
 
 if [ -n "$BASH_SOURCE" ]; then
-- 
2.9.4


