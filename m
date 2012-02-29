Received: from outbound.icp-osb-irony-out7.iinet.net.au ([203.59.1.108])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S2YHr-0003Fp-Nv
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 02:25:00 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEANp6TU/LO4Se/2dsb2JhbABDs1SBB4J3KIEpiAe5C40TXxMLhH8HWINKBIhNknKMfQ
X-IronPort-AV: E=Sophos;i="4.73,499,1325433600"; d="scan'208";a="78784405"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-osb-irony-out7.iinet.net.au with ESMTP;
	29 Feb 2012 09:13:25 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 09:13:46 +0800
Message-Id: <1330478026-3871-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] initscripts: Create the volatiles cache atomically.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 01:25:00 -0000

If a machine loses power while building the volatiles cache, it will
continue to operate with an incomplete set of volatiles. Fix this by
updating atomically.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../initscripts-1.0/populate-volatile.sh           |   10 ++++++----
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 1813fd1..4a99aff 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -22,7 +22,7 @@ create_file() {
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 " 
 
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
@@ -37,7 +37,7 @@ mk_dir() {
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 	
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
@@ -49,7 +49,7 @@ mk_dir() {
 link_file() {
 	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1" 
 
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
 	
 	[ -e "$2" ] && {
 	  echo "Cannot create link over existing -${TNAME}-." >&2
@@ -185,10 +185,12 @@ if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "
 then
 	sh /etc/volatile.cache
 else	
-	rm -f /etc/volatile.cache
+	rm -f /etc/volatile.cache /etc/volatile.cache.build
 	for file in `ls -1 "${CFGDIR}" | sort`; do
 		apply_cfgfile "${CFGDIR}/${file}"
 	done
+
+	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
 fi
 
 if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e16f19f..68701ce 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r131"
+PR = "r132"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.3.4



