Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7RHk-0002QI-UD
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 13:57:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2DCmKlw012172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 05:48:20 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Mar 2012 05:48:20 -0700
Message-ID: <586ca1ffd5fe89f14440708981cf2e5d64c966fb.1331642569.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1331642569.git.xiaofeng.yan@windriver.com>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 13 Mar 2012 19:22:59 +0800
Date: Tue, 13 Mar 2012 20:52:23 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] archive-patched-source.bbclass: Archive patched source
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
X-List-Received-Date: Tue, 13 Mar 2012 12:57:05 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass inherits archiver.bbclass to archive patched source

[#YOCTO 1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archive-patched-source.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/archive-patched-source.bbclass

diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
new file mode 100644
index 0000000..b3184b5
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
+do_package_write_rpm[prefuncs] += "do_archive_scripts_logs_copyleft "
+
+# Get dump date and create diff file 
+do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
-- 
1.7.0.4



