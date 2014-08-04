Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7D47017F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffIg020194 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:41 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414169-622923 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:03 -0500
Message-Id: <8823f277843a307b6ddd3c46b4b57c9efc54bf64.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize complete at 08/04/2014 01:41:41 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 11/20] udev-cache: parametrize tar options
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:42 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

The options to pass to `tar` for cache create/extract are likely to
change due to system configuration circumstances (e.g. using busybox tar
instead of GNU tar). So move the more detailed options into
the defaults file to allow for easier overrides.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init               | 2 +-
 meta/recipes-core/udev/udev/udev-cache         | 2 +-
 meta/recipes-core/udev/udev/udev-cache.default | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 5db029a..dc39d95 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -69,7 +69,7 @@ case "$1" in
 		    readfiles "$DEVCACHE_SYSCONF"
 		    OLDDATA="$READDATA"
 		    if [ "$OLDDATA" = "$NEWDATA" ]; then
-                            tar xzf $DEVCACHE -C / --exclude=log
+                            tar xzf $DEVCACHE -C / $DEVCACHE_EXTRACT_OPTS
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
                             [ -e "$DEVCACHE_CURRENT_SYSCONF" ] && rm -f "$DEVCACHE_CURRENT_SYSCONF"
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 7406e07..29700e0 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -26,7 +26,7 @@ fi
 if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_CURRENT_SYSCONF" ]; then
 	[ "${VERBOSE}" != "no" ] && echo "Populating dev cache"
 	(
-		tar czf "${DEVCACHE}.tmp" dev -C / --exclude=log
+		tar czf "${DEVCACHE}.tmp" dev -C / $DEVCACHE_CREATE_OPTS
 		mv -f "${DEVCACHE}.tmp" "$DEVCACHE"
 		mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
 	) &
diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index 7f39a68..30d7faa 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -6,4 +6,8 @@ DEVCACHE="/etc/udev-cache.tar.gz"
 DEVCACHE_SYSCONF="/etc/udev/cache.data"
 DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
 
+# - Avoid /dev/log because it's a pipe.
+DEVCACHE_EXTRACT_OPTS="--exclude=log"
+DEVCACHE_CREATE_OPTS="--exclude=log"
+
 PROBE_PLATFORM_BUS="yes"
-- 
2.0.4


