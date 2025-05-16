Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DC8C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 08:17:43 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.8365.1747383457456111076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 01:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3YYhTHZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso16330861fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 01:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747383455; x=1747988255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsMKTu1LD3PsAZU+pEDQ7QgK+MsPgWU9HXUcXC4cIlE=;
        b=j3YYhTHZTcqD+Amcewgx+jXxFAJ4r7CpzZ1ABCrAfC+7OlJe7SSzxfvRadEr+UI/p8
         vSyQiKCNiGIwHKm4Vu5zqjzsiHnfHUj7uKcmKrsAE0U3tUyGysxmDBSHhUheu0lTFKfD
         B+uoHLkwMa0Oo6qBFzkvOk6bRga2hxqs7KrGDuDFfBuSGbdNW3Y+k4dEG76THb7cCH+n
         VSXDowW0/u+w8dPTQPyBPPnqdHVMkQKlNhu4X4b5tbtbgc+R6UMvpm7Doi9+TYFoibxW
         f31fhkbYHGBVwOL7VZyEsz9waVuIGsakfG+S6QhyghYBNomZ2u07tihsP6c1uS2InyBD
         NE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383455; x=1747988255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsMKTu1LD3PsAZU+pEDQ7QgK+MsPgWU9HXUcXC4cIlE=;
        b=rQeyK7xrdRFL3mcsHt46vKZEpdTGJ6C2orb0NM48M3ZuIkrqEX0vzbIN5LXB3eiDQY
         lfaUY8gV4T7gvUvp0biVdkld+PWmxmiq8AMvnX5ozNGQNr28BcGCTPwmE4s5uHSjTW1u
         1nMrzWWXVKgjkMeQVbE3SCdqC1QmwKxcnGw+liNJzi7jNh1kGCbZUofqwBP5EqWtYSAi
         pTqDXSW4r3c4ou0Ix7/z9Z7w0T9VTJVXLp3aw5CstqZI0OucZCCXVF7GByMU4J5TGGhz
         B9nDgANW5GGs/rk25iFAbmLhgHg7Mqxw+GTycGPIjYnXJG/HnHCb5/j0usplOlf12m8z
         qT3w==
X-Gm-Message-State: AOJu0Yzgo8JRo3FtPVAEu2IYwrOmAuBiOQO18p/jSrLTVwgDrJV+K2i0
	99q2gC/OpdqVjsntBm7gnuo87oYx0gRv0+PUe1Jy2L97dHbH9+zP5ZRLuWZwb5iK
X-Gm-Gg: ASbGnctGpKuh5ihRLqSnBthdPfWHKZ5mNUjlPuKX+Hn0WR4e+aBtCj538jniQo47Qb8
	/tsAclHg9HBWo1WOlCoRWP8+L1v+/pLF0jBN951u5TwxG4C+KsstzAVFBdEgKWJvpsruaI7i8fv
	ToDg5LUX3pn+S/0mps/9oOd60uiojbAN85VY++tr85yrh/3Axn0fIbmiANEjCC5/T+ZIh4eKKvi
	5NvOK/QeevDCnch7WnTXZX/ol3qUsG8bdPvQW2ORhQYYzD8tkbQCbzL3hP819Mm7pnQO3MQjPdC
	+epKwSY5TurcC42xtHV2Q5ckQMw2vsTdhKW47rx1o0pxIO5kVl2zWbOUGZKegYAiQQAw1Yd+4KM
	BJNSV3Ghdda8aSK8xsszt8F7L4QS3MmRQjw==
X-Google-Smtp-Source: AGHT+IE9ox6OxNFC/1Hel89iuNcAWuMeOytn6kBcaxSk2byniU04hunSwKtNqTU0Fe6A742mGCz5iQ==
X-Received: by 2002:a05:651c:421b:b0:306:10d6:28b0 with SMTP id 38308e7fff4ca-328076e8934mr7971831fa.1.1747383454804;
        Fri, 16 May 2025 01:17:34 -0700 (PDT)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d11desm2945061fa.96.2025.05.16.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:17:34 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: skandigraun@gmail.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] zip: fix a buffer overflow detected issue
Date: Fri, 16 May 2025 10:17:31 +0200
Message-ID: <20250516081731.17716-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 08:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216723

A "buffer overflow detected" issue was observed as follows:
| *** buffer overflow detected ***: terminated
|
| zip error: Interrupted (aborting)

This issue is addressed by:
https://bugzilla.redhat.com/show_bug.cgi?id=2165653

Port the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...fix-a-buffer-overflow-detected-issue.patch | 38 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch b/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch
new file mode 100644
index 0000000000..d760dfcec5
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch
@@ -0,0 +1,38 @@
+From 23b4ed82bff20c737fe2e95d5b035e92a9522ca2 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Thu, 15 May 2025 13:58:45 +0200
+Subject: [PATCH] fileio.c: fix a buffer overflow detected issue
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix a following issue:
+| *** buffer overflow detected ***: terminated
+|
+| zip error: Interrupted (aborting)
+
+Reference: https://bugzilla.redhat.com/show_bug.cgi?id=2165653
+
+Upstream-Status: Inactive-Upstream [the fix is from Redhat but not the official project]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ fileio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fileio.c b/fileio.c
+index 1847e62..5a2959d 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -3502,7 +3502,7 @@ zwchar *local_to_wide_string(local_string)
+   if ((wc_string = (wchar_t *)malloc((wsize + 1) * sizeof(wchar_t))) == NULL) {
+     ZIPERR(ZE_MEM, "local_to_wide_string");
+   }
+-  wsize = mbstowcs(wc_string, local_string, strlen(local_string) + 1);
++  wsize = mbstowcs(wc_string, local_string, wsize + 1);
+   wc_string[wsize] = (wchar_t) 0;
+ 
+   /* in case wchar_t is not zwchar */
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index b573669f2f..27691bd89a 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
+           file://0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.43.0


