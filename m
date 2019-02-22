Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD9CB7CABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 02:16:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1M2FE8c020345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Feb 2019 18:15:55 -0800
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Thu, 21 Feb 2019 18:15:46 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 10:15:44 +0800
Message-ID: <1550801744-5299-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [PATCH] perl: fix incorrect symbolic link for libperl.so
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
X-List-Received-Date: Fri, 22 Feb 2019 02:16:25 -0000
Content-Type: text/plain

The perl-cross uses PERL_API_VERSION but not PERL_VERSION to define
libperl soname: libperl.so.$PERL_API_REVISION.$PERL_API_VERSION.$PERL_API_SUBVERSION.
For perl stable releases, the PERL_API_SUBVERSION is always 0. Specify
the so version for libperl to make sure the libperl.so can be linked to
the correct library.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 71653fe..1cc5480 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -34,6 +34,8 @@ inherit upstream-version-is-even
 
 DEPENDS += "db gdbm zlib virtual/crypt"
 
+PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
+
 do_unpack_append() {
     bb.build.exec_func('do_copy_perlcross', d)
 }
@@ -104,7 +106,7 @@ do_install() {
 
     # Fix up shared library
     rm ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/libperl.so
-    ln -sf ../../../../libperl.so.${PV} ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/libperl.so
+    ln -sf ../../../../libperl.so.${PERL_LIB_VER} ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/libperl.so
 }
 
 do_install_append_class-target() {
-- 
2.7.4


