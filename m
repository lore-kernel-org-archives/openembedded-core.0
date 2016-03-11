Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 756ED65C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:40:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2B9eJLH004722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 01:40:19 -0800
Received: from no3.corp.ad.wrs.com (128.224.124.175) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 11 Mar 2016 01:40:18 -0800
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Mar 2016 11:41:26 +0200
Message-ID: <1457689286-30239-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perl: fix missing dependency for perl-misc
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
X-List-Received-Date: Fri, 11 Mar 2016 09:40:21 -0000
Content-Type: text/plain

"perl-misc" package is adding tens of perl utilities which have
depencies on perl-modules.

For example, in order for "prove" to work correctly following modules
are needed:

RDEPENDS_perl-misc += "perl perl-module-app-prove
perl-module-overloading perl-module-tap-base perl-module-file-glob
perl-module-tap-formatter-console perl-module-tap-formatter-base
perl-module-tap-formatter-file perl-module-tap-formatter-session
perl-module-tap-parser perl-module-tap-parser-aggregator
perl-module-tap-parser-scheduler"

If we compile a list of modules needed by the utilities added by
"perl-misc" we may end up having to add hundreds of modules to
RDEPENDS_perl-misc.

Rather than adding hundreds of dependencies only perl-modules was added.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
index 033d4e3..830ecce 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
@@ -13,7 +13,7 @@
 #| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' 
 #| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rdepends
 
-RDEPENDS_perl-misc += "perl"
+RDEPENDS_perl-misc += "perl perl-modules"
 RDEPENDS_${PN}-pod += "perl"
 
 # Some additional dependencies that the above doesn't manage to figure out
-- 
1.9.1


