Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7cLC-0006ne-ER
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:45:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77188033"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.185])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:36:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 00:36:27 +0000
Message-Id: <e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Wed, 14 Mar 2012 00:45:22 -0000

If the user is in any directory other than $BUILDDIR when the bitbake
wrapper script is run, then show an error an exit.

Fixes [YOCTO #2071].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index dda3b26..45c8697 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -47,6 +47,11 @@ float_test() {
 # but earlier versions do not
 float_test "$TARVERSION > 1.23" && needtar="0"
 
+if [ "`pwd`" != "$BUILDDIR" ] ; then
+    echo "BitBake must be run from your build directory: $BUILDDIR"
+    exit 1
+fi
+
 buildpseudo="1"
 if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
     PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
-- 
1.7.5.4



