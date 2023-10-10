Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D95CD8C90
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:50 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.92777.1696947286196978324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z6gTkc6Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c61bde0b4bso48403025ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947285; x=1697552085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sqs6G5dCREITbPRgSUAU6tv6PDsdVsfIN6p5nvGRuVg=;
        b=Z6gTkc6Qvd0pHdc3LZwm3tMOOj/RQiNjqx/sdLbFif+GtYdAEOunBoup43+DGLarRb
         R63t40n0k0Cu+yOuzAYPsqsL5KfLA8c5iF51f+oGQj0HniBgU5HZrGw++iM6oTevzFKj
         ydng/0i7KbV/XHSpPSnRJMpMDiIKqq+BoHx6C3IlbL3snJR2/xTHWVpmE6gJkAWjxka3
         v9w6L86hZ/LLUkkOuSQQPg7Aw+n9bL/AJ8kEu701aYofVxi8paMzygYGVpPwMyTPu2Cn
         wbq8GDTy7vAWNC/1WH8pr4T1+0qjBp6VVJWja+0W/BjC5vbysZtdt2w7xpUdi7fwHobc
         3N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947285; x=1697552085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sqs6G5dCREITbPRgSUAU6tv6PDsdVsfIN6p5nvGRuVg=;
        b=jiw7+/Klop9jLgaoZTYTd5LFbyo5+ofSiGI+DzupZZWtyRXfy6PiqAZA2V9BuARnCK
         W4bBxBJAS8BjMjdiBn4/KEbqvfpsx7/4ckAZ3MgQ8JwY/IxyTtSmkCzwBGyXJW9iPSfg
         8wd38tkteIM2Je38x10SjZZbUMWXzH15U3KRlf1jdWNMVkIdczZ4ENAw2w+SqRVo4lje
         ELhizYhExwpC9QEYSoL/5L54dY+7VRy+aWULUJsulGle3bFnw0hY7aZkBCufgWeFRXkr
         SC+zLsG3gez/adjgXEdyQWfDOlRqzTz9QQRqfdzrGMV7EkP5bxxYJK6MJJha+LPWyee0
         DBng==
X-Gm-Message-State: AOJu0YzL+pVuldA2g03aFZaLlgrRTcDY8R0SaZN/GMAbe2r4abolGI8X
	Wfl9K6I5fLBsuOPasDdMw495dJcWQEYHs2P5x6s=
X-Google-Smtp-Source: AGHT+IFr115ai0F1iJSjftXHra0i2c/AAPtuYfTlZpYPKylWelfeROICkP1Pp3Jd7lflSS3lrmYmFw==
X-Received: by 2002:a17:902:c3cd:b0:1c6:1cd8:5b59 with SMTP id j13-20020a170902c3cd00b001c61cd85b59mr17949495plj.1.1696947285305;
        Tue, 10 Oct 2023 07:14:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] libpcre2 : Follow up fix CVE-2022-1586
Date: Tue, 10 Oct 2023 04:14:24 -1000
Message-Id: <7e2fe508b456207fd991ece7621ef8ba24b89e59.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188905

From: Shinu Chandran <shinucha@cisco.com>

CVE-2022-1586 was originally fixed by OE commit
https://github.com/openembedded/openembedded-core/commit/7f4daf88b71f
through libpcre2 commit
https://github.com/PCRE2Project/pcre2/commit/50a51cb7e672

The follow up patch is required to resolve a bug in the initial fix[50a51cb7e672]
https://github.com/PCRE2Project/pcre2/commit/d4fa336fbcc3

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-1586
https://security-tracker.debian.org/tracker/CVE-2022-1586

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcre2/CVE-2022-1586-regression.patch   | 30 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch
new file mode 100644
index 0000000000..42ee417fe7
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch
@@ -0,0 +1,30 @@
+From 5d1e62b0155292b994aa1c96d4ed8ce4346ef4c2 Mon Sep 17 00:00:00 2001
+From: Zoltan Herczeg <hzmester@freemail.hu>
+Date: Thu, 24 Mar 2022 05:34:42 +0000
+Subject: [PATCH] Fix incorrect value reading in JIT.
+
+CVE: CVE-2022-1586
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/d4fa336fbcc3]
+
+(cherry picked from commit d4fa336fbcc388f89095b184ba6d99422cfc676c)
+Signed-off-by: Shinu Chandran <shinucha@cisco.com>
+---
+ src/pcre2_jit_compile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
+index 493c96d..fa57942 100644
+--- a/src/pcre2_jit_compile.c
++++ b/src/pcre2_jit_compile.c
+@@ -7188,7 +7188,7 @@ while (*cc != XCL_END)
+     {
+     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
+     cc++;
+-    if (*cc == PT_CLIST && *cc == XCL_PROP)
++    if (*cc == PT_CLIST && cc[-1] == XCL_PROP)
+       {
+       other_cases = PRIV(ucd_caseless_sets) + cc[1];
+       while (*other_cases != NOTACHAR)
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index 3e1b001c32..53277270d2 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://CVE-2022-1586.patch \
+           file://CVE-2022-1586-regression.patch \
 	    file://CVE-2022-1587.patch \
 	    file://CVE-2022-41409.patch \
 "
-- 
2.34.1


