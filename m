Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEF2970362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 06:17:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6L6HoP0025813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jul 2014 23:17:50 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Jul 2014 23:17:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2014 14:17:34 +0800
Message-ID: <3706903d5cad6c996413ffa6e79d598d173c50ee.1405923190.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405923190.git.hongxu.jia@windriver.com>
References: <cover.1405923190.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] insane: add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 21 Jul 2014 06:17:54 -0000
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
 meta/classes/insane.bbclass | 10 ++++++++++
 meta/classes/utils.bbclass  |  2 ++
 meta/conf/bitbake.conf      |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b26216e..c3a6e9a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1022,6 +1022,16 @@ python () {
     # Check various variables
     ###########################################################################
 
+    # Checking ${FILESEXTRAPATHS}
+    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
+    if '__default' not in extrapaths.split(":"):
+        msg = "FILESEXTRAPATHS-variable, must always use _prepend (or _append)\n"
+        msg += "type of assignment. Please assign it with the format of:\n"
+        msg += "  FILESEXTRAPATHS_append := ${THISDIR}/Your_Files_Path or\n"
+        msg += "  FILESEXTRAPATHS_prepend := ${THISDIR}/Your_Files_Path\n"
+        msg += "in your bbappend file"
+        bb.fatal(msg)
+
     if d.getVar('do_stage', True) is not None:
         bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with OE-core" % d.getVar("FILE", True))
 
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


