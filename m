Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4C63370F69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKkI008678; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312041-290501 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:58 -0500
Message-Id: <fda8933d3d23815d7eee6a2e4398e00bb97947b5.1408742574.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1408742574.git.rich.tollerton@ni.com>
References: <cover.1408742574.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize complete at 08/22/2014 04:31:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-22_06:2014-08-22, 2014-08-22,
	1970-01-01 signatures=0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 12/12] udev-cache: refactor; improve verbosity and error handling
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
X-List-Received-Date: Fri, 22 Aug 2014 21:31:24 -0000

Most of /etc/init.d/udev-cache is in a conditional block which can be
replaced by a `[ ... ] || exit 0` to reduce nesting. This also
provides an opportunity to improve handling of VERBOSE a bit.

Previously, errors encountered during find, tar, etc. were ignored,
which could mask some problems, or cause invalid cache files to get
created. To solve: abort the update process (and report an error) if any
command in the process fails; and write the system configuration to
$SYSCONF_TMP first -- only update $SYSCONF_CACHED when we are certain
that the cache tarball was successfully created.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index baeb125..dc97198 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -41,19 +41,26 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
     exit 0
 fi
 
-if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_REGEN" ]; then
-	echo "Populating dev cache"
-	(
-		# Run sysconf_cmd before `tar`, not after, so that as little
-		# time as possible elapses between creating $SYSCONF_CACHED and
-		# $DEVCACHE.
-		sysconf_cmd > "$SYSCONF_CACHED"
-		find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
-			| xargs tar cf "${DEVCACHE_TMP}" -T-
-		gzip < "${DEVCACHE_TMP}" > "$DEVCACHE"
-		rm -f "${DEVCACHE_TMP}"
-		rm -f "$DEVCACHE_REGEN"
-	) &
+[ "$DEVCACHE" != "" ] || exit 0
+[ "${VERBOSE}" == "no" ] || echo -n "udev-cache: checking for ${DEVCACHE_REGEN}... "
+if ! [ -e "$DEVCACHE_REGEN" ]; then
+	[ "${VERBOSE}" == "no" ] || echo "not found."
+	exit 0
 fi
+[ "${VERBOSE}" == "no" ] || echo "found; building cache."
+
+(
+	# Run sysconf_cmd before `tar`, not after, so that as little time as
+	# possible elapses between creating $SYSCONF_CACHED and $DEVCACHE.
+	if ! { sysconf_cmd > "$SYSCONF_TMP" \
+		&& find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
+		| xargs tar cf "${DEVCACHE_TMP}" -T- \
+		&& gzip < "${DEVCACHE_TMP}" > "$DEVCACHE" \
+		&& mv "$SYSCONF_TMP" "$SYSCONF_CACHED" \
+		&& rm -f "$DEVCACHE_REGEN" "${DEVCACHE_TMP}"; }
+	then
+		echo "udev-cache: update failed!"
+	fi
+) &
 
 exit 0
-- 
2.0.4


