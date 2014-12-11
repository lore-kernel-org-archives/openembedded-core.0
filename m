Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EEB22724F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:08:44 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58jEV026625 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084528-1004396 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:04 -0600
Message-Id: <fb186caca9d4fb4f43340ac91ec30d8792d3f0d2.1418274272.git.rich.tollerton@ni.com>
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
Subject: [PATCH v3 3/9] udev-cache: don't generate sysconf twice
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
X-List-Received-Date: Thu, 11 Dec 2014 05:08:48 -0000

The udev initscript signals udev-cache to run by generating a new
sysconf; but udev-cache now overwrites that with its own copy. To
eliminate the needless sysconf generating in udev, we instead trigger
udev-cache to run by touching a new file $DEVCACHE_REGEN.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 5 ++++-
 meta/recipes-core/udev/udev/udev-cache | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index ee79670..337b6d4 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -16,6 +16,7 @@ export TZ=/etc/localtime
 [ -x @UDEVD@ ] || exit 1
 SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
+DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 [ -f /etc/default/rcS ] && . /etc/default/rcS
@@ -62,6 +63,7 @@ case "$1" in
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
                             [ -e $SYSCONF_TMP ] && rm -f "$SYSCONF_TMP"
+                            [ -e "$DEVCACHE_REGEN" ] && rm -f "$DEVCACHE_REGEN"
                     else
 			    # Output detailed reason why the cached /dev is not used
 			    if [ "$VERBOSE" != "no" ]; then
@@ -70,12 +72,13 @@ case "$1" in
 				    echo "udev: cached sysconf:  $SYSCONF_CACHED"
 				    echo "udev: current sysconf: $SYSCONF_TMP"
 			    fi
+			    touch "$DEVCACHE_REGEN"
                     fi
 	    else
 		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
-			    cat -- "$CMP_FILE_LIST" > "$SYSCONF_TMP"
+			    touch "$DEVCACHE_REGEN"
 		    fi
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index e0e1c39..814ef54 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -19,6 +19,7 @@ export TZ=/etc/localtime
 DEVCACHE_TMP="/dev/shm/udev-cache-tmp.tar"
 SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
+DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
 
 # A list of files which are used as a criteria to judge whether the udev cache could be reused.
 CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
@@ -30,7 +31,7 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     exit 0
 fi
 
-if [ "$DEVCACHE" != "" -a -e "$SYSCONF_TMP" ]; then
+if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_REGEN" ]; then
 	echo "Populating dev cache"
 	udevadm control --stop-exec-queue
         cat -- $CMP_FILE_LIST > "$SYSCONF_TMP"
@@ -40,6 +41,7 @@ if [ "$DEVCACHE" != "" -a -e "$SYSCONF_TMP" ]; then
 	rm -f "${DEVCACHE_TMP}"
 	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
 	udevadm control --start-exec-queue
+	rm -f "$DEVCACHE_REGEN"
 fi
 
 exit 0
-- 
2.1.3


