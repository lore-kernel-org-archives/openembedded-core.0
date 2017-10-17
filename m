Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB7BE78287
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 07:01:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9H71t8v001235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 17 Oct 2017 00:01:56 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 17 Oct 2017 00:01:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 03:01:52 -0400
Message-ID: <1508223712-93849-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1508223712-93849-1-git-send-email-hongxu.jia@windriver.com>
References: <1508223712-93849-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/2] perl: fix CVE-2017-12837
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
X-List-Received-Date: Tue, 17 Oct 2017 07:01:56 -0000
Content-Type: text/plain

https://perl5.git.perl.org/perl.git/commitdiff/96c83ed78aeea1a0496dd2b2d935869a822dc8a5

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2017-12837.patch        | 32 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12837.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12837.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12837.patch
new file mode 100644
index 0000000..2bf71f1
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12837.patch
@@ -0,0 +1,32 @@
+From 73d7247ecab863ef26b5687a37ccc75d6144ad0f Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Tue, 17 Oct 2017 13:49:14 +0800
+Subject: [PATCH] fix CVE-2017-12837
+
+Signed-off-by: Karl Williamson <khw@cpan.org>
+Signed-off-by: Steve Hay <steve.m.hay@googlemail.com>
+
+CVE: CVE-2017-12837
+Upstream-Status: Backport
+https://perl5.git.perl.org/perl.git/commitdiff/96c83ed78aeea1a0496dd2b2d935869a822dc8a5
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ regcomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 5498d14..31ec383 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -13021,6 +13021,7 @@ S_regatom(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth)
+                             goto loopdone;
+                         }
+                         p = RExC_parse;
++                        RExC_parse = parse_start;
+                         if (ender > 0xff) {
+                             REQUIRE_UTF8(flagp);
+                         }
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 93420f1..363bc94 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -66,6 +66,7 @@ SRC_URI += " \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
         file://perl-fix-CVE-2017-12883.patch \
+        file://perl-fix-CVE-2017-12837.patch \
 "
 
 # Fix test case issues
-- 
2.8.1


