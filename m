Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14F45606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 21:38:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jul 2016 14:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,421,1464678000"; d="scan'208";a="1023746097"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2016 14:38:08 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2016 13:31:25 +0000
Message-Id: <a609076dc0570bcd0ae3b8ed790611098091259e.1469453438.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469453438.git.mariano.lopez@linux.intel.com>
References: <cover.1469453438.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] useradd.bbclass: Fix delete user/group when more than one item
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
X-List-Received-Date: Mon, 25 Jul 2016 21:38:08 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently when a recipe adds more than one user/group, the
cleansstate task will delete only the first user/group. This
will solve this behavior and delete all users/groups.

[YOCTO #9943]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/useradd.bbclass | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 28dd341..8d51fb5 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -137,15 +137,21 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
         GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
         USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
 
-        if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
-            user=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
+        user=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
+        remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
+        while test "x$user" != "x"; do
             perform_userdel "${STAGING_DIR_TARGET}" "$OPT $user"
-        fi
-
-        if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
-            group=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
-            perform_groupdel "${STAGING_DIR_TARGET}" "$OPT $group"
-        fi
+            user=`echo "$remaining" | cut -d ';' -f 1 | awk '{ print $NF }'`
+            remaining=`echo "$remaining" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
+        done
+
+        user=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
+        remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
+        while test "x$user" != "x"; do
+            perform_groupdel "${STAGING_DIR_TARGET}" "$OPT $user"
+            user=`echo "$remaining" | cut -d ';' -f 1 | awk '{ print $NF }'`
+            remaining=`echo "$remaining" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
+        done
 
     fi
 fi
-- 
2.6.6


