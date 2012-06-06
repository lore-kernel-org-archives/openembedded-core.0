Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHgK-0002GC-Mc
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:57:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q56ElRYw018018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:47:27 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 07:47:26 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 09:53:13 -0500
Message-ID: <53c01d56966e699d4c1a8cfa2081851df273a8bf.1338994308.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/6] groff: Fix build on Fedora 17
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
X-List-Received-Date: Wed, 06 Jun 2012 14:57:58 -0000
Content-Type: text/plain

From: Song.Li <Song.Li@windriver.com>

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
---
 meta/recipes-extended/groff/groff_1.20.1.bb |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

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
1.7.3.4



