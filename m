Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 735EF70644
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 21:57:18 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6HLvJwM023301 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:57:19 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071716571968-513276 ;
	Thu, 17 Jul 2014 16:57:19 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 16:56:55 -0500
Message-Id: <6f87ef917a6327c50f2a190d6f30a705fe536bdc.1405633546.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <cover.1405633546.git.ben.shelton@ni.com>
References: <cover.1405633546.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize complete at 07/17/2014 04:57:19 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-17_06:2014-07-17, 2014-07-17,
	1970-01-01 signatures=0
Subject: [PATCH v2 4/6] initscripts: Use current date as an additional source of entropy
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
X-List-Received-Date: Thu, 17 Jul 2014 21:57:22 -0000

From: Ken Sharp <ken.sharp@ni.com>

If the seed file is empty or does not exist, the date is an extremely
poor backup source of entropy, but it is better than nothing.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/urandom | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index a0549de..ec4ef61 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -20,12 +20,11 @@ RANDOM_SEED_FILE=/var/lib/urandom/random-seed
 case "$1" in
 	start|"")
 		test "$VERBOSE" != no && echo "Initializing random number generator..."
-		# Load and then save 512 bytes,
-		# which is the size of the entropy pool
-		if test -f "$RANDOM_SEED_FILE"
-		then
-			cat "$RANDOM_SEED_FILE" >/dev/urandom
-		fi
+		# Load and then save 512 bytes, which is the size of the entropy
+		# pool. Also load the current date, in case the seed file is
+		# empty.
+		( date +%s.%N; [ -f "$RANDOM_SEED_FILE" ] && cat "$RANDOM_SEED_FILE" ) \
+			>/dev/urandom
 		rm -f "$RANDOM_SEED_FILE"
 		umask 077
 		dd if=/dev/urandom of=$RANDOM_SEED_FILE count=1 \
-- 
2.0.2


