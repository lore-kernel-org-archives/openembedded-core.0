Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SC7c7-0000Uw-PW
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 12:57:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2QAmRDX009485
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 03:48:27 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 03:48:28 -0700
Message-ID: <9cd03f0c7dfd575f76530bfefaaf0d7a4d518f24.1332758293.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1332758293.git.xiaofeng.yan@windriver.com>
References: <cover.1332758293.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Mar 2012 18:27:40 +0800
Date: Mon, 26 Mar 2012 18:49:39 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] archive-patched-source.bbclass: Archive patched source
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
X-List-Received-Date: Mon, 26 Mar 2012 10:57:28 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass inherits archiver.bbclass to archive patched source

[YOCTO #1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archive-patched-source.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/archive-patched-source.bbclass

diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
new file mode 100644
index 0000000..a6d368f
--- /dev/null
+++ b/meta/classes/archive-patched-source.bbclass
@@ -0,0 +1,14 @@
+# This file is for getting archiving packages with patched sources(archive 's' before do_patch stage),logs(archive 'temp' after package_write_rpm),dump data and 
+# creating diff file(get all environment variables and functions in building and mapping all content in 's' including patches to  xxx.diff.gz.
+# All archived packages will be deployed in ${DEPLOY_DIR}/sources
+
+inherit archiver
+
+# Get archiving package with patched sources including patches
+do_patch[postfuncs] += "do_archive_patched_sources "
+
+# Get archiving package with logs(temp) and scripts(.bb and .inc files)
+do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+
+# Get dump date and create diff file 
+do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
-- 
1.7.0.4



