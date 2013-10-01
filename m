Return-Path: <nathan.rossi@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe004.messaging.microsoft.com [213.199.154.207])
	by mail.openembedded.org (Postfix) with ESMTP id E6B1B6B109
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 04:20:39 +0000 (UTC)
Received: from mail74-am1-R.bigfish.com (10.3.201.238) by
	AM1EHSOBE027.bigfish.com (10.3.207.149) with Microsoft SMTP Server id
	14.1.225.22; Tue, 1 Oct 2013 04:20:40 +0000
Received: from mail74-am1 (localhost [127.0.0.1])	by mail74-am1-R.bigfish.com
	(Postfix) with ESMTP id B60A21001A5	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 04:20:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h906i1155h192ch)
Received-SPF: pass (mail74-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail74-am1 (localhost.localdomain [127.0.0.1]) by mail74-am1
	(MessageSwitch) id 1380601238868383_20582;
	Tue,  1 Oct 2013 04:20:38 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.244])	by
	mail74-am1.bigfish.com (Postfix) with ESMTP id D03EC4A0251	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 04:20:38 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server id 14.16.227.3;
	Tue, 1 Oct 2013 04:20:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id 1VQrRt-0001QL-Qx	for
	openembedded-core@lists.openembedded.org;
	Mon, 30 Sep 2013 21:20:37 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Oct 2013 14:19:42 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <50768585-372c-4a0f-bc4a-16bf7eb4675c@AM1EHSMHS002.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] linux-dummy.bb: Resolve missing task issues
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
X-List-Received-Date: Tue, 01 Oct 2013 04:20:41 -0000
Content-Type: text/plain

Commit 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a added additional
initramfs functionality and created an additional task on kernel.bbclass
Adding this task was missed on the linux-dummy recipe, which causes task
dependency issues due to image.bbclass depending on
"virtual/kernel:do_bundle_initramfs". This change adds a dummy task
which resolves the dependency issue.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
This issue affects both master and the dora branch.
---
 meta/recipes-kernel/linux/linux-dummy.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index a98a0f1..8a211da 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -27,3 +27,10 @@ do_compile () {
 do_install() {
         :
 }
+
+do_bundle_initramfs() {
+        :
+}
+do_bundle_initramfs[nostamp] = "1"
+addtask bundle_initramfs after do_compile
+
-- 
1.7.9.5



