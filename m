Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEX-0005Ph-G4
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028485"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:53 -0700
Message-Id: <bd147a11cf2ec545d29e3e1b190b5219535d9d8a.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 16:56:49 -0700
Date: Wed, 27 Apr 2011  0:29:53 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 32/52] logging: fix oedebug loglevel test
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:25 -0000

From: Darren Hart <dvhart@linux.intel.com>

When the existing test for loglevel fails, the syntax used results in the recipe
exiting with a silent failure. Performing any bash command after the test block
resolves the problem, such as "shift" or "echo ''". Rewriting with 'if []; then'
blocks provides a cleaner syntax and also resolves the failure.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/base.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 44fab53..7ca396d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -53,15 +53,15 @@ oefatal() {
 }
 
 oedebug() {
-	test $# -ge 2 || {
+	if [ $# -lt 2]; then
 		echo "Usage: oedebug level \"message\""
 		exit 1
-	}
+	fi
 
-	test ${OEDEBUG:-0} -ge $1 && {
+	if [ ${OEDEBUG:-0} -ge $1 ]; then
 		shift
 		echo "DEBUG:" $*
-	}
+	fi
 }
 
 oe_runmake() {
-- 
1.7.1.1



