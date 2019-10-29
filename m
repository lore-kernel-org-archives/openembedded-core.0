Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6737F9C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 20:39:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9TKdMWb025358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 13:39:22 -0700 (PDT)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 29 Oct 2019 13:39:21 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2019 15:39:21 -0500
Message-ID: <20191029203921.17227-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: inotify-tools: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Tue, 29 Oct 2019 20:39:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

An interface for inotify already exists through pyinotify,
but migrating inotify-tools to oe-core provides an option
that doesn't rely on python.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...inotify-nosys-fix-system-call-number.patch | 31 +++++++++++++++++++
 .../inotify-tools/inotify-tools_git.bb        | 23 ++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
 create mode 100644 meta/recipes-support/inotify-tools/inotify-tools_git.bb

diff --git a/meta/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch b/meta/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
new file mode 100644
index 0000000000..89b890dda9
--- /dev/null
+++ b/meta/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
@@ -0,0 +1,31 @@
+inotify-tools: fix __NR_inotify_add_watch system call number on _MIPS_SIM_ABI64
+
+The correct value should be the same as defined in
+linux/arch/mips/include/uapi/asm/unistd.h
+
+Upstream-Status: Summitted [https://github.com/rvoicilas/inotify-tools/pull/71]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ libinotifytools/src/inotifytools/inotify-nosys.h |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libinotifytools/src/inotifytools/inotify-nosys.h b/libinotifytools/src/inotifytools/inotify-nosys.h
+index db76b2c..5f7b11b 100644
+--- a/libinotifytools/src/inotifytools/inotify-nosys.h
++++ b/libinotifytools/src/inotifytools/inotify-nosys.h
+@@ -100,8 +100,8 @@ struct inotify_event {
+ # endif
+ # if _MIPS_SIM == _MIPS_SIM_ABI64
+ #  define __NR_inotify_init (__NR_Linux + 243)
+-#  define __NR_inotify_add_watch (__NR_Linux + 243)
+-#  define __NR_inotify_rm_watch (__NR_Linux + 243)
++#  define __NR_inotify_add_watch (__NR_Linux + 244)
++#  define __NR_inotify_rm_watch (__NR_Linux + 245)
+ # endif
+ # if _MIPS_SIM == _MIPS_SIM_NABI32
+ #  define __NR_inotify_init (__NR_Linux + 247)
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-support/inotify-tools/inotify-tools_git.bb b/meta/recipes-support/inotify-tools/inotify-tools_git.bb
new file mode 100644
index 0000000000..05ca4b4ad5
--- /dev/null
+++ b/meta/recipes-support/inotify-tools/inotify-tools_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Command line tools and C library providing a simple interface to inotify"
+AUTHOR = "Rohan McGovern <rohan@mcgovern.id.au>"
+HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
+SECTION = "console/devel"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
+
+SRCREV = "e203934e46784bb34c213078423ba1678e0c4936"
+PV = "3.20.1"
+
+SRC_URI = "git://github.com/rvoicilas/${BPN} \
+           file://inotify-nosys-fix-system-call-number.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-doxygen"
+
+PACKAGES =+ "libinotifytools"
+
+FILES_libinotifytools = "${libdir}/lib*.so.*"
-- 
2.23.0


