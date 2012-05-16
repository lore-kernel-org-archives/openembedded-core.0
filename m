Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SUa7z-0004GN-As
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 11:02:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4G8qaQT028420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 01:52:36 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 16 May 2012 01:52:36 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 16:59:45 +0800
Message-ID: <3e20fd5d9449d2c698e3f8c667f06d83301318aa.1337157396.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1337157396.git.xiaofeng.yan@windriver.com>
References: <cover.1337157396.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] archiver.bbclass: Add two default set for avoiding error when missing assignment
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
X-List-Received-Date: Wed, 16 May 2012 09:02:39 -0000
Content-Type: text/plain

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
1.7.0.4



