Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B295105D996
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 02:32:59 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.97515.1775615571130658930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 19:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fuBOh99X;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ce102afb0aso4514743eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 19:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775615570; x=1776220370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+jqoPTC8IhRzStcU0eU7R6IVXZcdyDtyZiduQqGZUs=;
        b=fuBOh99XoxLgXCD6cBSdEHwSLsaXzIRr5qQSe00JdJ79dCh+Z0l8EfHXcHn1qWHzyH
         S0c8SpbdHXR6k4+yvq/xZxiFucS+UlVAOrEY6NWSIReHPy8veoGJlvTE0UuUEzWiEr+7
         vxdBoPcSkbGV4rAAPct1v+gDa5Z4GBVA00wMbzb1jVmPEd1IrTfoRd/PWqPOIdEpxs+7
         5qCMCrcNrRUKaDB6MFt0Ofzq4HhMqTNwyBOLuhUxopC++GTGqS3A3+IekApYyv6ULdkY
         RSCpxfBO8iyWsTgR1idFpIL/33RFW1x2fVsBTKr8R4bJ8QCekycmfu4ZYpbeCAp4i5wf
         WFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775615570; x=1776220370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+jqoPTC8IhRzStcU0eU7R6IVXZcdyDtyZiduQqGZUs=;
        b=D5KPZnhKiu2liwSfSsXtgU+gwgxMUho7e9C/7JVfav3Ec3Pb4mDtRv3umGdUewHcq9
         89YFEFXriEbdzAQh3g/CnxcpYw0jIFnUBqbixoHUSY98LXpmGVv7I0gplXEXoqRwLMwk
         i1dzZRxKQbfhfxTfF5olnRFD4vqsLoVsSReCJjXbflO7Q/Eas0rhDHrj0N3aj+bAwunb
         znKbJobATNY09nQtKi3mpgV2SYTMqxceSrp4OGTY0JAQUkF02CEcfWpti96JflB8fXjG
         7na9dHt2QkkUWGoJLQN0Xsix5UtqJ76mtvEW1jMU6sUpst/w2fNPc2n6kp7X8k5eeORO
         NSag==
X-Gm-Message-State: AOJu0YyKfb6BnMQHGQ7tBcZVSzKFSg2dPcS17aQjviLZGIGCQd5C64gL
	IvPEPPXbpGPivtV43KtyCJVebOM93NgtNJmpnldeiBNHEiEwuZBdDLli+Wrzqy/Z
X-Gm-Gg: AeBDievKySKB2et4XevgrC4Tp9yP9Bs8Ts4RFxEakq8TEnxxTzIobzyRrlzYMP7SfBL
	fpFaG8WvnF3LTGziWXlQQM6S/nFh2nvh209jDi14Ujrkq7GtpvCYVPTID6o/20E6IWllSXXtIjz
	eSk0EdDnh2vH0MyLSDqWNob05Z8sLmsL4ktrvGq8YKRATYJGjG9N+uS4sp8k8JEpZj+yxQWRmPE
	x+aWe+R9B/xGFOLnfymoWAGXQgotR0fVqnFK5cSSp2E26iQ2f3RctQBGJE+vn94I88cXwE3HErr
	q/TVl1i9gfQ2On6bYvQ4BeJuutaUG/RhSgdLWSAAwffOI17pH6gO5EUHmb0JDohG/OXnbQYGyL1
	iisvfdYcoluGXYYqe7I+ZjnJ9f5zP9nQEvRahZXUcZnaPRRO74fx7n4zca1pfZhHH0CgM4KyVzf
	3ZTHBqZn7V35QwbkExhyiP6n5SnjxF1d1Hd2EY1f0JgiFa7w0ppO3chhVFsJarwj3EBrrPQoRbt
	HQ+ZfuHMoK2Eh7qmA3NZE0V9YlkZLbAwsasIEfVHmml6hhLYgRbpi4AadmRtWdoUthicSI=
X-Received: by 2002:a05:693c:2b0f:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-2cf3de7472amr5296610eec.27.1775615570086;
        Tue, 07 Apr 2026 19:32:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm24439844eec.14.2026.04.07.19.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 19:32:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] apr-utils: Fix old style function prototype warning with clang
Date: Tue,  7 Apr 2026 19:32:46 -0700
Message-ID: <20260408023246.297244-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 02:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234793

Fixes build with autoconf-2.73 + clang-22

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...le-function-prototype-warning-with-c.patch | 130 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch

diff --git a/meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch b/meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch
new file mode 100644
index 0000000000..e523859927
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch
@@ -0,0 +1,130 @@
+From 05afaf207eaff4c175198abd129ed1acde220df3 Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Thu, 14 Mar 2024 15:52:25 +0000
+Subject: [PATCH] sdbm: Fix old style function prototype warning with clang
+
+This fixes the following warning with clang
+
+../dbm/sdbm/sdbm_pair.c:63:1: warning: a function definition without a prototype is
+deprecated in all versions of C and is not supported in C2x [-Wdeprecated-non-prototype]
+   63 | fitpair(pag, need)
+      | ^
+
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/073368a46fbe92995927258ae2fc97d3920872f2]
+Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
+Submitted by: Biswapriyo Nath <nathbappai@gmail.com>
+Github: closes #47
+
+Merges r1912679 from ^/apr/apr/trunk
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.7.x@1916307 13f79535-47bb-0310-9956-ffa450edef68
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dbm/sdbm/sdbm_pair.c | 39 +++++++++------------------------------
+ 1 file changed, 9 insertions(+), 30 deletions(-)
+
+diff --git a/dbm/sdbm/sdbm_pair.c b/dbm/sdbm/sdbm_pair.c
+index 50d7965..6ecaff6 100644
+--- a/dbm/sdbm/sdbm_pair.c
++++ b/dbm/sdbm/sdbm_pair.c
+@@ -60,9 +60,7 @@ static int seepair(char *, int, char *, int);
+  */
+ 
+ int
+-fitpair(pag, need)
+-char *pag;
+-int need;
++fitpair(char *pag, int need)
+ {
+ 	register int n;
+ 	register int off;
+@@ -79,10 +77,7 @@ int need;
+ }
+ 
+ void
+-putpair(pag, key, val)
+-char *pag;
+-apr_sdbm_datum_t key;
+-apr_sdbm_datum_t val;
++putpair(char *pag, apr_sdbm_datum_t key, apr_sdbm_datum_t val)
+ {
+ 	register int n;
+ 	register int off;
+@@ -108,9 +103,7 @@ apr_sdbm_datum_t val;
+ }
+ 
+ apr_sdbm_datum_t
+-getpair(pag, key)
+-char *pag;
+-apr_sdbm_datum_t key;
++getpair(char *pag, apr_sdbm_datum_t key)
+ {
+ 	register int i;
+ 	register int n;
+@@ -129,18 +122,14 @@ apr_sdbm_datum_t key;
+ }
+ 
+ int
+-duppair(pag, key)
+-char *pag;
+-apr_sdbm_datum_t key;
++duppair(char *pag, apr_sdbm_datum_t key)
+ {
+ 	register short *ino = (short *) pag;
+ 	return ino[0] > 0 && seepair(pag, ino[0], key.dptr, key.dsize) > 0;
+ }
+ 
+ apr_sdbm_datum_t
+-getnkey(pag, num)
+-char *pag;
+-int num;
++getnkey(char *pag, int num)
+ {
+ 	apr_sdbm_datum_t key;
+ 	register int off;
+@@ -159,9 +148,7 @@ int num;
+ }
+ 
+ int
+-delpair(pag, key)
+-char *pag;
+-apr_sdbm_datum_t key;
++delpair(char *pag, apr_sdbm_datum_t key)
+ {
+ 	register int n;
+ 	register int i;
+@@ -231,11 +218,7 @@ apr_sdbm_datum_t key;
+  * return 0 if not found.
+  */
+ static int
+-seepair(pag, n, key, siz)
+-char *pag;
+-register int n;
+-register char *key;
+-register int siz;
++seepair(char *pag, register int n, register char *key, register int siz)
+ {
+ 	register int i;
+ 	register int off = PBLKSIZ;
+@@ -251,10 +234,7 @@ register int siz;
+ }
+ 
+ void
+-splpage(pag, new, sbit)
+-char *pag;
+-char *new;
+-long sbit;
++splpage(char *pag, char *new, long sbit)
+ {
+ 	apr_sdbm_datum_t key;
+ 	apr_sdbm_datum_t val;
+@@ -295,8 +275,7 @@ long sbit;
+  * this could be made more rigorous.
+  */
+ int
+-chkpage(pag)
+-char *pag;
++chkpage(char *pag)
+ {
+ 	register int n;
+ 	register int off;
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index b5e3d2fc8a..17dc79cc9a 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=158aa0b1efe0c12f23d4b007ddb9a5db \
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
+	       file://0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch \
            file://run-ptest \
            "
 

