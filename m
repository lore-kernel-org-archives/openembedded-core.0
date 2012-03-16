Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S8QdU-0003ca-CK
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 07:27:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2G6Imkk002553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 23:18:48 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 15 Mar 2012 23:18:48 -0700
Message-ID: <2c22a49e652d4e727a092edea34adea5eb160fac.1331877464.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1331877464.git.xiaofeng.yan@windriver.com>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 13 Mar 2012 20:38:28 +0800
Date: Fri, 16 Mar 2012 14:23:41 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] sourcepkg, src_distribute, src_distribute_local: remove three bbclass
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
X-List-Received-Date: Fri, 16 Mar 2012 06:27:38 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

These bbclasses have been merged into archiver.bbclass.

[YOCTO #1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/sourcepkg.bbclass            |  107 -----------------------------
 meta/classes/src_distribute.bbclass       |   49 -------------
 meta/classes/src_distribute_local.bbclass |   33 ---------
 3 files changed, 0 insertions(+), 189 deletions(-)
 delete mode 100644 meta/classes/sourcepkg.bbclass
 delete mode 100644 meta/classes/src_distribute.bbclass
 delete mode 100644 meta/classes/src_distribute_local.bbclass

diff --git a/meta/classes/sourcepkg.bbclass b/meta/classes/sourcepkg.bbclass
deleted file mode 100644
index 102c109..0000000
--- a/meta/classes/sourcepkg.bbclass
+++ /dev/null
@@ -1,107 +0,0 @@
-DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/source"
-EXCLUDE_FROM ?= ".pc autom4te.cache"
-
-# used as part of a path. make sure it's set
-DISTRO ?= "openembedded"
-
-def get_src_tree(d):
-
-	workdir = d.getVar('WORKDIR', True)
-	if not workdir:
-		bb.error("WORKDIR not defined, unable to find source tree.")
-		return
-
-	s = d.getVar('S', 0)
-	if not s:
-		bb.error("S not defined, unable to find source tree.")
-		return
-
-	s_tree_raw = s.split('/')[1]
-	s_tree = d.expand(s_tree_raw)
-
-	src_tree_path = os.path.join(workdir, s_tree)
-	try:
-		os.listdir(src_tree_path)
-	except OSError:
-		bb.fatal("Expected to find source tree in '%s' which doesn't exist." % src_tree_path)
-	bb.debug("Assuming source tree is '%s'" % src_tree_path)
-
-	return s_tree
-
-sourcepkg_do_create_orig_tgz(){
-
-	mkdir -p ${DEPLOY_DIR_SRC}
-	cd ${WORKDIR}
-	for i in ${EXCLUDE_FROM}; do
-		echo $i >> temp/exclude-from-file
-	done
-
-	src_tree=${@get_src_tree(d)}
-	
-	echo $src_tree
-	bbnote "Creating .orig.tar.gz in ${DEPLOY_DIR_SRC}/${P}.orig.tar.gz"
-	tar cvzf ${DEPLOY_DIR_SRC}/${P}.orig.tar.gz --exclude-from temp/exclude-from-file $src_tree
-	tar -cf - -C $src_tree -ps . | tar -xf - -C $src_tree.orig
-}
-
-sourcepkg_do_archive_bb() {
-
-	src_tree=${@get_src_tree(d)}
-	dest=${WORKDIR}/$src_tree/${DISTRO}
-	mkdir -p $dest
-
-	cp ${FILE} $dest
-}
-
-python sourcepkg_do_dumpdata() {
-
-	workdir = d.getVar('WORKDIR', True)
-	distro = d.getVar('DISTRO', True)
-	s_tree = get_src_tree(d)
-	openembeddeddir = os.path.join(workdir, s_tree, distro)
-	dumpfile = os.path.join(openembeddeddir, d.expand("${P}-${PR}.showdata.dump"))
-	
-	try:
-		os.mkdir(openembeddeddir)
-	except OSError:
-		# dir exists
-		pass
-
-	bb.note("Dumping metadata into '%s'" % dumpfile)
-	f = open(dumpfile, "w")
-	# emit variables and shell functions
-        bb.data.emit_env(f, d, True)
-	# emit the metadata which isnt valid shell
-	for e in d.keys():
-		if d.getVarFlag(e, 'python'):
-			f.write("\npython %s () {\n%s}\n" % (e, d.getVar(e, True)))
-	f.close()
-}
-
-sourcepkg_do_create_diff_gz(){
-
-	cd ${WORKDIR}
-	for i in ${EXCLUDE_FROM}; do
-		echo $i >> temp/exclude-from-file
-	done
-
-
-	src_tree=${@get_src_tree(d)}
-
-	for i in `find . -maxdepth 1 -type f`; do
-		mkdir -p $src_tree/${DISTRO}/files
-		cp $i $src_tree/${DISTRO}/files
-	done
-	
-	bbnote "Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz"
-	LC_ALL=C TZ=UTC0 diff --exclude-from=temp/exclude-from-file -Naur $src_tree.orig $src_tree | gzip -c > ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz
-	rm -rf $src_tree.orig
-}
-
-EXPORT_FUNCTIONS do_create_orig_tgz do_archive_bb do_dumpdata do_create_diff_gz
-
-addtask create_orig_tgz after do_unpack before do_patch
-addtask archive_bb after do_patch before do_dumpdata
-addtask dumpdata after archive_bb before do_create_diff_gz
-addtask create_diff_gz after do_dump_data before do_configure
-
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
diff --git a/meta/classes/src_distribute_local.bbclass b/meta/classes/src_distribute_local.bbclass
deleted file mode 100644
index 17b67e3..0000000
--- a/meta/classes/src_distribute_local.bbclass
+++ /dev/null
@@ -1,33 +0,0 @@
-inherit src_distribute
-
-# SRC_DIST_LOCAL possible values:
-# copy		copies the files to the distributedir
-# symlink	symlinks the files to the distributedir
-# move+symlink	moves the files into distributedir, and symlinks them back
-SRC_DIST_LOCAL ?= "move+symlink"
-SRC_DISTRIBUTEDIR ?= "${DEPLOY_DIR}/sources"
-SRC_DISTRIBUTECOMMAND () {
-	s="${SRC}"
-	d="${DEST}"
-
-	mkdir -p ${SRC_DISTRIBUTEDIR}
-
-	if echo $d | grep -q '/$'; then
-		mkdir -p ${SRC_DISTRIBUTEDIR}/$d
-	fi
-
-	case "${SRC_DIST_LOCAL}" in
-		copy)
-			test -e $s.md5 && cp -f $s.md5 ${SRC_DISTRIBUTEDIR}/$d.md5
-			cp -f $s ${SRC_DISTRIBUTEDIR}/$d
-			;;
-		symlink)
-			test -e $s.md5 && ln -sf $s.md5 ${SRC_DISTRIBUTEDIR}/$d.md5
-			ln -sf $s ${SRC_DISTRIBUTEDIR}/$d
-			;;
-		move+symlink)
-			mv $s ${SRC_DISTRIBUTEDIR}/$d
-			ln -sf ${SRC_DISTRIBUTEDIR}/$d $s
-			;;
-	esac
-}
-- 
1.7.0.4



