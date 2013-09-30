Return-Path: <marius.avram@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 86B3160EAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 12:30:22 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2013 05:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1007,1371106800"; d="scan'208";a="367692005"
Received: from mavram-vostro.rb.intel.com ([10.237.105.72])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2013 05:30:22 -0700
From: Marius Avram <marius.avram@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2013 15:31:38 +0300
Message-Id: <1380544298-7822-1-git-send-email-marius.avram@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Irina Patru <irina.patru@intel.com>
Subject: [PATCH] slang: fix sprintf bug concerning 8-bit characters
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
X-List-Received-Date: Mon, 30 Sep 2013 12:30:23 -0000

Buffer used for copying a "%c" character was getting
out of scope when it was required by the sprintf operation.

[YOCTO #5272]

Signed-off-by: Marius Avram <marius.avram@intel.com>
Signed-off-by: Irina Patru <irina.patru@intel.com>
---
 .../sprintf-bug-concerning-8-bit-characters.patch  |   42 ++++++++++++++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |    1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch

diff --git a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch b/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
new file mode 100644
index 0000000..ddf5cce
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Backported
+
+From 3a05d1a920140e9f2c72791c12f664213feb46df Mon Sep 17 00:00:00 2001
+From: Manfred Hanke <Manfred.Hanke@tngtech.com>
+Date: Thu, 20 Jun 2013 10:24:12 +0200
+Subject: [PATCH] sprintf bug (concerning %c for 8-bit character in non-UTF8
+ mode) fixed
+
+char *str points to SLuchar_Type utf8_buf[], which had too small scope
+
+src/test/strops.sl failed in the following environment:
+ - compiler:  gcc (Debian 4.7.2-5) 4.7.2
+ - CFLAGS:    -g -O2
+ - libc:      GNU C Library (Debian EGLIBC 2.13-38) stable release version 2.13
+ - kernel:    3.2.0-4-686-pae #1 SMP Debian 3.2.39-2 i686 GNU/Linux
+---
+ src/slstrops.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/slstrops.c b/src/slstrops.c
+index ce6acb0..cbbbb01 100644
+--- a/src/slstrops.c
++++ b/src/slstrops.c
+@@ -1884,6 +1884,7 @@ static char *SLdo_sprintf (char *fmt) /*{{{*/
+ #endif
+    unsigned char uch;
+    int use_long = 0, use_alt_format = 0;
++   SLuchar_Type utf8_buf[SLUTF8_MAX_MBLEN+1];
+ 
+    while (1)
+      {
+@@ -2071,7 +2072,6 @@ static char *SLdo_sprintf (char *fmt) /*{{{*/
+ #endif
+ 	       {
+ 		  SLwchar_Type wc;
+-		  SLuchar_Type utf8_buf[SLUTF8_MAX_MBLEN+1];
+ 
+ 		  if (-1 == SLang_pop_wchar (&wc))
+ 		    return out;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index f06caeb..db5c633 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://rpathfix.patch \
            file://fix-check-pcre.patch \
            file://change-char-type-to-signed-char-in-macros.patch \
+           file://sprintf-bug-concerning-8-bit-characters.patch \
           "
 
 inherit autotools
-- 
1.7.9.5


