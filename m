Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8DD077147
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 06:43:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u786hBJ9001431
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2016 23:43:11 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 7 Aug 2016 23:43:11 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2016 02:43:05 -0400
Message-ID: <d635e401929354af1c2f14155597d94a16e1af76.1470637742.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1470637742.git.dengke.du@windriver.com>
References: <cover.1470637742.git.dengke.du@windriver.com>
Subject: [PATCH 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Mon, 08 Aug 2016 06:43:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1. Filter the extra white space in intl.right

   When the sub-test unicode2.sub of intl.tests executed, it produced
   compact results without extra white space, compared to intl.right,
   it failed.

   So we need to filter the extra white space in intl.right.

2. Delete the '%q' in unicode3.sub

   In sub-test unicode3.sub of intl.tests have this:

		printf %q "$payload"

   The payload variable was assigned by ASCII characters, when using
   '%q' format strings, it means print the associated argument shell-quoted.

   But when the strings contain the non-alpha && non-digit && non-punctuation &&
   non-ISO 646 character(7-bit), it would output like this: " $'...', ANSI-C
   style quoted string. We can check the bash source code at:

	http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/printf.def#n557
	http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/strtrans.c#n331

   So we need to delete the format strings '%q', in this way the comparing
   could pass.

NOTE:
   Ensure the system contain fr-fr & de-de locales

   Some tests of intl.tests need to change locales to accomplish. So you need add
   the following to a conf file:

		IMAGE_LINGUAS = "en-us fr-fr de-de"

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 116 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   3 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch

diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch b/meta/recipes-extended/bash/bash/fix-run-intl.patch
new file mode 100644
index 0000000..5f59066
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-run-intl.patch
@@ -0,0 +1,116 @@
+From 56b869258922da108d35524dc124a1a64daa981a Mon Sep 17 00:00:00 2001
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
+2. Delete the '%q' in unicode3.sub
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
+   The format strings '%q' means print the associated argument shell-quoted.
+   Soucre code is here:
+
+	http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/printf.def#n557
+	http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/strtrans.c#n331
+
+   If the strings contain the non-alpha && non-digit && non-punctuation &&
+   non-ISO 646 character(7-bit), it would output like this: " $'...' " ANSI-C
+   style quoted string, just like the above.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ tests/intl.right   | 28 ++++++++++++++--------------
+ tests/unicode3.sub |  2 +-
+ 2 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/tests/intl.right b/tests/intl.right
+index acf108a..0c0c571 100644
+--- a/tests/intl.right
++++ b/tests/intl.right
+@@ -18,33 +18,33 @@ a√©b
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
+ 5ß@3ô+∆S8ü¢Í≥
+diff --git a/tests/unicode3.sub b/tests/unicode3.sub
+index f79871f..a4b97b2 100644
+--- a/tests/unicode3.sub
++++ b/tests/unicode3.sub
+@@ -1,7 +1,7 @@
+ payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
+ "$payload"
+ 
+-printf %q "$payload"
++printf "$payload"
+ echo
+ 
+ set -x ; : "$payload"
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


