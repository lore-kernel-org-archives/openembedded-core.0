Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2457B6B4BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 15:43:01 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Nov 2013 07:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="322053604"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Nov 2013 07:43:02 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id C32776A4009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 07:43:00 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:43:35 +0200
Message-Id: <0eb35797e7734f1cb3cff73d726ef2dd3d98ed5f.1384874570.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 2/4] meta-selftest: create a new test layer to be used by oe-selftest script
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
X-List-Received-Date: Tue, 19 Nov 2013 15:43:02 -0000

From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>

Everything in this layer is meant to be used by tests.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .gitignore                                         |  1 +
 meta-selftest/COPYING.MIT                          | 17 +++++++++++++
 meta-selftest/README                               |  2 ++
 meta-selftest/classes/test_events.bbclass          | 16 +++++++++++++
 meta-selftest/conf/layer.conf                      | 10 ++++++++
 .../recipes-test/aspell/aspell_0.0.0.1.bb          | 28 ++++++++++++++++++++++
 .../recipes-test/man/man/man-1.5h1-make.patch      | 16 +++++++++++++
 meta-selftest/recipes-test/man/man_1.6g.bbappend   |  2 ++
 .../xcursor-transparent-theme_0.1.1.bbappend       |  3 +++
 9 files changed, 95 insertions(+)
 create mode 100644 meta-selftest/COPYING.MIT
 create mode 100644 meta-selftest/README
 create mode 100644 meta-selftest/classes/test_events.bbclass
 create mode 100644 meta-selftest/conf/layer.conf
 create mode 100644 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
 create mode 100644 meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
 create mode 100644 meta-selftest/recipes-test/man/man_1.6g.bbappend
 create mode 100644 meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend

diff --git a/.gitignore b/.gitignore
index 0171597..b6755fe 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,3 +21,4 @@ bitbake/doc/manual/pdf/
 bitbake/doc/manual/txt/
 bitbake/doc/manual/xhtml/
 pull-*/
+!meta-selftest
diff --git a/meta-selftest/COPYING.MIT b/meta-selftest/COPYING.MIT
new file mode 100644
index 0000000..89de354
--- /dev/null
+++ b/meta-selftest/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/meta-selftest/README b/meta-selftest/README
new file mode 100644
index 0000000..e0f803d
--- /dev/null
+++ b/meta-selftest/README
@@ -0,0 +1,2 @@
+This layer is intended as test layer, used by scripts/oe-selftest
+and it's probably a mistake to include it in your builds.
diff --git a/meta-selftest/classes/test_events.bbclass b/meta-selftest/classes/test_events.bbclass
new file mode 100644
index 0000000..35324eb
--- /dev/null
+++ b/meta-selftest/classes/test_events.bbclass
@@ -0,0 +1,16 @@
+python test1_eventhandler() {
+    bb.note("Test for bb.event.BuildStarted")
+}
+python test2_eventhandler() {
+    bb.note("Test for bb.event.BuildCompleted")
+}
+python test3_eventhandler() {
+    bb.note("Test for bb.event.InvalidEvent")
+}
+
+addhandler test1_eventhandler
+test1_eventhandler[eventmask] = "bb.event.BuildStarted"
+addhandler test2_eventhandler
+test2_eventhandler[eventmask] = "bb.event.BuildCompleted"
+addhandler test3_eventhandler
+test3_eventhandler[eventmask] = "bb.event.InvalidEvent"
diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
new file mode 100644
index 0000000..e3322f6
--- /dev/null
+++ b/meta-selftest/conf/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+	${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "selftest"
+BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
+BBFILE_PRIORITY_selftest = "6"
diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
new file mode 100644
index 0000000..79eb06b
--- /dev/null
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -0,0 +1,28 @@
+# This recipe is a copy from the oe-core one.
+# It has a lower and invalid version number in order not to be accidentally used by bitbake.
+# It is used for tests that require duplicate recipe files.
+
+DESCRIPTION = "GNU Aspell spell-checker"
+SECTION = "console/utils"
+LICENSE="LGPLv2 | LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+PR = "r1"
+
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
+SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
+
+PACKAGES += "libaspell libpspell libpspell-dev aspell-utils"
+
+FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
+FILES_libaspell = "${libdir}/libaspell.so.* ${libdir}/aspell*"
+FILES_aspell-utils = "${bindir}/word-list-compress ${bindir}/aspell-import ${bindir}/run-with-aspell ${bindir}/pre*"
+FILES_${PN} = "${bindir}/aspell"
+FILES_libpspell = "${libdir}/libpspell.so.*"
+FILES_libpspell-dev = "${libdir}/libpspell* ${bindir}/pspell-config ${includedir}/pspell"
+
+ARM_INSTRUCTION_SET = "arm"
+inherit autotools gettext
diff --git a/meta-selftest/recipes-test/man/man/man-1.5h1-make.patch b/meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
new file mode 100644
index 0000000..a0d59b7
--- /dev/null
+++ b/meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
@@ -0,0 +1,16 @@
+Test patch here!
+This is invalid patch used by tests in scripts/lib/selftests.
+
+--- man-1.5g/man/Makefile.in.mike	Fri Apr  9 13:35:54 1999
++++ man-1.5g/man/Makefile.in	Fri Apr  9 13:36:45 1999
+@@ -1,8 +1,8 @@
+ #MAKE THIS PATCH INVALID
+ MAN1 = man whatis apropos
+-MAN5 = man.conf
++MAN5 = man.config
+ MAN8 = makewhatis
+-ALL = man.1 whatis.1 apropos.1 man.conf.5
++ALL = man.1 whatis.1 apropos.1 man.config.5
+ MAYBE8 = makewhatis
+ 
+ .SUFFIXES: .man .1 .5 .8
diff --git a/meta-selftest/recipes-test/man/man_1.6g.bbappend b/meta-selftest/recipes-test/man/man_1.6g.bbappend
new file mode 100644
index 0000000..2057209
--- /dev/null
+++ b/meta-selftest/recipes-test/man/man_1.6g.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend b/meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend
new file mode 100644
index 0000000..29e86f6
--- /dev/null
+++ b/meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend
@@ -0,0 +1,3 @@
+TEST_VAR = ""
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
-- 
1.8.3.1


