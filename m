Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 205F3701A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffIi020194 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:42 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414174-622926 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:06 -0500
Message-Id: <1b88abb2483607f2ed69b8fba1094f06ab73a212.1407177403.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:41 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 01:41:42 PM,
	Serialize complete at 08/04/2014 01:41:42 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_03:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Subject: [PATCH 14/20] udev-cache: refactor; improve verbosity and error handling
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:41 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Most of /etc/init.d/udev-cache is in a conditional block which can be
replaced by a `[ ... ] || exit 0` to reduce nesting. This eliminates
a `rm -f` which was dead code anyway.

This also provides the opportunity to emit a few more messages if
VERBOSE is set, which may help with future debugging.

Finally, make installing the new $DEVCACHE_SYSCONF contingent on
successfully creating the cache tarball.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 29700e0..7eea5fb 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -23,13 +23,15 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     exit 0
 fi
 
-if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_CURRENT_SYSCONF" ]; then
-	[ "${VERBOSE}" != "no" ] && echo "Populating dev cache"
-	(
-		tar czf "${DEVCACHE}.tmp" dev -C / $DEVCACHE_CREATE_OPTS
-		mv -f "${DEVCACHE}.tmp" "$DEVCACHE"
+[ "$DEVCACHE" != "" ] || exit 0
+[ "${VERBOSE}" == "no" ] || echo -n "$0: checking for ${DEVCACHE_CURRENT_SYSCONF}... "
+[ -e "$DEVCACHE_CURRENT_SYSCONF" ] || { echo "not found"; exit 0; }
+[ "${VERBOSE}" == "no" ] || echo "found; building cache."
+
+(
+	tar czf "${DEVCACHE}.tmp" dev -C / $DEVCACHE_CREATE_OPTS && \
+		mv -f "${DEVCACHE}.tmp" "$DEVCACHE" && \
 		mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
-	) &
-fi
+) &
 
 exit 0
-- 
2.0.4


