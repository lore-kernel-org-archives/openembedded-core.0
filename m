Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 279E46BA7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7S2pn4R005227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 19:51:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 27 Aug 2013 19:51:48 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2013 10:52:04 +0800
Message-ID: <55b4bd6190564b24e99a5e2969ba86db07ca95f7.1377658086.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377658086.git.Qi.Chen@windriver.com>
References: <cover.1377658086.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] runqemu-internal: don't bring down preconfigured tap interface
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
X-List-Received-Date: Wed, 28 Aug 2013 02:51:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

runqemu-ifup and runqemu-ifdown should be pairs. If we're using a
preconfigured tap interface, the runqemu-ifdown should not be invoked
to bring it down.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 8a6e551..8165e13 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -175,12 +175,14 @@ else
         POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed s/://`
         TAP=""
         LOCKFILE=""
+        USE_PRECONF_TAP="no"
         for tap in $POSSIBLE; do
             LOCKFILE="$LOCKDIR/$tap"
             echo "Acquiring lockfile for $tap..."
             acquire_lock $LOCKFILE
             if [ $? -eq 0 ]; then
                 TAP=$tap
+                USE_PRECONF_TAP="yes"
                 break
             fi
         done
@@ -215,7 +217,7 @@ else
         fi
 
         cleanup() {
-            if [ ! -e "$NOSUDO_FLAG" ]; then
+            if [ ! -e "$NOSUDO_FLAG" -a "$USE_PRECONF_TAP" = "no" ]; then
                 # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
                 # but inactive. This looks scary but is harmless
                 sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT 2> /dev/null
-- 
1.7.9.5


