Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC8D77BC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 06:05:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9H65Plr029706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Oct 2017 23:05:25 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Oct 2017 23:05:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 02:05:20 -0400
Message-ID: <1508220321-119344-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/2] perl: fix CVE-2017-12883
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
X-List-Received-Date: Tue, 17 Oct 2017 06:05:25 -0000
Content-Type: text/plain

The cause of this is that the vFAIL macro uses RExC_parse, and that
variable has just been changed in preparation for code after the vFAIL.
The solution is to not change RExC_parse until after the vFAIL.

This is a case where the macro hides stuff that can bite you.

https://perl5.git.perl.org/perl.git/commit/2be4edede4ae226e2eebd4eff28cedd2041f300f

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2017-12883.patch        | 51 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch
new file mode 100644
index 0000000..c58744f
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch
@@ -0,0 +1,51 @@
+From a2b6b82e5eea300a33f148ee5201373726f9f26c Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Tue, 17 Oct 2017 13:36:05 +0800
+Subject: [PATCH] fix CVE-2017-12883
+
+PATCH: [perl #131598]
+
+The cause of this is that the vFAIL macro uses RExC_parse, and that
+variable has just been changed in preparation for code after the vFAIL.
+The solution is to not change RExC_parse until after the vFAIL.
+
+This is a case where the macro hides stuff that can bite you.
+
+Signed-off-by: Karl Williamson <khw@cpan.org>
+Signed-off-by: Steve Hay <steve.m.hay@googlemail.com>
+
+Upstream-Status: Backport
+https://perl5.git.perl.org/perl.git/commit/2be4edede4ae226e2eebd4eff28cedd2041f300f
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ regcomp.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/regcomp.c b/regcomp.c
+index be6cb96..5498d14 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -11918,14 +11918,17 @@ S_grok_bslash_N(pTHX_ RExC_state_t *pRExC_state,
+ 	}
+         sv_catpv(substitute_parse, ")");
+ 
+-        RExC_parse = RExC_start = RExC_adjusted_start = SvPV(substitute_parse,
+-                                                             len);
++        len = SvCUR(substitute_parse);
+ 
+ 	/* Don't allow empty number */
+ 	if (len < (STRLEN) 8) {
+             RExC_parse = endbrace;
+ 	    vFAIL("Invalid hexadecimal number in \\N{U+...}");
+ 	}
++
++        RExC_parse = RExC_start = RExC_adjusted_start
++                                              = SvPV_nolen(substitute_parse);
++
+ 	RExC_end = RExC_parse + len;
+ 
+         /* The values are Unicode, and therefore not subject to recoding, but
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index b55d222..93420f1 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -65,6 +65,7 @@ SRC_URI += " \
         file://perl-errno-generation-gcc5.patch \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
+        file://perl-fix-CVE-2017-12883.patch \
 "
 
 # Fix test case issues
-- 
1.8.3.1


