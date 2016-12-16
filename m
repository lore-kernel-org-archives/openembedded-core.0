Return-Path: <mru@mansr.com>
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEC37740C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 16:28:53 +0000 (UTC)
Received: by unicorn.mansr.com (Postfix, from userid 51770)
	id BD7D615393; Fri, 16 Dec 2016 16:28:53 +0000 (GMT)
From: Mans Rullgard <mans@mansr.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 16:28:38 +0000
Message-Id: <20161216162838.14910-1-mans@mansr.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] initscripts: populate-volatile: don't run commands in background
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
X-List-Received-Date: Fri, 16 Dec 2016 16:28:54 -0000

If commands are run asynchronously they may be completed out of
order causing problems if later entries depend on earlier ones.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 91514bac86fa..cf0d2bf96610 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -36,7 +36,7 @@ create_file() {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
 		if [ -z "$ROOT_DIR" ]; then
-			eval $EXEC &
+			eval $EXEC
 		else
 			# Creating some files at rootfs time may fail and should fail,
 			# but these failures should not be logged to make sure the do_rootfs
@@ -86,7 +86,7 @@ link_file() {
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
 
 	if [ -z "$ROOT_DIR" ]; then
-		eval $EXEC &
+		eval $EXEC
 	else
 		# For the same reason with create_file(), failures should
 		# not be logged.
@@ -187,7 +187,7 @@ apply_cfgfile() {
 
 		case "${TTYPE}" in
 			"f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
-				create_file "${TNAME}" &
+				create_file "${TNAME}"
 				;;
 			"d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
 				mk_dir "${TNAME}"
-- 
2.11.0


