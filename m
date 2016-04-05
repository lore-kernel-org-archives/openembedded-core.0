Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C33707706C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 07:25:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 05 Apr 2016 00:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,443,1455004800"; d="scan'208";a="951847976"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2016 00:25:09 -0700
Received: from mbabyjoh-desk.ger.corp.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 192906A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 01:12:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 10:25:15 +0300
Message-Id: <1459841115-15996-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] useradd.bbclass: remove user/group created by the package in clean* task
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
X-List-Received-Date: Tue, 05 Apr 2016 07:25:20 -0000

At present, if a recipe is built which creates users/groups via useradd.bbclass,
those users/groups are not removed (at least from sysroot) when the
recipe/package is cleaned using clean/cleansstate/cleanall.

The "userdel_sysroot_sstate()" provides that functionality.

[YOCTO #9262]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/sstate.bbclass  |  6 ++++++
 meta/classes/useradd.bbclass | 26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6f285da..96b6265 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -51,6 +51,7 @@ SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= ""
+SSTATECLEANFUNCS = ""
 
 SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
 
@@ -444,6 +445,11 @@ def sstate_clean(ss, d):
                 stfile.endswith(rm_nohash):
             oe.path.remove(stfile)
 
+    # Remove the users/groups created by the package
+    for cleanfunc in (d.getVar('SSTATECLEANFUNCS', True) or '').split():
+        if d.getVar('BB_CURRENTTASK', True) in ['configure', 'clean']:
+            bb.build.exec_func(cleanfunc, d)
+
 sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
 
 CLEANFUNCS += "sstate_cleanall"
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0a6f2be..2b2bb96 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -127,6 +127,32 @@ useradd_sysroot_sstate () {
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
+SSTATECLEANFUNCS = "userdel_sysroot_sstate"
+SSTATECLEANFUNCS_class-cross = ""
+SSTATECLEANFUNCS_class-native = ""
+SSTATECLEANFUNCS_class-nativesdk = ""
+
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
 SYSROOTFUNC_class-cross = ""
-- 
2.4.0


