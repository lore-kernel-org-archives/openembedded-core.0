Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1Sg4fa-0004YD-0x
	for Openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 03:52:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5H1g8tW024826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 18:42:08 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 16 Jun 2012 18:42:08 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Sat, 16 Jun 2012 20:44:11 -0500
Message-ID: <1339897451-2605-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1339897451-2605-1-git-send-email-jason.wessel@windriver.com>
References: <1339897451-2605-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/1] package.bbclass, task.bbclass: Allow doc-pkgs in EXTRA_IMAGE_FEATURES
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
X-List-Received-Date: Sun, 17 Jun 2012 01:52:50 -0000
Content-Type: text/plain

The doc-pkgs package group is defined, but some of the "plumbing" is
missing to allow it to work like the dbg-pkgs and dev-pkgs.  This
patch adds the "plumbing" to allow you to specify doc-pkgs to install
all the documentation packages that correspond to the other installed
packages on the target file system in a similar manner to the dbg-pkgs.

[Yocto #2614]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/package.bbclass              |    4 ++++
 meta/classes/task.bbclass                 |    2 +-
 meta/conf/bitbake.conf                    |    2 +-
 meta/recipes-core/tasks/task-core-boot.bb |    1 +
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 10c2f0a..3145f88 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1616,6 +1616,8 @@ python package_depchains() {
 				depend = depend.replace('-dev', '')
 			if depend.endswith('-dbg'):
 				depend = depend.replace('-dbg', '')
+			if depend.endswith('-doc'):
+				depend = depend.replace('-doc', '')
 			pkgname = getname(depend, suffix)
 			#bb.note("Adding %s for %s" % (pkgname, depend))
 			if pkgname not in rreclist:
@@ -1637,6 +1639,8 @@ python package_depchains() {
 				depend = depend.replace('-dev', '')
 			if depend.endswith('-dbg'):
 				depend = depend.replace('-dbg', '')
+			if depend.endswith('-doc'):
+				depend = depend.replace('-doc', '')
 			pkgname = getname(depend, suffix)
 			#bb.note("Adding %s for %s" % (pkgname, depend))
 			if pkgname not in rreclist:
diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
index 22c2fd3..0704b42 100644
--- a/meta/classes/task.bbclass
+++ b/meta/classes/task.bbclass
@@ -20,7 +20,7 @@ python () {
     packages = d.getVar('PACKAGES', True).split()
     genpackages = []
     for pkg in packages:
-        for postfix in ['-dbg', '-dev']:
+        for postfix in ['-dbg', '-dev', '-doc']:
             genpackages.append(pkg+postfix)
     d.setVar('PACKAGES', ' '.join(packages+genpackages))
 }
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 97930a7..f60aafe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -233,7 +233,7 @@ HOMEPAGE = "unknown"
 # Ensure that -dev packages recommend the corresponding -dev packages of their
 # deps, and the same for -dbg.
 DEPCHAIN_PRE  = ""
-DEPCHAIN_POST = "-dev -dbg"
+DEPCHAIN_POST = "-dev -dbg -doc"
 
 DEPENDS = ""
 RDEPENDS = ""
diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 6487436..7ca2098 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -28,6 +28,7 @@ PACKAGES = "\
     task-core-boot \
     task-core-boot-dbg \
     task-core-boot-dev \
+    task-core-boot-doc \
 "
 
 RDEPENDS_task-core-boot = "\
-- 
1.7.1



