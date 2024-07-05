Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0294DC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 13:05:28 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.16699.1720184720320301626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 06:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=EFh4Z9ic;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: jstephan@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-44639c3d8e7so8712761cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720184719; x=1720789519; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdyGJUOsz4hgGeLtdo8QoEEHle0pZpZgkeHixq1wh+E=;
        b=EFh4Z9icS0OqhpFaMTNwYlPJymkJ4UDYZrDgiVsxJal2mom0MP9iNbGt5+IznuH+Id
         rQ10u4u3AnV50sGF721nX1S8iY+eW9JLOHloqNFbjTftw/32ISSmqSy0bGp9CyXXoCoI
         1y3a3mUnjol1CdI6FdSiNuYbVOdDIYToIZxnU5mMjihYcrq6DYfd7s0LYFyrYf06jF11
         bgXYwmW8S0lw99tl3mXmHeNxWCwNWXueuu2BJjtqsDuTAUY0ZUmRG5b880RU5uqLVP8o
         +zMbiWg5IM6pSA8z4eVk044IIanZTwHP7e3DJkBcQr+2TdaXisRrTPNN/AC3Tdv6AZt+
         sWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720184719; x=1720789519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdyGJUOsz4hgGeLtdo8QoEEHle0pZpZgkeHixq1wh+E=;
        b=g3Q/K7J2KfXtte5PcTh7N5o5JGAGCn+7LJ/+vz+f1A9X0aoGzd2Wn9LtVc6goEsivQ
         Y072NIyn04D4X9TgKOEmq0qpIqeGxjtlNe7l/8HdGkWC7YOycR5EWv73mSE6uhJgxjrF
         9BC9M9dM7DfeyWwc4QziuTNoF2v2nCAvkJbODdhHtW60A55rZqaapuGrLdFgd2dsEUlR
         XqzJuQ65UPQxT1ZeZeo4R4GrQrof2S84TmORtoVrW5RWfr31tQKzvB8OtVIdYU4ii7bt
         9+Bal+b/IZZYNz/zgqvEVwXTJVHAB+qTBVhYtrz+FNQqxdFV6WJP1jxHPmF7uNz2l22t
         OqNQ==
X-Gm-Message-State: AOJu0YzcNFMuKEgEmsFQsFHSAu6E8VZegGuN3uFtadtkonziM0M0P5l2
	GeCjIL7u1F3oWg5zUNIpDTa+oWct9yGfgutb47BllRcEFO6gbMVT8QPD1hB4aLxIdNcvNJEIBGg
	Diy4nrXhkSgF1k6nAOBWQFjzKl9CUUqH/KsnPAQ==
X-Google-Smtp-Source: AGHT+IGN7jtgtAR9JHGmVqMLYPsjPGPWMGQeq5SsEMMUWd3iSNTK88ZSdspiE/bgXXJmvz3tUf9HkJvikdty6kmqx+k=
X-Received: by 2002:a05:622a:1a06:b0:446:11ae:b074 with SMTP id
 d75a77b69052e-447cbf8c9admr54818791cf.59.1720184719325; Fri, 05 Jul 2024
 06:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240705113129.1798725-1-jstephan@baylibre.com> <CANPvuRmCL4duNDDuMRiEm_T_vYE86fdmMkbqL8d4mgXd98-www@mail.gmail.com>
In-Reply-To: <CANPvuRmCL4duNDDuMRiEm_T_vYE86fdmMkbqL8d4mgXd98-www@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 5 Jul 2024 15:05:07 +0200
Message-ID: <CAEHHSvYbGiS0A1gJZtQtaX21R4DKHubdhbLoCN5d3hqDfFyO_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: fix do_symlink_kernsrc function
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 13:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201605

Le ven. 5 juil. 2024 =C3=A0 13:55, Jose Quaresma <quaresma.jose@gmail.com> =
a =C3=A9crit :
>
>
>
> Julien Stephan via lists.openembedded.org <jstephan=3Dbaylibre.com@lists.=
openembedded.org> escreveu (sexta, 5/07/2024 =C3=A0(s) 12:31):
>>
>> According to the comment in do_symlink_kernsrc, this function exists
>> for compatibility with old style kernel recipes:
>>
>>     # Old style kernels may set ${S} =3D ${WORKDIR}/git for example
>>
>> For such recipes  S will always be different from STAGING_KERNEL_DIR.
>> This is fine for the first build or when unpack is rerun because new
>> sources are in S. However the following command breaks the build:
>>
>>     bitbake -C do_symlink_kernsrc virtual/kernel
>>
>> At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=3D
>> STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR
>> without removing the folder itself causing us to lose kernel sources.
>> Then we create a symlink from S to STAGING_KERNEL_DIR which results in t=
he
>> following broken symlinks:
>>
>>     ${WORKDIR}/git -> <...>/build/tmp/work-shared/<machine>/kernel-sourc=
e
>>     kernel-source -> <...>/build/tmp/work-shared/<machine>/kernel-source
>>
>> The build fails with the following error:
>>
>>     ERROR: <linux_recipe> do_kernel_checkout: FileExistsError(17, 'File =
exists')
>>     ERROR: Task (<linux_recipe>:do_kernel_checkout)
>>     failed with exit code '1'
>>
>> Attempting to access the kernel-source directory results in:
>>
>>     ls: cannot access 'kernel-source': Too many levels of symbolic links
>>
>> Fix this by checking if S is a symlink, and if so, verifying whether the=
 symlink
>> points to STAGING_KERNEL_DIR to avoid losing sources
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>  meta/classes-recipe/kernel.bbclass | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass
>> index 89badd90f18..e328151cb59 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -184,7 +184,12 @@ do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DI=
R} ${B} ${STAGING_KERNEL_BUILDD
>>  python do_symlink_kernsrc () {
>>      s =3D d.getVar("S")
>>      kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
>> -    if s !=3D kernsrc:
>> +    if os.path.islink(s):
>> +        _s =3D os.readlink(s)
>> +    else:
>> +        _s =3D s
>> +
>> +    if _s !=3D kernsrc:
>>          bb.utils.mkdirhier(kernsrc)
>>          bb.utils.remove(kernsrc, recurse=3DTrue)
>>          if s[-1] =3D=3D '/':
>> --
>> 2.45.1
>
>
> What kernel bbclass are you using to build your kernel?
> Please note that a very similar logic was replicated on the kernel-yocto.=
bbclass do_kernel_checkout function
> so it will be good to test with and without the kernel-yocto.bbclass.
> https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel-yocto.b=
bclass#n376
>
> I recently came across this problem in a change that I ended up having to=
 revert.
> https://github.com/Freescale/meta-freescale/pull/1843
> https://github.com/Freescale/meta-freescale/pull/1857
>
> Jose

Interesting, I'll check this. Thank you for reporting :)

Julien
>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#201601): https://lists.openembedded.org/g/openembedd=
ed-core/message/201601
>> Mute This Topic: https://lists.openembedded.org/mt/107052142/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [q=
uaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

