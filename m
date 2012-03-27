Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SCMCI-0003E9-To
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 04:31:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R2MjsO018152
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 19:22:45 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 19:22:46 -0700
Message-ID: <873e8cf8c1a014ffeacff6089afe930c6418a53a.1332814325.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Mar 2012 18:14:43 +0800
Date: Tue, 27 Mar 2012 10:24:03 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] sourcepkg.bbclass: Remove sourcepkg.bbclass
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
X-List-Received-Date: Tue, 27 Mar 2012 02:31:47 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass has been merged into archiver.bbclass.

[YOCTO #1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/sourcepkg.bbclass |  107 ----------------------------------------
 1 files changed, 0 insertions(+), 107 deletions(-)
 delete mode 100644 meta/classes/sourcepkg.bbclass

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
-- 
1.7.0.4



