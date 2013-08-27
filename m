Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 063626BA9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:07:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7R77otH005642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 03:07:50 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 27 Aug 2013 00:07:49 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 15:08:02 +0800
Message-ID: <f1e2a5ea20351fbe0e1e0552462752a5f5c70330.1377587203.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377587203.git.Qi.Chen@windriver.com>
References: <cover.1377587203.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] runqemu-internal: change the lock acquire/release logic
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
X-List-Received-Date: Tue, 27 Aug 2013 07:07:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Checking whether the lock file exists is sufficient for runqemu.
The contents of the lock file is not important.

This patch simplifies the lock acquire/release logic by removing the
flock mechanism. Also, we give more information to user indicating
why a tap interface is skipped.

As a side effect, the user now can easily create a lock file to
make runqemu skip a specific tap interface.

[YOCTO #5048]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 8165e13..3f8674c 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -135,15 +135,12 @@ else
                 return 1
             fi
 
-            touch $lockfile.lock
-            exec 8>$lockfile.lock
-            flock -n -x 8
-            if [ $? -ne 0 ]; then
-                exec 8>&-
+            if [ -e $lockfile.lock ]; then
                 return 1
+            else
+                touch $lockfile.lock
+                return 0
             fi
-
-            return 0
         }
 
         release_lock() {
@@ -154,7 +151,6 @@ else
             fi
 
             rm -f $lockfile.lock
-            exec  8>&-
         }
 
         LOCKDIR="/tmp/qemu-tap-locks"
@@ -184,6 +180,8 @@ else
                 TAP=$tap
                 USE_PRECONF_TAP="yes"
                 break
+            else
+                echo "Skipping $tap as it's locked by $LOCKFILE.lock"
             fi
         done
 
-- 
1.7.9.5


