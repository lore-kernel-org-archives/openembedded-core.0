Return-Path: <B40290@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0189.outbound.messaging.microsoft.com [213.199.154.189])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5966CB8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 03:06:42 +0000 (UTC)
Received: from mail207-db8-R.bigfish.com (10.174.8.251) by
	DB8EHSOBE030.bigfish.com (10.174.4.93) with Microsoft SMTP Server id
	14.1.225.22; Fri, 27 Sep 2013 03:06:42 +0000
Received: from mail207-db8 (localhost [127.0.0.1])	by
	mail207-db8-R.bigfish.com (Postfix) with ESMTP id C18374C0439	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 03:06:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 11
X-BigFish: VS11(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h4a8s1155h)
Received: from mail207-db8 (localhost.localdomain [127.0.0.1]) by mail207-db8
	(MessageSwitch) id 1380251200482881_16160;
	Fri, 27 Sep 2013 03:06:40 +0000 (UTC)
Received: from DB8EHSMHS023.bigfish.com (unknown [10.174.8.252])	by
	mail207-db8.bigfish.com (Postfix) with ESMTP id 69AD51E0031	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 03:06:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS023.bigfish.com
	(10.174.4.33) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 27 Sep 2013 03:06:40 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 27 Sep 2013 03:06:38 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r8R36ZGp000517;	Thu, 26 Sep 2013 20:06:36 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2013 11:06:29 +0800
Message-ID: <1380251189-21193-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <y>
References: <y>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] perf : fix perf of cross-compile for PowerPC 64bit targets
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
X-List-Received-Date: Fri, 27 Sep 2013 03:06:42 -0000
Content-Type: text/plain

    *fix perf build issue on powerpc 64bit targets
    |error information:
    | tests/attr.c: In function 'store_event':
    | tests/attr.c:71:4: error: format '%llu' expects argument of type 'long long unsigned int',
    | but argument 6 has type '__u64' [-Werror=format=]
    | attr->type, attr->config, fd);

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-kernel/perf/perf.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 269069f..fa6b8b9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -77,6 +77,7 @@ EXTRA_OEMAKE = \
 		'
 
 EXTRA_OEMAKE += "\
+	'CFLAGS=${CFLAGS} -fPIC' \
 	'prefix=${prefix}' \
 	'bindir=${bindir}' \
 	'sharedir=${datadir}' \
-- 
1.7.5.4



