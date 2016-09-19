Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0143601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:19:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J9J04I021779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:19:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 02:19:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 02:18:58 -0700
Message-ID: <4148d1a2e5a7365f9dbac4e03c13c0e750253409.1474276405.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474276405.git.liezhi.yang@windriver.com>
References: <cover.1474276405.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu-gen-tapdevs: remove /etc/runqemu-nosudo when remove taps
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
X-List-Received-Date: Mon, 19 Sep 2016 09:19:02 -0000
Content-Type: text/plain

It creats /etc/runqemu-nosudo when creats taps, so should remove it when
remove taps.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-gen-tapdevs | 46 +++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 624deac..bfb60f4 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -69,32 +69,38 @@ if [ ! -x "$IFCONFIG" ]; then
        exit 1
 fi
 
-# Ensure we start with a clean slate
-for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`; do
-	echo "Note: Destroying pre-existing tap interface $tap..."
-	$TUNCTL -d $tap
-done
-
-echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
-for ((index=0; index < $COUNT; index++)); do
-	echo "Creating tap$index"
-	ifup=`$RUNQEMU_IFUP $TUID $GID $SYSROOT 2>&1`
-	if [ $? -ne 0 ]; then
-		echo "Error running tunctl: $ifup"
-		exit 1
-	fi
-done
+if [ $COUNT -ge 0 ]; then
+	# Ensure we start with a clean slate
+	for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`; do
+		echo "Note: Destroying pre-existing tap interface $tap..."
+		$TUNCTL -d $tap
+	done
+	rm -f /etc/runqemu-nosudo
+else
+	echo "Error: Incorrect count: $COUNT"
+	exit 1
+fi
 
 if [ $COUNT -gt 0 ]; then
+	echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
+	for ((index=0; index < $COUNT; index++)); do
+		echo "Creating tap$index"
+		ifup=`$RUNQEMU_IFUP $TUID $GID $SYSROOT 2>&1`
+		if [ $? -ne 0 ]; then
+			echo "Error running tunctl: $ifup"
+			exit 1
+		fi
+	done
+
 	echo "Note: For systems running NetworkManager, it's recommended"
 	echo "Note: that the tap devices be set as unmanaged in the"
 	echo "Note: NetworkManager.conf file. Add the following lines to"
 	echo "Note: /etc/NetworkManager/NetworkManager.conf"
 	echo "[keyfile]"
 	echo "unmanaged-devices=interface-name:tap*"
-fi
 
-# The runqemu script will check for this file, and if it exists,
-# will use the existing bank of tap devices without creating
-# additional ones via sudo.
-touch /etc/runqemu-nosudo
+	# The runqemu script will check for this file, and if it exists,
+	# will use the existing bank of tap devices without creating
+	# additional ones via sudo.
+	touch /etc/runqemu-nosudo
+fi
-- 
2.9.0


