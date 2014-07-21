Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8D27029E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 05:35:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6L5Z3sD010832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jul 2014 22:35:03 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Jul 2014 22:35:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2014 13:34:47 +0800
Message-ID: <24a0f777e3517a0365315cc1d311ba9d686c80a2.1405917574.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405917574.git.hongxu.jia@windriver.com>
References: <cover.1405917574.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 21 Jul 2014 05:35:09 -0000
Content-Type: text/plain

When adding patches or config files from bbappend files, it requires
the use of FILESEXTRAPATHS, which has been an issue and failure point
for people starting to work with bitbake and oe-core.

We add checking to standardize how to use FILESEXTRAPATHS. Only the
format of:
  FILESEXTRAPATHS_append := ${THISDIR}/Your_Files_Path or
  FILESEXTRAPATHS_prepend := ${THISDIR}/Your_Files_Path
is acceptable.

[YOCTO #5412]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/base.bbclass                  |  1 +
 meta/classes/filesextrapaths_check.bbclass | 10 ++++++++++
 meta/classes/utils.bbclass                 |  2 ++
 meta/conf/bitbake.conf                     |  2 ++
 4 files changed, 15 insertions(+)
 create mode 100644 meta/classes/filesextrapaths_check.bbclass

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8114cf6..be8400a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -9,6 +9,7 @@ inherit utils
 inherit utility-tasks
 inherit metadata_scm
 inherit logging
+inherit filesextrapaths_check
 
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath"
 OE_IMPORTS[type] = "list"
diff --git a/meta/classes/filesextrapaths_check.bbclass b/meta/classes/filesextrapaths_check.bbclass
new file mode 100644
index 0000000..6863e0c
--- /dev/null
+++ b/meta/classes/filesextrapaths_check.bbclass
@@ -0,0 +1,10 @@
+python __anonymous() {
+    # Checking ${FILESEXTRAPATHS}
+    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
+    if '__default' not in extrapaths.split(":"):
+        msg =  "Please assign FILESEXTRAPATHS with the format of:\n"
+        msg += "  FILESEXTRAPATHS_append := ${THISDIR}/Your_Files_Path or\n"
+        msg += "  FILESEXTRAPATHS_prepend := ${THISDIR}/Your_Files_Path\n"
+        msg += "in your bbappend file\n"
+        bb.fatal(msg)
+}
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 0ee13e0..0f2a484 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -312,6 +312,8 @@ def explode_deps(s):
 def base_set_filespath(path, d):
     filespath = []
     extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
+    # Remove default flag which was used for checking
+    extrapaths = extrapaths.replace("__default:", "")
     # Don't prepend empty strings to the path list
     if extrapaths != "":
         path = extrapaths.split(":") + path
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f4870d5..6a0cf7a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -311,6 +311,8 @@ FILES_${PN}-locale = "${datadir}/locale"
 FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"
 # FILESPATH is set in base.bbclass
 #FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BPN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
+# This default was only used for checking
+FILESEXTRAPATHS ?= "__default:"
 
 ##################################################################
 # General work and output directories for the build system.
-- 
1.8.1.2


