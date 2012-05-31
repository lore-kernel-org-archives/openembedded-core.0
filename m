Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SZyb1-00019j-DD
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 08:10:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4V60ZGj025995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 23:00:35 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 30 May 2012 23:00:34 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 14:02:56 +0800
Message-ID: <ee86332c73aa80fe35b1d87818edd966a07829b6.1338443711.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1338443711.git.xiaofeng.yan@windriver.com>
References: <cover.1338443711.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] archiver.bbclass: Improve the usability for the archiver classes
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
X-List-Received-Date: Thu, 31 May 2012 06:10:56 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The usability of the archiver classes can be improved, beyond the
simple addition of default values for the variables. A user could
well inherit just archiver rather than the individual useful classes,
and not realize it will do nothing.

[YOCTO #2472]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ac8aa95..582c565 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -6,8 +6,10 @@ ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
 ARCHIVE_TYPE ?= "TAR SRPM"
 DISTRO ?= "poky"
 PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
-SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
-SOURCE_ARCHIVE_PACKAGE_TYPE ?= 'tar'
+SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type') \
+                                    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
+SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE','type') \
+                                 if d.getVarFlag('ARCHIVER_MODE', 'log_type')!= 'none' else 'tar'}'
 
 def get_bb_inc(d):
 	'''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
-- 
1.7.0.4



