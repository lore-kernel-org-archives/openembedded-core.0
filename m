Return-Path: <joel@jms.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CCAC00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:15:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.14631.1690982148248513992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jms.id.au header.s=google header.b=OKjHNv5y;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: joel.stan@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99357737980so1039950466b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1690982147; x=1691586947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oszZD699zTceOvPt0JmW2MK6mOXfadsMG8hb0+vah8=;
        b=OKjHNv5ySbQdjAWoXLNC4HXfp0eFrIykJIivSIVvL83DORf1mjRmkzVGmguxb/M7BE
         al5UYMEQXSwghUDFyzyinyGPgwfwMKsRilYkes1PRE+D0RtoULftP3ewbUkn++d0G02+
         5Ah3tuuPnO5ZiSBpvPls+ivGlsw6bMVk2iSPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982147; x=1691586947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oszZD699zTceOvPt0JmW2MK6mOXfadsMG8hb0+vah8=;
        b=kjTuJmuehS13pKIg1hbthMXmaV9g8TKSRpPX6nV8jLKd0h3fiqHdW2IZdw6WMMsQA+
         6YTqhr68x931c+ZKLk/0+sk19YFKADePkROWe+5/f6WE3diqsjsy2FfKHgFVN4//aoGD
         oGszE25BYTBcrfvfn3V+4VCd3ie7zK+4E0oKxCe9ZDUHBSMg5qXAkuqM8FplJjUUinYh
         RbYKI6IOuqWg0WuJWVupnu4Ss4dtfha2dYJ1q2SH8MFTM2fQYt+7etvWIHq9rL46FiHJ
         1MVrG+kw5Cz8NKfj29TR3lupgi6boTDOoKcsRyn2cpu52pAphHOABU04VXesptJhL7hV
         WrWw==
X-Gm-Message-State: ABy/qLbasnE6+vLd4Z5WYGUaTMaoyMj9OfIQQbGDbWfcel8EROquL/UV
	AdpmkefU2jU9x89mQO+lSCRWWkXbDRsScx7/8go=
X-Google-Smtp-Source: APBJJlHlUqfbQhxsSRhQdRSaK43Veit3ipCtNfTh/x6rauCu7QV5IfyZehbir6Ru+y4G6O4XLYlE3EATEfSP+W7v+t8=
X-Received: by 2002:a17:906:53d0:b0:99b:5642:b97a with SMTP id
 p16-20020a17090653d000b0099b5642b97amr5078154ejo.46.1690982146393; Wed, 02
 Aug 2023 06:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230802114705.90137-1-joel@jms.id.au> <CA+cAkeqRRNUyPxDZrk_3kkQCT2xbE72S5vxrZ_VvHH-xcEB2YA@mail.gmail.com>
In-Reply-To: <CA+cAkeqRRNUyPxDZrk_3kkQCT2xbE72S5vxrZ_VvHH-xcEB2YA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Aug 2023 13:15:34 +0000
Message-ID: <CACPK8Xd1DqL9WoV=kwxDO3bzcBEB_KhH-1oKhKE2xoqZzX9a-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Don't fail if Modules.symvers doesn't exist
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Andrew Geissler <geissonator@gmail.com>, mdmii@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185391

On Wed, 2 Aug 2023 at 12:45, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
>
>
> On Wed, 2 Aug 2023 at 13:47, Joel Stanley <joel@jms.id.au> wrote:
>>
>> The one liner tests using `[ ] && action` need to have || true after the=
 action,
>> otherwise the line returns false and the recipie fails.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  meta/classes-recipe/kernel.bbclass | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass
>> index 247ef4a48aa7..f1bc41e82be8 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -486,7 +486,7 @@ kernel_do_install() {
>>         install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map-$=
{KERNEL_VERSION}
>>         install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL=
_VERSION}
>>         install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNE=
L_VERSION}
>> -       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${K=
ERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
>> +       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${K=
ERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
>>  }
>>
>
> By doing that, you simply silent possible error of the action after the t=
est, below is a little snippet showing that

Sure. But the test is looking for the file, so if it doesn't exist
then the command install won't run.

I can't think of any realistic situation where install would fail if
the file is present.

> I think the origin of your issue is that the action failed , having the l=
og of kernel_do_install task would help.

That isn't the case.

The issue is the Modules.symvers file is not found. This is expected,
because the kernel does not use modules.

Here is the log, with paths trimmed:

DEBUG: Executing shell function do_install
NOTE: no modules to install
WARNING: temp/run.do_install.2584671:225 exit 1 from '[ -e Module.symvers ]=
'
WARNING: Backtrace (BB generated script):
    #1: do_install, temp/run.do_install.2584671, line 225
    #2: main, temp/run.do_install.2584671, line 283

