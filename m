Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6364672F97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:39:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 01:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="70427056"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2017 01:39:50 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id BDCFA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:39:48 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 11:41:15 +0200
Message-Id: <1488274875-10233-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1488274875-10233-1-git-send-email-maxin.john@intel.com>
References: <1488274875-10233-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] useradd.bbclass: drop obsolete code
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
X-List-Received-Date: Tue, 28 Feb 2017 09:39:49 -0000

Cleanup useradd class by removing the code made obsolete by
the introduction of Recipe Specific Sysroot.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/useradd.bbclass | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 326c04d..bbc7053 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -30,9 +30,6 @@ if test "x$D" != "x"; then
 	if [ ! -e $D${sysconfdir}/login.defs -a -e $D${sysconfdir}/login.defs.dpkg-new ]; then
 	    cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
 	fi
-
-	# user/group lookups should match useradd/groupadd --root
-	export PSEUDO_PASSWD="$SYSROOT:${STAGING_DIR_NATIVE}"
 fi
 
 # If we're not doing a special SSTATE/SYSROOT install
@@ -132,38 +129,6 @@ python useradd_sysroot_sstate () {
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


