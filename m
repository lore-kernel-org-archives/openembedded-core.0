Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023DEC54FD1
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2707.1785277335179755305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RGMp3NPG;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954aff6088so2856585e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277333; x=1785882133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mMny7I5hrqIK2DR8XHQTY+qcbx3U6F/iogAnqWFtnGg=;
        b=RGMp3NPGwc6Cxt1EaTwO3yOlfjFnVUOEQepxCPvNXJCujnGIN5vuNg7rmNp6J6bB05
         LuQodyyxtRlOmbYzNCeLSZqmkNhybahGvuzd9rXMZSr3JYYemvrQxCyHrO7mQwerL6jg
         5w1R1Najqu2ZhqAaWUD0BoRniAb7ntcv2r/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277333; x=1785882133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mMny7I5hrqIK2DR8XHQTY+qcbx3U6F/iogAnqWFtnGg=;
        b=tIGhCLjOF6Ql98XIllpKHSa+97FIHkjI1B8XtUVk2jvECbv2qiGiNIwpss/lIWFT86
         lhLUfuJN1ndZdSTvn8zoFIwmKRTABZTvMEo2F6/46nDNlNaxlSGUs3o3qnIpG0EJHUCR
         E9G6te0bvhhMPLw/CfwStxNUtUXhH1XuDi/UkBN7I6iAg6K5l8yGP2Bli2vqLdIOloDZ
         2Wt59hwIkYf4jYWbwiQOmICC7bvgtLUaCcYJeJEcBgu2rY+8yh8i6nJPyVXdo7qCdwgs
         WxFY1L4An4D8/PqUJX7ayigdP7WLIytFQERhVJWHpCi8g53cd3nn4J5fK/kpF3Ssgkq9
         8Kqg==
X-Gm-Message-State: AOJu0YyIcfYvAuyVXO9/ObKCJAATVsHbKDqHwT6lN2F1wMAwppD5zLU2
	NC0XNaQq+g6ZADdbrkCrSjMHO+YJSGRO14lMex4/BPs5GJzOSpXMjB/+dvmjrRTEiONX4I1/X9C
	+2Au7dYM=
X-Gm-Gg: AR+sD12W4C0RGIOIs5ah8VA0PHGu4nZW0fcFvUZG8LsYqWcFkAotpFG8fd1Tc8sP+S6
	3LgG9Siq1XwYzP/7pmqyTGcV/sVhefwDUnijT7q5xnRfaMsflz/q6qwZt+J4d9hRAxTnFHIewIY
	RnKxMD8MF6zyx5Gvs01pkIIRhbZz4Lw7d9AHt8rDxm0ClDExyy8pEsQFE4BxyIYbhzI9aa2zlZh
	Il7bDzbQaDOS4MQi1oecyIsVCqS7W7MSJtATnMcdQ9uVG7Ovn5B008lt0yIvWQDcTvGWVWWb/O1
	x7agkANIDJcTpf15YUpBpdheH4OrOx+OKFwlftEWdwsgPDY7KcU28K0jxmtvF+sF7fgPZKN6c6v
	N9JoVjwBQAwqXuR3K1IjA8eBwvRKvaPoknuL9yEgO0txWWlZmNcLL5HUDzOVQl802SpP14VB8zh
	hhp3pU1w6NB+DlRbiUVk1g/hhvqZd9c6oYcreFqLjt4tjQogGB9J0nZ8w0XFQ15pGPZIsWitdzy
	MYIIJQNwsy1Tyx22y3Tpi6SedbVAkXO5/MS7xk8KEcJfhosvaAW7Kp9TYlCPbA3
X-Received: by 2002:a05:600c:34d2:b0:495:5e07:649b with SMTP id 5b1f17b1804b1-496c6576533mr45705385e9.24.1785277333372;
        Tue, 28 Jul 2026 15:22:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/19] sqlite3: fix CVE-2026-11822 and CVE-2026-11824
Date: Wed, 29 Jul 2026 00:21:51 +0200
Message-ID: <3de44d1dd09907f620ed349dba563c489a5cecb9.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242219

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1], which addresses memory
corruption vulnerabilities in the SQLite FTS5 full-text search extension.
The GitHub mirror commit [1] corresponds to the SQLite Fossil check-in
shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f
[2] https://sqlite.org/src/info/061febcf41ca

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-11822
https://nvd.nist.gov/vuln/detail/CVE-2026-11824

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-11822_CVE-2026-11824.patch       | 41 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
new file mode 100644
index 00000000000..1764d5c6e2c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
@@ -0,0 +1,41 @@
+From ceece94b0040125a12192f6f23b1ec413871b04c Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 11 May 2026 12:00:19 +0000
+Subject: [PATCH] Fix potential buffer overwrite that could occur in fts5 when
+ processing corrupt records.
+
+FossilOrigin-Name: 061febcf41ca4872a0f407951e1507209daca7895122b909a7806c60b6e200c4
+
+CVE: CVE-2026-11822 CVE-2026-11824
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f]
+
+Backport Changes:
+- Applied the upstream fts5LeafRead() fix from ext/fts5/fts5_index.c
+  to sqlite3.c because the Yocto sqlite-autoconf source uses the
+  amalgamated SQLite layout.
+- Omitted ext/fts5/test/fts5corruptA.test because this extracted
+  recipe source contains the SQLite autoconf/amalgamation layout and
+  does not carry the upstream Tcl test tree.
+- Omitted Git mirror metadata files manifest and manifest.uuid because
+  they are not required for the security fix in this source layout.
+
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index fb42adcd7..6acf46a5b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239694,7 +239694,7 @@ static void fts5DataRelease(Fts5Data *pData){
+ static Fts5Data *fts5LeafRead(Fts5Index *p, i64 iRowid){
+   Fts5Data *pRet = fts5DataRead(p, iRowid);
+   if( pRet ){
+-    if( pRet->nn<4 || pRet->szLeaf>pRet->nn ){
++    if( pRet->szLeaf<4 || pRet->szLeaf>pRet->nn ){
+       p->rc = FTS5_CORRUPT;
+       fts5DataRelease(pRet);
+       pRet = 0;
+--
+2.51.0
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 1b3ac83b58d..975f3bdab84 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-6965.patch \
            file://CVE-2025-7709.patch \
            file://CVE-2025-70873.patch \
+           file://CVE-2026-11822_CVE-2026-11824.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 

