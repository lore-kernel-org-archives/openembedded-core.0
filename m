Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0EDC433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 11:14:28 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.10298.1633518866638386132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HQYu+Ybu;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id x7so8408444edd.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JoHLFCyeHJ6izpcwQrtg6SBdE/O8Th1Iym0Jsvt02WE=;
        b=HQYu+Ybud97P6Ig6/IEuKPxAp0I7adhRLQanFUaiWaE6hEoGAaY2lEylfWKyNnGRWX
         s6J8MuGqrtXhTJeTGzqGzPkIphmneoxsp1RsYCA6cXZC7pW1D8cMmX5A1xRRLCcKo6Od
         jHVIfv8/m3/aFr43cWPmhtNc0wqWIFfb+WxXJqXS05l90PYMNv8nLtNNI/C2bGQlgKc8
         LIpbpisAT5hc10p826CH+yLQrFXwNbz8P4sftkc5+wXdpIEoHupxKaj0DcnPRPFrQ/Yq
         mSMXaWvgpbu+Hxp5RFDDGvPM9rJ2aTQdeWCUgJNrLWfGkEyQPeuV49BzekmPeefBYHI3
         gkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JoHLFCyeHJ6izpcwQrtg6SBdE/O8Th1Iym0Jsvt02WE=;
        b=XfZszqtoGlTRhptLEdQ+rLSiRTNWcRxlt/nyvew633nTmWohy8hVN8fJ10xOt7OPwb
         XcVWWaUvM3wxEWPcZg8RYexic/Wm3CFYbAzpATxAX11Ka9en4vBvBkyYmWu6aZZt3WnQ
         rzAg/cYWibjIoF8FOs36sfqamw1a9PMgfa6Wjhn17o+hh4WAmsQQBWXdm2XUbAVtKLCF
         Ls9Zbwl88AIEZBTWR4DC4PKatdC8jUedT6eZS5ThY765XCK+QpXNOHBQDqv3f0i0Rwlf
         wnoGz7FJVx7rt6ipgKZzgDiw3P6xP0NP9AGk6nZHFTagIw2TgRKGDTA6vEnD4VGUk8fs
         kUMg==
X-Gm-Message-State: AOAM531aMT1tnab313FAEzgHXBno+6vYXunjm6sNjAmSS4VaYvaxTrOt
	2J58EfXfs1Ebx8Lg/e1UlIWrYhV/5kcPuRUJ/nXrenKdcZg=
X-Google-Smtp-Source: 
 ABdhPJzjJTvjcV+nO99zF5GLKrQlcC+hfreUOUJhN1oGn7Fy0pzXHUogyKPJypuwxWFK8I1hRHmgEYAdiFVttCFgz6w=
X-Received: by 2002:a17:907:7fa8:: with SMTP id
 qk40mr31430838ejc.445.1633518863360;
 Wed, 06 Oct 2021 04:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
 <6bf351545a8bf21fff5c00ff1ed8978b475f05d4.1633478971.git.bruce.ashfield@gmail.com>
 <CANPvuRnBLLeOOhurA9r5ihC_epZuESynEauXRe7PoUePa6dfWQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnBLLeOOhurA9r5ihC_epZuESynEauXRe7PoUePa6dfWQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Oct 2021 08:14:12 -0300
Message-ID: 
 <CADkTA4N3Atbo9mJ9302AFQubEMo1cqBF_u4tp6FswH6Q=D+GRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] kernel-yocto: don't apply config metadata
 patches twice
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 11:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156689

On Wed, Oct 6, 2021 at 5:46 AM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
> Hi Bruce,
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quarta, 6/10/20=
21 =C3=A0(s) 01:12:
>>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoc=
to.bbclass
>> index 549dfd97a4..1d5a8cdf29 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -36,7 +36,10 @@ def find_patches(d,subdir):
>>              if subdir =3D=3D patchdir:
>>                  patch_list.append(local)
>>          else:
>> -            patch_list.append(local)
>> +            # skip the patch if a patchdir was supplied, it won't be ha=
ndled
>> +            # properly
>> +            if not patchdir:
>> +                patch_list.append(local)
>
>
> I think that will be useful to have a warning there when the patchdir was=
 supplied

Sure, but no one has ever hit this before in the wild, so there are
none known to be in existence, since if they did exist you'd get an
error.

I'll probably just drop the patch and carry it locally.

Bruce

>
> Jose
>
>>
>>      return patch_list
>>
>> --
>> 2.19.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#156667): https://lists.openembedded.org/g/openembedd=
ed-core/message/156667
>> Mute This Topic: https://lists.openembedded.org/mt/86108495/5052612
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



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

