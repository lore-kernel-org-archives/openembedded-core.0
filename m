Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3AA5607F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:38:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5KDcvwx025893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2013 06:38:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 20 Jun 2013 06:38:57 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 21:38:25 +0800
Message-ID: <2146d8ba9021eb536acc28011fde7825eaecb9e7.1371735435.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371735435.git.kai.kang@windriver.com>
References: <cover.1371735435.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] tcl: fix unit test boundary year issue
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
X-List-Received-Date: Thu, 20 Jun 2013 13:38:56 -0000
Content-Type: text/plain

Unit test clock.test check the boundary year 2099 which is not
inclusive. Include 2099 to be a valide year number.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../tcltk/tcl/let-DST-include-year-2099.patch      |   35 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.0.bb           |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch b/meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
new file mode 100644
index 0000000..eef1812
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
@@ -0,0 +1,35 @@
+From f10135df3f4751d7c83a66561c988ae799b6372f Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Fri, 10 Aug 2012 13:07:20 +0800
+Subject: [PATCH] let DST include year 2099
+
+tcl puts Daylight Saving Time in deffect from 1916 to 2099,
+it should include the year 2099,becuase tcl
+self-contained testing have a DST testcase on 2099.
+so the condition statement "<2099" should be "<=2099"
+
+Upstream-Status: Submitted
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ library/clock.tcl |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/clock.tcl b/library/clock.tcl
+index 2e9cae7..e8efe4a 100644
+--- a/library/clock.tcl
++++ b/library/clock.tcl
+@@ -3945,7 +3945,7 @@ proc ::tcl::clock::ProcessPosixTimeZone { z } {
+ 
+     # Put DST in effect in all years from 1916 to 2099.
+ 
+-    for { set y 1916 } { $y < 2099 } { incr y } {
++    for { set y 1916 } { $y <= 2099 } { incr y } {
+ 	set startTime [DeterminePosixDSTTime $z start $y]
+ 	incr startTime [expr { - wide($stdOffset) }]
+ 	set endTime [DeterminePosixDSTTime $z end $y]
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
index 95556e2..7273182 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.0.bb
@@ -18,7 +18,8 @@ SRC_URI = "${BASE_SRC_URI} \
 	   file://fix_non_native_build_issue.patch \
 	   file://fix_issue_with_old_distro_glibc.patch \
 	   file://no_packages.patch \
-	   file://tcl-remove-hardcoded-install-path.patch"
+	   file://tcl-remove-hardcoded-install-path.patch \
+	   file://let-DST-include-year-2099.patch;patchdir=.. "
 
 SRC_URI[md5sum] = "573aa5fe678e9185ef2b3c56b24658d3"
 SRC_URI[sha256sum] = "354422b9c4791685499123b2dfe01faa98b555c08906c010cb4449ddc75dcade"
-- 
1.7.5.4


