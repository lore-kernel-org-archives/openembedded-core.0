Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7C3D6B21F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 01:52:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6J1qFD7010147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 18:52:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Jul 2013 18:52:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 09:52:25 +0800
Message-ID: <c3b69d3f1cab50d648f527ce788a7e2f8e8606ba.1374198646.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374198646.git.Qi.Chen@windriver.com>
References: <cover.1374198646.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V7 1/2] useradd.bbclass: add a new base class and code refactor
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
X-List-Received-Date: Fri, 19 Jul 2013 01:52:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add a new base class, useradd_base.bbclass, which is mainly a
collection of basic functions for user/group settings.

The useradd_base.bbclass is intended to be inherited by useradd.bbclass
and the extrausers.bbclass to avoid code cuplication.

[YOCTO #4074]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/useradd.bbclass      |   99 ++--------------
 meta/classes/useradd_base.bbclass |  230 +++++++++++++++++++++++++++++++++++++
 2 files changed, 238 insertions(+), 91 deletions(-)
 create mode 100644 meta/classes/useradd_base.bbclass

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
 
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
new file mode 100644
index 0000000..7aafe29
--- /dev/null
+++ b/meta/classes/useradd_base.bbclass
@@ -0,0 +1,230 @@
+# This bbclass provides basic functionality for user/group settings.
+# This bbclass is intended to be inherited by useradd.bbclass and
+# extrausers.bbclass.
+
+# The following functions basically have similar logic.
+# *) Perform necessary checks before invoking the actual command
+# *) Invoke the actual command, make retries if necessary
+# *) Error out if an error occurs.
+
+# Note that before invoking these functions, make sure the global variable
+# PSEUDO is set up correctly.
+
+perform_groupadd () {
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing groupadd with [$opts] and $retries times of retry"
+	local groupname=`echo "$opts" | awk '{ print $NF }'`
+	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+	if test "x$group_exists" = "x"; then
+		local count=0
+		while true; do
+			eval $PSEUDO groupadd $opts || true
+			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+			if test "x$group_exists" = "x"; then
+				bbwarn "groupadd command did not succeed. Retrying..."
+				sleep 1
+			else
+				break
+			fi
+			count=`expr $count + 1`
+			if test $count = $retries; then
+				bbfatal "Tried running groupadd command $retries times without scucess, giving up"
+			fi
+		done
+	else
+		bbwarn "group $groupname already exists, not re-creating it"
+	fi
+}
+
+perform_useradd () {
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing useradd with [$opts] and $retries times of retry"
+	local username=`echo "$opts" | awk '{ print $NF }'`
+	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+	if test "x$user_exists" = "x"; then
+	       local count=0
+	       while true; do
+		       eval $PSEUDO useradd $opts || true
+		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+		       if test "x$user_exists" = "x"; then
+			       bbwarn "useradd command did not succeed. Retrying..."
+			       sleep 1
+		       else
+			       break
+		       fi
+		       count=`expr $count + 1`
+		       if test $count = $retries; then
+				bbfatal "Tried running useradd command $retries times without scucess, giving up"
+		       fi
+	       done
+	else
+		bbwarn "user $username already exists, not re-creating it"
+	fi
+}
+
+perform_groupmems () {
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing groupmems with [$opts] and $retries times of retry"
+	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
+	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
+	bbnote "Running groupmems command with group $groupname and user $username"
+	# groupmems fails if /etc/gshadow does not exist
+	local gshadow=""
+	if [ -f $rootdir${sysconfdir}/gshadow ]; then
+		gshadow="yes"
+	else
+		gshadow="no"
+		touch $rootdir${sysconfdir}/gshadow
+	fi
+	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+	if test "x$mem_exists" = "x"; then
+		local count=0
+		while true; do
+			eval $PSEUDO groupmems $opts || true
+			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
+			if test "x$mem_exists" = "x"; then
+				bbwarn "groupmems command did not succeed. Retrying..."
+				sleep 1
+			else
+				break
+			fi
+			count=`expr $count + 1`
+			if test $count = $retries; then
+				if test "x$gshadow" = "xno"; then
+					rm -f $rootdir${sysconfdir}/gshadow
+					rm -f $rootdir${sysconfdir}/gshadow-
+				fi
+				bbfatal "Tried running groupmems command $retries times without scucess, giving up"
+			fi
+		done
+	else
+		bbwarn "group $groupname already contains $username, not re-adding it"
+	fi
+	if test "x$gshadow" = "xno"; then
+		rm -f $rootdir${sysconfdir}/gshadow
+		rm -f $rootdir${sysconfdir}/gshadow-
+	fi
+}
+
+perform_groupdel () {
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing groupdel with [$opts] and $retries times of retry"
+	local groupname=`echo "$opts" | awk '{ print $NF }'`
+	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+	if test "x$group_exists" != "x"; then
+		local count=0
+		while true; do
+			eval $PSEUDO groupdel $opts || true
+			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+			if test "x$group_exists" != "x"; then
+				bbwarn "groupdel command did not succeed. Retrying..."
+				sleep 1
+			else
+				break
+			fi
+			count=`expr $count + 1`
+			if test $count = $retries; then
+				bbfatal "Tried running groupdel command $retries times without scucess, giving up"
+			fi
+		done
+	else
+		bbwarn "group $groupname doesn't exist, not removing it"
+	fi
+}
+
+perform_userdel () {
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing userdel with [$opts] and $retries times of retry"
+	local username=`echo "$opts" | awk '{ print $NF }'`
+	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+	if test "x$user_exists" != "x"; then
+	       local count=0
+	       while true; do
+		       eval $PSEUDO userdel $opts || true
+		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+		       if test "x$user_exists" != "x"; then
+			       bbwarn "userdel command did not succeed. Retrying..."
+			       sleep 1
+		       else
+			       break
+		       fi
+		       count=`expr $count + 1`
+		       if test $count = $retries; then
+				bbfatal "Tried running userdel command $retries times without scucess, giving up"
+		       fi
+	       done
+	else
+		bbwarn "user $username doesn't exist, not removing it"
+	fi
+}
+
+perform_groupmod () {
+	# Other than the return value of groupmod, there's no simple way to judge whether the command
+	# succeeds, so we disable -e option temporarily
+	set +e
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing groupmod with [$opts] and $retries times of retry"
+	local groupname=`echo "$opts" | awk '{ print $NF }'`
+	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
+	if test "x$group_exists" != "x"; then
+		local count=0
+		while true; do
+			eval $PSEUDO groupmod $opts
+			if test $? != 0; then
+				bbwarn "groupmod command did not succeed. Retrying..."
+				sleep 1
+			else
+				break
+			fi
+			count=`expr $count + 1`
+			if test $count = $retries; then
+				bbfatal "Tried running groupmod command $retries times without scucess, giving up"
+			fi
+		done
+	else
+		bbwarn "group $groupname doesn't exist, unable to modify it"
+	fi
+	set -e
+}
+
+perform_usermod () {
+	# Same reason with groupmod, temporarily disable -e option
+	set +e
+	local rootdir="$1"
+	local opts="$2"
+	local retries="$3"
+	bbnote "Performing usermod with [$opts] and $retries times of retry"
+	local username=`echo "$opts" | awk '{ print $NF }'`
+	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+	if test "x$user_exists" != "x"; then
+	       local count=0
+	       while true; do
+		       eval $PSEUDO usermod $opts
+		       if test $? != 0; then
+			       bbwarn "usermod command did not succeed. Retrying..."
+			       sleep 1
+		       else
+			       break
+		       fi
+		       count=`expr $count + 1`
+		       if test $count = $retries; then
+				bbfatal "Tried running usermod command $retries times without scucess, giving up"
+		       fi
+	       done
+	else
+		bbwarn "user $username doesn't exist, unable to modify it"
+	fi
+	set -e
+}
-- 
1.7.9.5


