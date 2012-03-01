Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S37M7-0007F4-QC
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 15:51:43 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id E2A99F8120C; Thu,  1 Mar 2012 07:43:14 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2012 07:43:14 -0700
Message-Id: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] initscripts: Properly handle new timestamp format
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 14:51:44 -0000

Recent changes have attempted to make consistant use of /etc/timestamp
In particular
  5aab665 initscripts: Make /etc/timestamp consistent again.
  173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes

This new format can cause problems as the value is too large for
most [32 bit] machines.  Work around this by only comparing the
YYYYMMDD portion (which does fit in 32 bits).  Also, the new format
is not directly compatible with the 'date' command line, so it
must be reformatted for use.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 20ec0a0..383de82 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -70,8 +70,8 @@ if test -e /etc/timestamp
 then
 	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
 	read TIMESTAMP < /etc/timestamp
-	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
-		date -u $TIMESTAMP
+	if [ ${TIMESTAMP%????} -gt ${SYSTEMDATE%????} ]; then
+		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
 		/etc/init.d/hwclock.sh stop
 	fi
 fi
-- 
1.7.7.6



