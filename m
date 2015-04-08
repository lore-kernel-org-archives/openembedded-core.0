Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0093.outbound.protection.outlook.com [207.46.100.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0436ABF7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 13:33:35 +0000 (UTC)
Received: from Ubuntu64.caveonetworks.com (111.93.218.67) by
	CY1PR0701MB1148.namprd07.prod.outlook.com (25.160.146.13) with
	Microsoft SMTP
	Server (TLS) id 15.1.130.23; Wed, 8 Apr 2015 13:33:34 +0000
From: "Krishnanjanappa, Jagadeesh"
	<jagadeesh.krishnanjanappa@caviumnetworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 19:03:24 +0530
Message-ID: <1428500004-9535-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BY2PR12CA0017.namprd12.prod.outlook.com (25.160.121.27) To
	CY1PR0701MB1148.namprd07.prod.outlook.com (25.160.146.13)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Jagadeesh.Krishnanjanappa@caviumnetworks.com; 
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0701MB1148;
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(2351001)(229853001)(62966003)(42186005)(110136001)(40100003)(106356001)(66066001)(450100001)(47776003)(53416004)(77156002)(48376002)(46102003)(92566002)(87976001)(86362001)(50986999)(122386002)(36756003)(19580405001)(50466002)(19580395003)(33646002)(50226001)(7099025);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0701MB1148;
	H:Ubuntu64.caveonetworks.com; FPR:; SPF:None; MLV:ovrnspm;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Antispam-PRVS: <CY1PR0701MB1148F6B3F5DAB4EB551A35668EFC0@CY1PR0701MB1148.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:CY1PR0701MB1148; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0701MB1148; 
X-Forefront-PRVS: 0540846A1D
Received-SPF: None (protection.outlook.com: caviumnetworks.com does not
	designate permitted sender hosts)
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2015 13:33:34.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0701MB1148
Subject: [PATCH] dpkg: add triplet entry to fix build error for armeb
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
X-List-Received-Date: Wed, 08 Apr 2015 13:33:37 -0000
Content-Type: text/plain

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>

1. Cross-compling dpkg application for armeb fails with below error
   during configure task,

    (snip)
    configure:23141: checking dpkg cpu type
    configure:23148: result: armeb
    configure:23150: WARNING: armeb not found in cputable
    configure:23162: checking dpkg operating system type
    configure:23169: result: linux-gnueabi
    configure:23171: WARNING: linux-gnueabi not found in ostable
    configure:23183: checking dpkg architecture name
    configure:23189: error: cannot determine host dpkg architecture
    -- CUT --

    Add the required combination of "gnueabi-linux-armeb" entry in
    triplet list.

2. Added INC_PR to PR to have an updated value, when INC_PR is defined
   in dpkg.inc file

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
---
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        | 38 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.21.bb         |  4 +++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
new file mode 100644
index 0000000..af275de
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -0,0 +1,38 @@
+Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Date:   Wed Apr 8 18:08:14 2015 +0530
+
+[PATCH] add armeb triplet entry into triplettable.
+
+Cross-compling dpkg application for armeb fails with below error
+during configure task,
+
+(snip)
+ configure:23141: checking dpkg cpu type
+ configure:23148: result: armeb
+ configure:23150: WARNING: armeb not found in cputable
+ configure:23162: checking dpkg operating system type
+ configure:23169: result: linux-gnueabi
+ configure:23171: WARNING: linux-gnueabi not found in ostable
+ configure:23183: checking dpkg architecture name
+ configure:23189: error: cannot determine host dpkg architecture
+-- CUT --
+
+the required combination of "gnueabi-linux-armeb" was not found in
+the triplettable file thereby returning dpkg_arch as
+empty in configure script.
+
+Upstream-Status: Pending
+
+Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+
+diff -Naurp dpkg-1.17.21_org/triplettable dpkg-1.17.21/triplettable
+--- dpkg-1.17.21_org/triplettable	2015-04-08 17:08:52.370759171 +0530
++++ dpkg-1.17.21/triplettable	2015-04-08 17:09:12.406752081 +0530
+@@ -9,6 +9,7 @@ musleabihf-linux-arm	musl-linux-armhf
+ musl-linux-<cpu>	musl-linux-<cpu>
+ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
++gnueabi-linux-armeb	armeb
+ gnuabin32-linux-mips64el	mipsn32el
+ gnuabin32-linux-mips64	mipsn32
+ gnuabi64-linux-mips64el	mips64el
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
index 15c0277..06c690b 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
@@ -1,6 +1,9 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+INC_PR ?= "r0"
+PR = "${INC_PR}.1"
+
 SRC_URI += "file://noman.patch \
             file://check_snprintf.patch \
             file://check_version.patch \
@@ -12,6 +15,7 @@ SRC_URI += "file://noman.patch \
             file://dpkg-configure.service \
             file://glibc2.5-sync_file_range.patch \
             file://no-vla-warning.patch \
+            file://add_armeb_triplet_entry.patch \
            "
 
 SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
-- 
1.8.2.3


