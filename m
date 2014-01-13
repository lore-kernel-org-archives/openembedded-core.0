Return-Path: <nathan.rossi@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe002.messaging.microsoft.com [213.199.154.205])
	by mail.openembedded.org (Postfix) with ESMTP id C7B536BFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 08:34:19 +0000 (UTC)
Received: from mail100-am1-R.bigfish.com (10.3.201.236) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Mon, 13 Jan 2014 08:34:19 +0000
Received: from mail100-am1 (localhost [127.0.0.1])	by
	mail100-am1-R.bigfish.com (Postfix) with ESMTP id 1CCA63602D9	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 08:34:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh2327h2336h2438h2461h906i1155h)
Received-SPF: pass (mail100-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail100-am1 (localhost.localdomain [127.0.0.1]) by mail100-am1
	(MessageSwitch) id 1389602054165188_19237;
	Mon, 13 Jan 2014 08:34:14 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.244])	by
	mail100-am1.bigfish.com (Postfix) with ESMTP id C03F5240049	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 08:34:13 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server id 14.16.227.3;
	Mon, 13 Jan 2014 08:34:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1W2cyI-0005kd-Pm	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jan 2014 00:34:10 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 18:33:39 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <2bba5e79-d06e-4b11-98ab-59506c84f896@AM1EHSMHS006.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] kernel.bbclass: Fix empty modules directory QA issue
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
X-List-Received-Date: Mon, 13 Jan 2014 08:34:20 -0000
Content-Type: text/plain

If a kernel is built without any external modules (aka no CONFIG_*=m),
then during a modules_install of the kernel an empty directory is
created at /lib/modules/${KERNEL_VERIONS}/kernel. This is behaviour of
the kernel infrastructure, the directory would normally be populated
with the modules that were built.

However because of the expectations of kernel-modules-split, no packages
are created when there are no modules and an empty directory lingers.
This raises QA issues as warning or errors (depending on the distro).

The following patch changes the kernel_do_install task to check if the
directory is empty and if so removes it.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/kernel.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5fef446..6b4e992 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -183,6 +183,10 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
+		# If the kernel/ directory is empty remove it to prevent QA issues
+		if [ ! "$(ls -A "${D}/lib/modules/${KERNEL_VERSION}/kernel")" ]; then
+			rm -r "${D}/lib/modules/${KERNEL_VERSION}/kernel"
+		fi
 	else
 		bbnote "no modules to install"
 	fi
-- 
1.7.9.5



