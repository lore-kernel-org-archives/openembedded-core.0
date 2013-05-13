Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbloU-0001jf-4K
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 08:00:50 +0200
Received: by mail-pb0-f52.google.com with SMTP id xa7so4162857pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 22:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0q6zVjaJMMSxrBNkKYN/A0c7kB+fhT8pADJi5C1dvY4=;
	b=wVEjFSu4EuOjOVSzX1QVDNgqhOyKG8fF6Nx///nLeHLCKNAoyxjpGzX6uZFPwWUxXu
	Z2TzYBerLFKJvG3kV7GZKCF5YSK/hHFL3FmU4iA7HTosICdGUiiBSq5htmebQl+k9p+d
	ABXNqOi2XBcleXzZacLEZtyMNhXGq3ZBGeqPBEPkY8r0G7gLpLvzWCJhItFxWCFN6vRU
	dSXz1ORdqp6ANefljQF+dfY9HGCgzPWy9pwAHXJqDW6a27NMUc2Uip5hG/K9J7siY+aN
	OQA5m63wxmORzb4QHp9QKhpqnW3ckuOzycwMSlLd9SUm1FuOX02RxLHATrCkEsL3NDdm
	LF3A==
X-Received: by 10.68.178.161 with SMTP id cz1mr3495927pbc.27.1368423756242;
	Sun, 12 May 2013 22:42:36 -0700 (PDT)
Received: from norse.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	aj6sm12620928pbd.14.2013.05.12.22.42.34 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 22:42:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 22:42:22 -0700
Message-Id: <a5c9cc4750706a0a84751170a0f10ce9e4f07f0d.1368423406.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1368423406.git.raj.khem@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] runqemu: Replace use of ifconfig with ip
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
X-List-Received-Date: Mon, 13 May 2013 06:01:25 -0000

ifconfig and its ilk (net-tools package) is deprecated in favour of iproute2 package
and is now removed by many distro's e.g. Archlinux. So we replace ifconfig with ip utility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-gen-tapdevs | 6 +++---
 scripts/runqemu-ifup        | 6 +++---
 scripts/runqemu-internal    | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index f5be30a..d3b27be 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -59,10 +59,10 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 	exit 1
 fi
 
-IFCONFIG=`which ifconfig 2> /dev/null`
+IFCONFIG=`which ip 2> /dev/null`
 if [ -z "$IFCONFIG" ]; then
 	# Is it ever anywhere else?
-	IFCONFIG=/sbin/ifconfig
+	IFCONFIG=/sbin/ip
 fi
 if [ ! -x "$IFCONFIG" ]; then
        echo "$IFCONFIG cannot be executed"
@@ -70,7 +70,7 @@ if [ ! -x "$IFCONFIG" ]; then
 fi
 
 # Ensure we start with a clean slate
-for tap in `$IFCONFIG | grep ^tap | awk '{ print \$1 }' | sed s/://`; do
+for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`; do
 	echo "Note: Destroying pre-existing tap interface $tap..."
 	$TUNCTL -d $tap
 done
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 0926faf..8948153 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -70,10 +70,10 @@ if [ $STATUS -ne 0 ]; then
 	fi
 fi
 
-IFCONFIG=`which ifconfig 2> /dev/null`
+IFCONFIG=`which ip 2> /dev/null`
 if [ "x$IFCONFIG" = "x" ]; then
 	# better than nothing...
-	IFCONFIG=/sbin/ifconfig
+	IFCONFIG=/sbin/ip
 fi
 if [ ! -x "$IFCONFIG" ]; then
 	echo "$IFCONFIG cannot be executed"
@@ -100,7 +100,7 @@ if [ ! -x "$IPTABLES" ]; then
 fi
 
 n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-$IFCONFIG $TAP 192.168.7.$n netmask 255.255.255.255
+$IFCONFIG addr add 192.168.7.$n/32 dev $TAP
 
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
 $ROUTE add -host 192.168.7.$dest $TAP
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 3bd0a09..3c5282d 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -139,16 +139,16 @@ if [ ! -d "$LOCKDIR" ]; then
     chmod 777 $LOCKDIR
 fi
 
-IFCONFIG=`which ifconfig 2> /dev/null`
+IFCONFIG=`which ip 2> /dev/null`
 if [ -z "$IFCONFIG" ]; then
-    IFCONFIG=/sbin/ifconfig
+    IFCONFIG=/sbin/ip
 fi
 if [ ! -x "$IFCONFIG" ]; then
        echo "$IFCONFIG cannot be executed"
        exit 1
 fi
 
-POSSIBLE=`$IFCONFIG -a | grep '^tap' | awk '{print $1}' | sed s/://`
+POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed s/://`
 TAP=""
 LOCKFILE=""
 for tap in $POSSIBLE; do
-- 
1.8.2.1



