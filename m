Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UeNsU-0000Hw-8Y
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 13:03:48 +0200
Received: by mail-pb0-f45.google.com with SMTP id mc17so1818104pbc.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=6074oNUVdovigUkKyZIYsWHMFIsi16lCigS9M3tN/dQ=;
	b=Etb1EwcsyI1w3VeiXNoDLIqZ5HjXBZeCSDaGqctz9Mpf6EyT4h25IPqQH2WWqYGbjc
	wGEmg6TLzTWrmUfd4isoxVQ7dt8kgx3/SXog4/A4Z2Rh7jH0ZnFOEMIIRCisXyLM1xcC
	Vten8PbOWWIPbAvJge9suU8SpBZSpM8KnJQ1apn8M7BHUsYJDl1fDa3OavkOkP5fXJw4
	tutBCbhsVQh0ISQXjOX6FjiHEnXxKrZje3kGtxBWqJJhezI5CnmSpc8Cy/YWmIpG+l65
	g484sSS2Ty3da3eB8ehAgJR+3L06GL2//LzUPfx5/2a7CAbLlxD1zsu9xDSlOqNmwBL+
	im1w==
X-Received: by 10.66.155.102 with SMTP id vv6mr60420595pab.64.1369046721388;
	Mon, 20 May 2013 03:45:21 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	qb1sm23621966pbb.33.2013.05.20.03.45.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 03:45:20 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 20:58:23 +1000
Message-Id: <1369047503-2792-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2] populate-volatile.sh: remove repeated leading slashes in TNAME
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 11:03:54 -0000

This avoids triple slashes in the generated /etc/volatile.cache to
reduce disk usage and in the output when verbose mode is enabled.

As all the paths for volatiles start with a slash, we can change
TNAME=${ROOT_DIR}/${TNAME} to TNAME=${ROOT_DIR}${TNAME}. To avoid
a double slash when ROOT_DIR is /, we strip the extra slash from
ROOT_DIR.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index ab09231..430d083 100755
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
-- 
1.8.2.3



