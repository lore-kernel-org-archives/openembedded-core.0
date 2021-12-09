Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11A0C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 16:40:38 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.14181.1639068037692059052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 08:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JsmW/Rqd;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id m186so5387880qkb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 08:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BLQ+1jrMwnDBP6h0BvazZzA1mkhKTF3QA7MzjK4O6b8=;
        b=JsmW/Rqd3MM1N9rbepRqzMg3HZVfAPOy2lfE/XsGw4r7+xBS+G+Kl1ArOyt6nJV+RM
         CY073XSp0c8mIOcyc9cIj6mNwELINZJJ3kkg5FIUL31phZnFFMAx939IrxRXqd1QOdbT
         iDuD6xphG25l2RgQGhrjm4O5jeODONsNBnRoJiX+c93Me5vOd3LqMi3wLXAhlfOfwHF5
         vf1GcndWYFRRLT7Q/61SN6wa2LH6txqg1HRVgk+9RG8MAIDDFwx4yLVAE9O7nOmUeMJ5
         XQR+1eGPsmrbMnrPWJdkXSPizf8eIdXVtTlWSOKgao6Hx8lE9Qob1lMhB9Tf6RqlobwG
         3ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BLQ+1jrMwnDBP6h0BvazZzA1mkhKTF3QA7MzjK4O6b8=;
        b=BkusQRQfQnNEnvCqPi02xEPIARc/Yo+iaxK8AXt/OU8f0Xkei/lN/TbsNgLFpzRRWw
         kodjz9e9lp6LetyR3uCm4fm107YFgrOIZoGXKKFjTstgAJyCf476YQ9npXoyhq2nmNzf
         4FbJRTdQ8PTTr3RzUMEi2MsgMGFkJ5NehFZTBUlOSl11w1Tq/c3MzQUN7t7cl3L6FlYb
         4G5FUgrlSiysOnRinoelmgH5cHJH+bPhGdVhMHo8l22ldlOUA7cRzJQv9NJ65nH2p5oE
         dXTL51MMZ/Dx+PE6G+qgaUZfl3M42/giDdiY78Gy3r5/GdVp43ZA0+typ7GezFq5SpZr
         w9MA==
X-Gm-Message-State: AOAM530OcgpeelaJj8dEtbT1Lkg+6x6ykl3hqb5J/icVyqa+rFBjCwqy
	mwpSewvHnLvKeXLGEKTR3I4F22pMjXcN5M6ccDs=
X-Google-Smtp-Source: 
 ABdhPJxtGZ+65U0btM00T1nS6bPw5h0vyJDUav1AjGxJcPMaV3L3sHavyiTKkh/tujuz8WL5Oa78PqspCF9jZxjfAJE=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr14916564qkb.72.1639068036598;
 Thu, 09 Dec 2021 08:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20211209154006.2323679-1-andrei@gherzan.com>
In-Reply-To: <20211209154006.2323679-1-andrei@gherzan.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 08:40:10 -0800
Message-ID: 
 <CAMKF1srj=FoX1Omr-57j35T6gGgU5JcGTdJMdghVjFy45K73-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix tm.h plugin header
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 16:40:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159461

On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> On x86-64, tm.h (needed to build gcc plugins) tries to include
> config/i386/linux64.h, which isn't installed. Fortunately it also isn't
> used, so simply removing the include statement is an ok fix.
>

is it due to multilib support ? if so we might be ok since we may not
be using it
but really it will be good to check it with multilib builds of x86_64/x86

> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@hua=
wei.com>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 3 +++
>  meta/recipes-devtools/gcc/gcc-cross.inc          | 3 +++
>  meta/recipes-devtools/gcc/gcc-target.inc         | 3 +++
>  3 files changed, 9 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
> index 495dd9070b..a64fcc50ce 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -139,6 +139,9 @@ do_install () {
>         cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${=
BINV}/include/
>         cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SY=
S}/${BINV}/include/
>
> +       # Fix a plugin header including a nonexistant (and unnecessary) h=
eader
> +       sed -i -e '/config\/i386\/linux64\.h/d' ${D}${libdir}/gcc/${TARGE=
T_SYS}/${BINV}/plugin/include/tm.h
> +
>         # install LTO linker plugins where binutils tools can find it
>         install -d ${D}${libdir}/bfd-plugins
>         ln -sf ${LIBRELPATH}/liblto_plugin.so ${D}${libdir}/bfd-plugins/l=
iblto_plugin.so
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 3ffa1f0c46..ac34d5116a 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -119,6 +119,9 @@ do_install () {
>         cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${=
BINV}/include/
>         cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SY=
S}/${BINV}/include/
>
> +       # Fix a plugin header including a nonexistant (and unnecessary) h=
eader
> +       sed -i -e '/config\/i386\/linux64\.h/d' ${D}${libdir}/gcc/${TARGE=
T_SYS}/${BINV}/plugin/include/tm.h
> +
>         find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type =
f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm=
 -f
>
>         # install LTO linker plugins where binutils tools can find it
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index bf55e692e6..4d087c5183 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -187,6 +187,9 @@ do_install () {
>         rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/auto=
-build.h
>         rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/bcon=
fig.h
>
> +       # Fix a plugin header including a nonexistant (and unnecessary) h=
eader
> +       sed -i -e '/config\/i386\/linux64\.h/d' ${D}${libdir}/gcc/${TARGE=
T_SYS}/${BINV}/plugin/include/tm.h
> +
>         cd ${D}${bindir}
>
>         # We care about g++ not c++
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159457): https://lists.openembedded.org/g/openembedde=
d-core/message/159457
> Mute This Topic: https://lists.openembedded.org/mt/87614108/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

