Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EBCC43217
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:18 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.2701.1642713857228160426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SZRCcJHE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id h12so7292399pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GGhYoXdboYt6BGrcGbjNROCw2qxK2zOYTeNEd07SQEA=;
        b=SZRCcJHEar2QCB6/eIGOhLJOo7lzHh0YzxZz5w7XOJnLGc3CmvV8OlNk7hVf4wIunk
         MbPvrHm2FTiR4odl+5gkuJlNp+ELG25F/jwQEbKPGq5iVvIAd8gtAbXw4f6tRSbAd0v0
         dg8WHC13zY8KDQ8KdDs4cO7Yz/GI94G3O06mtKPbXCvw9840xH3Y33PE7B8YBzRXTmvQ
         hlzRL+JghonV5uVw0LMdLGIJu0/Fk9lwNLMAV+It37Pp5yDr/gr7mKI2JbWIVKwYzw4w
         ODjnEntT6GmyiNeUXHu5CpHimAnHeYZr3n18L3EpstzDx3vFLKOQ6X86OYAyy70akSL9
         ganA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGhYoXdboYt6BGrcGbjNROCw2qxK2zOYTeNEd07SQEA=;
        b=a+dYS+D4ElBALMoRKnIsI+V9NZswN3lPzNYHlw+HtgnZeBOPJvYnKCXWyr6IUbd8bj
         A6SSxsu/1zPJEmENE1Su0KLXjF6ltJb82UQocZJxd52InSDkTcEo2z98hMO1xX+/65HW
         rF+PihI3/aONjOT1IZOWXOgapllUDUnRpKpLnsoAOrNhi7Dr2OL46Zbr3RZ5XcgCpHqf
         MEtPkJF2ga5pLeLlejb/Txq5qGLNZ1lfriMM45lfCfp+RaB3aEmHTF/DR23t2gcFegHJ
         FN9Dk8HykFvKp5uB06ynEanf/Ike3hsTNcA2aAqT77Y8SJzMwIKNdTk1Qs6do8SQC6La
         mUfQ==
X-Gm-Message-State: AOAM531Kg5b570P/whj8XLaPnCSA6n+lRNcWSOJkgaHWXx21iYJuI8xJ
	7eFRIk4Os2XLBhifkhfambnMByy9vFp+fEDMPTE=
X-Google-Smtp-Source: 
 ABdhPJwbwoB6JUkVYcSlGc2lPxsZRMrGMyaucRwnjeXmJRFYFWFjAp7hFqUtsaTreS746zcce6qj8w==
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
 mi12mr1033343pjb.85.1642713855913;
        Thu, 20 Jan 2022 13:24:15 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] speex: fix CVE-2020-23903
Date: Thu, 20 Jan 2022 11:23:43 -1000
Message-Id: 
 <6afe9d7d0381b593c0b1e434c48008c7fa62750c.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160794

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2020-23903.

CVE: CVE-2020-23903

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8f56e5e9eef32c1e01742f913e205d93548de1f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../speex/speex/CVE-2020-23903.patch          | 30 +++++++++++++++++++
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch

diff --git a/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
new file mode 100644
index 0000000000..eb16e95ffc
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
@@ -0,0 +1,30 @@
+Backport patch to fix CVE-2020-23903.
+
+CVE: CVE-2020-23903
+Upstream-Status: Backport [https://github.com/xiph/speex/commit/870ff84]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 870ff845b32f314aec0036641ffe18aba4916887 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Mon, 13 Jul 2020 23:25:03 -0400
+Subject: [PATCH] wav_io: guard against invalid channel numbers
+
+Fixes #13
+---
+ src/wav_io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/wav_io.c b/src/wav_io.c
+index b5183015..09d62eb0 100644
+--- a/src/wav_io.c
++++ b/src/wav_io.c
+@@ -111,7 +111,7 @@ int read_wav_header(FILE *file, int *rate, int *channels, int *format, spx_int32
+    stmp = le_short(stmp);
+    *channels = stmp;
+ 
+-   if (stmp>2)
++   if (stmp>2 || stmp<1)
+    {
+       fprintf (stderr, "Only mono and (intensity) stereo supported\n");
+       return -1;
diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
index 3a0911d6f8..ea475f0f1b 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
                     file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz \
+           file://CVE-2020-23903.patch \
+           "
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
-- 
2.25.1


