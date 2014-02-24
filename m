Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08AAC6EE66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:53:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1OFr2HO015119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 07:53:03 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 24 Feb 2014 07:53:02 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 23:56:09 +0800
Message-ID: <b53a98919a99e630554a196b5899cdd99769b2e8.1393256563.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] local.conf.sample.extended: update for the archiver
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
X-List-Received-Date: Mon, 24 Feb 2014 15:53:03 -0000
Content-Type: text/plain

Updated it since we have refactored the archiver.bbclass.

[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/local.conf.sample.extended | 72 +++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5f10886..27d5932 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -188,40 +188,44 @@
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
+# The tarball for the configured source, the diff between do_unpack and
+# do_patch will be archived by default, and you can configure the
+# archiver when needed:
+#
+#The output format:
+# 1) tar: (default)
+#ARCHIVER_MODE[type] = "tar"
+# 2) srpm: (when PACKAGES != "")
+#ARCHIVER_MODE[type] = "srpm",
+# NOTE: The logs can't be packed into the srpm package because they are
+#       incompleted until the rpm package has been built.
+#
+# Archive the source:
+# 1) before do_patch:
+#ARCHIVER_MODE[src] = "unpacked"
+# 2) after do_patch:
+#ARCHIVER_MODE[src] = "patched"
+# 3) after do_configure: (default)
+#ARCHIVER_MODE[src] = "configured"
+#
+# 4) the patches between do_unpack and do_configure:
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
+# 7) the log.* and run.* files under ${T}
+#ARCHIVER_MODE[log] = "1"
+#
 
 # Remove the old image before the new one generated to save disk space
 #RM_OLD_IMAGE = "1"
-- 
1.8.3.1


