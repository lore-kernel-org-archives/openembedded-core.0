Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY0J-0002XN-NB
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:55 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0018B2FE86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:15 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:44 -0700
Message-Id: <75824ff13f43b330b11cf9a130f061baee785e1a.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0018B2FE86.ED3A3
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 13/16] groff: Fix build on Fedora 17
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:56 -0000

From: "Song.Li" <Song.Li@windriver.com>

Generally distros keep perl at /usr/bin/perl
But Fedora 17 also has /bin/perl,
this causes groff_1.20.1 build to put perl
interpreter path as /bin/perl
But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation
like this:

| error: Failed dependencies:
|       bin/perl is needed by groff-1.20.1-r1.ppc603e

Signed-off-by: Song.Li <song.li@windriver.com>

Sync up with the do_install_append_virtclass-native chunk.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/groff/groff_1.20.1.bb |   24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.20.1.bb
index 6cb72bf..ef22548 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.20.1.bb
@@ -4,7 +4,7 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -18,6 +18,10 @@ DEPENDS_virtclass-native = ""
 
 inherit autotools
 
+PERLPATH = "${bindir}/perl"
+PERLPATH_virtclass-native = "/usr/bin/env perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
+
 EXTRA_OECONF = "--without-x"
 PARALLEL_MAKE = ""
 
@@ -34,7 +38,25 @@ do_configure_prepend() {
 	fi
 }
 
+do_install_append() {
+	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+	for i in afmtodit mmroff; do
+		if [ -f ${D}${bindir}/$i ]; then
+			sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/$i
+		fi
+	done
+}
+
 do_install_append_virtclass-native() {
+	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+	for i in afmtodit mmroff; do
+		if [ -f ${D}${bindir}/$i ]; then
+			sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/$i
+		fi
+	done
+
 	create_cmdline_wrapper ${D}/${bindir}/groff \
 		-F${STAGING_DIR_NATIVE}${datadir_native}/groff/${PV}/font \
 		-M${STAGING_DIR_NATIVE}${datadir_native}/groff/${PV}/tmac
-- 
1.7.9.5



