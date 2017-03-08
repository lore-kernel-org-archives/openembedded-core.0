Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1F593774E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 08:55:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 08 Mar 2017 00:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,262,1486454400"; d="scan'208";a="1139427866"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2017 00:55:17 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id B97996A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 00:55:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 10:54:44 +0200
Message-Id: <1488963284-5915-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] useradd.bbclass: drop obsolete code
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
X-List-Received-Date: Wed, 08 Mar 2017 08:55:17 -0000

Cleanup useradd class by removing the code made obsolete by
the introduction of Recipe Specific Sysroot.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
Changes in v2:

Update PSEUDO_PASSWD as it is required by pseudo and without it
ipk builds would break
---
 meta/classes/useradd.bbclass | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 326c04d..6a3fa27 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -32,7 +32,7 @@ if test "x$D" != "x"; then
 	fi
 
 	# user/group lookups should match useradd/groupadd --root
-	export PSEUDO_PASSWD="$SYSROOT:${STAGING_DIR_NATIVE}"
+	export PSEUDO_PASSWD="$SYSROOT"
 fi
 
 # If we're not doing a special SSTATE/SYSROOT install
@@ -132,38 +132,6 @@ python useradd_sysroot_sstate () {
         bb.build.exec_func("useradd_sysroot", d)
 }
 
-userdel_sysroot_sstate () {
-if test "x${STAGING_DIR_TARGET}" != "x"; then
-    if [ "${BB_CURRENTTASK}" = "clean" ]; then
-        export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-        OPT="--root ${STAGING_DIR_TARGET}"
-
-        # Remove groups and users defined for package
-        GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
-        USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
-
-        user=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
-        remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
-        while test "x$user" != "x"; do
-            perform_userdel "${STAGING_DIR_TARGET}" "$OPT $user"
-            user=`echo "$remaining" | cut -d ';' -f 1 | awk '{ print $NF }'`
-            remaining=`echo "$remaining" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
-        done
-
-        user=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
-        remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
-        while test "x$user" != "x"; do
-            perform_groupdel "${STAGING_DIR_TARGET}" "$OPT $user"
-            user=`echo "$remaining" | cut -d ';' -f 1 | awk '{ print $NF }'`
-            remaining=`echo "$remaining" | cut -d ';' -f 2- -s | sed -e 's#[ \t]*$##'`
-        done
-
-    fi
-fi
-}
-
-#SSTATECLEANFUNCS_append_class-target = " userdel_sysroot_sstate"
-
 do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
 SYSROOTFUNC = ""
-- 
2.4.0


