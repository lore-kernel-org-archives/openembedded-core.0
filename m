Return-Path: <Mikhail_Durnev@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B314F6ABED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:55:10 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Urft2-0007nr-2c from Mikhail_Durnev@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Jun 2013 19:55:12 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 25 Jun 2013 19:55:12 -0700
Received: from sb-u1004lts-64bit.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.2.247.3; Tue, 25 Jun 2013 19:55:11 -0700
From: <mikhail_durnev@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2013 21:54:36 -0500
Message-ID: <1372215276-9080-2-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1372215276-9080-1-git-send-email-mikhail_durnev@mentor.com>
References: <1372215276-9080-1-git-send-email-mikhail_durnev@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Jun 2013 02:55:12.0387 (UTC)
	FILETIME=[93BEF530:01CE7218]
Subject: [PATCH 2/2] useradd.bbclass: Add members to a group
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
X-List-Received-Date: Wed, 26 Jun 2013 02:55:10 -0000
Content-Type: text/plain

From: Mikhail Durnev <mikhail_durnev@mentor.com>

useradd.bbclass supports adding new users and new groups. But it does not
support adding existing users to existing groups.

There is a need of adding users to some groups (e.g. audio). The class was
extended to call groupmems utility with arguments passed via GROUPMEMS_PARAM.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
---
 meta/classes/useradd.bbclass |   68 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index e50c889..3fe011d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -24,13 +24,15 @@ if test "x$D" != "x"; then
 	OPT="--root $D"
 
 	# Add groups and users defined for all recipe packages
-	GROUPADD_PARAM="${@get_all_cmd_params(d, 'group')}"
-	USERADD_PARAM="${@get_all_cmd_params(d, 'user')}"
+	GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
+	USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
+	GROUPMEMS_PARAM="${@get_all_cmd_params(d, 'groupmems')}"
 else
 	# Installing onto a target
 	# Add groups and users defined only for this package
 	GROUPADD_PARAM="${GROUPADD_PARAM}"
 	USERADD_PARAM="${USERADD_PARAM}"
+	GROUPMEMS_PARAM="${GROUPMEMS_PARAM}"
 fi
 
 # Perform group additions first, since user additions may depend
@@ -114,6 +116,62 @@ if test "x$USERADD_PARAM" != "x"; then
 		remaining=`echo "$remaining" | cut -d ';' -f 2-`
 	done
 fi
+
+if test "x$GROUPMEMS_PARAM" != "x"; then
+	echo "Running groupmems commands..."
+	# groupmems fails if /etc/gshadow does not exist
+	if [ -f $SYSROOT${sysconfdir}/gshadow ]; then
+		gshadow="yes"
+	else
+		gshadow="no"
+		touch $SYSROOT${sysconfdir}/gshadow
+	fi
+	# Invoke multiple instances of groupmems for parameter lists
+	# separated by ';'
+	opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1`
+	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
+	while test "x$opts" != "x"; do
+		groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
+		username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
+		echo "$groupname $username"
+		mem_exists=`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $SYSROOT/etc/group || true`
+		if test "x$mem_exists" = "x"; then
+			count=1
+			while true; do
+				eval $PSEUDO groupmems $OPT $opts || true
+				mem_exists=`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $SYSROOT/etc/group || true`
+				if test "x$mem_exists" = "x"; then
+					# File locking issues can require us to retry the command
+					echo "WARNING: groupmems command did not succeed. Retrying..."
+					sleep 1
+				else
+					break
+				fi
+				count=`expr $count + 1`
+				if test $count = 11; then
+					echo "ERROR: tried running groupmems command 10 times without success, giving up"
+					if test "x$gshadow" = "xno"; then
+						rm -f $SYSROOT${sysconfdir}/gshadow
+						rm -f $SYSROOT${sysconfdir}/gshadow-
+					fi
+					exit 1
+				fi
+			done
+		else
+			echo "Note: group $groupname already contains $username, not re-adding it"
+		fi
+
+		if test "x$opts" = "x$remaining"; then
+			break
+		fi
+		opts=`echo "$remaining" | cut -d ';' -f 1`
+		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+	done
+	if test "x$gshadow" = "xno"; then
+		rm -f $SYSROOT${sysconfdir}/gshadow
+		rm -f $SYSROOT${sysconfdir}/gshadow-
+	fi
+fi
 }
 
 useradd_sysroot () {
@@ -160,8 +218,8 @@ def update_useradd_after_parse(d):
         raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE'))
 
     for pkg in useradd_packages.split():
-        if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True):
-            raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM for package %s" % (d.getVar('FILE'), pkg))
+        if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg, True):
+            raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
 
 python __anonymous() {
     update_useradd_after_parse(d)
@@ -172,7 +230,7 @@ python __anonymous() {
 def get_all_cmd_params(d, cmd_type):
     import string
     
-    param_type = cmd_type.upper() + "ADD_PARAM_%s"
+    param_type = cmd_type.upper() + "_PARAM_%s"
     params = []
 
     useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
-- 
1.7.9.5


