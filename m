Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B7EFF5125
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85284.1775578589824163701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FZ/YAYlS;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a29e6110so33956275e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578588; x=1776183388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=FZ/YAYlS8zHyoHzbbVtH/C7qNEyOlwP/tBJ692kmMRm4KcYaf8bfPoIRkUKoqSZAoU
         +k2QPnZ9fVbpqoPm3runbFI5NdC68cto5LH5e7BGvOCuuUqGo/ijcPj5n2hIIBqdS/3l
         GDBErz/yFvzhbpKDX4dMD2AquPBx00AQHc3/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578588; x=1776183388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=Ld8DmOBEt4OtTyuLOXcS7IGLjWhPi//4Hjnw5pcjDQ3SQnwt8XZb751yCmWnklA2Rv
         f3zJ2g9mj+ivRnkSbt9bTYhxsiYeeAUSopGHoCOoKl9alMpuxZEESD+F72QgG2PS7DMN
         f7VZwx7XejnntdooIBeR32ZSzmMou0hA51Y4+m/1QQx++SyRG2+HrkgRnPCWqjyl2qZY
         L5Ki8o4Yt+5ZM4MP0a3vHuGPKQAZLwh1pGo/QMXMt0ROSKOwmkHIn59khCDxhYbnRZgK
         aXpAoHg5DutARC6okpPeBq0admSRAf4HnMJ/Su6bMccJm0hsJwhYYqSVc4nw8MOLx3sb
         E9Hg==
X-Gm-Message-State: AOJu0YyHO9XT3IhuCBQ7zvJHR5zTWMwpEaNVpf4cVL+C1795Up/tjIV3
	snfOZtbQn/5W/xuY5Eh8co3Ar8uTZc7zi67ID3MKDuW76gnue1ja+F3rK68j43e9F6KmCAC6Dgm
	5yi4+iYU=
X-Gm-Gg: AeBDieuV5ZKOutVFoagOej+CgbqUD3UdSMq9vmbsNbjCpRnzMq84kCS578hX9XbXKs9
	8oOczb6lJtSs92ew91CjxYM49qhZhXACThR3luGjnfNjkrlVMmhVvniLhlAJei/2s6wbrT19fKX
	JMG3Uu9gVGrXJ09G/0HoB/uH4m/HTT3w/nyV2Z466Mwp2oYlYgfUfewSt8hUX83t018DBWaT8o0
	2ruDXo9fc7wdvhG2STEWwgfRaBtUecz6AlQK+URQef50zORpW5zv2anVACex5MktKtsiB47IXNl
	Y8wX8TCPh4o5Y2gXVI7caG1wvqVGoKcH8htQZEAWUgBNLogOh+ZByH+mDfKg3v7p5iHs33Sin3H
	r5xZ8ulCSwr6FMUaGKfPHv5Q+Or/c7j8iEzh1tZNwbHOYfAmTuznkAi2ZVFvw0yItyKTi9WUg8P
	nGNX3pBYdNOvkn5J4Nj2H1TfbF4CW+gzyjCOZ5XH0OytozCehY3U8lxaLGM+mIT1SHuHLJCKM1c
	E7akdWIXsoqbrhSGbasoq1vCCsM
X-Received: by 2002:a05:600c:6305:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-4889978c561mr241491345e9.14.1775578587959;
        Tue, 07 Apr 2026 09:16:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 17/19] curl: patch CVE-2026-3784
Date: Tue,  7 Apr 2026 18:15:54 +0200
Message-ID: <659a32145680054823581ddcf6412410247df108.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234770

From: Vijay Anusuri <vanusuri@mvista.com>

pick patch from ubuntu per [1]

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3784
[3] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3784.patch             | 73 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 00000000000..95784e47637
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,73 @@
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
+Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
+
+CVE: CVE-2026-3784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c                        | 28 +++++++---------------------
+ tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
+ tests/http/testenv/curl.py       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 24 deletions(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     Curl_safe_strcasecompare(data->host.name, needle->host.name))
+-    return TRUE;
++     curl_strequal(data->host.name, needle->host.name)) {
+ 
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
++    return TRUE;
++  }
+   return FALSE;
+ }
+-
+-static bool
+-socks_proxy_info_matches(const struct proxy_info *data,
+-                         const struct proxy_info *needle)
+-{
+-  if(!proxy_info_matches(data, needle))
+-    return FALSE;
+-
+-  /* the user information is case-sensitive
+-     or at least it is not defined as case-insensitive
+-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-
+-  /* curl_strequal does a case insentive comparison, so do not use it here! */
+-  if(Curl_timestrcmp(data->user, needle->user) ||
+-     Curl_timestrcmp(data->passwd, needle->passwd))
+-    return FALSE;
+-  return TRUE;
+-}
+-#else
+-/* disabled, won't get called */
+-#define proxy_info_matches(x,y) FALSE
+-#define socks_proxy_info_matches(x,y) FALSE
+ #endif
+ 
+ /* A connection has to have been idle for a shorter time than 'maxage_conn'
+@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,
+         continue;
+ 
+       if(needle->bits.socksproxy &&
+-        !socks_proxy_info_matches(&needle->socks_proxy,
+-                                  &check->socks_proxy))
++        !proxy_info_matches(&needle->socks_proxy,
++                            &check->socks_proxy))
+         continue;
+ #endif
+       if(needle->bits.conn_to_host != check->bits.conn_to_host)
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index f50af1d4722..a2ee5736810 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -75,6 +75,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-1965-2.patch \
            file://CVE-2026-3783-pre1.patch \
            file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

