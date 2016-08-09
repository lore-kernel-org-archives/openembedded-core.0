Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob22.registeredsite.com (atl4mhob22.registeredsite.com
	[209.17.115.116])
	by mail.openembedded.org (Postfix) with ESMTP id C7BAF771F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 12:19:16 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob22.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	u79CJFLv112147 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 08:19:15 -0400
Received: (qmail 20538 invoked by uid 0); 9 Aug 2016 12:19:15 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 9 Aug 2016 12:19:14 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 14:19:00 +0200
Message-Id: <1470745140-1309-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] dropbear/init: Allow extra arguments for key generation
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
X-List-Received-Date: Tue, 09 Aug 2016 12:19:17 -0000

This patch adds DROPBEAR_RSAKEY_ARGS and DROPBEAR_DSSKEY_ARGS optional
parameters to /etc/default/dropbear. The contents are simply passed to
the 'dropbearkey' program when generating a host key.

The default keysize for RSA is currently 2048 bits. It takes a CortexA9
running at 700MHz between 4 and 10 seconds to calculate a keypair. The
board boots Linux in about a second, but you have to wait for several
seconds because of the keypair generation. This patch allows one to put
the line DROPBEAR_RSAKEY_ARGS="-s 1024" into /etc/default/dropbear, and
have a host key generated in about 0.2 seconds on the same CPU. This is
particulary useful for read-only rootfs systems which generate a key on
each boot.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

resubmitted: Added the [OE-core] prefix

 meta/recipes-core/dropbear/dropbear/init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core/dropbear/dropbear/init
index e8fed3f..434bd6b 100755
--- a/meta/recipes-core/dropbear/dropbear/init
+++ b/meta/recipes-core/dropbear/dropbear/init
@@ -62,13 +62,13 @@ for t in $DROPBEAR_KEYTYPES; do
         if [ -f "$DROPBEAR_RSAKEY" -a ! -s "$DROPBEAR_RSAKEY" ]; then
                 rm $DROPBEAR_RSAKEY || true
         fi
-        test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY
+        test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY $DROPBEAR_RSAKEY_ARGS
 	;;
     dsa)
         if [ -f "$DROPBEAR_DSSKEY" -a ! -s "$DROPBEAR_DSSKEY" ]; then
                 rm $DROPBEAR_DSSKEY || true
         fi
-        test -f $DROPBEAR_DSSKEY || dropbearkey -t dss -f $DROPBEAR_DSSKEY
+        test -f $DROPBEAR_DSSKEY || dropbearkey -t dss -f $DROPBEAR_DSSKEY $DROPBEAR_DSSKEY_ARGS
 	;;
   esac
 done
-- 
1.9.1


