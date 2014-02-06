Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2C26DC27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 23:37:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s16NbPhE027699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Feb 2014 15:37:25 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 6 Feb 2014 15:37:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Feb 2014 17:37:23 -0600
Message-ID: <c550e99c2b61ee902412389d4a442358c9e6598b.1391729077.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391729077.git.mark.hatle@windriver.com>
References: <cover.1391729077.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [v3 PATCH 1/2] useradd.bbclass: Fix build time install issues
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
X-List-Received-Date: Thu, 06 Feb 2014 23:37:26 -0000
Content-Type: text/plain

When the system attempts to populate the sysroot's passwd/group files, it
does so in a single block.  However, with the way it was previously
implemented, the system would always run through the code necessary to
populate the sysroot, even in the case of target packages.  This had
the side effect that a cross-installed filesystem may not match a
target installed filesystem.

The code was slightly reorganized to ensure that the cross/target installed
pre-install script behavior is the same.  It also moves the block that
configures the sysroot parameters to the sysroot specific section of
the code.

Also some minor validation was occuring even on nativesdk packages.
Nativesdk packages should be skipped when processing useradd ops.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/useradd.bbclass | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a2ad648..ad6f61a 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -24,12 +24,11 @@ if test "x$D" != "x"; then
 	# Installing into a sysroot
 	SYSROOT="$D"
 	OPT="--root $D"
+fi
 
-	# Add groups and users defined for all recipe packages
-	GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
-	USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
-	GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
-else
+# If we're not doing a special SSTATE/SYSROOT install
+# then set the values, otherwise use the environment
+if test "x$UA_SYSROOT" = "x"; then
 	# Installing onto a target
 	# Add groups and users defined only for this package
 	GROUPADD_PARAM="${GROUPADD_PARAM}"
@@ -97,6 +96,15 @@ useradd_sysroot () {
 	# Explicitly set $D since it isn't set to anything
 	# before do_install
 	D=${STAGING_DIR_TARGET}
+
+	# Add groups and users defined for all recipe packages
+	GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
+	USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
+	GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
+
+	# Tell the system to use the environment vars
+	UA_SYSROOT=1
+
 	useradd_preinst
 }
 
@@ -137,7 +145,8 @@ def update_useradd_after_parse(d):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
 
 python __anonymous() {
-    update_useradd_after_parse(d)
+    if not bb.data.inherits_class('nativesdk', d):
+        update_useradd_after_parse(d)
 }
 
 # Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
-- 
1.8.5.3


