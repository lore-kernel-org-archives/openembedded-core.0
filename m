Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 22C2176DD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041425"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:20 +0100
Message-Id: <60190effa4aca297a21d19bc6d33b0b059dae35f.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] classes/buildhistory: add build result to commit message
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:46 -0000

We have the command in the commit message, we might as well have the
build result as well (succeeded/failed and whether or not it was
interrupted by the user). The interrupted part relies upon a change to
BitBake to extend the BuildCompleted event to include an attribute for
that, but will not fail if the attribute is not present.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 135d17a..4db0441 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -593,12 +593,27 @@ buildhistory_single_commit() {
 		commitopts="$3 metadata-revs"
 		item="$3"
 	fi
+	if [ "${BUILDHISTORY_BUILD_FAILURES}" = "0" ] ; then
+		result="succeeded"
+	else
+		result="failed"
+	fi
+	case ${BUILDHISTORY_BUILD_INTERRUPTED} in
+		1)
+			result="$result (interrupted)"
+			;;
+		2)
+			result="$result (force interrupted)"
+			;;
+	esac
 	commitmsgfile=`mktemp`
 	cat > $commitmsgfile << END
 $item: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $2
 
 cmd: $1
 
+result: $result
+
 metadata revisions:
 END
 	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
@@ -659,7 +674,11 @@ python buildhistory_eventhandler() {
     if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
         if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
             bb.note("Writing buildhistory")
-            bb.build.exec_func("buildhistory_commit", e.data)
+            localdata = bb.data.createCopy(e.data)
+            localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
+            interrupted = getattr(e, '_interrupted', 0)
+            localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
+            bb.build.exec_func("buildhistory_commit", localdata)
 }
 
 addhandler buildhistory_eventhandler
-- 
2.1.0


