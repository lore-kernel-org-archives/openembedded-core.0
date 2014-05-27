Return-Path: <adrian.freihofer@neratec.com>
X-Greylist: delayed 396 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 10:29:30 UTC
Received: from mail.neratec.com (unknown [46.140.151.2])
	by mail.openembedded.org (Postfix) with ESMTP id C6C426FA6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 10:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id 7AE56928BFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 12:22:55 +0200 (CEST)
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id j77XqMeSVgaq; Tue, 27 May 2014 12:22:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id 9AD70928BFE;
	Tue, 27 May 2014 12:22:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at neratec.com
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pnn9DmhnXlcV; Tue, 27 May 2014 12:22:45 +0200 (CEST)
Received: from chl500346.localnet (chl500346.neratec.local [192.168.11.120])
	by mail.neratec.com (Postfix) with ESMTPS id 7B1E6928BFB;
	Tue, 27 May 2014 12:22:45 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@neratec.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 May 2014 12:22:45 +0200
Message-ID: <1634957.0tvEDlpPGg@chl500346>
Organization: Neratec Solutions AG
User-Agent: KMail/4.13 (Linux/3.13.0-24-generic; KDE/4.13.0; x86_64; ; )
MIME-Version: 1.0
Subject: [PATCH] runqemu-internal: add NIC to kernel parameters
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
X-List-Received-Date: Tue, 27 May 2014 10:29:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Fixes [YOCTO #6356]

Problem: If QEMU parameters are extended to emulate additional
network interfaces, NFS boot does not work. Example:
runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..."
This is solved by extending the kernel parameters by "::eth0:on"
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d317dfd..30d6514 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -249,7 +249,7 @@ else
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
 
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
+        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:on"
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$KVM_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-- 
1.9.1


