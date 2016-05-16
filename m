Return-Path: <Guojian.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA53D601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 08:54:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4G8s1NC001071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 01:54:02 -0700 (PDT)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 16 May 2016 01:54:01 -0700
From: <guojian.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:53:38 +0800
Message-ID: <1463388818-27996-1-git-send-email-guojian.zhou@windriver.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Subject: [PATCH] perl: use PACKAGESPLITFUNCS instead of populate_packages_prepend
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
X-List-Received-Date: Mon, 16 May 2016 08:54:02 -0000
Content-Type: text/plain

From: Guojian Zhou <guojian.zhou@windriver.com>

This is cleaner and leads to more accurate profiles.

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.22.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index bf8b3b6..f955e6f 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -340,7 +340,9 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 ALLOW_EMPTY_perl-modules = "1"
 PACKAGES_append = " perl-modules "
 
-python populate_packages_prepend () {
+PACKAGESPLITFUNCS_prepend = "split_perl_packages "
+
+python split_perl_packages () {
     libdir = d.expand('${libdir}/perl/${PV}')
     do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'perl-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-- 
1.7.12.4


