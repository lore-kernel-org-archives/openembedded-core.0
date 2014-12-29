Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91672725CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 05:47:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBT5leAu014315
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 28 Dec 2014 21:47:40 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Dec 2014 21:47:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 29 Dec 2014 13:47:23 +0800
Message-ID: <6dc05eff356ab8452cbf946c611aaacd0cf98ae1.1419823474.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419823473.git.hongxu.jia@windriver.com>
References: <cover.1419823473.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] groff: fix native perl path
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
X-List-Received-Date: Mon, 29 Dec 2014 05:47:42 -0000
Content-Type: text/plain

Build groff on a machine with /bin/perl, it gave an error at rootfs time:
...
|ERROR: Unable to install packages. Command 'tmp/sysroots/x86_64-linux/
usr/bin/smart --quiet --data-dir=tmp/work/qemux86-poky-linux/core-image
-minimal/1.0-r0/rootfs/var/lib/smart install -y groff@i586 run-postinsts@all
packagegroup-core-boot@qemux86 perl@i586' returned 1:
|error: Can't install groff-1.22.3-r1@i586: no package provides /bin/perl

ERROR: Function failed: do_rootfs
...

Previously (From OE-Core rev: 79fc557683d4eeadaebeb00dfba53762956e4910 and
103d668cece420447c12987119459ebd49c208df), we manually edit perl scripts
with replacing '/usr/bin/perl' or '/bin/perl' with '/usr/bin/env perl'.
If new perl scripts added after groff upgraded, we have to manually
do the modification on them.

The groff did the above modification according the value of PERL,
so we set it correctly could fix it.

We also add perl and ghostscript to groff DEPENDS, because it requres
perl >= v5.6.1 and ghostscript, see README:
...
 52 Depending on your requirements, you may need at least some of the
 53 following tools to build `groff' directly from its source:
 54
 55   perl >= v5.6.1 (see macro GROFF_PERL in file `m4/groff.m4')
 56   ghostscript
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.3.bb | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index 22c0946..12a260c 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -15,8 +15,11 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
 SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5"
 
-DEPENDS = "groff-native"
-DEPENDS_class-native = ""
+DEPENDS = "groff-native perl ghostscript"
+DEPENDS_class-native = "perl-native ghostscript-native"
+
+export PERL = "${bindir}/perl"
+PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
 inherit autotools texinfo
 
@@ -44,16 +47,6 @@ do_configure_append() {
     cd ${olddir}
 }
 
-do_install_append() {
-	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-	for i in afmtodit mmroff gropdf pdfmom; do
-		if [ -f ${D}${bindir}/$i ]; then
-			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/$i
-		fi
-	done
-}
-
 do_install_append_class-native() {
 	create_cmdline_wrapper ${D}/${bindir}/groff \
 		-F${STAGING_DIR_NATIVE}${datadir_native}/groff/${PV}/font \
-- 
1.9.1


