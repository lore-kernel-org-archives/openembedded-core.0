Return-Path: <B28495@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by mail.openembedded.org (Postfix) with ESMTP id D5B6F61A45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 09:45:16 +0000 (UTC)
Received: from mail29-db8-R.bigfish.com (10.174.8.242) by
	DB8EHSOBE038.bigfish.com (10.174.4.101) with Microsoft SMTP Server id
	14.1.225.23; Wed, 3 Jul 2013 09:45:16 +0000
Received: from mail29-db8 (localhost [127.0.0.1])	by mail29-db8-R.bigfish.com
	(Postfix) with ESMTP id 0801D12C004B	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 09:45:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail29-db8 (localhost.localdomain [127.0.0.1]) by mail29-db8
	(MessageSwitch) id 1372844715363677_13258;
	Wed,  3 Jul 2013 09:45:15 +0000 (UTC)
Received: from DB8EHSMHS030.bigfish.com (unknown [10.174.8.235])	by
	mail29-db8.bigfish.com (Postfix) with ESMTP id 5475B1EC0046	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 09:45:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS030.bigfish.com
	(10.174.4.40) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 3 Jul 2013 09:45:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 3 Jul 2013 09:45:13 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r639jACh031806;
	Wed, 3 Jul 2013 02:45:11 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2013 17:45:10 +0800
Message-ID: <1372844710-15122-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies
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
X-List-Received-Date: Wed, 03 Jul 2013 09:45:17 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Move to using the PACKAGECONFIG mechanism to select configure options
and dependencies. Without this the system will attempt to discover
various dependencies, and sometimes does so incorrectly.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7caef6e..8be3890 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -84,6 +84,8 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
+PACKAGECONFIG[libaio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
-- 
1.7.3.4



