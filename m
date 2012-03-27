Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SCMCK-0003EJ-Kf
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 04:31:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2R2MmA4020959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 19:22:48 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 19:22:48 -0700
Message-ID: <c3904c882e88cedc6ff29841c4307a5871db0bff.1332814325.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Mar 2012 18:16:06 +0800
Date: Tue, 27 Mar 2012 10:24:06 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] src_distribute.bbclass: Remove src__distribute.bbclass
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
X-List-Received-Date: Tue, 27 Mar 2012 02:31:49 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass has been merged into archiver.bbclass

[#YOCTO 1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/src_distribute.bbclass |   49 -----------------------------------
 1 files changed, 0 insertions(+), 49 deletions(-)
 delete mode 100644 meta/classes/src_distribute.bbclass

diff --git a/meta/classes/src_distribute.bbclass b/meta/classes/src_distribute.bbclass
deleted file mode 100644
index efa2720..0000000
--- a/meta/classes/src_distribute.bbclass
+++ /dev/null
@@ -1,49 +0,0 @@
-SRC_DISTRIBUTECOMMAND[func] = "1"
-python do_distribute_sources () {
-	l = bb.data.createCopy(d)
-	bb.data.update_data(l)
-
-	sources_dir = d.getVar('SRC_DISTRIBUTEDIR', True)
-	src_uri = d.getVar('SRC_URI', True).split()
-	fetcher = bb.fetch2.Fetch(src_uri, d)
-	ud = fetcher.ud
-
-	licenses = d.getVar('LICENSE', True).replace('&', '|')
-	licenses = licenses.replace('(', '').replace(')', '')
-	clean_licenses = ""
-	for x in licenses.split():
-		if x.strip() == '' or x == 'CLOSED':
-			continue
-
-		if x != "|":
-			clean_licenses += x
-
-	for license in clean_licenses.split('|'):
-		for url in ud.values():
-			cmd = d.getVar('SRC_DISTRIBUTECOMMAND', True)
-			if not cmd:
-				raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECOMMAND not defined")
-			url.setup_localpath(d)
-			d.setVar('SRC', url.localpath)
-			if url.type == 'file':
-				if url.basename == '*':
-					import os.path
-					dest_dir = os.path.basename(os.path.dirname(os.path.abspath(url.localpath)))
-					d.setVar('DEST', "%s_%s/" % (d.getVar('PF', True), dest_dir))
-				else:
-					d.setVar('DEST', "%s_%s" % (d.getVar('PF', True), url.basename))
-			else:
-				d.setVar('DEST', '')
-
-			d.setVar('SRC_DISTRIBUTEDIR', "%s/%s" % (sources_dir, license))
-			bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
-}
-
-addtask distribute_sources before do_build after do_fetch
-
-addtask distribute_sources_all after do_distribute_sources
-do_distribute_sources_all[recrdeptask] = "do_distribute_sources"
-do_distribute_sources_all[nostamp] = "1"
-do_distribute_sources_all () {
-	:
-}
-- 
1.7.0.4



