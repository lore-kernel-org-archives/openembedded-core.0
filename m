Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 312CF65CC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 06:03:23 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58jpi020295 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084527-1004394 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:02 -0600
Message-Id: <2f929e43b266621dd3ff8a4dd4b8315c365cfedd.1418274272.git.rich.tollerton@ni.com>
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
Subject: [PATCH v3 1/9] udev-cache: stop race between sysconf and cache generation
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
X-List-Received-Date: Thu, 11 Dec 2014 06:03:31 -0000

The validity of the udev cache is determined by the sysconf
file (/etc/udev/cache.data). Currently, there is a substantial delay
between sysconf generation in /etc/init.d/udev and cache generation in
/etc/init.d/udev-cache. If a hotplug event arrives in the middle of
this, then the sysconf will be out of date with respect to the cache.

The solution is two-pronged. First, we minimize the race window by
regenerating the sysconf immediately before the cache, in
/etc/init.d/udev-cache. This allows us to kill the race entirely by
stopping the udev event queue while the sysconf and cache are being
generated.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 497d257..a1410f5 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -19,8 +19,22 @@ export TZ=/etc/localtime
 DEVCACHE_TMP="/dev/shm/udev-cache-tmp.tar"
 SYSCONF_CACHED="/etc/udev/cache.data"
 SYSCONF_TMP="/dev/shm/udev.cache"
+
+# A list of files which are used as a criteria to judge whether the udev cache could be reused.
+CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
+readfiles () {
+   READDATA=""
+   for filename in $@; do
+	   if [ -r $filename ]; then
+		   while read line; do
+			   READDATA="$READDATA$line"
+		   done < $filename
+	   fi
+   done
+}
+
 if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     [ "$VERBOSE" != "no" ] && echo "udev-cache: read-only rootfs, skip generating udev-cache"
     exit 0
@@ -28,11 +42,15 @@ fi
 
 if [ "$DEVCACHE" != "" -a -e "$SYSCONF_TMP" ]; then
 	echo "Populating dev cache"
+	udevadm control --stop-exec-queue
+	readfiles $CMP_FILE_LIST
+	echo "$READDATA" > "$SYSCONF_TMP"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
 		| xargs tar cf "${DEVCACHE_TMP}" -T-
 	gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
 	rm -f "${DEVCACHE_TMP}"
 	mv "$SYSCONF_TMP" "$SYSCONF_CACHED"
+	udevadm control --start-exec-queue
 fi
 
 exit 0
-- 
2.1.3


