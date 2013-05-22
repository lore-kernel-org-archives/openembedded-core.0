Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 303146065C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 23:23:59 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lj1so2326114pab.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xBQENG/aQ6w0JNvBSmyrmRvY8VEN4Lf6WIpMPssKSWU=;
	b=xR0FmwOeGsxbGSMRuNbepcpRaya8KX2rXUskiklil+uMuJQlVxCWvyiZvJlVaUkimH
	+dXywB2Y/omv9+LcgF3kOwR1f/UZiOMKpJUWlJhO9MkLoOKrR6TWx/UzN8Z6NQ+ZDCsf
	3w4uuDlzZgUk/AvrMpfohXF4RNuBqQ+tnhLWAk89b6ZRRivFdICpb3oord5W9xmJxbF+
	y1ZN0lBvoaqqzmSTst37OYQalBjFsJETV6BaHwOIp+tM1eRvw7AfnKWiGyQ4H3pk8dEv
	YRoiZLEnaODn7x7YGMm61n8q2ZmIhd2JGdaDuheCDtmE8XTLtfiOu6konrXoIz3Zd7OU
	PRGg==
X-Received: by 10.68.225.197 with SMTP id rm5mr10215580pbc.137.1369265039906; 
	Wed, 22 May 2013 16:23:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm9033677pbm.0.2013.05.22.16.23.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 16:23:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 09:37:07 +1000
Message-Id: <1369265827-31019-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v4] populate-volatile.sh: remove repeated leading slashes in TNAME
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
X-List-Received-Date: Wed, 22 May 2013 23:23:59 -0000

This avoids triple slashes in the generated /etc/volatile.cache to
reduce disk usage and in the output when verbose mode is enabled.

As all the paths for volatiles start with a slash, we can change
TNAME=${ROOT_DIR}/${TNAME} to TNAME=${ROOT_DIR}${TNAME}. To avoid
a double slash when ROOT_DIR is /, we strip the extra slash from
ROOT_DIR.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh       | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index ab09231..91c70ef 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -10,11 +10,11 @@
 
 # Get ROOT_DIR
 DIRNAME=`dirname $0`
-ROOT_DIR=`echo $DIRNAME | sed -ne 's:etc/.*::p'`
+ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
 
 [ -e ${ROOT_DIR}/etc/default/rcS ] && . ${ROOT_DIR}/etc/default/rcS
 # When running populate-volatile.sh at rootfs time, disable cache.
-[ "$ROOT_DIR" != "/" ] && VOLATILE_ENABLE_CACHE=no
+[ -n "$ROOT_DIR" ] && VOLATILE_ENABLE_CACHE=no
 # If rootfs is read-only, disable cache.
 [ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
 
@@ -35,7 +35,7 @@ create_file() {
 	[ -e "$1" ] && {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-		if [ "$ROOT_DIR" = "/" ]; then
+		if [ -z "$ROOT_DIR" ]; then
 			eval $EXEC &
 		else
 			# Creating some files at rootfs time may fail and should fail,
@@ -57,7 +57,7 @@ mk_dir() {
 	[ -e "$1" ] && {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-		if [ "$ROOT_DIR" = "/" ]; then
+		if [ -z "$ROOT_DIR" ]; then
 			eval $EXEC
 		else
 			# For the same reason with create_file(), failures should
@@ -82,7 +82,7 @@ link_file() {
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
 
-	if [ "$ROOT_DIR" = "/" ]; then
+	if [ -z "$ROOT_DIR" ]; then
 		eval $EXEC &
 	else
 		# For the same reason with create_file(), failures should
@@ -150,7 +150,7 @@ apply_cfgfile() {
 	cat ${CFGFILE} | grep -v "^#" | \
 		while read LINE; do
 		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
-		TNAME=${ROOT_DIR}/${TNAME}
+		TNAME=${ROOT_DIR}${TNAME}
 		[ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
 
 		[ "${TTYPE}" = "l" ] && {
@@ -213,7 +213,7 @@ else
 	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
 fi
 
-if [ "${ROOT_DIR}" = "/" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
+if [ -z "${ROOT_DIR}" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
 then
 	ln -s /etc/ld.so.cache /var/run/ld.so.cache
 fi
-- 
1.8.2.3


