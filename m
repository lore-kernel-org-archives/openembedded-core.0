Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZWdr-0007x3-Ca
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:15:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MNBqOB018367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:11:52 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 16:11:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 18:23:26 -0500
Message-ID: <ad3c7491551c11e34027d5efc409ec7c6a5686e3.1308784531.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308784531.git.mark.hatle@windriver.com>
References: <cover.1308784531.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/4] Add umask task control
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
X-List-Received-Date: Wed, 22 Jun 2011 23:15:28 -0000
Content-Type: text/plain

Bitbake now allows the umask to be specified per task.  The
following tasks will have a umask of 022 set by default:

do_configure
do_compile
do_install
do_package
do_populate_sysroot
do_rootfs

do_configure and do_compile need a umask of 022 set because -many- recipes
directly copy generated files out of recipe's build directory.  Instead of
fixing each existing and future recipe, it was shown to be much easier to
just set the umask.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass                          |    4 ++++
 meta/classes/image.bbclass                         |    2 ++
 meta/classes/staging.bbclass                       |    1 +
 .../installer/adt-installer_1.0.bb                 |    2 ++
 meta/recipes-kernel/linux/linux-tools.inc          |    2 ++
 5 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 119b052..9a07f49 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -262,14 +262,18 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        bb.data.setVarFlag('do_configure', 'umask', 022, d)
+        bb.data.setVarFlag('do_compile', 'umask', 022, d)
         deps = (bb.data.getVarFlag('do_install', 'depends', d) or "").split()
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
         bb.data.setVarFlag('do_install', 'depends', " ".join(deps),d)
         bb.data.setVarFlag('do_install', 'fakeroot', 1, d)
+        bb.data.setVarFlag('do_install', 'umask', 022, d)
         deps = (bb.data.getVarFlag('do_package', 'depends', d) or "").split()
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
         bb.data.setVarFlag('do_package', 'depends', " ".join(deps),d)
         bb.data.setVarFlag('do_package', 'fakeroot', 1, d)
+        bb.data.setVarFlag('do_package', 'umask', 022, d)
         bb.data.setVarFlag('do_package_setscene', 'fakeroot', 1, d)
     source_mirror_fetch = bb.data.getVar('SOURCE_MIRROR_FETCH', d, 0)
     if not source_mirror_fetch:
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2469442..e77ec42 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -83,6 +83,8 @@ do_build[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate
 # task, so that we have a single fakeroot context for the whole process.
+do_rootfs[umask] = 022
+
 fakeroot do_rootfs () {
 	#set -x
 	rm -rf ${IMAGE_ROOTFS}
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index fef6457..04d51ed 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -58,6 +58,7 @@ sysroot_stage_all() {
 }
 
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
+do_populate_sysroot[umask] = 022
 
 addtask populate_sysroot after do_install
 
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 8f6e91f..0537440 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -54,6 +54,8 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://opkg/conf/opkg-sdk-i686.conf \
 	  "
 
+do_deploy[umask] = 022
+
 fakeroot do_deploy () {
 	cd ${WORKDIR}
 	mkdir -p ${ADT_DEPLOY}
diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index e4740d7..729e912 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -19,6 +19,8 @@ fakeroot do_install_perf() {
 addtask compile_perf after do_compile before do_install
 addtask install_perf after do_install before do_package
 
+do_compile_perf[umask] = 022
+do_install_perf[umask] = 022
 
 PERFDEPENDS = "virtual/libc:do_populate_sysroot elfutils:do_populate_sysroot"
 PERFDEPENDS_libc-uclibc = ""
-- 
1.7.3.4



