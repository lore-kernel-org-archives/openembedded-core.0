Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C9CC41513
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 13:33:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11302.1697117614991935397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 06:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SLE2QtBl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86491d060b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39CBT9OI011131
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:33:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=CC/K0sFAtCgMXFmDd5dhRrdWEdmgc0v6c8t7sIUo0BI=; b=
	SLE2QtBlAP2A/uwc7+RFdKVb1UG8NZ7vh27yZbg0zfIWTmg8WBC5b6rrLoW705VB
	w6rYNC5viSdlblv221fMSwe18smDQoQppKRbJA5tY5msjJYXVzBXQoFi8vNFpCF4
	kk50FZmIXEsW/n8iiuh/aj1Re8GJeqLrCa0soMyK3bONVNDO9uYO8OnnQxzzyISR
	KmA4JR9ifZI7ARQw5lP+zHrz3qAJtMuN1z7SxJeMqBhR8aRMSl1Bqe9xGkxpvAs9
	cMatc7cUfwTHuLydCrLoIMmNGIZYMgefOP0WNm8lMDX61LSNnJyOTIPMXJ25wCvd
	dBHA2w0Xvj8roc7A8m8klQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4sexr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:33:34 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:33:31 -0700
From: apolampa <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][mickledore][PATCH 2/2] curl: fix CVE-2023-38546
Date: Thu, 12 Oct 2023 13:33:17 +0000
Message-ID: <20231012133317.1092301-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231012133317.1092301-1-archana.polampalli@windriver.com>
References: <20231012133317.1092301-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ZBj8F0WhnsKFLyhpM3YqxHPZplGtOgb_
X-Proofpoint-ORIG-GUID: ZBj8F0WhnsKFLyhpM3YqxHPZplGtOgb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=940 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310120111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 13:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188999

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the Curl package. This flaw allows an attacker to insert
cookies into a running program using libcurl if the specific series of conditions are met.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../curl/curl/CVE-2023-38546.patch            | 125 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38546.patch b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
new file mode 100644
index 0000000000..c1d60fe656
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
@@ -0,0 +1,125 @@
+From 61275672b46d9abb3285740467b882e22ed75da8 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 14 Sep 2023 23:28:32 +0200
+Subject: [PATCH] cookie: remove unnecessary struct fields
+
+Plus: reduce the hash table size from 256 to 63. It seems unlikely to
+make much of a speed difference for most use cases but saves 1.5KB of
+data per instance.
+
+Closes #11862
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/61275672b46d9abb32857404]
+
+CVE: CVE-2023-38546
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/cookie.c | 13 +------------
+ lib/cookie.h |  9 ++++-----
+ lib/easy.c   |  4 +---
+ 3 files changed, 6 insertions(+), 20 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0c6e0f7..f9dfa50 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -119,7 +119,6 @@ static void freecookie(struct Cookie *co)
+   free(co->name);
+   free(co->value);
+   free(co->maxage);
+-  free(co->version);
+   free(co);
+ }
+
+@@ -726,11 +725,7 @@ Curl_cookie_add(struct Curl_easy *data,
+           }
+         }
+         else if((nlen == 7) && strncasecompare("version", namep, 7)) {
+-          strstore(&co->version, valuep, vlen);
+-          if(!co->version) {
+-            badcookie = TRUE;
+-            break;
+-          }
++	  /* just ignore */
+         }
+         else if((nlen == 7) && strncasecompare("max-age", namep, 7)) {
+           /*
+@@ -1174,7 +1169,6 @@ Curl_cookie_add(struct Curl_easy *data,
+     free(clist->path);
+     free(clist->spath);
+     free(clist->expirestr);
+-    free(clist->version);
+     free(clist->maxage);
+
+     *clist = *co;  /* then store all the new data */
+@@ -1238,9 +1232,6 @@ struct CookieInfo *Curl_cookie_init(struct Curl_easy *data,
+     c = calloc(1, sizeof(struct CookieInfo));
+     if(!c)
+       return NULL; /* failed to get memory */
+-    c->filename = strdup(file?file:"none"); /* copy the name just in case */
+-    if(!c->filename)
+-      goto fail; /* failed to get memory */
+     /*
+      * Initialize the next_expiration time to signal that we don't have enough
+      * information yet.
+@@ -1394,7 +1385,6 @@ static struct Cookie *dup_cookie(struct Cookie *src)
+     CLONE(name);
+     CLONE(value);
+     CLONE(maxage);
+-    CLONE(version);
+     d->expires = src->expires;
+     d->tailmatch = src->tailmatch;
+     d->secure = src->secure;
+@@ -1611,7 +1601,6 @@ void Curl_cookie_cleanup(struct CookieInfo *c)
+ {
+   if(c) {
+     unsigned int i;
+-    free(c->filename);
+     for(i = 0; i < COOKIE_HASH_SIZE; i++)
+       Curl_cookie_freelist(c->cookies[i]);
+     free(c); /* free the base struct as well */
+diff --git a/lib/cookie.h b/lib/cookie.h
+index 39bb08b..f852c68 100644
+--- a/lib/cookie.h
++++ b/lib/cookie.h
+@@ -56,18 +56,17 @@ struct Cookie {
+ #define COOKIE_PREFIX__SECURE (1<<0)
+ #define COOKIE_PREFIX__HOST (1<<1)
+
+-#define COOKIE_HASH_SIZE 256
++#define COOKIE_HASH_SIZE 63
+
+ struct CookieInfo {
+   /* linked list of cookies we know of */
+   struct Cookie *cookies[COOKIE_HASH_SIZE];
+
+-  char *filename;  /* file we read from/write to */
+-  long numcookies; /* number of cookies in the "jar" */
++  curl_off_t next_expiration; /* the next time at which expiration happens */
++  int numcookies;  /* number of cookies in the "jar" */
++  int lastct;      /* last creation-time used in the jar */
+   bool running;    /* state info, for cookie adding information */
+   bool newsession; /* new session, discard session cookies on load */
+-  int lastct;      /* last creation-time used in the jar */
+-  curl_off_t next_expiration; /* the next time at which expiration happens */
+ };
+
+ /* This is the maximum line length we accept for a cookie line. RFC 2109
+diff --git a/lib/easy.c b/lib/easy.c
+index 27124a7..fddf047 100644
+--- a/lib/easy.c
++++ b/lib/easy.c
+@@ -911,9 +911,7 @@ struct Curl_easy *curl_easy_duphandle(struct Curl_easy *data)
+   if(data->cookies) {
+     /* If cookies are enabled in the parent handle, we enable them
+        in the clone as well! */
+-    outcurl->cookies = Curl_cookie_init(data,
+-                                        data->cookies->filename,
+-                                        outcurl->cookies,
++    outcurl->cookies = Curl_cookie_init(data, NULL, outcurl->cookies,
+                                         data->set.cookiesession);
+     if(!outcurl->cookies)
+       goto fail;
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index bdffe7be34..375b4d2f93 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://CVE-2023-32001.patch \
     file://CVE-2023-28320-fol1.patch \
     file://CVE-2023-38545.patch \
+    file://CVE-2023-38546.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.40.0


