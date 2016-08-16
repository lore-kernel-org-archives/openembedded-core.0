Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 773C66FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:38:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7G7cfA0013169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 16 Aug 2016 00:38:41 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 00:38:40 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 03:38:36 -0400
Message-ID: <93f5be66f6ed8ba3d772775b87b2265f0e39a95e.1471332921.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1471332921.git.dengke.du@windriver.com>
References: <cover.1471332921.git.dengke.du@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Tue, 16 Aug 2016 07:38:43 -0000
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

3. Add the sanity check for locales

   When run the intl.tests, we need the following locales:

	en_US & fr_FR & de_DE

   So add the locales check for the intl.tests in run-ptest.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 +++++++++++++++++++++
 meta/recipes-extended/bash/bash/run-ptest          |  20 ++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   3 +-
 3 files changed, 132 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index 2098fa4..c61fabd 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -1,2 +1,22 @@
 #!/bin/sh
+
+en_US=`locale -a | grep en_US*`
+fr_FR=`locale -a | grep fr_FR*`
+de_DE=`locale -a | grep de_DE*`
+
+if [ -z "$en_US" ]
+then
+        echo "Warning: The en_US* locales is needed to run the intl.tests, please add it."
+fi
+ 
+if [ -z "$fr_FR" ]
+then
+        echo "Warning: The fr_FR* locales is needed to run the intl.tests, please add it."
+fi
+ 
+if [ -z "$de_DE" ]
+then
+        echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
+fi
+
 make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd`  runtest
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


