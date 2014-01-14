Return-Path: <nathan.rossi@xilinx.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0248.outbound.messaging.microsoft.com [213.199.154.248])
	by mail.openembedded.org (Postfix) with ESMTP id 666076B880
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 01:21:15 +0000 (UTC)
Received: from mail190-db9-R.bigfish.com (10.174.16.250) by
	DB9EHSOBE029.bigfish.com (10.174.14.92) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 01:21:14 +0000
Received: from mail190-db9 (localhost [127.0.0.1])	by
	mail190-db9-R.bigfish.com (Postfix) with ESMTP id BC6401600D0;
	Tue, 14 Jan 2014 01:21:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh2327h2336h2438h2461h906i1155h)
Received-SPF: pass (mail190-db9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail190-db9 (localhost.localdomain [127.0.0.1]) by mail190-db9
	(MessageSwitch) id 1389662472853105_16749;
	Tue, 14 Jan 2014 01:21:12 +0000 (UTC)
Received: from DB9EHSMHS025.bigfish.com (unknown [10.174.16.252])	by
	mail190-db9.bigfish.com (Postfix) with ESMTP id CC2E42E0047;
	Tue, 14 Jan 2014 01:21:12 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by DB9EHSMHS025.bigfish.com
	(10.174.14.35) with Microsoft SMTP Server id 14.16.227.3;
	Tue, 14 Jan 2014 01:21:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1W2sgp-00040b-Ly; Mon, 13 Jan 2014 17:21:11 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 11:21:00 +1000
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2bba5e79-d06e-4b11-98ab-59506c84f896@AM1EHSMHS006.ehs.local>
References: <2bba5e79-d06e-4b11-98ab-59506c84f896@AM1EHSMHS006.ehs.local>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <4f28e147-551b-4e20-992a-2e0f17ae5c99@DB9EHSMHS025.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH v2] kernel.bbclass: Fix empty modules directory QA issue
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
X-List-Received-Date: Tue, 14 Jan 2014 01:21:16 -0000
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
 meta/classes/kernel.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5fef446..f4dcba5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -183,6 +183,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
+		# If the kernel/ directory is empty remove it to prevent QA issues
+		rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}/kernel"
 	else
 		bbnote "no modules to install"
 	fi
-- 
1.7.9.5



