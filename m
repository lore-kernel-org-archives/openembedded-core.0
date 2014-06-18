Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8EAC6FD5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 22:48:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5IMmfLJ029911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 15:48:42 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 18 Jun 2014 15:48:41 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 18:48:03 -0400
Message-ID: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perl: strip RPATH from libxml-parser-perl Expat.so
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
X-List-Received-Date: Wed, 18 Jun 2014 22:48:48 -0000
Content-Type: text/plain

To fix:

ERROR: QA Issue: package libxml-parser-perl contains bad RPATH /home/paul/poky/build/tmp/sysroots/intel-corei7-64/usr/lib64 in file /home/paul/poky/build/tmp/work/corei7-64-poky-linux/libxml-parser-perl/2.41-r3/packages-split/libxml-parser-perl/usr/lib64/perl/vendor_perl/5.14.3/auto/XML/Parser/Expat/Expat.so
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/corei7-64-poky-linux/libxml-parser-perl/2.41-r3/temp/log.do_package.28544
ERROR: Task 4102 (/home/paul/poky/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_package) failed with exit code '1'

...which showed up when enabling a multilib build.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index 43a8a84518d3..2488aacb682c 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -27,6 +27,7 @@ do_configure_append() {
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
 	cpan_do_compile
+	chrpath -d ${S}/blib/arch/auto/XML/Parser/Expat/Expat.so
 }
 
 do_compile_class-native() {
-- 
1.9.1


