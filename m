Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4D465CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 13:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B16C12E10F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KD+VicyCdDMG
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id CAFEA2E119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B3B551523
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id A8B4C1508
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A7214788
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3CDIYbT015738
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:18:34 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3CDIY8I015720
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 15:18:34 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:18:33 +0200
Message-Id: <7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1460467072.git.pkj@axis.com>
References: <cover.1460467072.git.pkj@axis.com>
In-Reply-To: <cover.1460467072.git.pkj@axis.com>
References: <cover.1460467072.git.pkj@axis.com>
Subject: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Tue, 12 Apr 2016 13:18:36 -0000

Removal of users/group when cleansstating a recipe as implemented here
totally breaks when multiple recipes install the same user/groups.

This reverts commit b5304ce438666a7418746f4ddd32703ae3188089.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sstate.bbclass  |  5 -----
 meta/classes/useradd.bbclass | 29 -----------------------------
 2 files changed, 34 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8c62327..4a4269c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -51,7 +51,6 @@ SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= ""
-SSTATECLEANFUNCS = ""
 
 # Check whether sstate exists for tasks that support sstate and are in the
 # locked signatures file.
@@ -451,10 +450,6 @@ def sstate_clean(ss, d):
                 stfile.endswith(rm_nohash):
             oe.path.remove(stfile)
 
-    # Removes the users/groups created by the package
-    for cleanfunc in (d.getVar('SSTATECLEANFUNCS', True) or '').split():
-        bb.build.exec_func(cleanfunc, d)
-
 sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
 
 CLEANFUNCS += "sstate_cleanall"
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ee402ac..0a6f2be 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -127,35 +127,6 @@ useradd_sysroot_sstate () {
 	fi
 }
 
-userdel_sysroot_sstate () {
-if test "x${STAGING_DIR_TARGET}" != "x"; then
-    if [ "${BB_CURRENTTASK}" = "configure" -o "${BB_CURRENTTASK}" = "clean" ]; then
-        export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir}/pseudo"
-        OPT="--root ${STAGING_DIR_TARGET}"
-
-        # Remove groups and users defined for package
-        GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
-        USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
-
-        if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
-            user=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
-            perform_userdel "${STAGING_DIR_TARGET}" "$OPT $user"
-        fi
-
-        if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
-            group=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | awk '{ print $NF }'`
-            perform_groupdel "${STAGING_DIR_TARGET}" "$OPT $group"
-        fi
-
-    fi
-fi
-}
-
-SSTATECLEANFUNCS = "userdel_sysroot_sstate"
-SSTATECLEANFUNCS_class-cross = ""
-SSTATECLEANFUNCS_class-native = ""
-SSTATECLEANFUNCS_class-nativesdk = ""
-
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
 SYSROOTFUNC_class-cross = ""
-- 
2.1.0


