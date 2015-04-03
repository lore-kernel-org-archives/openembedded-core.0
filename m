Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0088.outbound.protection.outlook.com [157.56.111.88])
	by mail.openembedded.org (Postfix) with ESMTP id 053777391D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 17:55:38 +0000 (UTC)
Received: from Ubuntu64.caveonetworks.com (111.93.218.67) by
	CY1PR0701MB1147.namprd07.prod.outlook.com (25.160.146.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.125.19; Fri, 3 Apr 2015 17:55:36 +0000
From: "Krishnanjanappa, Jagadeesh"
	<jagadeesh.krishnanjanappa@caviumnetworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Apr 2015 23:25:26 +0530
Message-ID: <1428083726-4168-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BLUPR07CA074.namprd07.prod.outlook.com (25.160.24.29) To
	CY1PR0701MB1147.namprd07.prod.outlook.com (25.160.146.12)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Jagadeesh.Krishnanjanappa@caviumnetworks.com; 
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0701MB1147;
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(46102003)(229853001)(110136001)(48376002)(53416004)(50466002)(2351001)(42186005)(575784001)(50986999)(86362001)(66066001)(87976001)(47776003)(19580405001)(33646002)(19580395003)(50226001)(40100003)(62966003)(450100001)(122386002)(77156002)(92566002)(36756003)(7099025);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0701MB1147;
	H:Ubuntu64.caveonetworks.com; FPR:; SPF:None; MLV:ovrnspm;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Antispam-PRVS: <CY1PR0701MB1147AA5D4E94049CA2CE6A6E8EF10@CY1PR0701MB1147.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:CY1PR0701MB1147; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0701MB1147; 
X-Forefront-PRVS: 05352A48BE
Received-SPF: None (protection.outlook.com: caviumnetworks.com does not
	designate permitted sender hosts)
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2015 17:55:36.4250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0701MB1147
Subject: [PATCH v2] valgrind: add configure option to build only 32-bit or 64-bit components
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
X-List-Received-Date: Fri, 03 Apr 2015 17:55:41 -0000
Content-Type: text/plain

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>

Building both 32-bit and 64-bit binaries in valgrind at a time would
lead to following QA issue as below,

(snip)
 ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_exp-sgcheck-x86-linux.so
 ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/getoff-x86-linux
 ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_core-x86-linux.so
 ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valgrind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgpreload_memcheck-x86-linux.so
-- CUT --

hence perform only one type of build 32-bit or 64-bit, but not both.

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index bf80b16..ac50d2e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -32,10 +32,13 @@ SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1d
 COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
+PR = "r1"
+
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
+EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
 EXTRA_OEMAKE = "-w"
 
 do_install_append () {
-- 
1.8.2.3


