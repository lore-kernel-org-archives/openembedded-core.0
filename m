Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUr-0002oE-NL
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982183"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:42 -0700
Message-Id: <6b6e0667871fb5f43b68440954c3ad629dfc92e7.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 06/26] src_distribute.bbclass, src_distribute_local.bbclass: mostly rewritten
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:02 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

The code used to reference unavailable variables and mistakenly define
the tasks so fully demonstrating this have not been in use for a
while.

During the code rewrite, it was extended to copy also the patches into
the source distribution directory but using the PF as prefix to avoid
name colision among other recipes.

As 'distsrcall' task was not properly defined and noone noticed it,
until now, it got renamed to 'distribute_sources_all' as it is a
better and more meanful name for the task.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/src_distribute.bbclass       |   54 ++++++++++++++++++++---------
 meta/classes/src_distribute_local.bbclass |   28 ++++++++-------
 2 files changed, 52 insertions(+), 30 deletions(-)

diff --git a/meta/classes/src_distribute.bbclass b/meta/classes/src_distribute.bbclass
index 17d6c09..fbfbdf0 100644
--- a/meta/classes/src_distribute.bbclass
+++ b/meta/classes/src_distribute.bbclass
@@ -2,28 +2,48 @@ SRC_DISTRIBUTECOMMAND[func] = "1"
 python do_distribute_sources () {
 	l = bb.data.createCopy(d)
 	bb.data.update_data(l)
-	licenses = (bb.data.getVar('LICENSE', d, 1) or "unknown").split()
 
 	sources_dir = bb.data.getVar('SRC_DISTRIBUTEDIR', d, 1)
-	import re
-	for license in licenses:
-		for entry in license.split("|"):
-			for s in (bb.data.getVar('A', d, 1) or "").split():
-				s = re.sub(';.*$', '', s)
-				cmd = bb.data.getVar('SRC_DISTRIBUTECOMMAND', d, 1)
-				if not cmd:
-					raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECOMMAND not defined")
-				bb.data.setVar('SRC', s, d)
-				bb.data.setVar('SRC_DISTRIBUTEDIR', "%s/%s" % (sources_dir, entry), d)
-				bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
+	src_uri = bb.data.getVar('SRC_URI', d, 1).split()
+	fetcher = bb.fetch2.Fetch(src_uri, d)
+	ud = fetcher.ud
+
+	licenses = bb.data.getVar('LICENSE', d, 1).replace('&', '|')
+	licenses = licenses.replace('(', '').replace(')', '')
+	clean_licenses = ""
+	for x in licenses.split():
+		if x.strip() == '' or x == 'CLOSED':
+			continue
+
+		if x != "|":
+			clean_licenses += x
+
+	for license in clean_licenses.split('|'):
+		for url in ud.values():
+			cmd = bb.data.getVar('SRC_DISTRIBUTECOMMAND', d, 1)
+			if not cmd:
+				raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECOMMAND not defined")
+			url.setup_localpath(d)
+			bb.data.setVar('SRC', url.localpath, d)
+			if url.type == 'file':
+				if url.basename == '*':
+					import os.path
+					dest_dir = os.path.basename(os.path.dirname(os.path.abspath(url.localpath)))
+					bb.data.setVar('DEST', "%s_%s/" % (bb.data.getVar('PF', d, 1), dest_dir), d)
+				else:
+					bb.data.setVar('DEST', "%s_%s" % (bb.data.getVar('PF', d, 1), url.basename), d)
+			else:
+				bb.data.setVar('DEST', '', d)
+
+			bb.data.setVar('SRC_DISTRIBUTEDIR', "%s/%s" % (sources_dir, license), d)
+			bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
 }
 
 addtask distribute_sources before do_build after do_fetch
 
-addtask distsrcall after do_distribute_sources
-do_distall[recrdeptask] = "do_distribute_sources"
-base_do_distsrcall() {
+addtask distribute_sources_all after do_distribute_sources
+do_distribute_sources_all[recrdeptask] = "do_distribute_sources"
+do_distribute_sources_all[nostamp] = "1"
+do_distribute_sources_all () {
 	:
 }
-
-EXPORT_FUNCTIONS do_distsrcall
diff --git a/meta/classes/src_distribute_local.bbclass b/meta/classes/src_distribute_local.bbclass
index 5f0cef5..17b67e3 100644
--- a/meta/classes/src_distribute_local.bbclass
+++ b/meta/classes/src_distribute_local.bbclass
@@ -1,31 +1,33 @@
 inherit src_distribute
 
 # SRC_DIST_LOCAL possible values:
-# copy		copies the files from ${A} to the distributedir
-# symlink	symlinks the files from ${A} to the distributedir
+# copy		copies the files to the distributedir
+# symlink	symlinks the files to the distributedir
 # move+symlink	moves the files into distributedir, and symlinks them back
 SRC_DIST_LOCAL ?= "move+symlink"
 SRC_DISTRIBUTEDIR ?= "${DEPLOY_DIR}/sources"
 SRC_DISTRIBUTECOMMAND () {
 	s="${SRC}"
-	if [ ! -L "$s" ] && (echo "$s"|grep "^${DL_DIR}"); then
-		:
-	else
-		exit 0;
-	fi
+	d="${DEST}"
+
 	mkdir -p ${SRC_DISTRIBUTEDIR}
+
+	if echo $d | grep -q '/$'; then
+		mkdir -p ${SRC_DISTRIBUTEDIR}/$d
+	fi
+
 	case "${SRC_DIST_LOCAL}" in
 		copy)
-			test -e $s.md5 && cp -f $s.md5 ${SRC_DISTRIBUTEDIR}/
-			cp -f $s ${SRC_DISTRIBUTEDIR}/
+			test -e $s.md5 && cp -f $s.md5 ${SRC_DISTRIBUTEDIR}/$d.md5
+			cp -f $s ${SRC_DISTRIBUTEDIR}/$d
 			;;
 		symlink)
-			test -e $s.md5 && ln -sf $s.md5 ${SRC_DISTRIBUTEDIR}/
-			ln -sf $s ${SRC_DISTRIBUTEDIR}/
+			test -e $s.md5 && ln -sf $s.md5 ${SRC_DISTRIBUTEDIR}/$d.md5
+			ln -sf $s ${SRC_DISTRIBUTEDIR}/$d
 			;;
 		move+symlink)
-			mv $s ${SRC_DISTRIBUTEDIR}/
-			ln -sf ${SRC_DISTRIBUTEDIR}/`basename $s` $s
+			mv $s ${SRC_DISTRIBUTEDIR}/$d
+			ln -sf ${SRC_DISTRIBUTEDIR}/$d $s
 			;;
 	esac
 }
-- 
1.7.6.2



