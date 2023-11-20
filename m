Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA48C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:23:43 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1987.1700501022842736171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jWZ/5fSB;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-548ce28fd23so1337010a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 09:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700501021; x=1701105821; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/oy++kHFG7k9I7SghCBH/sIufx+Ro/5S/eCWQY0Cj4=;
        b=jWZ/5fSB9A3edRDNoRgJmluHmxDxxrQaRXIM2rDylS9/Tzcdpna3k1KYJROJ8A/ZjJ
         x9I+00PwMZ1RIkrEkEWrBaM5WaAgU9LbKc4BF7fNyAEgIt/nUGYXVXbQW9/xCgpnOH64
         iwpokWuKretpBWXdQF/EzKBd6RCB2KZwWbnbjH1pLpWtDnWZ/TZg0lQYm5nCg5ogDgeg
         6Dw6B7WNOmXoNM1vD7gK9SrTDMsIwtMRiYvQOEB5mp9wlREoqY85WavURHzzIssuHORC
         3PjDbI3CjPw6QpuqRIaGQWLcflKb2M05SuxATNfjhYKtia+9K6unZkYTDaNdnab+DcPD
         Q4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501021; x=1701105821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/oy++kHFG7k9I7SghCBH/sIufx+Ro/5S/eCWQY0Cj4=;
        b=rhZElCrpcyxYb6A/BuylYfTSVJCxITPNKe84kE1DYCYU0HYG+YqKsJRfjYwkiEshAq
         0viKY7MrwU7lwt/W7mFbokFXMt8fj8imEW2w5/aDxetPySPXqDipDuKta3/CBl86z7kb
         MoGNKAOZDHNgSGFbf+/WVL08CJDA/1LGEQpa5zqs+/cWPiceCaR32R8la4pr2w1N36tH
         rhKLLV5DDqjv04w3xH4j9EEVYbKOevf2wUxl6jpjmnzgRrCtj6PItUcUPMa8folfTXv5
         hin9iCaFf6Y8iYUpzpe/dYEv3Fz1NQPr4rO7B23dcx5/AMrx3f002y214QtWmCMqIoKh
         SfIA==
X-Gm-Message-State: AOJu0YyvFexc1QF8FOZSLXJUMl5vUBIEBZnbo8R206TTafflc4IQGzh2
	INmXDttCqs5/UGNJdeVbiInfa2MvAMO77ljaCRud5A==
X-Google-Smtp-Source: AGHT+IGfrT3o5d+7W3d3PkD5MDR23Ef/CqKKEq2M32xItK2GGM0tDLKBi2zZJTH0bBvr7vPukuI24K+A4fR1HsGiBRk=
X-Received: by 2002:a17:906:20da:b0:9e4:7b7:267d with SMTP id
 c26-20020a17090620da00b009e407b7267dmr6012099ejc.52.1700501021130; Mon, 20
 Nov 2023 09:23:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700496737.git.steve@sakoman.com> <e0bd7ce93a75c7ddb6b1c572453c37407e7e32da.1700496737.git.steve@sakoman.com>
 <CA+chaQe2x+xrL5ChW9RzdffcO-CCpyaRj6dSvhzzLO70yLcshA@mail.gmail.com>
In-Reply-To: <CA+chaQe2x+xrL5ChW9RzdffcO-CCpyaRj6dSvhzzLO70yLcshA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Nov 2023 07:23:30 -1000
Message-ID: <CAOSpxdbqZittfK6JukTT_PQCt84pKzaOoE7_Yfcpr64yTx_Q-g@mail.gmail.com>
Subject: Re: [OE-core][nanbield 11/33] kernel.bbclass: Use strip utility used
 for kernel build in do_package
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 17:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190926

Got it!  Thanks for reviewing.

Steve

On Mon, Nov 20, 2023 at 6:45=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> This requires additional fix from:
> https://git.openembedded.org/openembedded-core/commit/?id=3D41f019afc41f8=
00b622c46a6d7cf1beffc97716a
>
> Cheers,
>
> On Mon, Nov 20, 2023 at 5:39=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
>>
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> os.environ does not pass this down to runstrip() function and in
>> strip_execs() its using STRIP bitbake variable to find the strip utility
>> to use. Since there might be a trailing whitespace in KERNEL_STRIP
>> remove that otherwise python is not able to launch it.
>> e.g.
>>
>> FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-lin=
ux-strip '
>>
>> This is more evident when STRIP and KERNEL_STRIP are different utilities
>> e.g. when using clang as default toolchain but using gcc+binutils only f=
or
>> kernel build.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 77497dbdca92ab4d6386a071bc281c42a7e8a14b)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/classes-recipe/kernel.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass
>> index 2ec9ea2091..16b85dbca4 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
>>  do_transform_bundled_initramfs[dirs] =3D "${B}"
>>
>>  python do_package:prepend () {
>> -    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
>> +    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
>>  }
>>
>>  python do_devshell:prepend () {
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#190900): https://lists.openembedded.org/g/openembedd=
ed-core/message/190900
>> Mute This Topic: https://lists.openembedded.org/mt/102710661/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
artin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

