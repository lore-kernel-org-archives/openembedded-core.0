Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0248.outbound.messaging.microsoft.com [213.199.154.248])
	by mail.openembedded.org (Postfix) with ESMTP id EA48E6D44C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 03:40:58 +0000 (UTC)
Received: from mail82-db9-R.bigfish.com (10.174.16.253) by
	DB9EHSOBE013.bigfish.com (10.174.14.76) with Microsoft SMTP Server id
	14.1.225.22; Tue, 12 Nov 2013 03:41:00 +0000
Received: from mail82-db9 (localhost [127.0.0.1])	by mail82-db9-R.bigfish.com
	(Postfix) with ESMTP id 0DEC14E04D2	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 03:41:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail82-db9 (localhost.localdomain [127.0.0.1]) by mail82-db9
	(MessageSwitch) id 138422765846917_32534;
	Tue, 12 Nov 2013 03:40:58 +0000 (UTC)
Received: from DB9EHSMHS011.bigfish.com (unknown [10.174.16.243])	by
	mail82-db9.bigfish.com (Postfix) with ESMTP id 075F23001E9	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 03:40:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS011.bigfish.com
	(10.174.14.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 12 Nov 2013 03:40:56 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 12 Nov 2013 03:40:55 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rAC3eqme029846;	Mon, 11 Nov 2013 20:40:53 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 11:40:49 +0800
Message-ID: <1384227649-1334-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
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
X-List-Received-Date: Tue, 12 Nov 2013 03:41:00 -0000
Content-Type: text/plain

      *PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
       prevents 64-bit userland from seeing this definition, instead defaulting
       to u64 == long in userspace.

      *fix the below error
       |super-ddf.c:4542:5: error: format '%llu' expects argument of type 'long long unsigned int',
       |but argument 5 has type '__u64' [-Werror=format=]
       |dprintf("BVD %u has %08x at %llu\n", 0,

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-extended/mdadm/mdadm_3.3.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
index 586e04a..41816bc 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -26,6 +26,11 @@ do_configure_prepend () {
 }
 
 EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
+# PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
+# prevents 64-bit userland from seeing this definition, instead defaulting
+# to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
+# int-ll64.h included
+EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
 	oe_runmake
-- 
1.7.5.4



