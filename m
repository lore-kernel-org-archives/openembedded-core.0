Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D5BCB6D42C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:20:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA18K7gj010854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 01:20:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 1 Nov 2013 01:20:06 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Nov 2013 16:21:06 +0800
Message-ID: <c9a7f972bb491f955880caccb4a19b8523c60756.1383294017.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383294017.git.Qi.Chen@windriver.com>
References: <cover.1383294017.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] iproute2: de-bash its scripts to remove the bash dependency
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
X-List-Received-Date: Fri, 01 Nov 2013 08:20:05 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

If we build a minimal image with iproute2 installed, the following
error will appear during rootfs.

error: Can't install iproute2-3.10.0-r0.0@i586: no package provides /bin/bash

The problem is that iproute2 has an implicit dependency on 'bash'.
This dependency is from per-file dependency checking.

Patch two scripts, ifcfg and rtpr, from iproute2 to remove the bash
specific syntax.

[YOCTO #5415]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../iproute2/0001-iproute2-de-bash-scripts.patch   |   64 ++++++++++++++++++++
 .../iproute2/iproute2_3.11.0.bb                    |    1 +
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
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
index 98f5a80..469b2b0 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
@@ -2,6 +2,7 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch \
+           file://0001-iproute2-de-bash-scripts.patch \
           "
 
 SRC_URI[md5sum] = "d7ffb27bc9f0d80577b1f3fb9d1a7689"
-- 
1.7.9.5


