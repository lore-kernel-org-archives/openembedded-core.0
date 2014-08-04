Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 15CB76FE5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 18:41:40 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74IffIj020194 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 13:41:42 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080413414177-622928 ;
	Mon, 4 Aug 2014 13:41:41 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 4 Aug 2014 13:41:08 -0500
Message-Id: <148385839283a916aa32d91f6e663d075fc2f34f.1407177403.git.ben.shelton@ni.com>
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
Subject: [PATCH 16/20] udev-cache: invalidate on rules.d changes
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
X-List-Received-Date: Mon, 04 Aug 2014 18:41:46 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Presently, $DEVCACHE_CURRENT_SYSCONF doesn't change if rules are
modified, which may cause the cache to preserve an old configuration.
To fix, include `ls -l` output for all rules, which ought to be
reasonably fast to run on boot.

Natinst-Rally-ID: TA44427
Acked-by: Gratian Crisan <gratian.crisan@ni.com>
Natinst-ReviewBoard-ID: 58620
Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index e4a196f..3a52e98 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -63,9 +63,10 @@ case "$1" in
     # A list of files which are used as a criteria to judge whether the udev cache could be reused.
     CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
     if [ "$DEVCACHE" != "" ]; then
+	    RULELIST=`ls -l /lib/udev/rules.d/* /etc/udev/rules.d/* 2>/dev/null`
             if [ -e $DEVCACHE ]; then
 		    readfiles $CMP_FILE_LIST
-		    NEWDATA="$READDATA"
+		    NEWDATA="$READDATA$RULELIST"
 		    readfiles "$DEVCACHE_SYSCONF"
 		    OLDDATA="$READDATA"
 		    if [ "$OLDDATA" = "$NEWDATA" -a -f "$DEVCACHE" ]; then
@@ -77,7 +78,7 @@ case "$1" in
 			    # Output detailed reason why the cached /dev is not used
 			    if [ "$VERBOSE" != "no" ]; then
 				    echo "udev: udev cache not used"
-				    echo "udev: we use $CMP_FILE_LIST as criteria to judge whether the cache /dev could be resued"
+				    echo "udev: we use $CMP_FILE_LIST and ls -l [/lib][etc]/udev/rules.d/* as criteria to judge whether the cached /dev could be reused"
 				    echo "udev: olddata: $OLDDATA"
 				    echo "udev: newdata: $NEWDATA"
 			    fi
@@ -88,7 +89,7 @@ case "$1" in
 			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
 			    # otherwise, we do not bother to read files.
 			    readfiles $CMP_FILE_LIST
-			    echo "$READDATA" > "$DEVCACHE_CURRENT_SYSCONF"
+			    echo "$READDATA$RULELIST" > "$DEVCACHE_CURRENT_SYSCONF"
 		    fi
             fi
     fi
-- 
2.0.4


