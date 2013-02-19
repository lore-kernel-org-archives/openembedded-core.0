Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U7i23-0008BS-7u
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 08:54:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1J7cLoR006857
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 23:38:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 18 Feb 2013 23:38:21 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 15:38:15 +0800
Message-ID: <ef806d4db9e59f87ef7eb0cd90972e3b340124d7.1361258872.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361258872.git.Qi.Chen@windriver.com>
References: <cover.1361258872.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/4] populate-volatile.sh: add ROOT_DIR variable to support running at rootfs time
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
X-List-Received-Date: Tue, 19 Feb 2013 07:54:40 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

For populate-volatile.sh script to run correctly both at rootfs time and
at system boot time, it needs to be aware of which situation it is now in.

We use the ROOT_DIR variable to indicate whether it is run at rootfs time or
not. ROOT_DIR being "/" indicates that this script is run at system boot time,
otherwise, it is run at rootfs time.

Also, we ignore failures when running this script at rootfs time.
For example, if ${ROOT_DIR}/var/dir1 is symlink to /var/volatile/dir1, it's
possible that the link is a dead link. So if we're going to create some file
under ${ROOT_DIR}/var/dir1, it will fail. But the failure does no harm,
because this script will always run at system boot time to set up the correct
files and directories.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |   57 +++++++++++++++-----
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index ab3af70..f1f8793 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -8,10 +8,18 @@
 # Short-Description:  Populate the volatile filesystem
 ### END INIT INFO
 
-. /etc/default/rcS
-
-CFGDIR="/etc/default/volatiles"
-TMPROOT="/var/tmp"
+# Get ROOT_DIR
+DIRNAME=`dirname $0`
+ROOT_DIR=`echo $DIRNAME | sed -ne 's:etc/.*::p'`
+
+[ -e ${ROOT_DIR}/etc/default/rcS ] && . ${ROOT_DIR}/etc/default/rcS
+# When running populat-volatile.sh at rootfs time, disable cache.
+[ "$ROOT_DIR" != "/" ] && VOLATILE_ENABLE_CACHE=no
+# If rootfs is read-only, disable cache.
+[ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
+
+CFGDIR="${ROOT_DIR}/etc/default/volatiles"
+TMPROOT="${ROOT_DIR}/var/tmp"
 COREDEF="00_core"
 
 [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
@@ -27,7 +35,15 @@ create_file() {
 	[ -e "$1" ] && {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-		eval $EXEC &
+		if [ "$ROOT_DIR" = "/" ]; then
+			eval $EXEC &
+		else
+			# Creating some files at rootfs time may fail and should fail,
+			# but these failures should not be logged to make sure the do_rootfs
+			# process doesn't fail. This does no harm, as this script will
+			# run on target to set up the correct files and directories.
+			eval $EXEC > /dev/null 2>&1
+		fi
 	}
 }
 
@@ -41,7 +57,13 @@ mk_dir() {
 	[ -e "$1" ] && {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-		eval $EXEC
+		if [ "$ROOT_DIR" = "/" ]; then
+			eval $EXEC
+		else
+			# For the same reason with create_file(), failures should
+			# not be logged.
+			eval $EXEC > /dev/null 2>&1
+		fi
 	}
 }
 
@@ -53,7 +75,13 @@ link_file() {
 	[ -e "$2" ] && {
 		echo "Cannot create link over existing -${TNAME}-." >&2
 	} || {
-		eval $EXEC &
+		if [ "$ROOT_DIR" = "/" ]; then
+			eval $EXEC &
+		else
+			# For the same reason with create_file(), failures should
+			# not be logged.
+			eval $EXEC > /dev/null 2>&1
+		fi
 	}
 }
 
@@ -71,7 +99,7 @@ check_requirements() {
 	TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
 	TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
 
-	cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+	cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
 	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
 	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 	NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
@@ -85,7 +113,7 @@ check_requirements() {
 	}
 
 
-	cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+	cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
 	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
 	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 
@@ -116,6 +144,7 @@ apply_cfgfile() {
 	cat ${CFGFILE} | grep -v "^#" | \
 		while read LINE; do
 		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
+		TNAME=${ROOT_DIR}/${TNAME}
 		[ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
 
 		[ "${TTYPE}" = "l" ] && {
@@ -168,19 +197,19 @@ do
 done
 exec 9>&-
 
-if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
+if test -e ${ROOT_DIR}/etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
 then
-	sh /etc/volatile.cache
+	sh ${ROOT_DIR}/etc/volatile.cache
 else	
-	rm -f /etc/volatile.cache /etc/volatile.cache.build
+	rm -f ${ROOT_DIR}/etc/volatile.cache /etc/volatile.cache.build
 	for file in `ls -1 "${CFGDIR}" | sort`; do
 		apply_cfgfile "${CFGDIR}/${file}"
 	done
 
-	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
+	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
 fi
 
-if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
+if [ "${ROOT_DIR}" = "/" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
 then
 	ln -s /etc/ld.so.cache /var/run/ld.so.cache
 fi
-- 
1.7.9.5



