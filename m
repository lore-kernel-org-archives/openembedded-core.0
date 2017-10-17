Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C57571A9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 07:01:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9H71seJ002730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Oct 2017 00:01:54 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 17 Oct 2017 00:01:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 03:01:51 -0400
Message-ID: <1508223712-93849-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V3 1/2] perl: fix CVE-2017-12883
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
X-List-Received-Date: Tue, 17 Oct 2017 07:01:54 -0000
Content-Type: text/plain

The cause of this is that the vFAIL macro uses RExC_parse, and that
variable has just been changed in preparation for code after the vFAIL.
The solution is to not change RExC_parse until after the vFAIL.

This is a case where the macro hides stuff that can bite you.

https://perl5.git.perl.org/perl.git/commit/2be4edede4ae226e2eebd4eff28cedd2041f300f

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2017-12883.patch        | 52 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch
new file mode 100644
index 0000000..d21ba5a
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2017-12883.patch
@@ -0,0 +1,52 @@
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
+CVE: CVE-2017-12883
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
2.8.1


