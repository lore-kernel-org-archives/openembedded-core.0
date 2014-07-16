Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0139.outbound.protection.outlook.com [207.46.163.139])
	by mail.openembedded.org (Postfix) with ESMTP id 28DA865C94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:53:15 +0000 (UTC)
Received: from BLUPR03CA033.namprd03.prod.outlook.com (10.141.30.26) by
	BN1PR03MB155.namprd03.prod.outlook.com (10.255.201.24) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 09:37:19 +0000
Received: from BY2FFO11FD042.protection.gbl (2a01:111:f400:7c0c::136) by
	BLUPR03CA033.outlook.office365.com (2a01:111:e400:879::26) with
	Microsoft SMTP Server (TLS) id 15.0.995.11 via Frontend Transport;
	Wed, 16 Jul 2014 09:37:19 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD042.mail.protection.outlook.com (10.1.14.227) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 09:37:19 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G9bE65031022;
	Wed, 16 Jul 2014 02:37:17 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 17:38:11 +0800
Message-ID: <1405503492-27938-2-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1405503492-27938-1-git-send-email-ting.liu@freescale.com>
References: <1405503492-27938-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(229853001)(50226001)(47776003)(106466001)(81156004)(50466002)(4396001)(48376002)(26826002)(76176999)(102836001)(93916002)(50986999)(64706001)(80022001)(92566001)(2351001)(76482001)(21056001)(575784001)(86362001)(77982001)(107046002)(86152002)(33646002)(92726001)(97736001)(46102001)(62966002)(20776003)(110136001)(89996001)(85852003)(79102001)(99396002)(87286001)(81542001)(85306003)(81342001)(83072002)(84676001)(104166001)(77156001)(88136002)(87936001)(95666004)(36756003)(69596002)(44976005)(83322001)(31966008)(74662001)(19580405001)(19580395003)(68736004)(74502001)(105606002)(104016003)(6806004);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB155;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0274272F87
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/3] strace: fix 64 bit process detection
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
X-List-Received-Date: Wed, 16 Jul 2014 09:53:24 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../strace-fix-64-bit-process-detection.patch      |   34 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.8.bb         |    1 +
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch

diff --git a/meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch b/meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
new file mode 100644
index 0000000..a6579df
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
@@ -0,0 +1,34 @@
+powerpc64: fix 64-bit process detection on embedded
+
+* syscall.c (get_scno) [POWERPC64]: Fix 64-bit process detection
+on embedded powerpc.
+
+Upstream-Status: Backport
+
+Signed-off-by: James Yang <james.yang@freescale.com>
+Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
+
+diff --git a/syscall.c.orig b/syscall.c
+index 7efee0e..72d9453 100644
+--- a/syscall.c.orig
++++ b/syscall.c
+@@ -1207,11 +1207,14 @@ get_scno(struct tcb *tcp)
+ 	/* Check for 64/32 bit mode. */
+ 	if (upeek(tcp, sizeof(unsigned long)*PT_MSR, &val) < 0)
+ 		return -1;
+-	/* SF is bit 0 of MSR */
+-	if (val < 0)
+-		currpers = 0;
+-	else
+-		currpers = 1;
++
++	/*
++	 * Check for 64/32 bit mode.
++	 * Embedded implementations covered by Book E extension of PPC use
++	 * bit 0 (CM) of 32-bit Machine state register (MSR).
++	 * Other implementations use bit 0 (SF) of 64-bit MSR.
++	 */
++	currpers = (val & 0x8000000080000000) ? 0 : 1;
+ 	update_personality(tcp, currpers);
+ # endif
+ #elif defined(AVR32)
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index 71563d4..d954c37 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://git-version-gen \
            file://strace-add-configure-options.patch \
            file://Makefile-ptest.patch \
+           file://strace-fix-64-bit-process-detection.patch \
            file://run-ptest \
           "
 
-- 
1.7.3.4


