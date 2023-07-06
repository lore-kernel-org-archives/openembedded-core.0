Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7597EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:51:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.23251.1688651467280813833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EnvIF3Jg;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b6f9edac8dso10201111fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688651465; x=1691243465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SmvLv01SrwV++o22PAyh9NcTS+PpzlEh0+ZhiWV/Uhg=;
        b=EnvIF3JgeJxl7sAta1IDFahtjjicpzguAIER9KsrvZjVsZpXkwkPHUUzYnEQlLPnZQ
         pBhGgNLxJRvMkRDSqy/EY9TtUH0/sOF6ZWzg0kosyUwhRfRlR1V+Ezidc3Ay5HOsD2G+
         /GXrtGN50hkulsOCz1vjbjRrzBswvpdjCvLOODUHUVnEIkZeLWXsjvnYqnfJBLmr6DpG
         mZDU3CW+00llLrxlWNWBDmDR1UuAEq2w5f6fWXh6Kqxe+A4hZ2E1HUCcb2ejGNhvedsn
         QGe/hsDsQ+/tQ9TlC+RLvIV7FOvdLhu9vMZCUqZPDUWvOHzxt7ScsSVDPAfORR+sSHfD
         W18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688651465; x=1691243465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmvLv01SrwV++o22PAyh9NcTS+PpzlEh0+ZhiWV/Uhg=;
        b=c/LGgxxhHV33XjQZc3GPd7R43KuIEMfkPTvS3rUoIgld5nusFVUhA+kbVm4SEQYJ0X
         aVN4rUBY6dbcWoa6vX2hP8ZW5jfn5CkDjT9iU2T9iR27D35n+qvQ6mwoJBn/EzBK04/P
         bH2Dx3ZCSnio5mrlI0I43dpwwgkXEw3oGmRWkV8HiLEjn+fIKYe7QEZaFpE9k15R09S7
         tNw27cn1LbDrR3Fkn/O3kPaG6Y4vxCEDUyXcNAGWU72vsMtWCesSgTEkchIJ2ZXOMdKg
         7Iuka/sX/BQl/SVuisAJ6dAD0STb7RAIf5Y6LGLwwMYZenR05X6V98eCIXn3ItHCDO1C
         KqYw==
X-Gm-Message-State: ABy/qLb8yH6cRiXDaZqZ+X40CsnA6C85qIaP5upcAJsKyscSJ1Z22007
	O/3ijDBbiiBnSvpW3ZQJWZR56NW/zhwu4GsHvAQ=
X-Google-Smtp-Source: APBJJlFvTBcF/hmxLd5EP+kcQ+cu+hjLYHStFNcePu2nMpd9X46OPP6ZMgb8mlPjoJsgO7p9/0VuC+tcwXzbN5Gw05o=
X-Received: by 2002:a2e:9596:0:b0:2b6:d4f7:b7fa with SMTP id
 w22-20020a2e9596000000b002b6d4f7b7famr1235508ljh.5.1688651465239; Thu, 06 Jul
 2023 06:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
In-Reply-To: <20230706134556.2824413-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jul 2023 15:50:53 +0200
Message-ID: <CANNYZj974iNy5tcgmReWXqHBFE8ySEQ9FTBfMCJmUxkk1=X_nA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183948

I don't understand. We run python ptest all the time, and it doesn't
report fails, so why do we need to disable tests that aren't being
reported as failing?

Besides that, I believe that yes, adding toolchain bits to the image
is actually fine.

Alex

On Thu, 6 Jul 2023 at 15:46, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> This ptest requires gcc, g++, and binutils to pass. This is a lot to add
> for one test, so disable it instead.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...-test_cppext-omit-from-python3-ptest.patch | 37 +++++++++++++++++++
>  .../recipes-devtools/python/python3_3.11.4.bb |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
> new file mode 100644
> index 0000000000..9fca815368
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
> @@ -0,0 +1,37 @@
> +From 11f77795efa9aa15b0459006a16e3bbc72ec69b9 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 5 Jul 2023 14:29:33 -0400
> +Subject: [PATCH] test_cppext: omit from python3 ptest
> +
> +These tests fail when running python3 ptests because gcc, g++, and
> +binutils aren't present. This is a lot to add to the RDEPENDS, so
> +disable the tests instead.
> +
> +[YOCTO # 13298]
> +
> +Upstream-Status: Inappropriate (OE-Specific)
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + Lib/test/test_cppext.py | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Lib/test/test_cppext.py b/Lib/test/test_cppext.py
> +index 465894d24e..93b71d5100 100644
> +--- a/Lib/test/test_cppext.py
> ++++ b/Lib/test/test_cppext.py
> +@@ -17,9 +17,11 @@
> +
> + @support.requires_subprocess()
> + class TestCPPExt(unittest.TestCase):
> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
> +     def test_build_cpp11(self):
> +         self.check_build(False, '_testcpp11ext')
> +
> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
> +     def test_build_cpp03(self):
> +         self.check_build(True, '_testcpp03ext')
> +
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
> index 6b074c48cf..6a471e706d 100644
> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
> @@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://deterministic_imports.patch \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>             file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
> +           file://0001-test_cppext-omit-from-python3-ptest.patch \
>             "
>
>  SRC_URI:append:class-native = " \
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183947): https://lists.openembedded.org/g/openembedded-core/message/183947
> Mute This Topic: https://lists.openembedded.org/mt/99985618/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

