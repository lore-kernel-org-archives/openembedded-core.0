Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C49B76B7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 04:46:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA94kRWL000553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Nov 2015 20:46:28 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 Nov 2015 20:46:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jeffrey.honig@windriver.com>
Date: Sun, 8 Nov 2015 23:46:25 -0500
Message-ID: <1447044385-172869-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446884486-23655-2-git-send-email-hongxu.jia@windriver.com>
References: <1446884486-23655-1-git-send-email-hongxu.jia@windriver.com>
	<1446884486-23655-2-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libhtml-tree-perl: fix shebang
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
X-List-Received-Date: Mon, 09 Nov 2015 04:46:30 -0000
Content-Type: text/plain

There is a build failure while installing libhtml-tree-perl to sdk:
...
|Computing transaction...error: Can't install nativesdk-libhtml-tree-
perl-5.03-r0.1@x86_64_nativesdk: no package provides tmp/sysroots/
x86_64-linux/usr/bin/perl-native/perl.real
...

The rpm detects the shebang of perl script, so we correct it.
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libhtml/files/bin-htmltree-fix-shebang.patch   | 25 ++++++++++++++++++++++
 .../recipes-perl/libhtml/libhtml-tree-perl_5.03.bb |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch

diff --git a/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch b/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch
new file mode 100644
index 0000000..4266f05
--- /dev/null
+++ b/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch
@@ -0,0 +1,25 @@
+From 28ee994780459c3552d3cbbd6b011d054a41c439 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 8 Nov 2015 23:33:31 -0500
+Subject: [PATCH] bin/htmltree: fix shebang
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ bin/htmltree | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/htmltree b/bin/htmltree
+index 8bf3db2..f9927e5 100755
+--- a/bin/htmltree
++++ b/bin/htmltree
+@@ -1,4 +1,4 @@
+-#!/usr/bin/perl
++#!/usr/bin/env perl
+ # Time-stamp: "2000-10-02 14:48:15 MDT"
+ #
+ # Parse the given HTML file(s) and dump the parse tree
+-- 
+1.9.1
+
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 0b457e3..8eb0e06 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -11,7 +11,9 @@ HOMEPAGE = "http://www.cpan.org/authors/id/C/CJ/CJM/HTML-Tree-${PV}.readme"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
+           file://bin-htmltree-fix-shebang.patch \
+"
 SRC_URI[md5sum] = "d9271d60b872ed6fbe68b2d0fe8c450e"
 SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
 
-- 
1.9.1


