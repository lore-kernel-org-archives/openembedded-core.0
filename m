Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1SudQu-0005DS-Om
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 07:49:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6R5cJZb004860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 22:38:19 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 26 Jul 2012 22:38:19 -0700
From: <Song.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:38:03 +0800
Message-ID: <1343367483-15542-1-git-send-email-Song.Li@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V3] sysstat:use a new way to remove -s option of LFLAGS
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
X-List-Received-Date: Fri, 27 Jul 2012 05:49:53 -0000
Content-Type: text/plain

From: "Song.Li" <Song.Li@windriver.com>

sysstat Makefile shouldn't use -s option to strip binary
because we need debug info for dbg package.
The old way to remove -s option is passing LFLAGS=''
in make command line to clean all the LFLAGS variable in Makefile.
That will cause build failure when sensors lib is needed.
In fact,Only the "-s" should be removed, others LFLAGS should be kept.

[YOCTO #2740]

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
 .../sysstat/files/remove-s-option-of-LFLAGS.patch  |   36 ++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat.inc          |    6 ++--
 meta/recipes-extended/sysstat/sysstat_10.0.5.bb    |    2 +-
 3 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch

diff --git a/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
new file mode 100644
index 0000000..676a72f
--- /dev/null
+++ b/meta/recipes-extended/sysstat/files/remove-s-option-of-LFLAGS.patch
@@ -0,0 +1,36 @@
+From 48203896a3120947d62fa8a2b10aaa91efd0d7ac Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Fri, 27 Jul 2012 13:19:16 +0800
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
+Upstream-Status:Local Patch
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+---
+ Makefile.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index b09a832..3b5ea37 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -71,7 +71,6 @@ SYSCONFIG_DIR = @SYSCONFIG_DIR@
+ # Compiler flags
+ CFLAGS = @CFLAGS@ -Wall -Wstrict-prototypes -pipe -O2
+ DFLAGS = @DFLAGS@
+-LFLAGS = @STRIP@
+ DFLAGS += -DSA_DIR=\"$(SA_DIR)\" -DSADC_PATH=\"$(SADC_PATH)\"
+ DFLAGS += $(DFSENSORS)
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9da40a7..9d33f05 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -5,12 +5,12 @@ LICENSE = "GPLv2+"
 SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
-		   file://99_sysstat"
+	   file://99_sysstat \
+	   file://remove-s-option-of-LFLAGS.patch \
+          "
 
 inherit autotools gettext
 
-EXTRA_OEMAKE += 'LFLAGS=""'
-
 do_install() {
 	autotools_do_install
 
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
index 233102a..738fba8 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "208dd236d726d20591d53d3a20124dd4"
 SRC_URI[sha256sum] = "1f474d6ca742af73d0f9d09a374bda64c72bccb126aef327fa74383ff438feff"
-- 
1.7.9.5



