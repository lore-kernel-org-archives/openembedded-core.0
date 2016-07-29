Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 283E2607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:47:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6T7ljAi031792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 29 Jul 2016 00:47:46 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jul 2016 00:47:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 29 Jul 2016 03:47:41 -0400
Message-ID: <415f1f784875646f2c8545a091aab57bc29801bf.1469778196.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1469778195.git.hongxu.jia@windriver.com>
References: <cover.1469778195.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] groff_1.18.1.4: fix narrowing conversion error
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
X-List-Received-Date: Fri, 29 Jul 2016 07:47:47 -0000
Content-Type: text/plain

While gcc6 used, build old groff (for anti-GPLv3 reasons) failed:
.....
|groff-1.18.1.4/src/devices/grolbp/charset.h:69:1: error: narrowing
conversion of '130' from 'int' to 'char' inside { } [-Wnarrowing]
......

In upstream git://git.savannah.gnu.org/groff.git,
the following commit fix the issue, but the license is GPLV3,
we could not backport it to the old groff which license is GPLV2.
...
commit d180038ae0da19655bc2760ae2043efa0550a76c
Author: Werner LEMBERG <wl@gnu.org>
Date:   Wed Apr 16 21:11:07 2003 +0000
    * src/devices/grolbp/charset.h (symset): Use `unsigned char'.
...

We use another different way to fix the issue.

[YOCTO #9896]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../fix-narrowing-conversion-error.patch           | 61 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.18.1.4.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/fix-narrowing-conversion-error.patch

diff --git a/meta/recipes-extended/groff/groff-1.18.1.4/fix-narrowing-conversion-error.patch b/meta/recipes-extended/groff/groff-1.18.1.4/fix-narrowing-conversion-error.patch
new file mode 100644
index 0000000..4b0176f
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.18.1.4/fix-narrowing-conversion-error.patch
@@ -0,0 +1,61 @@
+From fc289ab69c6d7e4ad489172509a85f68afec43ea Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 29 Jul 2016 03:19:39 -0400
+Subject: [PATCH] fix narrowing conversion error
+
+While gcc6 used, build old groff (for anti-GPLv3 reasons) failed:
+.....
+|groff-1.18.1.4/src/devices/grolbp/charset.h:69:1: error: narrowing
+conversion of '130' from 'int' to 'char' inside { } [-Wnarrowing]
+......
+
+In upstream git://git.savannah.gnu.org/groff.git,
+the following commit fix the issue, but the license is GPLV3,
+we could not backport it to the old groff which license is GPLV2.
+...
+commit d180038ae0da19655bc2760ae2043efa0550a76c
+Author: Werner LEMBERG <wl@gnu.org>
+Date:   Wed Apr 16 21:11:07 2003 +0000
+    * src/devices/grolbp/charset.h (symset): Use `unsigned char'.
+...
+
+We use another different way to fix the issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/devices/grolbp/charset.h | 2 +-
+ src/devices/grolbp/lbp.cc    | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/devices/grolbp/charset.h b/src/devices/grolbp/charset.h
+index adc76f4..e9c6c5b 100644
+--- a/src/devices/grolbp/charset.h
++++ b/src/devices/grolbp/charset.h
+@@ -1,6 +1,6 @@
+ // Definition of the WP54 character set
+ 
+-char symset[] = {
++int symset[] = {
+ 0x57,0x50,0x35,0x34,0x00,0x41,0x76,0x61,0x6e,0x74,0x47,0x61,
+ 0x72,0x64,0x65,0x2d,0x42,0x6f,0x6f,0x6b,0x00,0x41,0x76,
+ 0x61,0x6e,0x74,0x47,0x61,0x72,0x64,0x65,0x2d,0x44,0x65,
+diff --git a/src/devices/grolbp/lbp.cc b/src/devices/grolbp/lbp.cc
+index 76db32a..00d4ca7 100644
+--- a/src/devices/grolbp/lbp.cc
++++ b/src/devices/grolbp/lbp.cc
+@@ -152,8 +152,8 @@ static void wp54charset()
+ {
+   unsigned int i;
+   lbpputs("\033[714;100;29;0;32;120.}");
+-  for (i = 0; i < sizeof(symset); i++)
+-    lbpputc(symset[i]);
++  for (i = 0; i < sizeof(symset)/sizeof(symset[0]); i++)
++    lbpputc((char)symset[i]&0xFF);
+   lbpputs("\033[100;0 D");
+   return;
+ }
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index bd786a3..fc7eb44 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/old/${BP}.tar.gz \
           file://man-local.patch \
           file://mdoc-local.patch \
           file://groff-1.18.1.4-fix-bindir.patch \
+          file://fix-narrowing-conversion-error.patch \
 " 
 
 inherit autotools texinfo
-- 
2.8.1


