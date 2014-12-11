Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id CA8916017E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:47:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58jpk020295 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084530-1004397 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:05 -0600
Message-Id: <09c6d22253c3bf0164b8a75bf88b65f1a5f02849.1418274272.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418274272.git.rich.tollerton@ni.com>
References: <cover.1418274272.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize complete at 12/10/2014 11:08:45 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-10_09:2014-12-10, 2014-12-10,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH v3 4/9] udev-cache: refactor sysconf generation
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
X-List-Received-Date: Thu, 11 Dec 2014 05:47:12 -0000

The current system configuration needs to be generated both inside
udev (to compare against the cached system configuration) and
udev-cache (to regenerate the cached system configuration). Use a single
function definition for this task, duplicated across both initscripts.
This also allows administrators to modify it for machine-specific
requirements.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 15 +++++++++++----
 meta/recipes-core/udev/udev/udev-cache |  8 +++++++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 337b6d4..96578bc 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -17,6 +17,16 @@ export TZ=/etc/localtime
 SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
 DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
+
+# A list of files which are used as a criteria to judge whether the udev cache could be reused.
+CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
+[ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
+
+# Command to compute system configuration.
+sysconf_cmd () {
+	cat -- $CMP_FILE_LIST
+}
+
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 [ -f /etc/default/rcS ] && . /etc/default/rcS
@@ -52,12 +62,9 @@ case "$1" in
     mkdir -m 1777 -p /var/volatile/tmp
 
     # Cache handling.
-    # A list of files which are used as a criteria to judge whether the udev cache could be reused.
-    CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
-    [ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
     if [ "$DEVCACHE" != "" ]; then
             if [ -e $DEVCACHE ]; then
-		    cat -- "$CMP_FILE_LIST" > "$SYSCONF_TMP"
+		    sysconf_cmd > "$SYSCONF_TMP"
 		    if cmp $SYSCONF_CACHED $SYSCONF_TMP >/dev/null; then
                             tar xmf $DEVCACHE -C / -m
                             not_first_boot=1
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 814ef54..4d50876 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -24,6 +24,12 @@ DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
 # A list of files which are used as a criteria to judge whether the udev cache could be reused.
 CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
 [ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
+
+# Command to compute system configuration.
+sysconf_cmd () {
+	cat -- $CMP_FILE_LIST
+}
+
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
@@ -34,7 +40,7 @@ fi
 if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_REGEN" ]; then
 	echo "Populating dev cache"
 	udevadm control --stop-exec-queue
-        cat -- $CMP_FILE_LIST > "$SYSCONF_TMP"
+        sysconf_cmd > "$SYSCONF_TMP"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
 		| xargs tar cf "${DEVCACHE_TMP}" -T-
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
-- 
2.1.3


