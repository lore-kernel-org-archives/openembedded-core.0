Return-Path: <scott.a.garman@intel.com>
Received: from masterfoo.zenlinux.com (masterfoo.zenlinux.com [207.192.74.254])
	by mail.openembedded.org (Postfix) with ESMTP id F15CB6EFC0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 19:05:26 +0000 (UTC)
Received: from localhost (c-24-20-145-95.hsd1.or.comcast.net [24.20.145.95])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id BF2FE2FE0F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 14:05:04 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2014 11:04:47 -0800
Message-Id: <bb53744a8568261f4cb548df08e7332aa8389edd.1392490959.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392490959.git.scott.a.garman@intel.com>
References: <cover.1392490959.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1392490959.git.scott.a.garman@intel.com>
References: <cover.1392490959.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: BF2FE2FE0F.23D93
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: add ability to skip using an existing tap device
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
X-List-Received-Date: Sat, 15 Feb 2014 19:05:27 -0000

Support the sitauation where a user could have another VM running
which uses tap devices. To prevent runqemu from trying to use the
same tap device, runqemu will skip using a tap device if it finds
a filename tapX.skip within its lock directory.

This fixes [YOCTO #5815]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-internal | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f9ca380..d317dfd 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -178,6 +178,10 @@ else
         USE_PRECONF_TAP="no"
         for tap in $POSSIBLE; do
             LOCKFILE="$LOCKDIR/$tap"
+            if [ -e "$LOCKFILE.skip" ]; then
+                echo "Found $LOCKFILE.skip, skipping $tap"
+                continue
+            fi
             echo "Acquiring lockfile for $tap..."
             acquire_lock $LOCKFILE
             if [ $? -eq 0 ]; then
@@ -214,7 +218,7 @@ else
             fi 
         else
             echo "Using preconfigured tap device '$TAP'"
-            echo "If this is not intended, use flock on $LOCKFILE.lock to make runqemu skip $TAP."
+            echo "If this is not intended, touch $LOCKFILE.skip to make runqemu skip $TAP."
         fi
 
         cleanup() {
-- 
1.8.3.2


