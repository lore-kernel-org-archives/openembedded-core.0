Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44t-0006K2-CI
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478123"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:09 +0300
Message-Id: <c2b5cfa5fa3e688fc799fe80f754df9fbd398cc5.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/12] archiver.bbclass: Add two default set for avoiding error when missing assignment
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
X-List-Received-Date: Thu, 17 May 2012 17:01:28 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add two default set(SOURCE_ARCHIVE_LOG_WITH_SCRIPTS, \
SOURCE_ARCHIVE_PACKAGE_TYPE) to archiver.bbclass for avoiding \
building error when forgetting to assign to them.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 59b58f4..ac8aa95 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -6,6 +6,8 @@ ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
 ARCHIVE_TYPE ?= "TAR SRPM"
 DISTRO ?= "poky"
 PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
+SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
+SOURCE_ARCHIVE_PACKAGE_TYPE ?= 'tar'
 
 def get_bb_inc(d):
 	'''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
@@ -277,7 +279,7 @@ def get_package(d):
 	try:
 		f = open(tarpackage,'r')
 		line = list(set(f.readline().replace('\n','').split()))
-	except IOError:
+	except UnboundLocalError,IOError:
 		pass
 	f.close()
 	return line
-- 
1.7.7.6



