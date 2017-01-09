Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBCA719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:42:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP; 09 Jan 2017 09:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="51003827"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by orsmga005.jf.intel.com with ESMTP; 09 Jan 2017 09:42:54 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:49:25 -0600
Message-Id: <1483984165-7030-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] recipes-test: exclude recipes from world target
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
X-List-Received-Date: Mon, 09 Jan 2017 17:42:56 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These recipes should be excluded from target 'world' because these are
just intended to be used internally by oe-selftest (devtool, recipetool, etc.)

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb                     | 2 ++
 meta-selftest/recipes-test/devtool/devtool-test-localonly.bb            | 1 +
 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb             | 1 +
 meta-selftest/recipes-test/devtool/devtool-test-subdir.bb               | 2 ++
 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb       | 2 ++
 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb         | 2 ++
 meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb | 2 ++
 7 files changed, 12 insertions(+)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 20a0ab7..073cf56 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -14,6 +14,8 @@ SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
 SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
 
+EXCLUDE_FROM_WORLD = "1"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
index 28ff49e..3f7123c 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -4,3 +4,4 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRC_URI = "file://file1 \
            file://file2"
 
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
index 719a5f1..e45ee9f 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -14,3 +14,4 @@ SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af
 
 inherit autotools pkgconfig
 
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
index 1a163f8..3f69565 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
@@ -5,3 +5,5 @@ SRC_URI = "file://devtool-test-subdir.tar.gz \
            file://testfile;subdir=${BPN}"
 
 S = "${WORKDIR}/${BPN}"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index e93b0d5..4049be2 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -12,5 +12,7 @@ PR = "r5"
 
 S = "${WORKDIR}/pv-${PV}"
 
+EXCLUDE_FROM_WORLD = "1"
+
 inherit autotools
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 9bfce0a..450636e 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -15,4 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/dbus-wait"
 
 S = "${WORKDIR}/git"
 
+EXCLUDE_FROM_WORLD = "1"
+
 inherit autotools pkgconfig
diff --git a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
index 7d0a040..7375c47 100644
--- a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
+++ b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
@@ -15,6 +15,8 @@ SRC_URI = "file://installscript.sh \
            file://selftest-replaceme-inst-todir-globfile \
            file://selftest-replaceme-inst-func"
 
+EXCLUDE_FROM_WORLD = "1"
+
 install_extrafunc() {
 	install -m 0644 ${WORKDIR}/selftest-replaceme-inst-func ${D}${datadir}/selftest-replaceme-inst-func
 }
-- 
2.1.4


