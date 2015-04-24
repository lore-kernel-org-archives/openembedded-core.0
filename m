Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D65073D88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sLRr008503
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:10 -0700
Message-ID: <96d37f4d102f86a75a1d045d249abb150f22acf5.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] nspr: remove nspr-CVE-2014-1545.patch
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:24 -0000
Content-Type: text/plain

It is a backport patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nspr/nspr/nspr-CVE-2014-1545.patch             |   67 --------------------
 1 file changed, 67 deletions(-)
 delete mode 100644 meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch

diff --git a/meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch b/meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch
deleted file mode 100644
index 565ff16..0000000
--- a/meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Fix for CVE-2014-1545
-
-Upstream-Status: Backport
-
-Backported from nspr-4.10.6.tar.gz.
----
---- a/pr/src/io/prprf.c
-+++ b/pr/src/io/prprf.c
-@@ -50,6 +50,10 @@
- #include "prlog.h"
- #include "prmem.h"
- 
-+#ifdef _MSC_VER
-+#define snprintf _snprintf
-+#endif
-+
- /*
- ** WARNING: This code may *NOT* call PR_LOG (because PR_LOG calls it)
- */
-@@ -330,7 +334,7 @@
- ** Convert a double precision floating point number into its printable
- ** form.
- **
--** XXX stop using sprintf to convert floating point
-+** XXX stop using snprintf to convert floating point
- */
- static int cvt_f(SprintfState *ss, double d, const char *fmt0, const char *fmt1)
- {
-@@ -338,15 +342,14 @@
-     char fout[300];
-     int amount = fmt1 - fmt0;
- 
--    PR_ASSERT((amount > 0) && (amount < sizeof(fin)));
--    if (amount >= sizeof(fin)) {
--	/* Totally bogus % command to sprintf. Just ignore it */
-+    if (amount <= 0 || amount >= sizeof(fin)) {
-+        /* Totally bogus % command to snprintf. Just ignore it */
- 	return 0;
-     }
-     memcpy(fin, fmt0, amount);
-     fin[amount] = 0;
- 
--    /* Convert floating point using the native sprintf code */
-+    /* Convert floating point using the native snprintf code */
- #ifdef DEBUG
-     {
-         const char *p = fin;
-@@ -356,14 +359,11 @@
-         }
-     }
- #endif
--    sprintf(fout, fin, d);
--
--    /*
--    ** This assert will catch overflow's of fout, when building with
--    ** debugging on. At least this way we can track down the evil piece
--    ** of calling code and fix it!
--    */
--    PR_ASSERT(strlen(fout) < sizeof(fout));
-+    memset(fout, 0, sizeof(fout));
-+    snprintf(fout, sizeof(fout), fin, d);
-+    /* Explicitly null-terminate fout because on Windows snprintf doesn't
-+     * append a null-terminator if the buffer is too small. */
-+    fout[sizeof(fout) - 1] = '\0';
- 
-     return (*ss->stuff)(ss, fout, strlen(fout));
- }
-- 
1.7.9.5


