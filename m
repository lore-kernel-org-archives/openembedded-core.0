Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1SuEbM-00057f-Rj
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 05:19:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6Q2Wctw009668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 19:32:39 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 25 Jul 2012 19:32:38 -0700
From: <Song.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 10:32:21 +0800
Message-ID: <1343269941-18349-1-git-send-email-Song.Li@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2] sysstat:use a new way to remove -s option of LFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 03:19:01 -0000
Content-Type: text/plain

From: "Song.Li" <Song.Li@windriver.com>

sysstat Makefile shouldn't use -s option to strip binary
because we need debug info for dbg package.
The old way to remove -s option is passing LFLAGS=''
in make command line to clean all the LFLAGS variable in Makefile.
That will cause build failure when sensors lib is needed.
In fact,Only the "-s" should be removed, others LFLAGS should be kept.

[YOCTO #2740]

(LOCAL PATCH: NOT UPSTREAM)

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
 .../sysstat/files/remove-s-option-of-LFLAGS.patch  |   36 ++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat.inc          |    5 +--
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    2 +-
 3 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch

diff --git a/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
new file mode 100644
index 0000000..5345c3e
--- /dev/null
+++ b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
@@ -0,0 +1,36 @@
+From 69f0088cbe300628f5d94b66505ac8ed07565229 Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Fri, 13 Jul 2012 13:51:13 +0800
+Subject: [PATCH] remove -s option of LFLAGS
+
+sysstat Makefile shouldn't use -s option to strip binary
+because we need debug info for dbg package.
+The old way to remove -s option is passing LFLAGS=''
+in make command line to clean all the LFLAGS variable in Makefile.
+That will cause build failure when sensors lib is needed.
+In fact,only "-s" should be removeed, others LFLAGS should be kept.
+
+[YOCTO #2740]
+
+Upstream-Status:Pending
+
+(LOCAL PATCH: NOT UPSTREAM)
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+---
+ Makefile.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index d1ea853..ee6cbc1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -71,7 +71,6 @@ SYSCONFIG_DIR = @SYSCONFIG_DIR@
+ # Compiler flags
+ CFLAGS = @CFLAGS@ -Wall -Wstrict-prototypes -pipe -O2
+ DFLAGS = @DFLAGS@
+-LFLAGS =  -s
+ DFLAGS += -DSA_DIR=\"$(SA_DIR)\" -DSADC_PATH=\"$(SADC_PATH)\"
+ DFLAGS += $(DFSENSORS)
+ 
+-- 
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9da40a7..1c98101 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -5,11 +5,12 @@ LICENSE = "GPLv2+"
 SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
-		   file://99_sysstat"
+		   file://99_sysstat \
+		   file://remove-s-option-of-LFLAGS.patch \
+          "
 
 inherit autotools gettext
 
-EXTRA_OEMAKE += 'LFLAGS=""'
 
 do_install() {
 	autotools_do_install
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
index 7ef6c60..93fbe21 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
 SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
-- 
1.7.9.5



