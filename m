Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SC7c2-0000Ug-PM
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 12:57:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2QAmImP009482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 03:48:22 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 03:48:18 -0700
Message-ID: <cb3a87df6970daf19c696eb79b3c64efe82c433a.1332758293.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1332758293.git.xiaofeng.yan@windriver.com>
References: <cover.1332758293.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Mar 2012 18:23:06 +0800
Date: Mon, 26 Mar 2012 18:49:29 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] archive-original-source.bbclass: Archive original source
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
X-List-Received-Date: Mon, 26 Mar 2012 10:57:23 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass prepares for archiving original source.
If original source is tarball, then copy this tarball to
${DEPLOY_DIR}/sources.
If original source is dirctory, then archive this directory to
tarball

[YOCTO #1977]

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



