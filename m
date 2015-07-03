Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4612D75CEE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 05:01:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98041692"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jul 2015 13:05:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t633tbu8007164
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 11:55:39 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 3 Jul 2015 11:57:17 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 11:47:47 +0800
Message-ID: <1435895267-34962-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] do_unpack: move qa check of unpack into insane.bbclass
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
X-List-Received-Date: Fri, 03 Jul 2015 05:01:54 -0000
Content-Type: text/plain

Some source archive are not standard format.
For example, sometimes, we still need decompress file once again after base_do_unpack,
in such case, the following warning will be caught.

 WARNING: xxx : the directory ${WORKDIR}/xxxx (xxxxxx) pointed to by the S variable doesn't exist \
 - please set S within the recipe to point to where the source has been unpacked to

So, we should do this QA check after all of unpack jobs been completed.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/classes/base.bbclass   |  3 ---
 meta/classes/insane.bbclass | 12 ++++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 56fe5f2..5606228 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -152,9 +152,6 @@ python base_do_unpack() {
         fetcher.unpack(rootdir)
     except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
-
-    if not os.path.exists(s_dir):
-        bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN', True), d.getVar('S', False), s_dir))
 }
 
 def pkgarch_mapping(d):
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4537eec..fc3d5ff 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1140,6 +1140,15 @@ Missing inherit gettext?""" % (gt, config))
         except subprocess.CalledProcessError:
             pass
 }
+
+python do_qa_unpack() {
+    bb.note("Checking has ${S} been created")
+
+    s_dir = d.getVar('S', True)
+    if not os.path.exists(s_dir):
+        bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN', True), d.getVar('S', False), s_dir))
+}
+
 # The Staging Func, to check all staging
 #addtask qa_staging after do_populate_sysroot before do_build
 do_populate_sysroot[postfuncs] += "do_qa_staging "
@@ -1149,6 +1158,9 @@ do_populate_sysroot[postfuncs] += "do_qa_staging "
 #addtask qa_configure after do_configure before do_compile
 do_configure[postfuncs] += "do_qa_configure "
 
+# Check does S exist.
+do_unpack[postfuncs] += "do_qa_unpack"
+
 python () {
     tests = d.getVar('ALL_QA', True).split()
     if "desktop" in tests:
-- 
1.9.1


