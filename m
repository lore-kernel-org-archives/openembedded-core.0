Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5D75975A67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:56:48 +0000 (UTC)
Received: by wiga1 with SMTP id a1so74387978wig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fYoqwUsoDppRjhUEYuzj/eLeOsOkhUErU9geus1vP0I=;
	b=dzgRLHHsxPT+Ceejia3HPxLrbtvsjldbyrgHfXt+Mbi03sGkP9qpWa5DXhaczeeGEB
	4q6F+9D7R+R+GttAFwJ7co6dd1C/WhT4ubyZri8/c8NSEtmR/WWLFYKVz7hCfytkZgTG
	3c35gU+EOtplDeK9CLp2/pyeLzIMYDHm7jsUI8ueFTFofEq2//ulcxrpe+Qvyr2w0b/x
	L3Lr9VoqHy4E4bg6RMMsbrl+YVJiPRU7xqx27sgoraKKuCA551t41BZwDeCwBXNyXB2D
	RE62tp13ZMdDrB2J++dgrJMJFz1mWkENOB2JGuEjtkc5nZvKT4jURizJr33PJ0KkzIuv
	ejUA==
X-Received: by 10.194.172.130 with SMTP id bc2mr40311553wjc.85.1434974209709; 
	Mon, 22 Jun 2015 04:56:49 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id q4sm30184358wju.14.2015.06.22.04.56.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 04:56:48 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 13:56:08 +0200
Message-Id: <1434974169-19875-3-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
References: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
Cc: paul.eggleton@linux.intel.com,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 2/3] runqemu: add support for multiple NICs
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
X-List-Received-Date: Mon, 22 Jun 2015 11:56:50 -0000

Fixes [YOCTO #6356]

Current runqemu script does not support qemu configurations with
more than one emulated NIC. If parameters for one or more
additional NICs are appended qemu ends up with an invalid
configuration.

Example to reproduce:
runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..."

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index bc2a355..ea2badc 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -256,7 +256,7 @@ else
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
 
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
+        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:off"
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$KVM_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-- 
2.4.3


