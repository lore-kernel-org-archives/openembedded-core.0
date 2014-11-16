Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id E03E172131
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 00:06:04 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id G0611p00N0BVjqb01065zK; Sat, 15 Nov 2014 17:06:05 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 18:05:51 -0600
Message-Id: <19633f557fd99aaf48f1402ffa0d32fb4d8e6510.1416081855.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
Subject: [PATCH V2 7/7] useradd.bbclass: set PSEUDO_PASSWD consistent with root directory
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

When installing into a sysroot this class examines $D/etc/passwd for
content, then invokes useradd to make changes.  Under pseudo useradd
attempts to look up user information in directories specified by
$PSEUDO_PASSWD.  For opkg multilib installs $D is not always the same as
$IMAGE_ROOT, and the user might already be in the IMAGE_ROOT files,
causing a failure during rootfs population.

Fix this by ensuring the files pseudo looks at when doing useradd stuff
are the same ones that useradd.bbclass will be manipulating.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/useradd.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 3b70e80..0b9a843 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -24,6 +24,8 @@ if test "x$D" != "x"; then
 	# Installing into a sysroot
 	SYSROOT="$D"
 	OPT="--root $D"
+	# user/group lookups should match useradd/groupadd --root
+	export PSEUDO_PASSWD="$SYSROOT:${STAGING_DIR_NATIVE}"
 fi
 
 # If we're not doing a special SSTATE/SYSROOT install
-- 
1.8.5.5


