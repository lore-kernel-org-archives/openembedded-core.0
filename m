Return-Path: <B28495@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe005.messaging.microsoft.com [216.32.180.31])
	by mail.openembedded.org (Postfix) with ESMTP id A2F776CDAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:11:52 +0000 (UTC)
Received: from mail130-va3-R.bigfish.com (10.7.14.225) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 11 Oct 2013 08:11:53 +0000
Received: from mail130-va3 (localhost [127.0.0.1])	by
	mail130-va3-R.bigfish.com (Postfix) with ESMTP id 736B24012D	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:11:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail130-va3 (localhost.localdomain [127.0.0.1]) by mail130-va3
	(MessageSwitch) id 1381479111240377_14033;
	Fri, 11 Oct 2013 08:11:51 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.232])	by
	mail130-va3.bigfish.com (Postfix) with ESMTP id 301532004F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:11:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 11 Oct 2013 08:11:51 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 11 Oct 2013 08:11:49 +0000
Received: from NETWORKudp177383uds.ap.freescale.net
	(udp144273uds.ap.freescale.net [10.193.20.27])	by
	tx30smr01.am.freescale.net
	(8.14.3/8.14.0) with ESMTP id r9B8Bl2A030874;
	Fri, 11 Oct 2013 01:11:48 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 16:11:44 +0800
Message-ID: <1381479105-21972-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 1/2] perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
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
X-List-Received-Date: Fri, 11 Oct 2013 08:11:53 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
prevents 64-bit userland from seeing this definition, instead defaulting
to u64 == long in userspace.
Perf want LL64, flag __SANE_USERSPACE_TYPES__ to get int-ll64.h.

Fix the below issue:
| tests/attr.c:71:4: error: format '%llu' expects argument of type 'long
long unsigned int', but argument 6 has type '__u64' [-Werror=format=]
| tests/attr.c:80:7: error: format '%llu' expects argument of type 'long
long unsigned int', but argument 4 has type '__u64' [-Werror=format=]
|        attr->type, attr->config, fd) < 0) {
|        ^

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-kernel/perf/perf.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 269069f..d27e535 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -89,6 +89,12 @@ EXTRA_OEMAKE += "\
 	'infodir=${@oe.path.relative(prefix, infodir)}' \
 "
 
+# PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
+# prevents 64-bit userland from seeing this definition, instead defaulting
+# to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get 
+# int-ll64.h included.
+EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
+
 PARALLEL_MAKE = ""
 
 do_compile() {
-- 
1.7.3.4



