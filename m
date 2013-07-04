Return-Path: <B28495@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by mail.openembedded.org (Postfix) with ESMTP id B9DEB6007C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 01:59:47 +0000 (UTC)
Received: from mail140-db8-R.bigfish.com (10.174.8.229) by
	DB8EHSOBE013.bigfish.com (10.174.4.76) with Microsoft SMTP Server id
	14.1.225.22; Thu, 4 Jul 2013 01:59:47 +0000
Received: from mail140-db8 (localhost [127.0.0.1])	by
	mail140-db8-R.bigfish.com (Postfix) with ESMTP id A2B441C0281	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 01:59:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail140-db8 (localhost.localdomain [127.0.0.1]) by mail140-db8
	(MessageSwitch) id 1372903185916357_1502;
	Thu,  4 Jul 2013 01:59:45 +0000 (UTC)
Received: from DB8EHSMHS027.bigfish.com (unknown [10.174.8.243])	by
	mail140-db8.bigfish.com (Postfix) with ESMTP id DAC7B180049	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 01:59:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS027.bigfish.com
	(10.174.4.37) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 4 Jul 2013 01:59:42 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 4 Jul 2013 01:59:40 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r641xb6o029786;
	Wed, 3 Jul 2013 18:59:38 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2013 09:59:37 +0800
Message-ID: <1372903178-20708-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH v2] qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies
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
X-List-Received-Date: Thu, 04 Jul 2013 01:59:48 -0000
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
index 7caef6e..2d4a345 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -84,6 +84,8 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
+PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
-- 
1.7.3.4



