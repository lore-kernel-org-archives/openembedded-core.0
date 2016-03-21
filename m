Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93A816014F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 15:57:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2016 08:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="928683351"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2016 08:57:36 -0700
Received: from mbabyjoh-desk.ger.corp.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D1E746A4002
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:45:18 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 17:57:09 +0200
Message-Id: <1458575829-7484-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1458575829-7484-1-git-send-email-maxin.john@intel.com>
References: <1458575829-7484-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] useradd.bbclass: remove user/group created by the package in cleanall task
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
X-List-Received-Date: Mon, 21 Mar 2016 15:57:42 -0000

At present, if a recipe is built which creates users/groups via useradd.bbclass,
those users/groups are not removed (at least from sysroot) when the
recipe/package is cleaned using cleansstate/cleanall.

This "userdel_sysroot_sstate()" provides that functionality. Please note
that this function does not affect the users/groups created in the final
root filesystem.

[YOCTO #9262]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/useradd.bbclass | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0a6f2be..a8e4a50 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -127,6 +127,33 @@ useradd_sysroot_sstate () {
 	fi
 }
 
+userdel_sysroot_sstate () {
+if test "x${STAGING_DIR_TARGET}" != "x"; then
+    export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir}/pseudo"
+    OPT="--root ${STAGING_DIR_TARGET}"
+
+    # Remove groups and users defined for package
+    GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
+    USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
+
+    if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
+        user=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
+        perform_userdel "${STAGING_DIR_TARGET}" "$OPT $user"
+    fi
+
+    if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
+        group=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
+        perform_groupdel "${STAGING_DIR_TARGET}" "$OPT $group"
+    fi
+fi
+}
+
+do_cleansstate[prefuncs] += "${SYSROOTCLEANFUNC}"
+SYSROOTCLEANFUNC = "userdel_sysroot_sstate"
+SYSROOTCLEANFUNC_class-cross = ""
+SYSROOTCLEANFUNC_class-native = ""
+SYSROOTCLEANFUNC_class-nativesdk = ""
+
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
 SYSROOTFUNC_class-cross = ""
-- 
2.4.0


