Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4326DDBE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:08:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2013 09:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,783,1378882800"; d="scan'208";a="441131529"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2013 09:08:13 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 86D6F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:08:11 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 19:08:51 +0200
Message-Id: <ae748a37a26b2f3210902d8e7c90b97861e5d628.1385571298.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/4] meta-selftest: create a new test layer to be used by oe-selftest script
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
X-List-Received-Date: Wed, 27 Nov 2013 17:08:31 -0000

From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>

Everything in this layer is meant to be used by tests called by
scripts/oe-selftest. These are helper recipes/appends to test various bitbake
options or scripts.
Currently most of these files here only have "include test_recipe.inc" which
is the file tests will actually use.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .gitignore                                         |  1 +
 meta-selftest/COPYING.MIT                          | 17 +++++++++++++
 meta-selftest/README                               |  3 +++
 meta-selftest/classes/test_events.bbclass          | 16 +++++++++++++
 meta-selftest/conf/layer.conf                      | 10 ++++++++
 .../recipes-test/aspell/aspell_0.0.0.1.bb          | 28 ++++++++++++++++++++++
 .../recipes-test/aspell/aspell_0.60.6.1.bbappend   |  2 ++
 meta-selftest/recipes-test/m4/m4_1.4.17.bbappend   |  2 ++
 .../recipes-test/man/man/man-1.5h1-make.patch      | 16 +++++++++++++
 meta-selftest/recipes-test/man/man_1.6g.bbappend   |  2 ++
 .../xcursor-transparent-theme_0.1.1.bbappend       |  2 ++
 11 files changed, 99 insertions(+)
 create mode 100644 meta-selftest/COPYING.MIT
 create mode 100644 meta-selftest/README
 create mode 100644 meta-selftest/classes/test_events.bbclass
 create mode 100644 meta-selftest/conf/layer.conf
 create mode 100644 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
 create mode 100644 meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend
 create mode 100644 meta-selftest/recipes-test/m4/m4_1.4.17.bbappend
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
index 0000000..11a6fee
--- /dev/null
+++ b/meta-selftest/README
@@ -0,0 +1,3 @@
+This layer is intended as test layer, used by scripts/oe-selftest
+and it's probably a mistake to include it in your builds (unless you
+want to run the script).
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
index 0000000..a847b78
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
+BBFILE_PRIORITY_selftest = "5"
diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
new file mode 100644
index 0000000..427726a
--- /dev/null
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -0,0 +1,28 @@
+# This recipe is a copy from the oe-core one.
+# It has a lower and invalid version number in order not to be accidentally used by bitbake.
+# It is used for tests that require overlayed recipe files.
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
diff --git a/meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend b/meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend
new file mode 100644
index 0000000..2057209
--- /dev/null
+++ b/meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta-selftest/recipes-test/m4/m4_1.4.17.bbappend b/meta-selftest/recipes-test/m4/m4_1.4.17.bbappend
new file mode 100644
index 0000000..2057209
--- /dev/null
+++ b/meta-selftest/recipes-test/m4/m4_1.4.17.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
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
index 0000000..2057209
--- /dev/null
+++ b/meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
-- 
1.8.3.1


