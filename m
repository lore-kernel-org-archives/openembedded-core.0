Return-Path: <nathan.rossi@xilinx.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe005.messaging.microsoft.com [65.55.88.15])
	by mail.openembedded.org (Postfix) with ESMTP id 89CE96C963
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 07:06:01 +0000 (UTC)
Received: from mail114-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Wed, 8 Jan 2014 07:06:01 +0000
Received: from mail114-tx2 (localhost [127.0.0.1])	by
	mail114-tx2-R.bigfish.com (Postfix) with ESMTP id 897903E00DC	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 07:06:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh2327h2336h906i1155h)
Received-SPF: pass (mail114-tx2: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail114-tx2 (localhost.localdomain [127.0.0.1]) by mail114-tx2
	(MessageSwitch) id 1389164759181537_23852;
	Wed,  8 Jan 2014 07:05:59 +0000 (UTC)
Received: from TX2EHSMHS014.bigfish.com (unknown [10.9.14.229])	by
	mail114-tx2.bigfish.com (Postfix) with ESMTP id 255B03C004A	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 07:05:59 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by TX2EHSMHS014.bigfish.com
	(10.9.99.114) with Microsoft SMTP Server id 14.16.227.3; Wed, 8 Jan 2014
	07:05:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1W0nDC-00009O-Lq	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jan 2014 23:05:58 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jan 2014 17:05:27 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <d7cb4e9a-2926-44a2-b789-a31612162a44@TX2EHSMHS014.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] ptest.bblass: Fix package QA issues when disabled
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
X-List-Received-Date: Wed, 08 Jan 2014 07:06:01 -0000
Content-Type: text/plain

When the ptest distro feature is disabled, a ptest directory is still
created in the install phase, This directory is not cleaned up or
consumed by any package and will throw a QA error, e.g.

ERROR: QA Issue: glib-2.0: Files/directories were installed but not
shipped
  /usr/lib/glib-2.0/ptest
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

This is caused by the do_install_ptest_base[cleandirs] task flag which
is not setup to be conditional on ptest being enabled. This patch
changes the task flag to emit the cleandirs path only when the ptest
distro feature is enabled.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/ptest.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index ec10f80..3450085 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -49,7 +49,7 @@ do_install_ptest_base() {
     fi
 }
 
-do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
+do_install_ptest_base[cleandirs] = "${@['', '${D}${PTEST_PATH}'][(d.getVar('PTEST_ENABLED', True) or '') == '1']}"
 
 addtask configure_ptest_base after do_configure before do_compile
 addtask compile_ptest_base   after do_compile   before do_install
-- 
1.7.9.5



