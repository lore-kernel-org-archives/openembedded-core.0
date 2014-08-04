Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7406FECD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:39 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffkH020176 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:41 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414096-622913 ;
	Mon, 4 Aug 2014 13:41:40 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:40:53 -0500
Message-Id: <78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:40 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize complete at 08/04/2014 01:41:41 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 01/20] udev-cache: Compress the cache
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

$DEVCACHE is observed to be 100k uncompressed; compressing it reduces
its size to ~5k.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init               | 2 +-
 meta/recipes-core/udev/udev/udev-cache         | 2 +-
 meta/recipes-core/udev/udev/udev-cache.default | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index f2c84d5..1e69861 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -69,7 +69,7 @@ case "$1" in
 		    readfiles /etc/udev/cache.data
 		    OLDDATA="$READDATA"
 		    if [ "$OLDDATA" = "$NEWDATA" ]; then
-                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+                            (cd /; tar xzf $DEVCACHE > /dev/null 2>&1)
                             not_first_boot=1
                             [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
                             [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index db5a513..3769062 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -25,7 +25,7 @@ fi
 
 if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
 	echo "Populating dev cache"
-	(cd /; tar cf "$DEVCACHE" dev)
+	(cd /; tar czf "$DEVCACHE" dev)
 	mv /dev/shm/udev.cache /etc/udev/cache.data
 fi
 
diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index 2093336..909ec87 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -1,5 +1,5 @@
 # Default for /etc/init.d/udev
 
 # Comment this out to disable device cache
-DEVCACHE="/etc/dev.tar"
+DEVCACHE="/etc/dev.tar.gz"
 PROBE_PLATFORM_BUS="yes"
-- 
2.0.4


