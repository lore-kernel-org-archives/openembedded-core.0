Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.2667.1588755398790501375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 01:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=GmC+XYvg;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588755398; x=1620291398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/kHhZtfzkt/YhucANxOBFRzbtfH5jY0v1ud5icPn1Cs=;
  b=GmC+XYvg4fMVWK2U3DqUbs3dS6N2LQiG8Ng4OIA/oje++J0QsW7W9Ocl
   HNH4adMs0R8DTH7SwqRDpXsYq46ZqlVq2pzoXWjrMI82gJ3D4/9xqFeSI
   coFT7cnkgaPgzO+wodGjLy+ylEsnN2KBfI9kdHeTZrK4iZITG8uGuhpwI
   DvyjK3LTJqQw66ROsbJTxQVn6DvDln6BOFemSMxw/NUv0FMpi/ohSA1q+
   D7phtRzeVEySqcx8SohHRHVIsaPdzxJXuXQbfnHczKAR+aJYi43AHhiPl
   3bgH58wJKLlqHXaN2jGh9S29QaAfWD4B2HFM33YEJK8vQMgx1bKRY1ze4
   w==;
IronPort-SDR: 1FNn/rRNMWpOsw73kAlzKwGCP5yqjeiSex7yP7dzL25sR35cxu3gGKGg/06PyLvzd0gZiRwVNG
 +W2y2a9AMZ2Zm1cGZ0gM83Z5tQVqIUWJzbIeyC28U8SUJxdkBuHkwVi+pNkYBlcDWhEH944r5/
 5wBkNKfXIWMijYSHqgbK+IPM0bqgSLcb1xVOgnK/jYQb1lQAzHL2ukBcnK9CMn5inh4d3wQJzN
 tO4X11+sccIXrtS/BkPpycoPNxxeuP4//ne14jXHOo5JeMf5HV75cRNqyg1/T+Vl6Oo2ZBQEHs
 ZX0=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="2575583"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 2/2] cpio: add patch to fix issues with gcc 10
Date: Wed, 6 May 2020 10:56:19 +0200
Message-ID: <20200506085619.2110220-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506085619.2110220-1-richard.leitner@skidata.com>
References: <20200506085619.2110220-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gcc 10 introduced "-fno-common" as default. Therefore backport the
according cpio patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...ove-superfluous-declaration-of-progr.patch | 29 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
new file mode 100644
index 0000000000..bef37f12ae
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
@@ -0,0 +1,29 @@
+From 33e6cb5a28fab3d99bd6818f8c01e6f33805390f Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 20 Jan 2020 07:45:39 +0200
+Subject: [PATCH] src/global.c: Remove superfluous declaration of program_name
+
+This is cpio upstream commit 641d3f4 (Minor fix * src/global.c:
+Remove superfluous declaration of program_name, 2020-01-20)
+
+---
+ src/global.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/global.c b/src/global.c
+index fb3abe9..acf92bc 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -184,9 +184,6 @@ unsigned int warn_option = 0;
+ /* Extract to standard output? */
+ bool to_stdout_option = false;
+ 
+-/* The name this program was run with.  */
+-char *program_name;
+-
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+ int (*xstat) ();
+-- 
+2.26.2
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index ecea8c6d8e..9e35a80f8b 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.26.2

