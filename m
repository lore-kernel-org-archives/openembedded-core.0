Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 062217320B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 07:30:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3O7UKTS000755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Apr 2018 00:30:20 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 00:30:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 24 Apr 2018 15:37:51 +0800
Message-ID: <1524555471-8816-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524555471-8816-1-git-send-email-hongxu.jia@windriver.com>
References: <1524555471-8816-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perl: fix CVE-2017-12837
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
X-List-Received-Date: Tue, 24 Apr 2018 07:30:20 -0000
Content-Type: text/plain

https://perl5.git.perl.org/perl.git/commitdiff/96c83ed78aeea1a0496dd2b2d935869a822dc8a5

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../perl/perl/CVE-2017-12837.patch                 | 32 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2017-12837.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2017-12837.patch b/meta/recipes-devtools/perl/perl/CVE-2017-12837.patch
new file mode 100644
index 0000000..0b59fcd
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2017-12837.patch
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
index 53a4262..51b5129 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -65,6 +65,7 @@ SRC_URI += " \
         file://perl-test-customized.patch \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
         file://CVE-2017-12883.patch \
+        file://CVE-2017-12837.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


