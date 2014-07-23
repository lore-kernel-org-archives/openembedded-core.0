Return-Path: <ting.liu@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0210.outbound.protection.outlook.com [207.46.163.210])
	by mail.openembedded.org (Postfix) with ESMTP id E837E707F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 04:01:57 +0000 (UTC)
Received: from CH1PR03CA009.namprd03.prod.outlook.com (10.255.156.154) by
	BL2PR03MB145.namprd03.prod.outlook.com (10.255.230.13) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Wed, 23 Jul 2014 04:01:57 +0000
Received: from BN1AFFO11FD039.protection.gbl (10.255.156.132) by
	CH1PR03CA009.outlook.office365.com (10.255.156.154) with Microsoft SMTP
	Server (TLS) id 15.0.990.7 via Frontend Transport;
	Wed, 23 Jul 2014 04:01:56 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD039.mail.protection.outlook.com (10.58.52.243) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 23 Jul 2014 04:01:56 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6N41r3T017726;
	Tue, 22 Jul 2014 21:01:54 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 11:58:56 +0800
Message-ID: <1406087937-32112-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(85306003)(4396001)(50226001)(106466001)(83072002)(105606002)(81156004)(50466002)(48376002)(46102001)(95666004)(76482001)(104016003)(77982001)(62966002)(107046002)(36756003)(110136001)(229853001)(83322001)(85852003)(77156001)(86152002)(79102001)(102836001)(92726001)(2351001)(44976005)(92566001)(19580395003)(68736004)(31966008)(104166001)(87286001)(81342001)(88136002)(74662001)(81542001)(20776003)(84676001)(97736001)(74502001)(87936001)(80022001)(64706001)(99396002)(33646002)(47776003)(26826002)(19580405001)(93916002)(21056001)(69596002)(6806004)(86362001)(50986999)(89996001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB145;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 028166BF91
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] perf: remove CFLAGS override
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
X-List-Received-Date: Wed, 23 Jul 2014 04:02:04 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

definition of __SANE_USERSPACE_TYPES__ was added in kernel source by
commit e3541ec75219819d3235f80125a1a75d798ff6e1
perf tools, powerpc: Fix compile warnings in tests/attr.c

Overriding the CFLAGS makes it impossible for kernel build system to
append to it, thus making the build fail in various ways as:

|     CC /.../perf/1.0-r9/perf-1.0/perf.o
| In file included from builtin.h:4:0,
|                  from perf.c:9:
| util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
|  #include <lk/debugfs.h>
|                         ^
| compilation terminated.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 20968f9..222ae83 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -92,13 +92,6 @@ EXTRA_OEMAKE += "\
 	'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
-# PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
-# prevents 64-bit userland from seeing this definition, instead defaulting
-# to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get 
-# int-ll64.h included. And MIPS64 has the same issue.
-EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
-EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
-
 PARALLEL_MAKE = ""
 
 do_compile() {
-- 
1.8.3.2


