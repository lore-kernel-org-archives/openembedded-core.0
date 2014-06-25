Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF2960CF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 20:24:58 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so8615379wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XZY8ZlXRC6HBhxQ04jqHm7WrMeDC8nP1zEkWDLT1dgY=;
	b=Lj/nRYOxXdic7uJB+lefwPhFrFMTSlEbjZnbRagttho6FnaLcOaH7V0dq2gvcNxZ4X
	pywWGTUS2+Jmqua03Snt0oR/zJKCyPOCQUv5DkuE4XfKpiizgfok9b3ra29fJ7Kw+Y8a
	Li7HXT+2dd8PfdX+3qKfntFsbPo3NiFv19a7pewGRil8h3C0UEXJ8vORQofJbGAXGCoX
	vlLTI/bLD7KZZJuXrg68LadF+fk+xW/WrroEFm8K2jZNY3pYgxT9c6oKyG2szVbqT520
	rFMHDaPX3agdDC/T90addlrPejZmhPPiCdnYFkC1s17yaF0Sx1qPInDQVYWq3W+PimRs
	Ew5w==
X-Received: by 10.180.84.7 with SMTP id u7mr22571985wiy.27.1403727896344;
	Wed, 25 Jun 2014 13:24:56 -0700 (PDT)
Received: from chl500346.homenetwork (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id i12sm9589617wjr.32.2014.06.25.13.24.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jun 2014 13:24:55 -0700 (PDT)
From: Adrian <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2014 22:24:09 +0200
Message-Id: <1403727849-2841-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] If QEMU parameters are extended to emulate additional network interfaces, NFS boot does not work. Based on the ip configuration provided by the runqemu-internal script the kernel is not able to use the right interface for the nfs mount.
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
X-List-Received-Date: Wed, 25 Jun 2014 20:25:02 -0000

From: Adrian Freihofer <adrian.freihofer@neratec.com>

Example to reproduce:
runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..."

If kernel parameters are extended to get the kernel forced to use
eth0 for the nfs rootfs another issue pops up. The script which creates
a special config for connman fails. It creates an invalid configuration
for connman which ends up in a nfs disconnection again.

[YOCTO #6356]

Signed-off-by: Adrian <adrian.freihofer@gmail.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb                  | 2 +-
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 2 +-
 scripts/runqemu-internal                                           | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index af72640..e69cfe3 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 SRC_URI_append_qemuall = "file://wired.config \
                           file://wired-setup \
                          "
-PR = "r2"
+PR = "r3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
index c46899e..c7b6dd1 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -3,7 +3,7 @@
 CONFIGF=/var/lib/connman/wired.config
 
 # Extract wired network config from /proc/cmdline
-NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^ ]*\):\([^ ]*\):\([^ ]*\):\([^ ]*\).*$/\1\/\4\/\3/p'`
+NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^:]*\):\([^:]*\):\([^:]*\):\([^:]*\).*$/\1\/\4\/\3/p'`
 
 # Check if eth0 is already set via kernel cmdline
 if [ "x$NET_CONF" = "x" ]; then
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 38745dd..7f33ee5 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -248,8 +248,7 @@ else
         n0=$(echo $TAP | sed 's/tap//')
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
-
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
+        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0:${MACHINE}:eth0:off"
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$KVM_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-- 
1.9.1


