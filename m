Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07D5B601D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:23:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8O9NuRN009344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 02:23:56 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 24 Sep 2013 02:23:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2013 17:23:55 +0800
Message-ID: <1380014635-21068-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] perl: do not use pushd
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
X-List-Received-Date: Tue, 24 Sep 2013 09:23:55 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

pushd is not available when system is using dash as default shell

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index caa2b61..15afe2d 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -21,11 +21,11 @@ do_install_ptest () {
 	# Tweaks to make tests pass
 	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
 	# Put all *.t files from the lib dir in the ptest package
-	pushd lib
+	cd lib
 	for file in `find -name \*.t`; do
 	    tar -cf - $file | ( cd ${D}${libdir}/perl/${PV} && tar -xf - )
 	done
-	popd
+	cd ..
 
 	mkdir -p ${D}${libdir}/perl/${PV}/XS
 	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
-- 
1.7.10.4


