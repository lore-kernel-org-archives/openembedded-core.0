Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9CBCAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.12030.1758807665859424040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=poK74oar;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so876177a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807665; x=1759412465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR031m3gw6N9C0Bzj2dihlku4pWpOJmUxyfJ+Jmq+7Q=;
        b=poK74oarjWwIF/Qv2xPqPchEu8uOO9ZW3s+FaQeNq4Vn9cBjd4fTwTnYjw1ILOFU7J
         nbhqsHN01GuA5qc93Tt7nqIiesNf1S1LTdkVv3GGaXwJvfpzs/8ftgLU/04FHN0pV+pU
         sC14hzJ5FV/e0cCSfn/zKxZNNy5awDgAZxp1F8YasORXB0VHLIDPTQsx7Y0xPb3kQ4Nw
         lOaRyrLUSU2Ms+uOAxSo6A4smaGN/bkKz1U0zSiAjWCtOMrZo+opPk+tbr82sMS7XL+O
         rJ+WNAwg7JZJLXIAgj/Su3xLbieYgbtXos0k+F2cTox60XcEjB61E3lIBD0rfw4kH0ED
         bM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807665; x=1759412465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YR031m3gw6N9C0Bzj2dihlku4pWpOJmUxyfJ+Jmq+7Q=;
        b=LrGtK3YK7+SuDASj2MUMfBoQV/kqs3s1/0AX+JuoHS6Uwfpp2VBGk5NxloYHVtkpXM
         3mTNpbETTZrtgPWf9763rlTuY8+NyNTYoMXF1JfbgbJecjzaOorRpvlRHvMrnFFAUD00
         Ycqp0eI5MGVUHYcZ7ALaqFErvOyv7OwROBam1Xe7so1w5fC9BQk/VLhfjTNdV3+7Z8DM
         sWu+WrXGJxi3DdaznQsJPrRU8Bw+D7NuFScW45Uy6Ek1+XMFVoDnq1cbmxIJrvCyilsS
         mbGjEfiV+H8qWSWWzHeRiMhr0fodwZEH0U9cHqzizKWwz3iCnluJ0esRxmoF4ZLRTePy
         cP7w==
X-Gm-Message-State: AOJu0Yy27hEmBEWN9vdhfQr2yAGMSNONWo6YZXKUg3ZViF9sDFxq3+K8
	r8gyzeT0Ggf28x3Sf8fa5ppvNmsTbDLDtrbqQsKpL5COnmcMJJnlf9JccWCmTBG+MGH45BSMBmy
	yniGp
X-Gm-Gg: ASbGncuA4ECH+FIRZ+8bRkVrZD962KM5CEGXmYM6ZKnT7QqD2K3JO/lwuiKka605n3b
	AMP96cI+LgbHKxlV5dRdiAYcEzsrkDSONvFxEI+jn7dajHu4VdRbspQVbRTCOYfDKAW62AozXao
	YCGbwUbJroZROxZmW8EbW/FDgse+j0UNEo1Y6ZjfWODOb2ACbax4iJr0CzI1PN2MMJDlz/eUFF9
	2aFrib+PSwArpuJxVw3KMGFHeyeNcx2jNA9oZQBL8BIm97tiQASkjqJiSmCj+JcAfUqre9KeEYK
	wn341QsVSv2s3icpTKwrRiPVJHkVOZvzEwhvYFiyhnRwXdeQELvY6MvdFJAQVd1LHmGCo669EBM
	ia2vPkaS/QccobXBaVQhXL67V
X-Google-Smtp-Source: AGHT+IHGr0+xI+10UMPn9igyG/6YkPAd8pkGq6PmcpN6IMUB8WJkbO6nUKmDpBqxTY3n1qcqtUO7qA==
X-Received: by 2002:a17:90b:4d88:b0:330:4d30:5009 with SMTP id 98e67ed59e1d1-3342a2498cbmr3918457a91.2.1758807664829;
        Thu, 25 Sep 2025 06:41:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/11] curl: fix CVE-2025-9086
Date: Thu, 25 Sep 2025 06:40:46 -0700
Message-ID: <b0cc7001a628deaa96d1aebb5ded52797898a0be.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224020

From: Yogita Urade <yogita.urade@windriver.com>

1, A cookie is set using the secure keyword for https://target
2, curl is redirected to or otherwise made to speak with http://target
(same hostname, but using clear text HTTP) using the same cookie set
3, The same cookie name is set - but with just a slash as path (path="/").
Since this site is not secure, the cookie should just be ignored.
4, A bug in the path comparison logic makes curl read outside a heap buffer boundary

The bug either causes a crash or it potentially makes the comparison come to
the wrong conclusion and lets the clear-text site override the contents of
the secure cookie, contrary to expectations and depending on the memory contents
immediately following the single-byte allocation that holds the path.

The presumed and correct behavior would be to plainly ignore the second set of
the cookie since it was already set as secure on a secure host so overriding
it on an insecure host should not be okay.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9086

Upstream patch:
https://github.com/curl/curl/commit/c6ae07c6a541e0e96d0040afb6

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2025-9086.patch             | 55 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-9086.patch b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
new file mode 100644
index 0000000000..c77d8fe33d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
@@ -0,0 +1,55 @@
+From c6ae07c6a541e0e96d0040afb62b45dd37711300 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 11 Aug 2025 20:23:05 +0200
+Subject: [PATCH] cookie: don't treat the leading slash as trailing
+
+If there is only a leading slash in the path, keep that. Also add an
+assert to make sure the path is never blank.
+
+Reported-by: Google Big Sleep
+Closes #18266
+
+CVE: CVE-2025-9086
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c6ae07c6a541e0e96d0040afb6]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/cookie.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index c1ed291..67494d2 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -316,7 +316,7 @@ static char *sanitize_cookie_path(const char *cookie_path)
+   }
+
+   /* convert /hoge/ to /hoge */
+-  if(len && new_path[len - 1] == '/') {
++  if(len > 1 && new_path[len - 1] == '/') {
+     new_path[len - 1] = 0x0;
+   }
+
+@@ -1074,7 +1074,7 @@ Curl_cookie_add(struct Curl_easy *data,
+          clist->spath && co->spath && /* both have paths */
+          clist->secure && !co->secure && !secure) {
+         size_t cllen;
+-        const char *sep;
++        const char *sep = NULL;
+
+         /*
+          * A non-secure cookie may not overlay an existing secure cookie.
+@@ -1083,8 +1083,9 @@ Curl_cookie_add(struct Curl_easy *data,
+          * "/loginhelper" is ok.
+          */
+
+-        sep = strchr(clist->spath + 1, '/');
+-
++        DEBUGASSERT(clist->spath[0]);
++        if(clist->spath[0])
++          sep = strchr(clist->spath + 1, '/');
+         if(sep)
+           cllen = sep - clist->spath;
+         else
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6845a43cd2..6ed3d6e84d 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0002.patch \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
+    file://CVE-2025-9086.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


