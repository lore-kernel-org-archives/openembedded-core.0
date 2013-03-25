Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UK5Ds-0001v9-2A
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 12:05:54 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4060CD22B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 11:48:56 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 11:48:45 +0100
Message-Id: <1364208525-9251-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <51501E03.8020907@linaro.org>
References: <51501E03.8020907@linaro.org>
Subject: [PATCH] powertop: add 2.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 11:05:54 -0000

With all tweaks from 1.13:
- uclibc buildable
- libncurses instead of libncursesw

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../stub_out_the_ncurses_calls_in_dump_mode.patch  | 33 -----------------
 meta/recipes-kernel/powertop/powertop_1.13.bb      | 41 ----------------------
 meta/recipes-kernel/powertop/powertop_2.3.bb       | 22 ++++++++++++
 3 files changed, 22 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
 delete mode 100644 meta/recipes-kernel/powertop/powertop_1.13.bb
 create mode 100644 meta/recipes-kernel/powertop/powertop_2.3.bb

diff --git a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch b/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
deleted file mode 100644
index ae4cf5d..0000000
--- a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [this patch is 1.13 specific and 2.0 will be coming.]
-
-Running PowerTop in Poky in dump mode (with --dump) always ends with a
-segmentation fault.
-
-The cause is: in dump mode, setup_windows() is not invoked so the
-*_window variables, like cstate_window, are still NULL; later in
-main() -> show_cstates(), the functions, like wrefresh(), will trigger
-segfault.
-
-After discussing in PowerTop mailling list, I think the right solution is
-we should stub out the ncurses calls in dump mode.
-
-(The patch was also sent to upstream PowerTop mailling list.)
-
-Signed-off-by Dexuan Cui <dexuan.cui@intel.com>, 2010-08-20
-(this patch is licensed under GPLv2)
-
---- a/display.c
-+++ b/display.c
-@@ -44,6 +44,12 @@
- static WINDOW *status_bar_window;
- 
- #define print(win, y, x, fmt, args...) do { if (dump) printf(fmt, ## args); else mvwprintw(win, y, x, fmt, ## args); } while (0)
-+#define wattrset(win, c) do { if (!dump ) wattrset(win, c); } while (0)
-+#define wbkgd(win, c) do { if (!dump ) wbkgd(win, c); } while (0)
-+#define werase(win) do { if (!dump ) werase(win); } while (0)
-+#define wrefresh(win) do { if (!dump ) wrefresh(win); } while (0)
-+#define wattron(win, a) do { if (!dump ) wattron(win, a); } while (0)
-+#define wattroff(win, a) do { if (!dump ) wattroff(win, a); } while (0)
- 
- char status_bar_slots[10][40];
- 
diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
deleted file mode 100644
index db54ed0..0000000
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Power usage tool"
-DESCRIPTION = "PowerTOP, a tool that helps you find what software is using the most power."
-HOMEPAGE = "http://www.lesswatts.org/"
-BUGTRACKER = "http://bugzilla.lesswatts.org/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "virtual/libintl ncurses"
-
-# powertop 1.13 needs lspci
-RDEPENDS_${PN} = "pciutils"
-
-PR = "r4"
-
-SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
-           file://stub_out_the_ncurses_calls_in_dump_mode.patch \
-          "
-
-SRC_URI[md5sum] = "78aa17c8f55178004223bf236654298e"
-SRC_URI[sha256sum] = "2bc866089496877dd26d2d316ad5763ab8ecb5e28aefba44bc5d355dcdc58d98"
-
-CFLAGS += "${LDFLAGS}"
-EXTRA_OEMAKE = "VERSION=\"${PV}\" EXTRA_LIBS=${EXTRA_LIBS}"
-
-EXTRA_LIBS_libc-uclibc = "-lintl"
-
-do_configure() {
-	# We do not build ncurses with wide char support
-	sed -i -e 's:lncursesw:lncurses ${EXTRA_LIBS}:g' ${S}/Makefile
-}
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
-
-inherit update-alternatives
-ALTERNATIVE_${PN} = "powertop"
-ALTERNATIVE_TARGET[powertop] = "${bindir}/powertop"
-ALTERNATIVE_LINK_NAME[powertop] = "${base_bindir}/powertop"
-ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-kernel/powertop/powertop_2.3.bb b/meta/recipes-kernel/powertop/powertop_2.3.bb
new file mode 100644
index 0000000..2a2adb4
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop_2.3.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
+HOMEPAGE = "http://01.org/powertop/"
+DEPENDS = "ncurses virtual/gettext libnl pciutils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "dc03608f20e56cdc99d121a6191556f6"
+SRC_URI[sha256sum] = "b8c1add69afee28c77dca56fdcedb4a46820f3a71c86aae7891b0c5c595cd744"
+
+inherit autotools
+
+# we need to explicitly link with libintl in uClibc systems
+LDFLAGS += "${EXTRA_LDFLAGS}"
+EXTRA_LDFLAGS_libc-uclibc = "-lintl"
+
+# we do not want libncursesw if we can
+do_configure_prepend() {
+    # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
+    sed -i -e "s/ncursesw//g" ${S}/configure.ac
+}
-- 
1.8.1.2



