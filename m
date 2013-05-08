Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaAX7-000862-VE
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 22:00:23 +0200
Received: by mail-pb0-f52.google.com with SMTP id xa7so1453067pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=lF9xAxLZrwwJR7f4uFjePfL+ws6h9fCmOXSE/0rifho=;
	b=k/wRCqwwdecbR5Dg70LQonKcodgPvFqc8In2oCQHiXVnk3rbbexryDA6y9uGkvZXJK
	7xbJbdH7Mme2BNOymwS8R+Exss+h0jzJ3yBKxlLtO5FX+3bq4NUCkUL4FYfp7jGIbz9c
	H2Zco1ZPydWu9TgMCGMk80z8eCzT/HT+1CRYbFzFMnckKCYqg1lxC9h0LyCiBmozVRDA
	e9AWFxlN/ru53kSkacAcbfi9I9Xk84Hr8Dhj2UVfy84NfsUJlVFjwgech2hRVD2ZoTxh
	JHgZmeMrvJNBgfkF+Ecm0H0Y5wnKg71VG6rHNFUPadutcyr5AHdQxCEjqJTeMdhqILsm
	5ptA==
X-Received: by 10.68.255.130 with SMTP id aq2mr8914447pbd.164.1368042130521;
	Wed, 08 May 2013 12:42:10 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	wi6sm33746207pbc.22.2013.05.08.12.42.09 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 12:42:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 12:40:43 -0700
Message-Id: <1368042043-26561-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] runqemu: Replace use of ifconfig with ip
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
X-List-Received-Date: Wed, 08 May 2013 20:00:39 -0000

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
index f11706d..d295013 100755
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
1.8.2.2



