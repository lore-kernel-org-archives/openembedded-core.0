Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SAwUa-0006wp-US
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:52:49 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id DF2512FD12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 00:43:46 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 21:43:42 -0700
Message-Id: <1e1a2ceb4c6afa22a71d3c902b7a3b18cdee10cf.1332453478.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332453478.git.scott.a.garman@intel.com>
References: <cover.1332453478.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1332453478.git.scott.a.garman@intel.com>
References: <cover.1332453478.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: DF2512FD12.CB950
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/2] useradd.bbclass: retry useradd/groupadd commands to avoid lock race issues
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
X-List-Received-Date: Fri, 23 Mar 2012 04:52:49 -0000

A race condition can occur when adding users and groups to the
passwd and group files, causing errors like the following:

 ERROR: Function 'useradd_sysroot' failed
 Tried to access "/etc/group" but this was locked.

This fix will cause the useradd code to retry the useradd and
groupadd commands up to 10 times (with a 1s sleep in between
attempts) before failing.

This fixes [YOCTO #1794]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |   36 ++++++++++++++++++++++++++++++++++--
 1 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 7981a68..0bbb371 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -45,7 +45,23 @@ if test "x$GROUPADD_PARAM" != "x"; then
 		groupname=`echo "$opts" | awk '{ print $NF }'`
 		group_exists=`grep "^$groupname:" $SYSROOT/etc/group || true`
 		if test "x$group_exists" = "x"; then
-			eval $PSEUDO groupadd  $OPT $opts
+			count=1
+			while true; do
+				eval $PSEUDO groupadd $OPT $opts || true
+				group_exists=`grep "^$groupname:" $SYSROOT/etc/group || true`
+				if test "x$group_exists" = "x"; then
+					# File locking issues can require us to retry the command
+					echo "WARNING: groupadd command did not succeed. Retrying..."
+					sleep 1
+				else
+					break
+				fi
+				count=`expr $count + 1`
+				if test $count = 11; then
+					echo "ERROR: tried running groupadd command 10 times without success, giving up"
+					exit 1
+				fi
+			done		
 		else
 			echo "Note: group $groupname already exists, not re-creating it"
 		fi
@@ -70,7 +86,23 @@ if test "x$USERADD_PARAM" != "x"; then
 		username=`echo "$opts" | awk '{ print $NF }'`
 		user_exists=`grep "^$username:" $SYSROOT/etc/passwd || true`
 		if test "x$user_exists" = "x"; then
-			eval $PSEUDO useradd $OPT $opts
+			count=1
+			while true; do
+				eval $PSEUDO useradd $OPT $opts || true
+				user_exists=`grep "^$username:" $SYSROOT/etc/passwd || true`
+				if test "x$user_exists" = "x"; then
+					# File locking issues can require us to retry the command
+					echo "WARNING: useradd command did not succeed. Retrying..."
+					sleep 1
+				else
+					break
+				fi
+				count=`expr $count + 1`
+				if test $count = 11; then
+					echo "ERROR: tried running useradd command 10 times without success, giving up"
+					exit 1
+				fi
+			done
 		else
 			echo "Note: username $username already exists, not re-creating it"
 		fi
-- 
1.7.5.4



