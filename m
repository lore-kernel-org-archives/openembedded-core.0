Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SZyb2-00019k-Ff
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 08:10:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4V60a72005965
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 23:00:36 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 30 May 2012 23:00:36 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 14:02:57 +0800
Message-ID: <354a7b8da4265e47f351fa1b6bc4cfe7adc6eebd.1338443711.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1338443711.git.xiaofeng.yan@windriver.com>
References: <cover.1338443711.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] local.conf.sample.extended: Change the usage about arhiver.bbclass
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
X-List-Received-Date: Thu, 31 May 2012 06:10:57 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Change the usage about arhiver.bbclass due to the improvement for
usability of archiver.bbclass

[YOCTO #2472]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta-yocto/conf/local.conf.sample.extended |   31 ++++++++++++++++-----------
 1 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
index b493094..66b94ad 100644
--- a/meta-yocto/conf/local.conf.sample.extended
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -184,20 +184,25 @@
 
 # Archiving source code configuration
 #
-# The following variables control which files to archive and the type to archive to generate.
-# There are three basic class defintions of common operations that might be desired and these
-# can be enabled by uncommenting one of the following lines:
-#
-# INHERIT += "archive-original-source"
-# INHERIT += "archive-patched-source"
-#INHERIT =+ "archive-configured-source"
-#
+# The following variables control which files to archive and
+# the type to archive to generate.
+# The content to archive
+# "original":    Copy source code package from downloads if existing. 
+# Archive source code after do_unpack if not found in downloads 
+# "patched":    Archive source code package after do_patch
+# "configured": Archive source code package after do_configure 
+# ARCHIVER_MODE[choices] = "none original patched configured"
 # Type of archive:
-# SOURCE_ARCHIVE_PACKAGE_TYPE = 'srpm'
-#SOURCE_ARCHIVE_PACKAGE_TYPE ?= 'tar'
-#
+# ARCHIVER_MODE[type] = "tar srpm"
 # Whether to include WORKDIR/temp, .bb and .inc files:
 # 'logs_with_scripts' include WORKDIR/temp directory and .bb and .inc files
 # 'logs' only include WORKDIR/temp
-# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs'
-#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
+# ARCHIVER_MODE[log_type] = "logs logs_with_scripts"
+# There are three basic class defintions of common operations 
+# that might be desired and these can be enabled by 
+# uncommenting five of the following lines:
+#ARCHIVER_MODE ?= "original"
+#ARCHIVER_MODE[type] ?= "tar"
+#ARCHIVER_MODE[log_type] ?= "logs_with_scripts"
+#ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE != 'none' else ''}"
+#INHERIT += "${ARCHIVER_CLASS}"
-- 
1.7.0.4



