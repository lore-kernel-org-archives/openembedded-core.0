Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A947CC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 10:45:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15140.1707389145629334782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 02:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gwW2dUp3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27687c8229=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4185wf2j000848
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Feb 2024 10:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/SyXX
	h3EY2lsd8hAd7YPQOjdtBlstscallnjaKTtqG0=; b=gwW2dUp3gWo23BwmRe9v6
	ddnSWlmHDS4CPTItR9MeHexnsSYflCfQ37Rpmz6LuUdFcRWBLAuqsl5/StCEAHTh
	x7g4oPfHmGycXZRhB2IwWRbGTzbYgarLaEfLTt4jjOLZlKL7zc0LIFCYC/uEbMYs
	/vVu63E00sbQOY0sqD6B7HwFqDN50aD93X7J0WV0e195RzLlOMuftTWHHId1Vvob
	oQ72NaTqEkQuF9F1wGfjsvcCoWHuLST3K45ANyBS57LjMUpa7kicQj7qMsKfo5UD
	j6oszSKzUgl2i0cM3X6Q8aAq58SBZZrAL3yrOnhMKiRGaefcP+MI96zJrZx3rfXe
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0n139-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 10:45:44 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 02:45:19 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] curl: Fix CVE-2023-46219
Date: Thu, 8 Feb 2024 10:45:00 +0000
Message-ID: <20240208104500.1433705-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Sl7KI6m70hL3RTtztQkR1M55jisnv0AC
X-Proofpoint-GUID: Sl7KI6m70hL3RTtztQkR1M55jisnv0AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_02,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=673 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402080055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 10:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195129

From: Archana Polampalli <archana.polampalli@windriver.com>

When saving HSTS data to an excessively long file name, curl could end up
removing all contents, making subsequent requests using that file unaware
of the HSTS status they should otherwise use.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../curl/curl/CVE-2023-46219-0001.patch       |  42 ++++++
 .../curl/curl/CVE-2023-46219-0002.patch       | 133 ++++++++++++++++++
 .../curl/curl/CVE-2023-46219-0003.patch       |  81 +++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 4 files changed, 259 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch b/meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
new file mode 100644
index 0000000000..55e8f6fac9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
@@ -0,0 +1,42 @@
+From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
+From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
+Date: Mon, 10 Jul 2023 21:43:28 +0200
+Subject: [PATCH] fopen: optimize
+
+Closes #11419
+
+CVE: CVE-2023-46219
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/fopen.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index ad3691b..92f39cf 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   int fd = -1;
+   *tempname = NULL;
+
+-  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
+-    /* a non-regular file, fallback to direct fopen() */
+-    *fh = fopen(filename, FOPEN_WRITETEXT);
+-    if(*fh)
+-      return CURLE_OK;
++  *fh = fopen(filename, FOPEN_WRITETEXT);
++  if(!*fh)
+     goto fail;
+-  }
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++    return CURLE_OK;
++  fclose(*fh);
++  *fh = NULL;
+
+   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
+   if(result)
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch b/meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
new file mode 100644
index 0000000000..f432fabbb1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
@@ -0,0 +1,133 @@
+From 73b65e94f3531179de45c6f3c836a610e3d0a846 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Nov 2023 08:23:17 +0100
+Subject: [PATCH] fopen: create short(er) temporary file name
+
+Only using random letters in the name plus a ".tmp" extension. Not by
+appending characters to the final file name.
+
+Reported-by: Maksymilian Arciemowicz
+
+Closes #12388
+
+CVE: CVE-2023-46219
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/73b65e94f3531179]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/fopen.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 59 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index 92f39cf..1670e32 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -39,6 +39,50 @@
+ #include "curl_memory.h"
+ #include "memdebug.h"
+
++
++/*
++  The dirslash() function breaks a null-terminated pathname string into
++  directory and filename components then returns the directory component up
++  to, *AND INCLUDING*, a final '/'.  If there is no directory in the path,
++  this instead returns a "" string.
++  This function returns a pointer to malloc'ed memory.
++  The input path to this function is expected to have a file name part.
++*/
++
++#ifdef _WIN32
++#define PATHSEP "\\"
++#define IS_SEP(x) (((x) == '/') || ((x) == '\\'))
++#elif defined(MSDOS) || defined(__EMX__) || defined(OS2)
++#define PATHSEP "\\"
++#define IS_SEP(x) ((x) == '\\')
++#else
++#define PATHSEP "/"
++#define IS_SEP(x) ((x) == '/')
++#endif
++
++static char *dirslash(const char *path)
++{
++  size_t n;
++  struct dynbuf out;
++  DEBUGASSERT(path);
++  Curl_dyn_init(&out, CURL_MAX_INPUT_LENGTH);
++  n = strlen(path);
++  if(n) {
++    /* find the rightmost path separator, if any */
++    while(n && !IS_SEP(path[n-1]))
++      --n;
++    /* skip over all the path separators, if any */
++    while(n && IS_SEP(path[n-1]))
++      --n;
++  }
++  if(Curl_dyn_addn(&out, path, n))
++    return NULL;
++  /* if there was a directory, append a single trailing slash */
++  if(n && Curl_dyn_addn(&out, PATHSEP, 1))
++    return NULL;
++  return Curl_dyn_ptr(&out);
++}
++
+ /*
+  * Curl_fopen() opens a file for writing with a temp name, to be renamed
+  * to the final name when completed. If there is an existing file using this
+@@ -50,25 +94,34 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+                     FILE **fh, char **tempname)
+ {
+   CURLcode result = CURLE_WRITE_ERROR;
+-  unsigned char randsuffix[9];
++  unsigned char randbuf[41];
+   char *tempstore = NULL;
+   struct_stat sb;
+   int fd = -1;
++  char *dir;
+   *tempname = NULL;
+
++  dir = dirslash(filename);
++  if(!dir)
++    goto fail;
++
+   *fh = fopen(filename, FOPEN_WRITETEXT);
+   if(!*fh)
+     goto fail;
+-  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode)){
++    free(dir);
+     return CURLE_OK;
++  }
+   fclose(*fh);
+   *fh = NULL;
+
+-  result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
++  result = Curl_rand_hex(data, randbuf, sizeof(randbuf));
+   if(result)
+     goto fail;
+
+-  tempstore = aprintf("%s.%s.tmp", filename, randsuffix);
++  /* The temp file name should not end up too long for the target file
++     system */
++  tempstore = aprintf("%s%s.tmp", dir, randbuf);
+   if(!tempstore) {
+     result = CURLE_OUT_OF_MEMORY;
+     goto fail;
+@@ -95,6 +148,7 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(!*fh)
+     goto fail;
+
++  free(dir);
+   *tempname = tempstore;
+   return CURLE_OK;
+
+@@ -107,6 +161,7 @@ fail:
+   free(tempstore);
+
+   *tempname = NULL;
++  free(dir);
+   return result;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch b/meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch
new file mode 100644
index 0000000000..3b6f756549
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch
@@ -0,0 +1,81 @@
+From f27b8dba73295cb5296a50f2c19c0739b502eb94 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 24 Nov 2023 09:46:32 +0100
+Subject: [PATCH] fopen: allocate the dir after fopen
+
+Move the allocation of the directory name down to after the fopen() call
+to allow that shortcut code path to avoid a superfluous malloc+free
+cycle.
+
+Follow-up to 73b65e94f35311
+
+Closes #12398
+
+CVE: CVE-2023-46219
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f27b8dba73295cb529]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/fopen.c | 19 ++++++++-----------
+ 1 file changed, 8 insertions(+), 11 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index 1670e32..b663f8b 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -98,18 +98,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   char *tempstore = NULL;
+   struct_stat sb;
+   int fd = -1;
+-  char *dir;
++  char *dir = NULL;
+   *tempname = NULL;
+
+-  dir = dirslash(filename);
+-  if(!dir)
+-    goto fail;
+-
+   *fh = fopen(filename, FOPEN_WRITETEXT);
+   if(!*fh)
+     goto fail;
+   if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode)){
+-    free(dir);
+     return CURLE_OK;
+   }
+   fclose(*fh);
+@@ -119,9 +114,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(result)
+     goto fail;
+
+-  /* The temp file name should not end up too long for the target file
+-     system */
+-  tempstore = aprintf("%s%s.tmp", dir, randbuf);
++  dir = dirslash(filename);
++  if(dir) {
++    /* The temp file name should not end up too long for the target file
++       system */
++    tempstore = aprintf("%s%s.tmp", dir, randbuf);
++    free(dir);
++  }
+   if(!tempstore) {
+     result = CURLE_OUT_OF_MEMORY;
+     goto fail;
+@@ -148,7 +147,6 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(!*fh)
+     goto fail;
+
+-  free(dir);
+   *tempname = tempstore;
+   return CURLE_OK;
+
+@@ -161,7 +159,6 @@ fail:
+   free(tempstore);
+
+   *tempname = NULL;
+-  free(dir);
+   return result;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 9e9ff00bf7..30f0e5f249 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -54,6 +54,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
            file://CVE-2023-46218.patch \
+           file://CVE-2023-46219-0001.patch \
+           file://CVE-2023-46219-0002.patch \
+           file://CVE-2023-46219-0003.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.40.0


