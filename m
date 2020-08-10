Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.46332.1597071178064241135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lG/pi1ECg04Meb+LddGyWn+gTJvvQnfCkq8WTlPiLsd7Rws1R+P+gx5iqKxpQoWL0yPjNTC+UQ
 6o15c98SXPoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="238376833"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="238376833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:53:00 -0700
IronPort-SDR: QWCFDb3OSNaHoCQWPVN7b9Y+JpMcZ3Iixd42RR0VMlcb8qVWuof8Ku4DNrrHfy0qT2cC7W7DO5
 5GBYNNVkO4AQ==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="494819276"
Received: from sshettyx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.64.39])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 4/4] libpcre: Add fix for CVE-2020-14155
Date: Mon, 10 Aug 2020 22:52:47 +0800
Message-Id: <3f536edfa56ce3f93223c23ed48427a0c24ede1a.1597071024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597071024.git.anuj.mittal@intel.com>
References: <cover.1597071024.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rahul Taya <Rahul.Taya@kpit.com>

Added below patch in libpcre
CVE-2020-14155.patch

This patch fixes below error:
PCRE could allow a remote attacker to execute arbitrary
code on the system, caused by an integer overflow in
libpcre via a large number after (?C substring.
By sending a request with a large number, an attacker
can execute arbitrary code on the system or
cause the application to crash.

Tested-by: Rahul Taya <Rahul.Taya@kpit.com>
Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libpcre/libpcre/CVE-2020-14155.patch      | 41 +++++++++++++++++++
 meta/recipes-support/libpcre/libpcre_8.43.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch

diff --git a/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch b/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
new file mode 100644
index 0000000000..183512fd7d
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
@@ -0,0 +1,41 @@
+--- pcre-8.43/pcre_compile.c    2020-07-05 22:26:25.310501521 +0530
++++ pcre-8.43/pcre_compile1.c   2020-07-05 22:30:22.254489562 +0530
+
+CVE: CVE-2020-14155
+Upstream-Status: Backport [https://vcs.pcre.org/pcre/code/trunk/pcre_compile.c?view=patch&r1=1761&r2=1760&pathrev=1761]
+Signed-off-by: Rahul Taya<Rahul.Taya@kpit.com>
+
+@@ -6,7 +6,7 @@
+ and semantics are as close as possible to those of the Perl 5 language.
+
+                        Written by Philip Hazel
+-           Copyright (c) 1997-2018 University of Cambridge
++           Copyright (c) 1997-2020 University of Cambridge
+
+ -----------------------------------------------------------------------------
+ Redistribution and use in source and binary forms, with or without
+@@ -7130,17 +7130,19 @@
+           int n = 0;
+           ptr++;
+           while(IS_DIGIT(*ptr))
++           {
+             n = n * 10 + *ptr++ - CHAR_0;
++            if (n > 255)
++               {
++               *errorcodeptr = ERR38;
++               goto FAILED;
++               }
++            }
+           if (*ptr != CHAR_RIGHT_PARENTHESIS)
+             {
+             *errorcodeptr = ERR39;
+             goto FAILED;
+             }
+-          if (n > 255)
+-            {
+-            *errorcodeptr = ERR38;
+-            goto FAILED;
+-            }
+           *code++ = n;
+           PUT(code, 0, (int)(ptr - cd->start_pattern + 1)); /* Pattern offset */
+           PUT(code, LINK_SIZE, 0);                          /* Default length */
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.43.bb
index b97af08b25..60ece64504 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://out-of-tree.patch \
            file://run-ptest \
            file://Makefile \
+           file://CVE-2020-14155.patch \
 "
 
 SRC_URI[md5sum] = "636222e79e392c3d95dcc545f24f98c4"
-- 
2.26.2

