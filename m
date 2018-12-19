Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 389247BDE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 23:00:01 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 8195422063C;
	Thu, 20 Dec 2018 11:59:58 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 11:59:48 +1300
Message-Id: <20181219225948.30700-6-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219225948.30700-1-douglas.royds@taitradio.com>
References: <20181219225948.30700-1-douglas.royds@taitradio.com>
Subject: [PATCH 5/5] icecc: patchelf is needed by icecc-create-env
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
X-List-Received-Date: Wed, 19 Dec 2018 23:00:03 -0000

Although we could potentially build patchelf and all its dependencies,
they would all have to be blacklisted to avoid trying to build them with
icecc. We use the host patchelf instead.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 49597175ca..7d94525d31 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -38,7 +38,7 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
-HOSTTOOLS_NONFATAL += "icecc"
+HOSTTOOLS_NONFATAL += "icecc patchelf"
 
 # This version can be incremented when changes are made to the environment that
 # invalidate the version on the compile nodes. Changing it will cause a new
@@ -326,6 +326,10 @@ set_icecc_env() {
         bbwarn "Cannot use icecc: icecc binary not found"
         return
     fi
+    if [ -z "$(which patchelf patchelf-uninative)" ]; then
+        bbwarn "Cannot use icecc: patchelf not found"
+        return
+    fi
 
     # Create symlinks to icecc in the recipe-sysroot directory
     mkdir -p ${ICE_PATH}
-- 
2.17.1


