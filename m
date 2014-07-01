Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 005066087D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 07:52:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s617qAJR019311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jul 2014 00:52:10 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 1 Jul 2014 00:52:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:51:54 +0800
Message-ID: <5d66647dfde216a36e42a3fe2f47aa3b2f766185.1404200247.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404200247.git.hongxu.jia@windriver.com>
References: <cover.1404200247.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] libxml-parser-perl: fix do_compile failed with unrecognized option '-Wl, -O1'
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
X-List-Received-Date: Tue, 01 Jul 2014 07:52:10 -0000
Content-Type: text/plain

Use '${CCLD}' as '${LD}' which the cpan was doing.
...
i586-poky-linux-ld: unrecognized option '-Wl,-O1'
i586-poky-linux-ld: use the --help option for usage information
...

Also fix do_configure warnings
...
'--SYSROOT' is not a known MakeMaker parameter name.
'-MARCH' is not a known MakeMaker parameter name.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index 43a8a84..26241e8 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
-EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC=${CC} LD=${LD} FULL_AR=${AR}"
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC='${CC}' LD='${CCLD}' FULL_AR='${AR}'"
 
 inherit cpan
 
-- 
1.8.1.2


