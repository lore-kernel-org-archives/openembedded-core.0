Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F35CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 21:18:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.26133.1758748679402542089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 14:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xpP3ufso;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27c369f898fso3331375ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758748679; x=1759353479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlxKiunrNz98S/F4lrc7d22CNIZbzsnwcpM6twnOVJ8=;
        b=xpP3ufsowK2SS11R5cEhASH/386VXwhk8MS1gruPm+2PekVDirIgnMIbydIJMH/NyV
         lRGQRbWbF8F6RaIbm4fpt+P74CR3PmqZdiw0x1d0LrHCG4tDroUxiBPDmyhtCTG0mi/p
         wlbj1u8da1j2BM6uKJxw6CSF7KkTpHUxKVAtYirLMKF9scURCH2JnyGewm1QJCfrhBqf
         gkjC3kvsGaCnOngqtgE65KZOsCEuDW3NgZjLyWkYnzEYUJpdo6N2e86c2Ynh49in5iYF
         09a+fGgChl0tCNSrN4fJ6N0+lTpd3ay63wRGennNsxS6A0hobfZLF0p50f6yVR+N1rPd
         b9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748679; x=1759353479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlxKiunrNz98S/F4lrc7d22CNIZbzsnwcpM6twnOVJ8=;
        b=BfhjACtrfYbyRVrghuwZ6soIgQmVtZ4Gua0n/G76O4aCgXoW5A7L5+ICVMrUk+j4o5
         3lIIhjg/uefMpubV8n7/iBa2kUFUl2DQ/G0W3fq1er0xO4JPMrvkCFSvUlVvZkppS9Nl
         fOMuGQ/81ktgLqLV80/IGiqOOYU7vXmXg4bVnv5EcQY39OnNdHtWEr1R7++5o8AHPG88
         bp64RNv0UJy2a2XXX1hshboCUpCVfEsVVlslTpUrR7F42EpiEEabYzcjl1bA/tZc1Nw5
         AhC5eNJ9ZQziOHrTeuP2yP0OF85Ii2l4jAZdvM8gAV/qVRI4vInfcfbw1Y2sNyHWSguz
         2Gvw==
X-Gm-Message-State: AOJu0YycO0/zPK48rEYmPmBq+7tgAX8PxwWAprGqnodq5j8i5c+HQ7Wi
	PtdBBugA733D+morpjecqFugI62QunL1v6GbmJH3TV+wrXSVBwzY4lFiamQkOqmqZFTMZs53HQe
	6OO7mZtY=
X-Gm-Gg: ASbGncu5BLwB98l+v++q49qAzEyqb22xWyA3YEeX1aQ4sFmRV0i7WO+AY8mSQpvHQyC
	szonjFE4+yoXYqaMeParfXgDJmRKqzUrgmpmWms4TNH3us4ddCk3O2Zv+pjyn67DqSoFEQX1k/+
	fuwxIIsFR+5iYs3A9qGfsM70FLbxQVrjadJwYAzUcFaOKvF7k2QnvfBUXdHqoNzXvk1qN33zU09
	ubyH1BFSnCq4XAPy/85qI+bCEodTqMOHG7z+SmarNHwYHt25MgL/plS/fW9IyR59KVe5f1hPJcb
	ag/y2kPyKSCxVoUe2Mpq8SPbpuTzPWjnJeZUlkt+YvjL0yfHSrbWB7DLFixV1/uH5Hits1bxlmD
	NRZWK166c15JkZQ==
X-Google-Smtp-Source: AGHT+IG61WkL7noM6a8BDi27EXNzzaJuO4cKTQjpFvAnrXxxuipGfMKhaLsZ9U3D5lSAuQv+IsGixw==
X-Received: by 2002:a17:903:19e6:b0:266:f01a:98c4 with SMTP id d9443c01a7336-27ed49dece8mr10519135ad.13.1758748678581;
        Wed, 24 Sep 2025 14:17:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6702cf9sm2194555ad.38.2025.09.24.14.17.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:17:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/3] curl: fix CVE-2025-9086
Date: Wed, 24 Sep 2025 14:17:48 -0700
Message-ID: <95ab3c3e3745e7e0ca74760683e42ae7531b4199.1758748538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758748538.git.steve@sakoman.com>
References: <cover.1758748538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223990

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
 meta/recipes-support/curl/curl_8.12.1.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-9086.patch b/meta/recipes-support/curl/curl/CVE-2025-9086.patch
new file mode 100644
index 0000000000..0055d23076
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
+index 9819768..d7ee757 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -324,7 +324,7 @@ static char *sanitize_cookie_path(const char *cookie_path)
+   }
+
+   /* convert /hoge/ to /hoge */
+-  if(len && new_path[len - 1] == '/') {
++  if(len > 1 && new_path[len - 1] == '/') {
+     new_path[len - 1] = 0x0;
+   }
+
+@@ -1039,7 +1039,7 @@ replace_existing(struct Curl_easy *data,
+          clist->spath && co->spath && /* both have paths */
+          clist->secure && !co->secure && !secure) {
+         size_t cllen;
+-        const char *sep;
++        const char *sep = NULL;
+
+         /*
+          * A non-secure cookie may not overlay an existing secure cookie.
+@@ -1048,8 +1048,9 @@ replace_existing(struct Curl_easy *data,
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
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index 9e279bbad1..0fb3719ac2 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2025-9086.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


