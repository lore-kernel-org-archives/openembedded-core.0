Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFC6F46C7F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75685.1775546035115343993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TM6A1g9G;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so27174135e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546033; x=1776150833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=TM6A1g9G2/vL6kySAb2XAZdiYSnPgzekuuj5BrRRdNoKm1kohJYb0fCUrdbouPh/q7
         tnKOvBJ+0CgEyDjaXVM5rk5dbsuNTGvD4eyTKpT0cMFmQ8tFv9bdnswQLzBafL/iHq6e
         JfAlAMCmR8iB3ErBgeY7FAreWyYpVUdreSLDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546033; x=1776150833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=nQT0NQ6p+G5L/eswmRKHk3TB8eI/yll6OkxQDQU3m9u0/KGrilW2DB0pM2o3Dx/Xqp
         a3g+S8EOgDvzC5ukFqoxNTcEN84ur6PWIYP5mBgvkRIL6/+2/rt0s6BORpB7yEwq/lLD
         jcb9BzT+gXl8U8bc9RRrJHGPRo5koeGB1pSqUvdacEOLHTVrhgrGhenRFg+hbD/D+9tP
         Lis2b9YBiUsJXY+mAgUb+hL7SXUPSRvjX9zQbAW7O+OmLjINVB48crk5CU7CFhkSTKc1
         ChfFcgLMqZLTBF9K8Eq6oKoiKt7D2slq5GG8Q5yVs3XVfLLfztAerIJZQrlDGCMlaqMi
         lf2A==
X-Gm-Message-State: AOJu0YwQO1Y9BfvVbtuUZsfa5ETrpb1Y8fjord/2ngAidTVuLCJFAEJG
	l/T6sAY6q3vO/e01QH7MFyKxObasfEfJFcuXfrzd8DM9ZnpRO4uGzgeXSCpMDCnelMwISdV5z48
	p8qIXpXE=
X-Gm-Gg: AeBDiesLA5KdCTI2KdRyFAKxcFOD29nF0NtGlmeHVlHjlpKT9rvKiNY5pATNIfwdJ3a
	gWueUrE8/g5F3tVZ0BAKzPMBvUnrYyJrjVVCVoKzfWy8D2j9dUqYKTWDtZzyNCu1rLrHhyX41Cr
	n8HwIhrpSS0zEwJCSGdbE9fX4+WIw4Mvb2MtPiCh7Xy9mS7aiNuhSk6VSKCDcdPyHBsOM3LStkc
	fDBe1NvHkgeAyPMSR81/6LgnisOVXg+NR6OtUqWJxTiOI7uNxBPhh1pEiQAmJ9ijMkdx6b604jr
	dvLP71qavBm+3tHZLP8ZbKm9bhZ2Y4MMVETA24CRFx+69UewUnkCx50Px8vqvzlIpIYEKjRtpni
	UeW3IxMg5jxlftVptCXgxQOPViEzNFz4jPkyB66rxLGVoZ3zZhaFIph2YRMbK+xZvcpiAlMhAI0
	Grh2CIWqbddmNtHvszHBLoG/HtSOrhP6YIEn6p5GTtBhkcyiCLoKsUhTxlYRjnrkwFG47kDkWkG
	NXWrjUqVQfcGpckvPBfOgYRrvo=
X-Received: by 2002:a05:600c:5292:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488996b021fmr243581695e9.3.1775546033140;
        Tue, 07 Apr 2026 00:13:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 17/18] curl: patch CVE-2026-3784
Date: Tue,  7 Apr 2026 09:13:25 +0200
Message-ID: <659a32145680054823581ddcf6412410247df108.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234721

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
 

