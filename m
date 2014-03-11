Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 546DC6F817
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:04:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3uFl003912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:56 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:23 +0800
Message-ID: <45d847a16c7fb262e98ef85402a421a9cbaa30d1.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] local.conf.sample.extended: update for the archiver
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
X-List-Received-Date: Tue, 11 Mar 2014 17:04:00 -0000
Content-Type: text/plain

Updated it since we have refactored the archiver.bbclass.

[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/local.conf.sample.extended | 63 +++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5f10886..aa01917 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -188,40 +188,35 @@
 # when the disk space reduces 50M (or the amount of inode reduces 5k).
 #BB_DISKMON_WARNINTERVAL = "50M,5K"
 
-# Archiving source code, configure what kind of sources will be archived
-# and the output format. The output files will be put in
-# ${DEPLOY_DIR}/sources/.
-#
-# You can add the following 3 lines to the conf file to get a quick
-# usage:
-#ARCHIVER_MODE ?= "original"
-#ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE != 'none' else ''}"
-#INHERIT += "${ARCHIVER_CLASS}"
-#
-# Detailed configuration:
-# What kind of sources will be archived, the ARCHIVER_MODE could be:
-# original: the ${S} after do_unpack
-# patched : the ${S} after do_patch
-# configured: the ${S} after do_configure
-#ARCHIVER_MODE ?= "original"
-#
-# The output format type, tar or srpm, the default is "tar".
-#ARCHIVER_MODE[type] ?= "tar"
-#
-# Whether include the log file under ${T} and the recipe (.bb and .inc),
-# the default is "logs_with_scripts".
-#ARCHIVER_MODE[log_type] ?= "logs_with_scripts"
-#
-# license filter:
-# yes: Only the COPYLEFT_LICENSE_INCLUDE recipe will be archived
-# no: All kinds of license will be archived
-# The default is "no"
-#ARCHIVER_MODE[filter] ?= "no"
-#
-# The following lines should be added to your conf file verbatim
-# (uncommented though of course):
-#ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE != 'none' else ''}"
-#INHERIT += "${ARCHIVER_CLASS}"
+# Archive the source and put them to ${DEPLOY_DIR}/sources/.
+#
+#INHERIT += "archiver"
+#
+# The tarball for the patched source will be created by default, and you
+# can configure the archiver as follow:
+#
+# Create archive for:
+# 1) original (or unpacked) source:
+#ARCHIVER_MODE[src] = "original"
+# 2) patched source: (default)
+#ARCHIVER_MODE[src] = "patched"
+# 3) configured source:
+#ARCHIVER_MODE[src] = "configured"
+#
+# 4) the patches between do_unpack and do_patch:
+#ARCHIVER_MODE[diff] = "1"
+# set the files that you'd like to exclude from the diff:
+#ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
+#
+# 5) the environment data, similar to 'bitbake -e recipe':
+#ARCHIVER_MODE[dumpdata] = "1"
+#
+# 6) the recipe (.bb and .inc):
+#ARCHIVER_MODE[recipe] = "1"
+#
+# Whether output the .src.rpm package:
+#ARCHIVER_MODE[srpm] = "1"
+#
 
 # Remove the old image before the new one generated to save disk space
 #RM_OLD_IMAGE = "1"
-- 
1.8.3.1


