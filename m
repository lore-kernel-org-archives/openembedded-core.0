Return-Path: <nathan.rossi@xilinx.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe010.messaging.microsoft.com [216.32.180.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3B760017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 05:38:26 +0000 (UTC)
Received: from mail215-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE014.bigfish.com (10.7.40.64) with Microsoft SMTP Server id
	14.1.225.22; Fri, 21 Feb 2014 05:38:25 +0000
Received: from mail215-va3 (localhost [127.0.0.1])	by
	mail215-va3-R.bigfish.com (Postfix) with ESMTP id A1DC94C027F;
	Fri, 21 Feb 2014 05:38:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2fh95h839hc61hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh906i1155h)
Received-SPF: pass (mail215-va3: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail215-va3 (localhost.localdomain [127.0.0.1]) by mail215-va3
	(MessageSwitch) id 139296110359887_17490;
	Fri, 21 Feb 2014 05:38:23 +0000 (UTC)
Received: from VA3EHSMHS040.bigfish.com (unknown [10.7.14.238])	by
	mail215-va3.bigfish.com (Postfix) with ESMTP id 08F7160021B;
	Fri, 21 Feb 2014 05:38:23 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by VA3EHSMHS040.bigfish.com
	(10.7.99.50) with Microsoft SMTP Server id 14.16.227.3; Fri, 21 Feb 2014
	05:38:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1WGioX-0008Pq-Ps; Thu, 20 Feb 2014 21:38:21 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2014 15:37:31 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <98dd26f3-a46a-451d-a445-93e8b1862377@VA3EHSMHS040.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] kernel-yocto.bbclass: Force do_diffconfig depends to ${PN}
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
X-List-Received-Date: Fri, 21 Feb 2014 05:38:27 -0000
Content-Type: text/plain

Commit 07e59b5ff659bde6e6a60c4781c0a2deb406c667 added the task
dependency of 'virtual/kernel:do_kernel_configme' for the do_diffconfig
task. This dependency is only valid for linux recipes that inherit
kernel-yocto (e.g. linux-yocto), however due to virtual/kernel being a
virtual dependency it may not be providing a kernel which inherits
kernel-yocto in which case the do_kernel_configme task might not exist.

In the case where virtual/kernel is provided by a non kernel-yocto
recipe an error is thrown in relation to the dependency, e.g.

	ERROR: Task do_diffconfig in linux-yocto-tiny_3.8.bb depends
	upon non-existent task do_kernel_configme in linux.bb

Changing the dependency to use '${PN}:do_kernel_configme' forces the
dependency to only depend on the recipe which inherits
kernel-yocto.bbclass.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
This effects the linux-xlnx recipe in meta-xilinx, causing the above error to be
shown when building the linux-xlnx recipe with PREFERRED_PROVIDER_virtual/kernel
 = "linux-xlnx".

I am not sure if this change is entirely correct, there may be a reason for the
dependence on virtual/kernel that I am not aware of, In which case I have cc'd
all parties involved in the commit which added this dependency.

I did however do a test of the diffconfig feature with this dependency change
in place, no regressions are apparent with the linux-yocto recipe.
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fab5d4c..ad80621 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -412,4 +412,4 @@ OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
 GUILT_BASE = "meta"
 KBUILD_OUTPUT = "${B}"
 
-do_diffconfig[depends] += "virtual/kernel:do_kernel_configme"
+do_diffconfig[depends] += "${PN}:do_kernel_configme"
-- 
1.7.9.5



