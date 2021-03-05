Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tSUld+IOTbBevms33WhFYU8+aD/sKtjvk2C/W+Apxy6y93dZJhoCjZe9ALbbMVjBtI2S/BVIUs
 +KZlWKWpYj9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671128"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671128"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:46 -0800
IronPort-SDR: LxoDp3XN1cIomw8nk4d4/3IQEW5L+lUCTWhzgH0a4m+2ysbVL6d4xTxraqU3eCToZNJRwUmHI5
 ZHA8uS+KPgaQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129017"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:44 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 35/52] cups: fix CVE-2020-10001
Date: Fri,  5 Mar 2021 12:21:11 +0800
Message-Id: <22a52f07798a6c5d9e5ed6f76b97970111752192.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

A buffer (read) overflow in the ippReadIO function.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-10001

Upstream patches:
https://github.com/OpenPrinting/cups/commit/efbea1742bd30f842fbbfb87a473e5c84f4162f9

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90eba79bf6f623aa3021eafd0141dad1c3059001)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2020-10001.patch            | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2020-10001.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4a1177467b..244c87001f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2020-10001.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2020-10001.patch b/meta/recipes-extended/cups/cups/CVE-2020-10001.patch
new file mode 100644
index 0000000000..09a0a5765d
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2020-10001.patch
@@ -0,0 +1,74 @@
+From efbea1742bd30f842fbbfb87a473e5c84f4162f9 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 1 Feb 2021 15:02:32 -0500
+Subject: [PATCH] Fix a buffer (read) overflow in ippReadIO (CVE-2020-10001)
+
+Upstream-Status: Backport
+CVE: CVE-2020-10001
+
+Reference to upstream patch:
+[https://github.com/OpenPrinting/cups/commit/efbea1742bd30f842fbbfb87a473e5c84f4162f9]
+
+[SG: Addapted for version 2.3.3]
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ CHANGES.md | 2 ++
+ cups/ipp.c | 8 +++++---
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index df72892..5ca12da 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -4,6 +4,8 @@ CHANGES - 2.3.3 - 2020-04-24
+ Changes in CUPS v2.3.3
+ ----------------------
+ 
++- Security: Fixed a buffer (read) overflow in the `ippReadIO` function
++  (CVE-2020-10001)
+ - CVE-2020-3898: The `ppdOpen` function did not handle invalid UI
+   constraint.  `ppdcSource::get_resolution` function did not handle
+   invalid resolution strings.
+diff --git a/cups/ipp.c b/cups/ipp.c
+index 3d52934..adbb26f 100644
+--- a/cups/ipp.c
++++ b/cups/ipp.c
+@@ -2866,7 +2866,8 @@ ippReadIO(void       *src,		/* I - Data source */
+   unsigned char		*buffer,	/* Data buffer */
+ 			string[IPP_MAX_TEXT],
+ 					/* Small string buffer */
+-			*bufptr;	/* Pointer into buffer */
++			*bufptr,	/* Pointer into buffer */
++			*bufend;	/* End of buffer */
+   ipp_attribute_t	*attr;		/* Current attribute */
+   ipp_tag_t		tag;		/* Current tag */
+   ipp_tag_t		value_tag;	/* Current value tag */
+@@ -3441,6 +3442,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 		}
+ 
+                 bufptr = buffer;
++                bufend = buffer + n;
+ 
+ 	       /*
+ 	        * text-with-language and name-with-language are composite
+@@ -3454,7 +3456,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 
+ 		n = (bufptr[0] << 8) | bufptr[1];
+ 
+-		if ((bufptr + 2 + n) >= (buffer + IPP_BUF_SIZE) || n >= (int)sizeof(string))
++		if ((bufptr + 2 + n + 2) > bufend || n >= (int)sizeof(string))
+ 		{
+ 		  _cupsSetError(IPP_STATUS_ERROR_INTERNAL,
+ 		                _("IPP language length overflows value."), 1);
+@@ -3481,7 +3483,7 @@ ippReadIO(void       *src,		/* I - Data source */
+                 bufptr += 2 + n;
+ 		n = (bufptr[0] << 8) | bufptr[1];
+ 
+-		if ((bufptr + 2 + n) >= (buffer + IPP_BUF_SIZE))
++		if ((bufptr + 2 + n) > bufend)
+ 		{
+ 		  _cupsSetError(IPP_STATUS_ERROR_INTERNAL,
+ 		                _("IPP string length overflows value."), 1);
+-- 
+2.17.1
+
-- 
2.29.2

