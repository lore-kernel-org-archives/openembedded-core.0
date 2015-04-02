Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0070.outbound.protection.outlook.com [157.56.111.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFFB73CB9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 18:47:21 +0000 (UTC)
Received: from Ubuntu64.caveonetworks.com (111.93.218.67) by
	CY1PR0701MB1148.namprd07.prod.outlook.com (25.160.146.13) with
	Microsoft SMTP
	Server (TLS) id 15.1.125.19; Thu, 2 Apr 2015 18:47:19 +0000
From: "Krishnanjanappa, Jagadeesh"
	<jagadeesh.krishnanjanappa@caviumnetworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Apr 2015 00:17:07 +0530
Message-ID: <1428000427-31985-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BLUPR02CA057.namprd02.prod.outlook.com (25.160.23.175) To
	CY1PR0701MB1148.namprd07.prod.outlook.com (25.160.146.13)
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0701MB1148;
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(36756003)(42186005)(50466002)(575784001)(229853001)(47776003)(106356001)(2351001)(53416004)(86362001)(48376002)(62966003)(122386002)(87976001)(40100003)(46102003)(50986999)(50226001)(101416001)(110136001)(92566002)(19580405001)(77156002)(19580395003)(450100001)(33646002)(66066001)(7099025);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0701MB1148;
	H:Ubuntu64.caveonetworks.com; FPR:; SPF:None; MLV:ovrnspm;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Antispam-PRVS: <CY1PR0701MB1148B779D522D8AB2319EB7C8EF20@CY1PR0701MB1148.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:CY1PR0701MB1148; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0701MB1148; 
X-Forefront-PRVS: 0534947130
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2015 18:47:19.9892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0701MB1148
Subject: [PATCH] valgrind: Add INSANE_SKIP of arch for valgrind and valgrind-dbg
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
X-List-Received-Date: Thu, 02 Apr 2015 18:47:23 -0000
Content-Type: text/plain

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>

If a complier supports generating 32-bit and 64-bit binaries, then
while building valgrind we have two sets of binaries (32-bit and 64-bit)
being generated.

Example: With compiler supporting generation of both 32-bit and 64-bit
binaries, and building valgrind in 64-bit mode, we come across following
QA Issue (listing only few of them),

(snip)
ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_exp-sgcheck-x86-linux.so
ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/getoff-x86-linux
ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_core-x86-linux.so
ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_memcheck-x86-linux.so
-- CUT --

However, we can build only 64-bit or 32-bit binaries in valgrind using
"--enable-only64bit" and "--enable-only32bit" configure options respectively.
And the required configure option can be selected based on SITEINFO_BITS, but
feel that if a compiler supports generation of both type of binaries and it
may be useful for users to have/execute both type of binaries on multilib
environment. So choosing to pack both types of binaries and skip errors if the
architecture type are different using INSANE_SKIP.

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index bf80b16..eaa64c4 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -32,6 +32,8 @@ SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1d
 COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
+PR = "r1"
+
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
@@ -52,6 +54,13 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
 RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
 
+# skip checking of the Executable and Linkable Format (ELF) type, bit
+# size, and endianness of any binaries. If a compiler supports
+# generating 32-bit, 64-bit binaries, then we have two sets of 
+# binaries i.e 32-bit and 64-bit.
+INSANE_SKIP_${PN} += "arch"
+INSANE_SKIP_${PN}-dbg += "arch"
+
 do_compile_ptest() {
     oe_runmake check
 }
-- 
1.8.2.3


