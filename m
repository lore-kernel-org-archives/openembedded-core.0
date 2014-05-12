Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 8479F61F16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:38 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:28 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 7B6763A220;
	Mon, 12 May 2014 15:55:45 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:29 +0200
Message-Id: <875252a972e731f1e12927fdc6fbc9a46b326a04.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
References: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 04/13] trace-cmd: refactoring recipe
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
X-List-Received-Date: Mon, 12 May 2014 14:28:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Refactoring recipe to avoid duplicated entries in trace-cmd and
kernelshark bb-files. Also remove usage of FILESPATH and split package
unique patches into separate dirs.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../kernelshark-fix-syntax-error-of-shell.patch    |    0
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |   18 ++++--------------
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        |   14 ++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |   16 ++++------------
 4 files changed, 22 insertions(+), 26 deletions(-)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => kernelshark}/kernelshark-fix-syntax-error-of-shell.patch (100%)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd.inc

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
rename to meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index d61097d..e64abe2 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -1,28 +1,18 @@
 SUMMARY = "Graphical trace viewer for Ftrace"
 LICENSE = "GPLv2"
+
+require trace-cmd.inc
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
-SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
-PR = "r3"
-PV = "1.2+git${SRCPV}"
-
 DEPENDS = "gtk+"
 RDEPENDS_${PN} = "trace-cmd"
 
-inherit pkgconfig pythonnative
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
-           file://addldflags.patch \
-           file://make-docs-optional.patch \
-           file://blktrace-api-compatibility.patch \
-           file://kernelshark-fix-syntax-error-of-shell.patch"
-S = "${WORKDIR}/git"
+SRC_URI_append = "file://kernelshark-fix-syntax-error-of-shell.patch"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
 
-FILESPATH = "${FILE_DIRNAME}/trace-cmd"
-
 do_install() {
 	oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
 	rm -rf ${D}${datadir}/trace-cmd
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd.inc b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
new file mode 100644
index 0000000..fb8c5fa
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
@@ -0,0 +1,14 @@
+SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
+PR = "r3"
+PV = "1.2+git${SRCPV}"
+
+inherit pkgconfig pythonnative
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/trace-cmd:"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
+           file://addldflags.patch \
+           file://make-docs-optional.patch \
+           file://blktrace-api-compatibility.patch \
+"
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index a0c823b..6f3319d 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -1,26 +1,18 @@
 SUMMARY = "User interface to Ftrace"
 LICENSE = "GPLv2 & LGPLv2.1"
+
+require trace-cmd.inc
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
                     file://trace-input.c;beginline=5;endine=8;md5=6ad47cc2b03385d8456771eec5eeea0b"
 
-SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
-PR = "r3"
-PV = "1.2+git${SRCPV}"
-
-inherit pkgconfig pythonnative
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
-           file://addldflags.patch \
-           file://make-docs-optional.patch \
-           file://blktrace-api-compatibility.patch \
-           file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
+SRC_URI_append = "file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
            file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
            file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
            file://trace-cmd-fix-syntax-error-of-shell.patch \
 "
-S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'prefix=${prefix}'"
 
-- 
1.7.9.5


