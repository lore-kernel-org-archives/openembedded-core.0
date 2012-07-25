Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3b-0004Xl-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:30:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897544"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:18:55 -0700
Message-Id: <138c3c26830e48a56ca7cb3e5feca324d13ec89c.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/28] initscripts: don't bg mk_dirs in populate-volatile
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
X-List-Received-Date: Wed, 25 Jul 2012 07:30:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

If a directory needs to be created to create something else in volatiles,
there's no guarantees on ordering due to the backgrounding. We can't guarantee
with certainty that the create directory commands are complete before the
later ones run. This ensures that we wait for directory creations to complete
before we proceed.

Chris Hallinan hit an actual failure due to this back in March of last year.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../initscripts-1.0/populate-volatile.sh           |    4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 4a99aff..d2175d7 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -42,7 +42,7 @@ mk_dir() {
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-	  eval $EXEC &
+	  eval $EXEC
 	}
 }
 
@@ -153,7 +153,7 @@ apply_cfgfile() {
             create_file "${TNAME}" &
 	    ;;
       "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
-            mk_dir "${TNAME}" &
+            mk_dir "${TNAME}"
 	    # Add check to see if there's an entry in fstab to mount.
 	    ;;
       *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1d80c55..b741b61 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r135"
+PR = "r136"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.7.6



