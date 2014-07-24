Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1526AD05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 03:27:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O3Rnse012428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 20:27:49 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 23 Jul 2014 20:27:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 23:27:47 -0400
Message-ID: <1406172467-20638-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] nspr: Fix for CVE-2014-1545
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
X-List-Received-Date: Thu, 24 Jul 2014 03:27:54 -0000
Content-Type: text/plain

From: Xufeng Zhang <xufeng.zhang@windriver.com>

Mozilla Netscape Portable Runtime (NSPR) before 4.10.6 allows remote
attackers to execute arbitrary code or cause a denial of service
(out-of-bounds write) via vectors involving the sprintf and console
functions.Per: http://cwe.mitre.org/data/definitions/787.html

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../nspr/nspr/nspr-CVE-2014-1545.patch             | 67 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.10.3.bb           |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch

diff --git a/meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch b/meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch
new file mode 100644
index 0000000..565ff16
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch
@@ -0,0 +1,67 @@
+Fix for CVE-2014-1545
+
+Upstream-Status: Backport
+
+Backported from nspr-4.10.6.tar.gz.
+---
+--- a/pr/src/io/prprf.c
++++ b/pr/src/io/prprf.c
+@@ -50,6 +50,10 @@
+ #include "prlog.h"
+ #include "prmem.h"
+ 
++#ifdef _MSC_VER
++#define snprintf _snprintf
++#endif
++
+ /*
+ ** WARNING: This code may *NOT* call PR_LOG (because PR_LOG calls it)
+ */
+@@ -330,7 +334,7 @@
+ ** Convert a double precision floating point number into its printable
+ ** form.
+ **
+-** XXX stop using sprintf to convert floating point
++** XXX stop using snprintf to convert floating point
+ */
+ static int cvt_f(SprintfState *ss, double d, const char *fmt0, const char *fmt1)
+ {
+@@ -338,15 +342,14 @@
+     char fout[300];
+     int amount = fmt1 - fmt0;
+ 
+-    PR_ASSERT((amount > 0) && (amount < sizeof(fin)));
+-    if (amount >= sizeof(fin)) {
+-	/* Totally bogus % command to sprintf. Just ignore it */
++    if (amount <= 0 || amount >= sizeof(fin)) {
++        /* Totally bogus % command to snprintf. Just ignore it */
+ 	return 0;
+     }
+     memcpy(fin, fmt0, amount);
+     fin[amount] = 0;
+ 
+-    /* Convert floating point using the native sprintf code */
++    /* Convert floating point using the native snprintf code */
+ #ifdef DEBUG
+     {
+         const char *p = fin;
+@@ -356,14 +359,11 @@
+         }
+     }
+ #endif
+-    sprintf(fout, fin, d);
+-
+-    /*
+-    ** This assert will catch overflow's of fout, when building with
+-    ** debugging on. At least this way we can track down the evil piece
+-    ** of calling code and fix it!
+-    */
+-    PR_ASSERT(strlen(fout) < sizeof(fout));
++    memset(fout, 0, sizeof(fout));
++    snprintf(fout, sizeof(fout), fin, d);
++    /* Explicitly null-terminate fout because on Windows snprintf doesn't
++     * append a null-terminator if the buffer is too small. */
++    fout[sizeof(fout) - 1] = '\0';
+ 
+     return (*ss->stuff)(ss, fout, strlen(fout));
+ }
diff --git a/meta/recipes-support/nspr/nspr_4.10.3.bb b/meta/recipes-support/nspr/nspr_4.10.3.bb
index 0adfe3b..60e1bfa 100644
--- a/meta/recipes-support/nspr/nspr_4.10.3.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
            file://trickly-fix-build-on-x86_64.patch \
+           file://nspr-CVE-2014-1545.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
-- 
2.0.0


