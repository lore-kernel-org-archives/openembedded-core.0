Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 09A626CBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 09:06:23 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 10:06:14 +0100
Message-Id: <1381827974-19501-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [PATCH] crond: remove UID check in init script
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
X-List-Received-Date: Tue, 15 Oct 2013 09:06:23 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

this init script fails when the default shell is busybox sh. This
is because busybox sh doesn't set the UID. No other init scripts
in oecore feel the need to check the UID so just remove the check.

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta/recipes-extended/cronie/cronie/crond.init | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie/crond.init b/meta/recipes-extended/cronie/cronie/crond.init
index 08f34be..c8dffef 100755
--- a/meta/recipes-extended/cronie/cronie/crond.init
+++ b/meta/recipes-extended/cronie/cronie/crond.init
@@ -23,10 +23,6 @@ CONFIG=/etc/sysconfig/crond
 
 case "$1" in
   start)
-    if [ $UID -ne 0 ] ; then
-        echo "User has insufficient privilege."
-        exit 1
-    fi
     echo -n "Starting crond: "
     start-stop-daemon --start --quiet --exec $CROND -- $CRONDARGS
     RETVAL=$?
@@ -37,10 +33,6 @@ case "$1" in
     fi
     ;;
   stop)
-    if [ $UID -ne 0 ] ; then
-        echo "User has insufficient privilege."
-        exit 1
-    fi
     echo -n "Stopping crond: "
     start-stop-daemon --stop --quiet --pidfile /var/run/crond.pid
     RETVAL=$?
-- 
1.8.4


