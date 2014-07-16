Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 64378701D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:42:43 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6GKxPMl015737 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:59:25 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071615592560-455728 ;
	Wed, 16 Jul 2014 15:59:25 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 15:59:16 -0500
Message-Id: <3e8bfb57a56113ee2048e70551c017e5290d1180.1405542432.git.ben.shelton@ni.com>
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
Subject: [PATCH 3/5] initscripts: parametrize random seed file location
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
X-List-Received-Date: Wed, 16 Jul 2014 21:42:50 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Currently, the random seed file location is hardcoded to
/var/lib/urandom/random-seed.  Refactor it to a parameter
(RANDOM_SEED_FILE) so the file location is defined in only one place.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/urandom | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index eb3a7c3..a0549de 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -12,6 +12,9 @@
 ### END INIT INFO
 
 test -c /dev/urandom || exit 0
+
+RANDOM_SEED_FILE=/var/lib/urandom/random-seed
+
 . /etc/default/rcS
 
 case "$1" in
@@ -19,13 +22,13 @@ case "$1" in
 		test "$VERBOSE" != no && echo "Initializing random number generator..."
 		# Load and then save 512 bytes,
 		# which is the size of the entropy pool
-		if test -f /var/lib/urandom/random-seed
+		if test -f "$RANDOM_SEED_FILE"
 		then
-			cat /var/lib/urandom/random-seed >/dev/urandom
+			cat "$RANDOM_SEED_FILE" >/dev/urandom
 		fi
-		rm -f /var/lib/urandom/random-seed
+		rm -f "$RANDOM_SEED_FILE"
 		umask 077
-		dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
+		dd if=/dev/urandom of=$RANDOM_SEED_FILE count=1 \
 			>/dev/null 2>&1 || echo "urandom start: failed."
 		umask 022
 		;;
@@ -34,7 +37,7 @@ case "$1" in
 		# see documentation in linux/drivers/char/random.c
 		test "$VERBOSE" != no && echo "Saving random seed..."
 		umask 077
-		dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
+		dd if=/dev/urandom of=$RANDOM_SEED_FILE count=1 \
 			>/dev/null 2>&1 || echo "urandom stop: failed."
 		;;
 	*)
-- 
2.0.1


