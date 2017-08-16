Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82410783B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 21:46:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GLkCn9023093
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 14:46:12 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 14:46:11 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 14:46:11 -0700
Message-ID: <20170816214611.244031-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] ruby: fix CVE-2017-9224
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
X-List-Received-Date: Wed, 16 Aug 2017 21:46:11 -0000
Content-Type: text/plain

Use DATA_ENSURE(1) before access.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ruby/ruby/ruby-CVE-2017-9224.patch             | 41 ++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.4.1.bb           |  4 +++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch

diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
new file mode 100644
index 0000000..848139b
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
@@ -0,0 +1,41 @@
+From 690313a061f7a4fa614ec5cc8368b4f2284e059b Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Tue, 23 May 2017 10:28:58 +0900
+Subject: [PATCH] fix #57 : DATA_ENSURE() check must be before data access
+
+---
+ regexec.c |    5 -----
+ 1 file changed, 5 deletions(-)
+
+--- end of original header
+
+CVE: CVE-2017-9224
+
+Context modified so that patch applies for version 2.4.1.
+
+Upstream-Status: Pending
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/regexec.c b/regexec.c
+index 35fef11..d4e577d 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -1473,14 +1473,9 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+       NEXT;
+
+     CASE(OP_EXACT1)  MOP_IN(OP_EXACT1);
+-#if 0
+       DATA_ENSURE(1);
+       if (*p != *s) goto fail;
+       p++; s++;
+-#endif
+-      if (*p != *s++) goto fail;
+-      DATA_ENSURE(0);
+-      p++;
+       MOP_OUT;
+       break;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.4.1.bb b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
index 1d335f1..77e17f1 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
@@ -1,5 +1,9 @@
 require ruby.inc
 
+SRC_URI += " \
+           file://ruby-CVE-2017-9224.patch \
+           "
+
 SRC_URI[md5sum] = "782bca562e474dd25956dd0017d92677"
 SRC_URI[sha256sum] = "a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250"
 
-- 
2.7.4


