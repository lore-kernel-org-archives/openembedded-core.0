Return-Path: <Xudong.Zhu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA94B6EFF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 03:30:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1E3U9FS005156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 19:30:09 -0800 (PST)
Received: from pek-xzhu-980.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 13 Feb 2014 19:30:09 -0800
From: "Xudong.zhu" <xudong.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 11:30:04 +0800
Message-ID: <1392348604-4134-2-git-send-email-xudong.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1392348604-4134-1-git-send-email-xudong.zhu@windriver.com>
References: <1392348604-4134-1-git-send-email-xudong.zhu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] tar: fix a build error introduced by 1.27
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
X-List-Received-Date: Fri, 14 Feb 2014 03:30:08 -0000
Content-Type: text/plain

From: "Xudong.zhu" <xzhu@windriver.com>

--same-order option cannot be used with -c the latest
tar version 1.27.
To fix this, drop the -s from -ps if -c exists.

[YOCTO #5823]

Signed-off-by: Xudong.zhu <xzhu@windriver.com>
---
 meta/classes/libc-package.bbclass     |    8 ++++----
 meta/classes/package.bbclass          |    2 +-
 meta/classes/populate_sdk_deb.bbclass |    2 +-
 meta/classes/staging.bbclass          |    2 +-
 meta/lib/oe/path.py                   |    2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 75e9b2a..1fc60d9 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -96,14 +96,14 @@ do_prep_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
 	rm -rf $treedir
 	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
-	tar -cf - -C ${LOCALETREESRC}${datadir} -ps i18n | tar -xf - -C $treedir/${datadir}
+	tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir/${datadir}
 	# unzip to avoid parsing errors
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
 		gunzip $i
 	done
-	tar -cf - -C ${LOCALETREESRC}${base_libdir} -ps . | tar -xf - -C $treedir/${base_libdir}
+	tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/${base_libdir}
 	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.* ]; then
-		tar -cf - -C ${STAGING_DIR_NATIVE}/${prefix_native}/${base_libdir} -ps libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
+		tar -cf - -C ${STAGING_DIR_NATIVE}/${prefix_native}/${base_libdir} -p libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
 	fi
 	install -m 0755 ${LOCALETREESRC}${bindir}/localedef $treedir/${base_bindir}
 }
@@ -113,7 +113,7 @@ do_collect_bins_from_locale_tree() {
 
 	parent=$(dirname ${localedir})
 	mkdir -p ${PKGD}/$parent
-	tar -cf - -C $treedir/$parent -ps $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
+	tar -cf - -C $treedir/$parent -p $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
 }
 
 inherit qemu
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 59a27a2..847921d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -437,7 +437,7 @@ python perform_packagecopy () {
     # files to operate on
     subprocess.call('rm -rf %s/*' % (dvar), shell=True)
     # Preserve sparse files and hard links
-    subprocess.call('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar), shell=True)
+    subprocess.call('tar -cf - -C %s -p . | tar -xf - -C %s' % (dest, dvar), shell=True)
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
     if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index f2d0621..2d25149 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -13,7 +13,7 @@ populate_sdk_post_deb () {
 	local target_rootfs=$1
 
 	mkdir -p ${target_rootfs}/etc
-	tar -cf - -C ${STAGING_ETCDIR_NATIVE} -ps apt | tar -xf - -C ${target_rootfs}/etc
+	tar -cf - -C ${STAGING_ETCDIR_NATIVE} -p apt | tar -xf - -C ${target_rootfs}/etc
 }
 
 populate_sdk_deb () {
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index ee5a025..fb4eebd 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -17,7 +17,7 @@ sysroot_stage_dir() {
 	# However we always want to stage a $src itself, even if it's empty
 	mkdir -p "$dest"
 	if [ -d "$src" ]; then
-		tar -cf - -C "$src" -ps . | tar -xf - -C "$dest"
+		tar -cf - -C "$src" -p . | tar -xf - -C "$dest"
 	fi
 }
 
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1fdfa87..92a5910 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -82,7 +82,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
 
     bb.utils.mkdirhier(dst)
-    cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (src, dst)
+    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 
-- 
1.7.9.5


