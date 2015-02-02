Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0129.outbound.protection.outlook.com [157.56.112.129])
	by mail.openembedded.org (Postfix) with ESMTP id 53AB06E208
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 07:52:53 +0000 (UTC)
Received: from piippo.it.local (91.217.248.11) by
	DB4PR02MB0416.eurprd02.prod.outlook.com (10.141.43.140) with Microsoft
	SMTP Server (TLS) id 15.1.75.20; Mon, 2 Feb 2015 07:38:23 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 09:38:22 +0200
Message-ID: <1422862702-27566-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB4PR03CA0024.eurprd03.prod.outlook.com (25.160.39.162) To
	DB4PR02MB0416.eurprd02.prod.outlook.com (10.141.43.140)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DB4PR02MB0416;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:DB4PR02MB0416; 
X-Forefront-PRVS: 0475418F50
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(62966003)(92566002)(46102003)(50226001)(40100003)(42186005)(50466002)(229853001)(33646002)(36756003)(575784001)(48376002)(19580395003)(66066001)(122386002)(19580405001)(77156002)(87976001)(2351001)(47776003)(110136001)(77096005)(50986999)(86362001)(7099025);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB4PR02MB0416; H:piippo.it.local;
	FPR:; SPF:None; MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:DB4PR02MB0416;
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2015 07:38:23.7629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB0416
Subject: [PATCH] wayland: add nativesdk support
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
X-List-Received-Date: Mon, 02 Feb 2015 07:52:54 -0000
Content-Type: text/plain

Allow building wayland-scanner for nativesdk. Extra patch required
to use the scanner from wayland-native during the build.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 .../always-use-wayland-scanner-from-system.patch   | 25 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.6.0.bb     |  8 ++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/always-use-wayland-scanner-from-system.patch

diff --git a/meta/recipes-graphics/wayland/wayland/always-use-wayland-scanner-from-system.patch b/meta/recipes-graphics/wayland/wayland/always-use-wayland-scanner-from-system.patch
new file mode 100644
index 0000000..9e5fe4d
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/always-use-wayland-scanner-from-system.patch
@@ -0,0 +1,25 @@
+The wayland-scanner built for the nativesdk cannot be run during the build,
+so instead use the wayland-scanner from native build.
+
+Upstream-Status: Pending
+
+Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
+---
+ Makefile.am | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+diff --git a/Makefile.am b/Makefile.am
+index c15d8b8..45f7133 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -62,7 +62,7 @@ nodist_libwayland_client_la_SOURCES =         \
+ pkgconfig_DATA += src/wayland-client.pc src/wayland-server.pc
+ 
+ if ENABLE_SCANNER
+-wayland_scanner = $(top_builddir)/wayland-scanner
++wayland_scanner = wayland-scanner
+ bin_PROGRAMS = wayland-scanner
+ wayland_scanner_SOURCES = src/scanner.c
+ wayland_scanner_LDADD = $(EXPAT_LIBS) libwayland-util.la
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipes-graphics/wayland/wayland_1.6.0.bb
index cf3c094..5c9832e 100644
--- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.6.0.bb
@@ -16,14 +16,20 @@ SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86b
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
+SRC_URI_append_class-nativesdk = " \
+    file://disable-macro-checks-not-used-for-scanner.patch \
+    file://always-use-wayland-scanner-from-system.patch \
+    "
 EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
+EXTRA_OECONF_class-nativesdk = "--disable-documentation --enable-scanner"
 
 inherit autotools pkgconfig
 
 # We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS_class-native = "expat-native libffi-native"
+DEPENDS_class-nativesdk = "nativesdk-expat nativesdk-libffi wayland-native"
 DEPENDS = "expat libffi wayland-native"
 
 EXTRA_OECONF = "--disable-documentation --disable-scanner"
-- 
1.9.1


