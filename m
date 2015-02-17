Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B18D265C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:48:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1H5mQ70019112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Feb 2015 21:48:26 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Feb 2015 21:48:26 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 00:47:45 -0500
Message-ID: <1424152066-23546-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1424152066-23546-1-git-send-email-paul.gortmaker@windriver.com>
References: <1424152066-23546-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] coreutils: import prebuilt manpages from Gentoo
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
X-List-Received-Date: Tue, 17 Feb 2015 05:48:24 -0000
Content-Type: text/plain

As can be seen here:

http://lists.gnu.org/archive/html/coreutils/2014-11/msg00001.html

other people have run into the headache of trying to cross compile
coreutils, with the "help2man" problem (assumes host can run the
target binaries with "--help" arg to collect data for manpage.)

And since "current wisdom is this is working as intended" we are
largely left with no choice but to use the same solution and
abandon trying to generate the man pages at build time.  So here
we import prebuilt manpages.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.23.bb | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.23.bb b/meta/recipes-core/coreutils/coreutils_8.23.bb
index be68a310311a..63df75e7baf2 100644
--- a/meta/recipes-core/coreutils/coreutils_8.23.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.23.bb
@@ -12,14 +12,17 @@ DEPENDS_class-native = ""
 
 inherit autotools gettext texinfo
 
-SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
+           http://distfiles.gentoo.org/distfiles/${BP}-man.tar.xz;name=manpages \
            file://man-decouple-manpages-from-build.patch \
            file://remove-usr-local-lib-from-m4.patch \
            file://fix-selinux-flask.patch \
           "
 
-SRC_URI[md5sum] = "abed135279f87ad6762ce57ff6d89c41"
-SRC_URI[sha256sum] = "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
+SRC_URI[tarball.md5sum] = "abed135279f87ad6762ce57ff6d89c41"
+SRC_URI[tarball.sha256sum] = "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
+SRC_URI[manpages.md5sum] = "ce49bc8360e16afe67581d136606efc7"
+SRC_URI[manpages.sha256sum] = "d1b16e74b3dba4f313aeebae2c69da205f7d2e6e1c2aa8d39026c860d314ecca"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
@@ -71,6 +74,13 @@ do_install_append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
+
+	# prebuilt man pages
+	install -d ${D}/${mandir}/man1
+	install -t ${D}/${mandir}/man1 ${S}/man/*.1
+	# prebuilt man pages don't do a separate man page for [ vs test.
+	# see comment above r.e. sed and update-alternatives
+	cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
 }
 
 do_install_append_class-native(){
@@ -82,18 +92,23 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
+ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1"
 
 ALTERNATIVE_LINK_NAME[base64] = "${base_bindir}/base64"
 ALTERNATIVE_TARGET[base64] = "${bindir}/base64.${BPN}"
+ALTERNATIVE_LINK_NAME[base64.1] = "${mandir}/man1/base64.1"
 
 ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
 ALTERNATIVE_TARGET[mktemp] = "${bindir}/mktemp.${BPN}"
+ALTERNATIVE_LINK_NAME[mktemp.1] = "${mandir}/man1/mktemp.1"
 
 ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
 ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
+ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
 
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
+ALTERNATIVE_LINK_NAME[lbracket.1] = "${mandir}/man1/lbracket.1"
 
 python __anonymous() {
 	for prog in d.getVar('base_bindir_progs', True).split():
-- 
2.2.1


