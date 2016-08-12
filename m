Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42D9A771C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 02:08:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7C287cZ005448
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:08:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 11 Aug 2016 19:08:06 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2016 22:08:03 -0400
Message-ID: <18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1470967099.git.dengke.du@windriver.com>
References: <cover.1470967099.git.dengke.du@windriver.com>
Subject: [PATCH V2 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Fri, 12 Aug 2016 02:08:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1. Filter the extra white space in intl.right

   When the sub-test unicode2.sub of intl.tests executed, it produced
   compact results without extra white space, compared to intl.right,
   it failed.

   So we need to filter the extra white space in intl.right.

   Import this patch for intl.right from bash devel branch:

	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel

   Commit is:

	85ec0778f9d778e1820fb8c0e3e996f2d1103b45

2. Change intl.right correspond to the unicode3.sub's output

   In sub-test unicode3.sub of intl.tests have this:

		printf %q "$payload"

   The payload variable was assigned by ASCII characters, when using
   '%q' format strings, it means print the associated argument shell-quoted.

   When the strings contain the non-alpha && non-digit && non-punctuation &&
   non-ISO 646 character(7-bit), it would output like this: " $'...', ANSI-C
   style quoted string. We can check the bash source code at:

	http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/printf.def#n557
	http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/strtrans.c#n331

   So we need to change the intl.right contain the correct output of unicode3.sub.

   Import parts of this patch for intl.right from bash devel branch:

	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel

   Commit is:

	74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3

NOTE:
   Ensure the system contain fr-fr & de-de locales

   Some tests of intl.tests need to change locales to accomplish. So you need add
   the following to a conf file:

		IMAGE_LINGUAS = "en-us fr-fr de-de"

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   3 +-
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch

diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch b/meta/recipes-extended/bash/bash/fix-run-intl.patch
new file mode 100644
index 0000000..d4a3409
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-run-intl.patch
@@ -0,0 +1,110 @@
+From a00d3161fd7b6a698bdd2ed5f0ac5faac580ee2a Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 3 Aug 2016 23:13:00 -0400
+Subject: [PATCH] fix run-intl failed
+
+1. Filter extra white space of intl.right
+
+   Due to the extra white space of intl.right, when the result of
+   sub-test unicode2.sub of intl.tests compared to it, the test
+   failed.
+
+   So we need to filter the extra white space of intl.right.
+
+   Import this patch for intl.right from bash devel branch:
+
+	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
+
+   commit is:
+
+	85ec0778f9d778e1820fb8c0e3e996f2d1103b45
+
+2. Change intl.right correspond to the unicode3.sub's output
+
+   In sub-test unicode3.sub of intl.tests, the payload value is:
+
+	payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
+
+   It used quoted string expansion(escaped octal) to assign ASCII
+   characters to variables. So when the test run the following:
+
+	printf %q "$payload"
+
+   It produced:
+
+	$'5\247@3\231+\306S8\237\242\352\263'
+
+   When compared to the intl.right(contain the converted character), it failed.
+
+   Import parts of patch for intl.right from bash devel branch:
+
+	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
+
+   commit is:
+
+	74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
+
+Upstream-Status: Backport
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ tests/intl.right | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/tests/intl.right b/tests/intl.right
+index acf108a..1efdfbe 100644
+--- a/tests/intl.right
++++ b/tests/intl.right
+@@ -18,34 +18,34 @@ a√©b
+ 1.0000
+ 1,0000
+ Passed all 1378 Unicode tests
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   357 277 277 012                                                
++0000000 357 277 277 012
+ 0000004
+-0000000   357 277 277 012                                                
++0000000 357 277 277 012
+ 0000004
+-0000000   012                                                            
++0000000 012
+ 0000001
+-0000000   012                                                            
++0000000 012
+ 0000001
+-0000000   012                                                            
++0000000 012
+ 0000001
+-0000000   012                                                            
++0000000 012
+ 0000001
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   303 277 012                                                    
++0000000 303 277 012
+ 0000003
+-0000000   101 040 302 243 040 305 222 012                                
++0000000 101 040 302 243 040 305 222 012
+ 0000010
+ ./unicode3.sub: line 2: 5ß@3ô+∆S8ü¢Í≥: command not found
+-5ß@3ô+∆S8ü¢Í≥
++$'5\247@3\231+\306S8\237\242\352\263'
+ + : $'5\247@3\231+\306S8\237\242\352\263'
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 95ed392..3f0dd8b 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -20,7 +20,8 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://test-output.patch \
            file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
-	   file://fix-run-builtins.patch \
+           file://fix-run-builtins.patch \
+           file://fix-run-intl.patch \
            "
 
 SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-- 
2.8.1


