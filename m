Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C1DC433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 20:02:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.2149.1638475320659757171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XAmmOmVX;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.47,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f47.google.com with SMTP id u1so1014788wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOSG6J9EDf8ZAQAejPfWTKGvGVigH7z/WYwcjQ76m2E=;
        b=XAmmOmVXHwZ1AxfVLu6nLY/GhVWJqwGRtUHjJRMAJHoivjqQLop1vd86jqX2/5MSky
         RZlE1ksJlHRs21UQ6Si61rcCpmzBlt1GWi6aAEg7z90JeKK3JP5PSLNseiu0z0WMgjz8
         /cRq+3cpLgzVnV40p9MrheBCu7c5lA+/W3QqZDzJVsnbZvqiE0MmkJubr5IEB6byHA3l
         Kul1quZzw530l08AF7I529E1o87Pm/bEPyknieBvthG9c1Wns3eq8oL1uvd1uZW651VK
         ek0f6zK19qCoJeLPksjJv3R6CwFIivFe06x/qEuhcJHj2JDL/nQgTLoLoK3jtT6PMZd4
         tMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOSG6J9EDf8ZAQAejPfWTKGvGVigH7z/WYwcjQ76m2E=;
        b=uk7LTptEI4046yFsbL1fVqOeP2DUw5yWEsXjVzpj6zB2bGEorTmZFRg3L+87ssOJXU
         eLfpEFIocee8NMeGsv+GAq4zjg3zFJ+wkas+mn8AcGzj1m8vCY7+e1gQubPszti8HgM8
         XePu/wwMz6V0m5A8BhikknKSuQizXe2Oamo4W2gvLr9M5K4jKqj4ALdqMSwl4/c9Q6Vs
         vipNa1Q9QyoEPSIxKM/xCwBFoJhcJ0+vrEsVBmh8Ecqkya0Mcjjmkz91fw1GZ1iJgUKO
         NNTm9Nw9iWew4Ltcoved06Di6onqmZ5YHuKx2NaIztioGx3YbjwSm1Lgb1Az88JeobFW
         OucQ==
X-Gm-Message-State: AOAM530C5s4pQsiuVnbQ5QHSZTu14r2lmHdP4KxajyJ7cxQg+c4/UoMP
	mJmmTz1e/3obzyB9fvXuQqgBIAGg5V70WyJdxRj3BA==
X-Google-Smtp-Source: 
 ABdhPJzc8VaZgNSY6epW3YWZhMa7IXFmheD1hWBiZ/ZVr3ZijL5aK6rWQHGsDwn5i80U5VbaJKei5tYiNK7oCoS7rwc=
X-Received: by 2002:adf:f80c:: with SMTP id
 s12mr16604382wrp.627.1638475319031;
 Thu, 02 Dec 2021 12:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20211202112116.1133149-1-alex@linutronix.de>
In-Reply-To: <20211202112116.1133149-1-alex@linutronix.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Dec 2021 10:01:48 -1000
Message-ID: 
 <CAOSpxdZZ5DGDRtNdqbSaUHPrerjfaBz_X9TeruumzPAuQZPgPg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] go-helloworld: test at runtime
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 20:02:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159101

On Thu, Dec 2, 2021 at 1:21 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This adds a smoke check for whether the Go toolchain actually
> produces working executables across a range of architectures.

I'm getting a failure during autobuilder testing (qemuarm64-ptest):

DEBUG: Executing shell function do_configure
# Building C bootstrap tool.
cmd/dist
go tool dist: unknown architecture: aarch64
WARNING: exit code 1 from a shell command.
ERROR: Execution of
'TOPDIR/tmp/work/aarch64-linux/go-native/1.14.15-r0/temp/run.do_configure.318086'
failed with exit code 1

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2609

Steve

> (From OE-Core rev: 2819bb2cf22c6cfcaeaee79f0280097ec9cb9327)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/testimage.bbclass                |  2 +-
>  meta/lib/oeqa/runtime/cases/go.py             | 19 +++++++++++++++++++
>  .../packagegroup-core-tools-testapps.bb       |  7 +++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/runtime/cases/go.py
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index b1aef626f7..80c19b1e60 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -58,7 +58,7 @@ BASICTESTSUITE = "\
>      ping date df ssh scp python perl gi ptest parselogs \
>      logrotate connman systemd oe_syslog pam stap ldd xorg \
>      kernelmodule gcc buildcpio buildlzip buildgalculator \
> -    dnf rpm opkg apt weston"
> +    dnf rpm opkg apt weston go"
>
>  DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
>
> diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
> new file mode 100644
> index 0000000000..89ba2c3ecb
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/go.py
> @@ -0,0 +1,19 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.depends import OETestDepends
> +from oeqa.runtime.decorator.package import OEHasPackage
> +
> +class GoHelloworldTest(OERuntimeTestCase):
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    @OEHasPackage(['go-helloworld'])
> +    def test_gohelloworld(self):
> +        cmd = "go-helloworld"
> +        status, output = self.target.run(cmd)
> +        msg = 'Exit status was not 0. Output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> +
> +        msg = 'Incorrect output: %s' % output
> +        self.assertEqual(output, "Hello, Go examples!", msg=msg)
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> index a5fc152859..3c946c57ef 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> @@ -17,6 +17,12 @@ KEXECTOOLS_microblaze ?= ""
>  KEXECTOOLS_nios2 ?= ""
>  KEXECTOOLS_riscv64 ?= ""
>
> +# go does not support ppc32, only ppc64
> +# https://github.com/golang/go/issues/22885
> +# gccgo may do better
> +GOTOOLS ?= "go-helloworld"
> +GOTOOLS:powerpc ?= ""
> +
>  GSTEXAMPLES ?= "gst-examples"
>  GSTEXAMPLES_riscv64 = ""
>
> @@ -48,4 +54,5 @@ RDEPENDS_${PN} = "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
> +    ${GOTOOLS} \
>      "
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159086): https://lists.openembedded.org/g/openembedded-core/message/159086
> Mute This Topic: https://lists.openembedded.org/mt/87450623/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

