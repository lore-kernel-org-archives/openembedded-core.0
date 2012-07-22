Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Ssv1y-0000lS-1p
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:13:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6MC1ZBY026641
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 05:01:35 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 22 Jul 2012 05:01:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 20:01:26 +0800
Message-ID: <ce6899f1011e17701a67b7e8342509d0f0c8a964.1342958140.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1342958140.git.jackie.huang@windriver.com>
References: <cover.1342958140.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jul 2012 12:13:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

A race condition can occur when adding users and groups to the
passwd and group files, in [YOCTO #1794], 10 times retry added
but it is not fixed completely.

This fix re-writes the useradd_preinst and useradd_sysroot with
python and use locking of bb.utils to lock the passwd and group
files before executing useradd/groupadd commands to avoid the
lock race themselves.

[YOCTO #2779]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/useradd.bbclass |  200 +++++++++++++++++------------------------
 1 files changed, 83 insertions(+), 117 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index bb8f42b..81bcb56 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -14,126 +14,92 @@ USERADDDEPENDS_virtclass-nativesdk = ""
 # c) As the preinst script in the target package at do_rootfs time
 # d) As the preinst script in the target package on device as a package upgrade
 #
-useradd_preinst () {
-OPT=""
-SYSROOT=""
-
-if test "x$D" != "x"; then
-	# Installing into a sysroot
-	SYSROOT="$D"
-	OPT="--root $D"
-
-	# Add groups and users defined for all recipe packages
-	GROUPADD_PARAM="${@get_all_cmd_params(d, 'group')}"
-	USERADD_PARAM="${@get_all_cmd_params(d, 'user')}"
-else
-	# Installing onto a target
-	# Add groups and users defined only for this package
-	GROUPADD_PARAM="${GROUPADD_PARAM}"
-	USERADD_PARAM="${USERADD_PARAM}"
-fi
-
-# Perform group additions first, since user additions may depend
-# on these groups existing
-if test "x$GROUPADD_PARAM" != "x"; then
-	echo "Running groupadd commands..."
-	# Invoke multiple instances of groupadd for parameter lists
-	# separated by ';'
-	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
-	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
-	while test "x$opts" != "x"; do
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
-		if test "x$opts" = "x$remaining"; then
-			break
-		fi
-		opts=`echo "$remaining" | cut -d ';' -f 1`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
-	done
-fi 
-
-if test "x$USERADD_PARAM" != "x"; then
-	echo "Running useradd commands..."
-	# Invoke multiple instances of useradd for parameter lists
-	# separated by ';'
-	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1`
-	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
-	while test "x$opts" != "x"; do
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
-		if test "x$opts" = "x$remaining"; then
-			break
-		fi
-		opts=`echo "$remaining" | cut -d ';' -f 1`
-		remaining=`echo "$remaining" | cut -d ';' -f 2-`
-	done
-fi
+def useradd_preinst(d):
+	import re
+	import commands
+	import os
+
+	sysroot = ""
+	opt = ""
+
+	dir = d.getVar('STAGING_DIR_TARGET', True)
+	if dir:
+		# Installing into a sysroot
+		sysroot = dir
+		opt = "--root %s" % dir
+
+		# Add groups and users defined for all recipe packages
+		groupadd_param = get_all_cmd_params(d, 'group')
+		useradd_param = get_all_cmd_params(d, 'user')
+	else:
+		# Installing onto a target
+		# Add groups and users defined only for this package
+		groupadd_param = d.getVar('GROUPADD_PARAM', True)
+		useradd_param = d.getVar('GROUPADD_PARAM', True)
+
+	group_file = '%s/etc/group' % sysroot
+	user_file = '%s/etc/passwd' % sysroot
+
+	# Use the locking of bb to the group/passwd file to avoid the
+	# locking issue of groupadd/useradd
+	group_lock = '%s.locked' % group_file
+	user_lock = '%s.locked' % user_file
+	lockfiles = [group_lock, user_lock]
+
+	with bb.utils.fileslocked(lockfiles):
+		# Perform group additions first, since user additions may depend
+		# on these groups existing
+		if groupadd_param and sysroot:
+			bb.debug(1, "Running groupadd commands ...")
+			# Invoke multiple instances of groupadd for parameter lists
+			# separated by ';'
+			param_list = groupadd_param.split(';')
+			for opts in param_list:
+				groupname = opts.split()[-1]
+				with open(group_file, 'r') as f:
+					passwd_lines = f.read()
+				group_re = re.compile('\n%s' % groupname)
+				if group_re.search(passwd_lines):
+					bb.note("Note: groupname %s already exists, not re-creating it" % groupname)
+					continue
+				try:
+					output, err = bb.process.run('groupadd %s %s' % (opt, opts))
+				except bb.process.CmdError as exc:
+					bb.error("Failed to add group: %s" % exc)
+				else:
+					bb.note("Successful to add group %s" % groupname)
+
+		if useradd_param:
+			bb.debug(1, "Running useradd commands ...")
+			# Invoke multiple instances of useradd for parameter lists
+			# separated by ';'
+			param_list = useradd_param.split(';')
+			for opts in param_list:
+				# useradd does not have a -f option, so we have to check if the
+				# username already exists manually
+				username = opts.split()[-1]
+				with open(user_file, 'r') as f:
+					passwd_lines = f.read()
+				user_re = re.compile('\n%s' % username)
+				if user_re.search(passwd_lines):
+					bb.note("Note: username %s already exists, not re-creating it" % username)
+					continue
+				try:
+					output, err = bb.process.run('useradd %s %s' % (opt, opts))
+				except bb.process.CmdError as exc:
+					bb.error("Failed to add user: %s" % exc)
+				else:
+					bb.note("Successful to add user %s" % username)
+
+fakeroot python useradd_sysroot () {
+	useradd_preinst(d)
 }
 
-useradd_sysroot () {
-	# Pseudo may (do_install) or may not (do_populate_sysroot_setscene) be running 
-	# at this point so we're explicit about the environment so pseudo can load if 
-	# not already present.
-	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir}/pseudo"
-
-	# Explicitly set $D since it isn't set to anything
-	# before do_install
-	D=${STAGING_DIR_TARGET}
-	useradd_preinst
+fakeroot python useradd_sysroot_sstate () {
+    if d.getVar("BB_CURRENTTASK", True) == "package_setscene":
+        useradd_preinst(d)
 }
 
-useradd_sysroot_sstate () {
-	if [ "${BB_CURRENTTASK}" = "package_setscene" ]
-	then
-		useradd_sysroot
-	fi
-}
 
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
@@ -171,7 +137,7 @@ python __anonymous() {
 # [group|user]add parameters for all USERADD_PACKAGES in this recipe
 def get_all_cmd_params(d, cmd_type):
     import string
-    
+
     param_type = cmd_type.upper() + "ADD_PARAM_%s"
     params = []
 
-- 
1.7.4



