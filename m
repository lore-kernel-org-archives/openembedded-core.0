Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858CE1093188
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:56:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7532.1773993389479774345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FMqCjPeA;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so22070085ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773993388; x=1774598188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjBARhUTUqICFt3IMO89NrIcC1A2ebBKU1U2Qy1mTCg=;
        b=FMqCjPeApbf4WqrD0B1pEmVozlAyG931CFpgFaHMjJMy6bVIxJIgIvkPZgQbip3uUV
         Sboo0B789dIbhIilwulkr19UVOYEeantTRsE8oKfYq1IcvcmwN0wyWwllbeeUJUbxRuK
         hjvIdllCWOdC5HO/4zjHKyAbdpEbg+Z2dvf60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773993388; x=1774598188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RjBARhUTUqICFt3IMO89NrIcC1A2ebBKU1U2Qy1mTCg=;
        b=MibobzzyKju/v85q750kHg21k0TSmamKTlZYBwluqiv0FILHsZK22LoarRBUqie8/r
         BOTB2FfQrlbjpTuxxK9Mrlu3htRW7aPLOZg40p4oAVAxzMfdO+p7YPfp0yEle+hM4pLA
         fzPz0Sf4G2WPd1aJ6QJKZgxn6vgrM41r7Jznjo4EZWpGiJGsicSUeSUwV4uoQJrk/lHF
         kCqyKX2IGqr8huoSj6d/BkbAo3GeDRRQ6DrzdmznpGw4jLcKP0JrBVk6dv0U0FdsOOGQ
         jrl2B5EE5epHN/Fvv5Q8vebXk4TMj2lc8q+uLETubiu/QMY7MJGCBPGnrrkgJhcXeeUg
         4drA==
X-Gm-Message-State: AOJu0YzSOYIWqX410uj0FCbwTxsnTulsskjouC0iQwNuZD0qbAZwy9tG
	sh8K223aILx8T+EqwUP5FsXavYkUsKMhRoYj9MZ9/wCgM6lOhp/Tyg2INv+DYvq1sARbiG62uGf
	trBXasno=
X-Gm-Gg: ATEYQzyPDn/7uTCVDNFuOMnYTfPbSo0WU+lwLflmuw7/X5RDmYpuSVbZRM1p3KIXMYs
	+jLOz9KJL+AbMn3URA8oc1YM41pkc1osCmVLI9gnvcnmwgko34AvKbwZsKxCLSWu8qsVMLp2IRj
	UVOxJKM+H1hx90hrCsma7pCR49GBDLHKpknyJpuvd/ODSwMGykIUoUboAeRPBIJsr7jC0LfdBgb
	0dQGdXOg/boTXN1UoOL4VSxUwKHfMptW66TaIkPI4HaVQRdOzQXGQl71vxc2YNKtf1SnIMI39EK
	o7gFeZOlb55ecb7yY43fnDWzeUkYp3gAaQLyAp2r/VCf88cuEM/w3fP8ebFj612Kr8fccpzL82u
	9zKWdzqJ42ZA4hJhcLJk+MA3EGEfuHKpsO5Z/CP5K90rxm584kSJHoscZo0Q41atixqgnSCK6PM
	/SzsFXFFGoyck/yuA114wIaUOXfgoz63sQtQzQVq/aHp/p/HE=
X-Received: by 2002:a17:902:f605:b0:2b0:5084:eb1e with SMTP id d9443c01a7336-2b0827d60d6mr19612275ad.42.1773993388430;
        Fri, 20 Mar 2026 00:56:28 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:8f5f:34a4:6ab0:7770])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm14770965ad.23.2026.03.20.00.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:56:27 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/4] curl: Fix CVE-2026-3784
Date: Fri, 20 Mar 2026 13:26:04 +0530
Message-Id: <20260320075604.551251-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260320075604.551251-1-vanusuri@mvista.com>
References: <20260320075604.551251-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233587

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2026-3784

Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
Upstream commit https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]

Reference: https://curl.se/docs/CVE-2026-3784.html
           https://ubuntu.com/security/CVE-2026-3784

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-3784.patch             | 74 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 0000000000..8f3d56bab9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,74 @@
+Backport of:
+
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
+Upstream commit https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
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
index 8fdd954c7e..c33183e096 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -74,6 +74,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-1965-1.patch \
            file://CVE-2026-1965-2.patch \
            file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


