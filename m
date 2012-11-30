Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1TeNuo-0003lz-Ti
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 11:33:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUAJWtH006388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 02:19:32 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 30 Nov 2012 02:19:32 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 18:19:28 +0800
Message-ID: <1354270768-5265-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] initscripts/urandom: change random-seed directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 10:33:51 -0000
Content-Type: text/plain

/etc/init.d/urandom fails to start/stop because it tries to save
random-seed into /var/lib/urandom folder which does not exist in the
file system.

Fixed by using /var/lib/misc instead of /var/lib/urandom.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/urandom | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index eb3a7c3..1cf7c5c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -14,18 +14,19 @@
 test -c /dev/urandom || exit 0
 . /etc/default/rcS
 
+SAVEDFILE=/var/lib/misc/random-seed
 case "$1" in
 	start|"")
 		test "$VERBOSE" != no && echo "Initializing random number generator..."
 		# Load and then save 512 bytes,
 		# which is the size of the entropy pool
-		if test -f /var/lib/urandom/random-seed
+		if test -f $SAVEDFILE
 		then
-			cat /var/lib/urandom/random-seed >/dev/urandom
+			cat $SAVEDFILE >/dev/urandom
 		fi
-		rm -f /var/lib/urandom/random-seed
+		rm -f $SAVEDFILE
 		umask 077
-		dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
+		dd if=/dev/urandom of=$SAVEDFILE count=1 \
 			>/dev/null 2>&1 || echo "urandom start: failed."
 		umask 022
 		;;
@@ -34,7 +35,7 @@ case "$1" in
 		# see documentation in linux/drivers/char/random.c
 		test "$VERBOSE" != no && echo "Saving random seed..."
 		umask 077
-		dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
+		dd if=/dev/urandom of=$SAVEDFILE count=1 \
 			>/dev/null 2>&1 || echo "urandom stop: failed."
 		;;
 	*)
-- 
1.7.11



