Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 484CD6B262
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 06:08:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6H68Cc2026290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 23:08:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 23:08:11 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 14:08:18 +0800
Message-ID: <cc86685b4cc9374f7d80fcfd092a740671b0f3e2.1374041180.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374041180.git.Qi.Chen@windriver.com>
References: <cover.1374041180.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V6 2/3] useradd.bbclass: code refactor
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
X-List-Received-Date: Wed, 17 Jul 2013 06:08:11 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The basic functions have moved to useradd_base.bbclass. So this class
only needs to inherit useradd_base.bbclass and use the functions defined
there. The reason is to avoid code duplication with extrausers.bbclass.

[YOCTO #4074]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/useradd.bbclass |   99 ++++--------------------------------------
 1 file changed, 8 insertions(+), 91 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3fe011d..9b3ac25 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -1,3 +1,5 @@
+inherit useradd_base
+
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
@@ -44,30 +46,7 @@ if test "x$GROUPADD_PARAM" != "x"; then
 	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		groupname=`echo "$opts" | awk '{ print $NF }'`
-		group_exists=`grep "^$groupname:" $SYSROOT/etc/group || true`
-		if test "x$group_exists" = "x"; then
-			count=1
-			while true; do
-				eval $PSEUDO groupadd $OPT $opts || true
-				group_exists=`grep "^$groupname:" $SYSROOT/etc/group || true`
-				if test "x$group_exists" = "x"; then
-					# File locking issues can require us to retry the command
-					echo "WARNING: groupadd command did not succeed. Retrying..."
-					sleep 1
-				else
-					break
-				fi
-				count=`expr $count + 1`
-				if test $count = 11; then
-					echo "ERROR: tried running groupadd command 10 times without success, giving up"
-					exit 1
-				fi
-			done		
-		else
-			echo "Note: group $groupname already exists, not re-creating it"
-		fi
-
+		perform_groupadd "$SYSROOT" "$OPT $opts" 10
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
@@ -83,32 +62,7 @@ if test "x$USERADD_PARAM" != "x"; then
 	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		# useradd does not have a -f option, so we have to check if the
-		# username already exists manually
-		username=`echo "$opts" | awk '{ print $NF }'`
-		user_exists=`grep "^$username:" $SYSROOT/etc/passwd || true`
-		if test "x$user_exists" = "x"; then
-			count=1
-			while true; do
-				eval $PSEUDO useradd $OPT $opts || true
-				user_exists=`grep "^$username:" $SYSROOT/etc/passwd || true`
-				if test "x$user_exists" = "x"; then
-					# File locking issues can require us to retry the command
-					echo "WARNING: useradd command did not succeed. Retrying..."
-					sleep 1
-				else
-					break
-				fi
-				count=`expr $count + 1`
-				if test $count = 11; then
-					echo "ERROR: tried running useradd command 10 times without success, giving up"
-					exit 1
-				fi
-			done
-		else
-			echo "Note: username $username already exists, not re-creating it"
-		fi
-
+		perform_useradd "$SYSROOT" "$OPT $opts" 10
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
@@ -119,58 +73,18 @@ fi
 
 if test "x$GROUPMEMS_PARAM" != "x"; then
 	echo "Running groupmems commands..."
-	# groupmems fails if /etc/gshadow does not exist
-	if [ -f $SYSROOT${sysconfdir}/gshadow ]; then
-		gshadow="yes"
-	else
-		gshadow="no"
-		touch $SYSROOT${sysconfdir}/gshadow
-	fi
 	# Invoke multiple instances of groupmems for parameter lists
 	# separated by ';'
 	opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
-		username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
-		echo "$groupname $username"
-		mem_exists=`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $SYSROOT/etc/group || true`
-		if test "x$mem_exists" = "x"; then
-			count=1
-			while true; do
-				eval $PSEUDO groupmems $OPT $opts || true
-				mem_exists=`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $SYSROOT/etc/group || true`
-				if test "x$mem_exists" = "x"; then
-					# File locking issues can require us to retry the command
-					echo "WARNING: groupmems command did not succeed. Retrying..."
-					sleep 1
-				else
-					break
-				fi
-				count=`expr $count + 1`
-				if test $count = 11; then
-					echo "ERROR: tried running groupmems command 10 times without success, giving up"
-					if test "x$gshadow" = "xno"; then
-						rm -f $SYSROOT${sysconfdir}/gshadow
-						rm -f $SYSROOT${sysconfdir}/gshadow-
-					fi
-					exit 1
-				fi
-			done
-		else
-			echo "Note: group $groupname already contains $username, not re-adding it"
-		fi
-
+		perform_groupmems "$SYSROOT" "$OPT $opts" 10
 		if test "x$opts" = "x$remaining"; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1`
 		remaining=`echo "$remaining" | cut -d ';' -f 2-`
 	done
-	if test "x$gshadow" = "xno"; then
-		rm -f $SYSROOT${sysconfdir}/gshadow
-		rm -f $SYSROOT${sysconfdir}/gshadow-
-	fi
 fi
 }
 
@@ -254,6 +168,9 @@ fakeroot python populate_packages_prepend () {
         preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
         if not preinst:
             preinst = '#!/bin/sh\n'
+        preinst += 'perform_groupadd () {\n%s}\n' % d.getVar('perform_groupadd', True)
+        preinst += 'perform_useradd () {\n%s}\n' % d.getVar('perform_useradd', True)
+        preinst += 'perform_groupmems () {\n%s}\n' % d.getVar('perform_groupmems', True)
         preinst += d.getVar('useradd_preinst', True)
         d.setVar('pkg_preinst_%s' % pkg, preinst)
 
-- 
1.7.9.5


