Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0244.outbound.protection.outlook.com [207.46.163.244])
	by mail.openembedded.org (Postfix) with ESMTP id AD94170332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:35:05 +0000 (UTC)
Received: from BY2PR03CA070.namprd03.prod.outlook.com (10.141.249.43) by
	BL2PR03MB147.namprd03.prod.outlook.com (10.255.230.19) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 10:35:05 +0000
Received: from BN1BFFO11FD035.protection.gbl (2a01:111:f400:7c10::1:104) by
	BY2PR03CA070.outlook.office365.com (2a01:111:e400:2c5d::43) with
	Microsoft
	SMTP Server (TLS) id 15.0.985.8 via Frontend Transport; Wed, 16 Jul 2014
	10:35:04 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD035.mail.protection.outlook.com (10.58.144.98) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 10:35:04 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6GAZ0BL019065; Wed, 16 Jul 2014 03:35:02 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 18:35:58 +0800
Message-ID: <1405506958-29789-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(105606002)(80022001)(87936001)(102836001)(81542001)(85306003)(106466001)(68736004)(74662001)(92726001)(31966008)(46102001)(85852003)(50466002)(79102001)(6806004)(36756003)(77982001)(104016003)(92566001)(83072002)(88136002)(97736001)(33646002)(74502001)(86152002)(50226001)(20776003)(76482001)(89996001)(81342001)(26826002)(19580405001)(47776003)(93916002)(110136001)(99396002)(50986999)(77156001)(4396001)(21056001)(19580395003)(83322001)(48376002)(64706001)(104166001)(84676001)(2351001)(44976005)(62966002)(86362001)(95666004)(87286001)(229853001)(107046002);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB147;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0274272F87
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] gcc: update *LIBC_* linker relocation reglex
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
X-List-Received-Date: Wed, 16 Jul 2014 10:35:12 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

* GLIBC_DYNAMIC_LINKER64 reglex does not work for rs6000/linux64.h,
  update it.
* it turns out that UCLIBC_DYNAMIC_LINKER reglex will strip the 32/64
  chars from UCLIBC_DYNAMIC_LINKER64/UCLIBC_DYNAMIC_LINKER32, add '\b'.
  my two PCs: Centos 6.5 (python 2.7.5) and Fedora 13 (python 2.7.3)

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 81d664a..acea6d8 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -88,8 +88,10 @@ python gcc_multilib_setup() {
                 substs = [
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdir32) + r'\3'),
-                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(\S+)(\s*\"\S+\")$',
                         r'\1' + wrap_libdir(libdir64) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*\"\S+\"\s*)(\S+)(\s*\"\S+\"\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir64) + r'\3' + wrap_libdir(libdir64) + r'\5'),
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdirx32) + r'\3'),
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
@@ -100,7 +102,7 @@ python gcc_multilib_setup() {
                         r'\1' + wrap_libdir(libdir64) + r'\3'),
                     (r'^(#define\s*UCLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdirn32) + r'\3'),
-                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKER\s*)(\S+)(\s*\".*\")$',
+                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdir32) + r'\3'),
                 ]
 
-- 
1.7.3.4


