Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id 7945772125
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 00:06:04 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id G0611p00N0BVjqb01065zJ; Sat, 15 Nov 2014 17:06:05 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 18:05:50 -0600
Message-Id: <45c4538d5565c021007b692ffd8f861a8d94ed84.1416081855.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
Subject: [PATCH V2 6/7] bitbake.conf: pseudo fall back to last-resort passwd files
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
X-List-Received-Date: Sun, 16 Nov 2014 00:06:05 -0000

Recipe packaging for the target requires permissions that are consistent
with meta/files/fs-perms.txt which specifies certain user and group
names.  In the early parts of a target build base-passwd is not yet
available to provide the target /etc files used for user/group lookup.
Allow pseudo to fall-back to the last-resort files it installs if the
target ones aren't there yet.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2a8a37f..0ccaac0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -586,7 +586,7 @@ SRC_URI = ""
 
 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
-PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}"
+PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}"
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
-- 
1.8.5.5


