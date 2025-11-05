Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D897CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 10:18:15 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6157.1762337883840336603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 02:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I5M5br7H;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ecf30c734eso63392521cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 02:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762337883; x=1762942683; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wdljmg7pEmWDBWqUDMEUCqnqsWcQTRaO5nHeD3YCBI8=;
        b=I5M5br7HOJmUMCRkGR2sQ+HVr08rvHwnsyuj1+iw5zxOS9OiaiIuxoraZBaWjDImDp
         Yzwgm2H7h61r1O7+gX0w+pOgofUlctjbXpdXUMPbJMiQ+vLG0ywqRXOlh62NcFI1TbiG
         1jOL9tKQuqvnemfghpSCEneAAD7uIJJrBjtGumm95eB2f6sacSqAx/39nnOceBZYyD1u
         k3sSbzpr0DdoU7rWgGYDzyzxvvsY9LIS6uN6xKyna6YO0cEm4MX0HyATVDKhPu/XrUH2
         OaoJWA5TAvEZQL+DSWa6/vKsBP8Iptb8naJ44CJsiyesUvegdLcl4Ld+VjiQjztXZkCO
         A5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762337883; x=1762942683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdljmg7pEmWDBWqUDMEUCqnqsWcQTRaO5nHeD3YCBI8=;
        b=CEAb7MDlZYTSx5s8v63YXBdzdj/Zsis9ypKplJMAMO+GQ01ham8yfMNr4NEnK5ci52
         U1ilRJKWyEjV/URzdLP9A0WCQK4Ps3xWl2NtmhVokAjCw1c+OPzJhKaLUH3qsmHhhZ5x
         3jabi2nN0iUJas0mdZzq3/jyuGrgP6nK7zLfblJYMqsMgC4qX9LJI5kIDRRg+ftxXygX
         9u9RhMXXxOumLKURJ/cdt6FrphyJJTVxbj0sO8bqcG5Bglk9OhH37d2nw9f4sZu692c3
         RBpZuPJUw1RQsCZRVEC269ZWqolvAbH3QKeDM/ZbggLQ9GD1gJaKvoX7i+P8mSsQXxnO
         vmJA==
X-Gm-Message-State: AOJu0YzcmikZBVdAClxDT7Ni/jFaCti06laoxHYwyN64Q3dATM36HtOy
	dNQcwSxqea8KSa6ByyZO5H9RBP7IoOHfrazjQam6OdN7q3NHNG/3cijMgrDfBdVvpcjRwfbM+be
	BBo6Ggx4uXkKpATnGhGaLn74JM6mQf+s=
X-Gm-Gg: ASbGnctAqDZT4S8Wsuwgfmv6FJe4f+Ymu7vYkvfIbSNtefhWQxxhMhNw835HI27sg7F
	a3r6GLZyQwovaPBKjCV4w8f8lMSL/+RYU3rlSbBQc+tEwvMLRRXOwKvGelo349GxBjx5ml/ti/M
	7zrRGGMP+KjUyeH4GbYpnZ8OGke7344NChTXEA+E/B/4DA4U0Q7XSC889PPLRlBMwNY7I2Trb+m
	CYuHKcL0YGi1huSwNViX2zAdA16Ic8/7+wK+j7qF8YcqBcP1OKbVYWfaQ==
X-Google-Smtp-Source: AGHT+IHOhWxFo0hQfKGgUVRfID9Yr2aUXNlsUZarDvnakAPZnbK8xeDGtrZj7ozrQ5o7hhhIq4FkR1oDSaHFbbvw57o=
X-Received: by 2002:a05:622a:a15:b0:4ec:f6ae:d5d9 with SMTP id
 d75a77b69052e-4ed725e75d0mr40910411cf.39.1762337882588; Wed, 05 Nov 2025
 02:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20251105070341.2335739-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251105070341.2335739-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Nov 2025 11:17:49 +0100
X-Gm-Features: AWmQ_blMGO6X9E12bK4VMZzGF7k1-0goSUC8pMkiB3u74Sr7v1j35kez6E1HmSE
Message-ID: <CANNYZj816p0Py9uFEJv+qjL54tRmsmvBegv+nCXU9T53R2VOZg@mail.gmail.com>
Subject: Re: [PATCH v4] icu: use automake ptest output format
To: jiaying.song.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 10:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225750

Thanks for the rework and submission, I think this is good.

Alex

On Wed, 5 Nov 2025 at 08:03, <jiaying.song.cn@windriver.com> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Make ICU ptest output compatible with Automake format.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  ...utput-compatible-with-Automake-forma.patch | 52 +++++++++++++++++++
>  meta/recipes-support/icu/icu_77-1.bb          |  3 +-
>  2 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
>
> diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
> new file mode 100644
> index 0000000000..a3d9b46835
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
> @@ -0,0 +1,52 @@
> +From f56e295e936c6c6d9c7219ef649697891cd11382 Mon Sep 17 00:00:00 2001
> +From: Jiaying Song <jiaying.song.cn@windriver.com>
> +Date: Mon, 3 Nov 2025 11:34:06 +0800
> +Subject: [PATCH] Make ICU ptest output compatible with Automake format
> +
> +Change test result format to PASS/FAIL for Automake compatibility
> +
> +Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3764]
> +
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + test/intltest/intltest.cpp | 4 ++--
> + tools/ctestfw/ctest.c      | 3 ++-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
> +index 33829b0..07071ea 100644
> +--- a/test/intltest/intltest.cpp
> ++++ b/test/intltest/intltest.cpp
> +@@ -830,11 +830,11 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
> +             saveBaseLoc[0]=0; /* reset path */
> +
> +             if (lastErrorCount == errorCount) {
> +-                snprintf( msg, sizeof(msg),  "   } OK:   %s ", name );
> ++                snprintf(msg, sizeof(msg), "PASS: %s\n   }", name);
> +                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
> +                 lastTestFailed = false;
> +             }else{
> +-                snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
> ++                snprintf(msg, sizeof(msg), "FAIL: %s\n   } (ERRORS: %li)", name, static_cast<long>(errorCount - lastErrorCount));
> +                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
> +
> +                 for(int i=0;i<LL_indentlevel;i++) {
> +diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
> +index 7634526..727b164 100644
> +--- a/tools/ctestfw/ctest.c
> ++++ b/tools/ctestfw/ctest.c
> +@@ -413,9 +413,10 @@ static void iterateTestsWithLevel ( const TestNode* root,
> +         ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
> +
> +         if (myERROR_COUNT != ERROR_COUNT) {
> +-          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT, pathToFunction);
> ++          log_testinfo_i("\nFAIL: %s\n} ---[ERRORS: %d]", root->name, ERROR_COUNT - myERROR_COUNT);
> +           strcpy(ERROR_LOG[ERRONEOUS_FUNCTION_COUNT++], pathToFunction);
> +         } else {
> ++          log_testinfo_i("\nPASS: %s\n", root->name);
> +           if(!ON_LINE) { /* had some output */
> +             int spaces = FLAG_INDENT-(depth-1);
> +             log_testinfo_i("} %*s[OK] ", spaces, "---");
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
> index fa25b3e7c8..370c14af81 100644
> --- a/meta/recipes-support/icu/icu_77-1.bb
> +++ b/meta/recipes-support/icu/icu_77-1.bb
> @@ -122,7 +122,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
>             file://0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch \
>             file://0001-test-Add-support-ptest.patch \
>             file://run-ptest \
> -           "
> +           file://0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch \
> +          "
>
>  SRC_URI:append:class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
> --
> 2.34.1
>

