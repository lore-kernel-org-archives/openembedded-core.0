Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UA8ry-0006Xi-Q2
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 01:58:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Feb 2013 16:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="261338777"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.143])
	by azsmga001.ch.intel.com with ESMTP; 25 Feb 2013 16:41:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 16:41:50 -0800
Message-Id: <1361839310-1758-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] mini-x-session: Fix starting of x-session
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
X-List-Received-Date: Tue, 26 Feb 2013 00:58:17 -0000

We need to use sudo semantics since it does not start correctly
with su.

The test was constructed incorrectly.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/mini-x-session/files/mini-x-session | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mini-x-session/files/mini-x-session b/meta/recipes-graphics/mini-x-session/files/mini-x-session
index 91f1592..dca655a 100644
--- a/meta/recipes-graphics/mini-x-session/files/mini-x-session
+++ b/meta/recipes-graphics/mini-x-session/files/mini-x-session
@@ -17,13 +17,14 @@ exec /etc/mini_x/session
 fi
 
 MINI_X_SESSION_DIR=/etc/mini_x/session.d
-if [ -d "$MINI_X_SESSION_DIR"]; then
+if [ -d "$MINI_X_SESSION_DIR" ]; then
 	# Execute session file on behalf of file owner
 	find $MINI_X_SESSION_DIR -type f | while read SESSIONFILE; do
 		set +e
 		USERNAME=`stat -c %U $SESSIONFILE`
 		# Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
-		su -l -c '$SESSIONFILE&' $USERNAME
+#		su -l -c '$SESSIONFILE&' $USERNAME
+		sudo -b -i -u $USERNAME $SESSIONFILE&
 		set -e
 	done
 fi
-- 
1.8.0.2



