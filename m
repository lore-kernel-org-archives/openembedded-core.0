Return-Path: <emil.sjolin@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE256E8E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 05:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A1356180AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 06:24:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id S3Ga9FIgHA7V
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 06:24:46 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 8500118088
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 06:24:46 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 63E8ECEC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 06:24:46 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 55D02CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 06:24:46 +0100 (CET)
Received: from lnxemilsn.se.axis.com (lnxemilsn.se.axis.com [10.92.35.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 53FDF34005;
	Tue,  4 Mar 2014 06:24:46 +0100 (CET)
Received: by lnxemilsn.se.axis.com (Postfix, from userid 21110)
	id 477C992061; Tue,  4 Mar 2014 06:24:46 +0100 (CET)
From: =?UTF-8?q?Emil=20Sj=C3=B6lin?= <emil.sjolin@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 06:24:43 +0100
Message-Id: <1393910683-7222-1-git-send-email-emilsn@axis.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [dora][PATCH] iproute2: de-bash its scripts to remove the bash dependency
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
X-List-Received-Date: Tue, 04 Mar 2014 05:24:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If we build a minimal image with iproute2 installed, the following
error will appear during rootfs.

error: Can't install iproute2-3.10.0-r0.0@i586: no package provides /bin/bash

The problem is that iproute2 has an implicit dependency on 'bash'.
This dependency is from per-file dependency checking.

Patch two scripts, ifcfg and rtpr, from iproute2 to remove the bash
specific syntax.

NOTE: This fix is taken from master branch
(SHA1 ID: 1132c4210eddd59b22b2640935ab0bb8f48c0124) and applied on dora.

Signed-off-by: Emil Sjölin <emilsn@axis.com>
---
 .../iproute2/0001-iproute2-de-bash-scripts.patch   |   64 ++++++++++++++++++++
 .../iproute2/iproute2_3.10.0.bb                    |    1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
new file mode 100644
index 0000000..39c7d40
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
@@ -0,0 +1,64 @@
+Subject: [PATCH] iproute2: de-bash scripts
+
+de-bash these two scripts to make iproute2 not depend on bash.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ ip/ifcfg |   15 ++++++++-------
+ ip/rtpr  |    2 +-
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/ip/ifcfg b/ip/ifcfg
+index 083d9df..60bcf1f 100644
+--- a/ip/ifcfg
++++ b/ip/ifcfg
+@@ -1,12 +1,13 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ CheckForwarding () {
+-  local sbase fwd
++  local sbase fwd forwarding
+   sbase=/proc/sys/net/ipv4/conf
+   fwd=0
+   if [ -d $sbase ]; then
+     for dir in $sbase/*/forwarding; do
+-      fwd=$[$fwd + `cat $dir`]
++      forwarding=`cat $dir`
++      fwd=$(($fwd+$forwarding))
+     done
+   else
+     fwd=2
+@@ -127,12 +128,12 @@ fi
+ arping -q -A -c 1 -I $dev $ipaddr
+ noarp=$?
+ ( sleep 2 ;
+-  arping -q -U -c 1 -I $dev $ipaddr ) >& /dev/null </dev/null &
++  arping -q -U -c 1 -I $dev $ipaddr ) > /dev/null 2>&1 </dev/null &
+ 
+-ip route add unreachable 224.0.0.0/24 >& /dev/null
+-ip route add unreachable 255.255.255.255 >& /dev/null
++ip route add unreachable 224.0.0.0/24 > /dev/null 2>&1
++ip route add unreachable 255.255.255.255 > /dev/null 2>&1
+ if [ `ip link ls $dev | grep -c MULTICAST` -ge 1 ]; then
+-  ip route add 224.0.0.0/4 dev $dev scope global >& /dev/null
++  ip route add 224.0.0.0/4 dev $dev scope global > /dev/null 2>&1
+ fi
+ 
+ if [ $fwd -eq 0 ]; then
+diff --git a/ip/rtpr b/ip/rtpr
+index c3629fd..674198d 100644
+--- a/ip/rtpr
++++ b/ip/rtpr
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ exec tr "[\\\\]" "[
+ ]"
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
index 2220467..721fa55 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
@@ -2,6 +2,7 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch \
+           file://0001-iproute2-de-bash-scripts.patch \
           "
 
 SRC_URI[md5sum] = "45fb5427fc723a0001c72b92c931ba02"
-- 
1.7.10.4


