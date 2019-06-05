Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 084056C149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 22:50:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x55Mofcn007927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jun 2019 15:50:41 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 5 Jun 2019 15:50:40 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2019 15:50:40 -0700
Message-ID: <20190605225040.213296-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] slang: modify an array test
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
X-List-Received-Date: Wed, 05 Jun 2019 22:50:41 -0000
Content-Type: text/plain

One array test attempts to create an array that is far too
large to exist.  Different exceptions are thrown for 32 and 64
bit machines, so we account for that when catching them.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-extended/slang/slang/array_test.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-extended/slang/slang/array_test.patch

diff --git a/meta/recipes-extended/slang/slang/array_test.patch b/meta/recipes-extended/slang/slang/array_test.patch
new file mode 100644
index 0000000..ccd416f
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/array_test.patch
@@ -0,0 +1,20 @@
+slang: modify array test
+
+One array test tries to create an array that is far too large and anticipates an exception.
+IndexError will only be thrown for 64 bit machines, so we add InvalidParmError for 32 bit ones.
+
+Upstream-Status: Submitted [jedsoft.org]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/src/test/array.sl
++++ b/src/test/array.sl
+@@ -165,7 +165,7 @@ try
+ {
+    SS = Long_Type[10000,10000,10000,10000,10000,10000];
+ }
+-catch IndexError;
++catch IndexError,InvalidParmError;
+ 
+ private define array_map2_func ()
+ {
-- 
2.7.4


