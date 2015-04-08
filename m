Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0070.outbound.protection.outlook.com [207.46.100.70])
	by mail.openembedded.org (Postfix) with ESMTP id 774A060089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 13:59:21 +0000 (UTC)
Received: from Ubuntu64.caveonetworks.com (111.93.218.67) by
	BN3PR0701MB1138.namprd07.prod.outlook.com (25.160.114.151) with
	Microsoft
	SMTP Server (TLS) id 15.1.130.23; Wed, 8 Apr 2015 13:59:18 +0000
From: "Krishnanjanappa, Jagadeesh"
	<jagadeesh.krishnanjanappa@caviumnetworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 19:29:09 +0530
Message-ID: <1428501549-16696-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BY2PR08CA0067.namprd08.prod.outlook.com (25.163.62.163) To
	BN3PR0701MB1138.namprd07.prod.outlook.com (25.160.114.151)
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0701MB1138;
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(50986999)(19580395003)(66066001)(229853001)(53416004)(33646002)(110136001)(47776003)(19580405001)(106356001)(42186005)(50226001)(2351001)(46102003)(77156002)(62966003)(87976001)(122386002)(40100003)(86362001)(50466002)(48376002)(450100001)(92566002)(36756003)(7099025);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0701MB1138;
	H:Ubuntu64.caveonetworks.com; FPR:; SPF:None; MLV:ovrnspm;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Antispam-PRVS: <BN3PR0701MB11387B2B39360A2E30C184AB8EFC0@BN3PR0701MB1138.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0701MB1138; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0701MB1138; 
X-Forefront-PRVS: 0540846A1D
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2015 13:59:18.4966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0701MB1138
Subject: [PATCH v2] dpkg: add triplet entry to fix build error for armeb
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
X-List-Received-Date: Wed, 08 Apr 2015 13:59:22 -0000
Content-Type: text/plain

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>

Cross-compling dpkg application for armeb fails with below error
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

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
---
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        | 38 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.21.bb         |  1 +
 2 files changed, 39 insertions(+)
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
index 15c0277..ebb8671 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://noman.patch \
             file://dpkg-configure.service \
             file://glibc2.5-sync_file_range.patch \
             file://no-vla-warning.patch \
+            file://add_armeb_triplet_entry.patch \
            "
 
 SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
-- 
1.8.2.3


