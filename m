Received: from mail-pd0-f173.google.com ([209.85.192.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UeNuM-0000cO-Iw
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 13:05:53 +0200
Received: by mail-pd0-f173.google.com with SMTP id v10so5276003pde.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=CNBa61TedE5EFKFO0t8GXw0qQAoZvpkRie5RsMWdNi0=;
	b=a1JroSg5jsqcjElxKfRZGWT7FovbExSx4D0kRWE1YnMTNxIqJd3OtT2WvoWIm6EeEQ
	GLwbV6ybtmGpwz3Z2Ivo/qFuh/IU9BEiltIFEL13OGj2QdweDG2gGEAV695x2+189t5c
	u4TZnPhh6bbaBijUOiQrPVUyT41rKgysHqGmgTjOZFKEX8++hvL2MV1x1tjxyZlS/ZMB
	JaQAViYfFXG16FjcodIiwicLtnNn7K1ByGZT2eLq4MbO+6vXLShk8a/ApWSjReAzh7ni
	XB5U9u1aDlXBFXALPYkyw2sP0GnSJwgKWPFb+wUkgzI8b3mN4lJgfR6dlCTo4+2Clsko
	m1jA==
X-Received: by 10.68.198.69 with SMTP id ja5mr60867755pbc.183.1369046837915;
	Mon, 20 May 2013 03:47:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vu10sm23637262pbc.27.2013.05.20.03.47.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 03:47:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 21:00:25 +1000
Message-Id: <1369047625-2966-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v3] populate-volatile.sh: remove repeated leading slashes in TNAME
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
X-List-Received-Date: Mon, 20 May 2013 11:05:56 -0000

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
index ab09231..eb89cd1 100755
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
+if [ -n "${ROOT_DIR}" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
 then
 	ln -s /etc/ld.so.cache /var/run/ld.so.cache
 fi
-- 
1.8.2.3



