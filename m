Received: from mail-yx0-f173.google.com ([209.85.213.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RFmxo-0006cM-1g
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:10:44 +0200
Received: by yxk38 with SMTP id 38so4169530yxk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=OrSSfTjJfw+974kUq/yIJxJ800+TZGp9Fz5XbshTjVo=;
	b=umiw2wgFAj3JBR8gGdSf1cyWZDsOra4EHbkfxz4wx2RNs7b/nI4Qoc8zgUsvsKAYjG
	rt6VSbA49/C/BtTkJRDkcvIGCqOGq0sDAnuyBI1uZBl1Q9ieAeS+FYJ0dMVncdz6NEmO
	ocLPjjevqQXyZ0CX7brb1xazFlFmoyWrykVpc=
Received: by 10.236.175.202 with SMTP id z50mr10789494yhl.79.1318856694001;
	Mon, 17 Oct 2011 06:04:54 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm5488983yhi.22.2011.10.17.06.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 06:04:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 13:04:43 +0000
Message-Id: <7c20c1e8f43767e7db6dfc75c47fd9858261b8a0.1318856652.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318856652.git.otavio@ossystems.com.br>
References: <cover.1318856652.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318856652.git.otavio@ossystems.com.br>
References: <cover.1318856652.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] src_distribute.bbclass, src_distribute_local.bbclass: mostly rewritten
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
X-List-Received-Date: Mon, 17 Oct 2011 13:10:44 -0000

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
1.7.2.5



