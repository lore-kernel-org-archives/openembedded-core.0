Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S3mih-0002ci-Nu
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 12:01:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q23ArFH4017607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Mar 2012 02:53:15 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 3 Mar 2012 02:53:14 -0800
Message-ID: <6b45ee6d33a54d9abcbc0dd28f383a4993795017.1330771239.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1330771239.git.xiaofeng.yan@windriver.com>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 2 Mar 2012 16:39:29 +0800
Date: Sat, 3 Mar 2012 18:54:10 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] archiver_configure.bbclass: configure the content for archiving package
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
X-List-Received-Date: Sat, 03 Mar 2012 11:01:48 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This is configuration file to point to what content a archive package
should include in the different stage of task by pointing to different variable and
stage.

[YOCTO #1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver_configure.bbclass |   35 +++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/archiver_configure.bbclass

diff --git a/meta/classes/archiver_configure.bbclass b/meta/classes/archiver_configure.bbclass
new file mode 100644
index 0000000..c9892d3
--- /dev/null
+++ b/meta/classes/archiver_configure.bbclass
@@ -0,0 +1,35 @@
+# This file is for getting tarball in different stage for sources, patches, and logs by configuring 
+# the following variable and tasks
+
+inherit archiver
+
+# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
+SOURCE_ARCHIVE_PACKAGE_TYPE = 'tar'
+
+# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts', 'logs'}
+# String 'logs_with_scripts' include temp directory and .bb and .inc file
+# String 'logs' only include temp 
+SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = 'logs_with_scripts'
+
+# PATCHES_ARCHIVE_WITH_SERIES = {'true', 'false'}
+# Strings 'true' means that patches including series files(series + non-applying)
+# String 'false' means that no series and only archive applying patches
+PATCHES_ARCHIVE_WITH_SERIES = 'true'
+
+# Archive packages for copy-left
+#COPYLEFT_COMPLIANCE = 'true'
+
+# Open this item when you want to get original sources tarball with patches
+do_unpack[postfuncs] += "do_archive_original_sources_patches "
+
+# Open this item when you want to get tarball for patched sources including patches
+#do_patch[postfuncs] += "do_archive_patched_sources "
+
+# Open this item when you want to get tarball for configured sources including patches
+#do_configure[postfuncs] += "do_archive_configured_sources "
+
+# Open this item when you want to get tarball for logs tarball
+do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+
+# Get dump date and create diff file 
+do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
-- 
1.7.0.4



