Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.mail.online.nl (smtp03.mail.online.nl [194.134.25.73])
	by mail.openembedded.org (Postfix) with ESMTP id A532660053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 17:06:43 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp03.mail.online.nl (Postfix) with ESMTP id B7B3E1C002A;
	Fri, 11 Sep 2015 19:06:42 +0200 (CEST)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Sep 2015 19:06:40 +0200
Message-Id: <1441991200-12654-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] image_types.bbclass: Restore compatibility with previous UBI filesystems
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
X-List-Received-Date: Fri, 11 Sep 2015 17:06:45 -0000

Support for multiple ubi images has broken dozens of machine deployment scripts
in two ways:
Previously, ubi filesystems would be named $IMAGE_NAME as one would expect. The
current version would append "_rootfs" to that name for no reason. Fix it so that
the name for ubi images remains unchanged if there is only one image to build.
Machines would append to IMAGE_CMD_ubi, adding extra image processing of their
own. This is broken now that IMAGE_CMD_ubi became a variable instead of a function.
Make IMAGE_CMD_ubi a function again, this also makes for more logical quotes (I
was surprised to find that " within " would even work).

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/image_types.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ecb066b..306403e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -120,7 +120,11 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
-	local vname="_$3"
+	if [ -z "$3" ]; then
+		local vname=""
+	else
+		local vname="_$3"
+	fi
 
 	echo \[ubifs\] > ubinize${vname}.cfg
 	echo mode=ubi >> ubinize${vname}.cfg
@@ -158,7 +162,9 @@ IMAGE_CMD_multiubi () {
 	done
 }
 
-IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAME}""
+IMAGE_CMD_ubi () {
+	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
+}
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
-- 
2.1.0


