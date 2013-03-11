Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nQ-000161-Ae
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4wme005779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:58 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:36 +0800
Message-ID: <73778a456bb1270f2ae93145daab4bf7fd95adba.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/17] perl_5.14.2.bb:fix errors if configure is reattempted
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:21:59 -0000
Content-Type: text/plain

If configure of perl is reattempted it currently fails as it tries to edit
files outside ${S}. Chaging from ${WORKDIR} to ${S} avoids this issue
and allows rebuilds to work.

Cherry-pick commit f2f0a1aa489f9e6e4414fa758d3dd09a950a106c

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 1c52055..9681f54 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -169,7 +169,7 @@ do_configure() {
 			;;
 	esac
         # These are strewn all over the source tree
-        for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" -m1 "/usr/include/.*\.h" ${WORKDIR}/* -r -l` ${S}/utils/h2xs.PL ; do
+        for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" -m1 "/usr/include/.*\.h" ${S}/* -r -l` ${S}/utils/h2xs.PL ; do
             echo Fixing: $foo
             sed -e 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i $foo
         done
-- 
1.7.10.4



