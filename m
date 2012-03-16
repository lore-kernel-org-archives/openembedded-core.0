Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S8QdP-0003YP-N7
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 07:27:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2G6IheX002550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 23:18:43 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 15 Mar 2012 23:18:44 -0700
Message-ID: <5227b4166faf51464c09ce2584e2aae0e58b9068.1331877464.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1331877464.git.xiaofeng.yan@windriver.com>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 13 Mar 2012 19:27:04 +0800
Date: Fri, 16 Mar 2012 14:23:37 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] archive-original-source.bbclass: Archive original source
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
X-List-Received-Date: Fri, 16 Mar 2012 06:27:32 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass prepares for archiving original source.

[#YOCTO 1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archive-original-source.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/archive-original-source.bbclass

diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
new file mode 100644
index 0000000..b085533
--- /dev/null
+++ b/meta/classes/archive-original-source.bbclass
@@ -0,0 +1,14 @@
+# This file is for getting archiving packages with original sources(archive 's' after unpack stage),patches,logs(archive 'temp' after package_write_rpm),dump data and 
+# creating diff file(get all environment variables and functions in building and mapping all content in 's' including patches to  xxx.diff.gz.
+# All archived packages will be deployed in ${DEPLOY_DIR}/sources
+
+inherit archiver
+
+# Get original sources archiving package with patches
+do_unpack[postfuncs] += "do_archive_original_sources_patches "
+
+# Get archiving package with temp(logs) and scripts(.bb and inc files)
+do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+
+# Get dump date and create diff file 
+do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
-- 
1.7.0.4



