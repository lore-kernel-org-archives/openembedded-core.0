Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 33BE9701F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:53:25 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6GKxPMm015737 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:59:25 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071615592561-455729 ;
	Wed, 16 Jul 2014 15:59:25 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 15:59:17 -0500
Message-Id: <ededa281cd9a9d240d92fd819d6d6ef44a325ce4.1405542432.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <cover.1405542432.git.ben.shelton@ni.com>
References: <cover.1405542432.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:25 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:25 PM,
	Serialize complete at 07/16/2014 03:59:25 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-16_07:2014-07-16, 2014-07-16,
	1970-01-01 signatures=0
Subject: [PATCH 4/5] initscripts: Use current date as an additional source of entropy
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
X-List-Received-Date: Wed, 16 Jul 2014 21:53:30 -0000

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
2.0.1


