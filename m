Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89724CD1288
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 13:06:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.13344.1711804007193580496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Mar 2024 06:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLh1Iemy;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3417a3151c5so1809346f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711804005; x=1712408805; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hs+BvNgHWDx9OKPlqhmOX0Mom7ylQqrCj0v7xGX0xc=;
        b=gLh1IemyQGLIvVjDFK5w3lUTUz5zHD9/2xMT2y1CNjAkT9Ey1zOhAjTp1xt3Vk2rqz
         qU3Nlou1gFWQp5TjLiPtcV8VeDY4WFw5w3d082YTJBVEL548k5CJQ5kjRnumCIfHqWiu
         YqcfCtDn0gHdcAul6IvxGHW3Jj3EAegxKte0W+y3NAZ0XUbkfWjyaK5P6RRkQi9ocaLC
         Ly8xGdUVseQdz8lnJni1f9WtjjRS3JGyjjeb7sf3B/2gg3MKYrLHs9kpxvHLc7uud8HA
         mo8WHZyG+J+1XAcnc2T6DEyn931DqB1644S+C1Ri/WtFlAaa9PX67YKFHG3roUlBBXxa
         WimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711804005; x=1712408805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Hs+BvNgHWDx9OKPlqhmOX0Mom7ylQqrCj0v7xGX0xc=;
        b=d4zKFMfwgi4S3dK4RRy49dwZ++QwN5iK2uoX17FBemZU+BZ/ErVJM61SaLXU5ZHtmk
         GxQxoyocCUwP1B3ZIXMTAvnCzOsT9PSRpIhwhHTBSC26kMNkhWvPs17mHGvbBYqfqdqT
         u8DEycKH20akeDVS3KnU+89pDx+kPCSwyBr7YIZrj1WXeMc6Ctez+wNoToE7Wx8jAjVB
         XfkAmuyq4ru8LeGh3+qD3xqo7B/7IVxjoHIe3H2dunnmLOB2W77rBMqFgo7zbti7i6Qo
         7YWAHdS0ca0sEF0kJcJJAauVNlsA2QGsbrnvJ7KHhDq7+EFTjpEBJUzwkur1i5Q2AMNw
         jQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7VbJU3KbEs31Ktjni+sAEznt81KOemDR9YkiiZay+omTHqkpbsgvN/ku7LaUPhFKySABpypGvULdduUTiYOyemR1+RTH/gxA4UP4cqtHP5RSboVl+/HjA
X-Gm-Message-State: AOJu0Yy4DPbOw1OoQoW3HJvzHQTfEjqCaJXrZitnB/UiaPTV9BkBgKGU
	F2OSkDxaRiAPWLxyPZoJHbteccofVkz+LxRprswDD4gebky0UehqNv23g6PSJTmryV7upr8NbQg
	YAoHQMWz5QBIo+RY3+9o3P6iV16o=
X-Google-Smtp-Source: AGHT+IEwqp9nrcNfDze0tFNbnrkKOzG7EWkiy+FOwQTJh/0MRyfEkkLlWCFeWtBaatdsLEjYGAu97hnzmbVPRUnOp2M=
X-Received: by 2002:a5d:5cd2:0:b0:33e:b7f8:7c66 with SMTP id
 cg18-20020a5d5cd2000000b0033eb7f87c66mr3247089wrb.41.1711804005215; Sat, 30
 Mar 2024 06:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com> <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
 <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com>
 <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org> <CANNYZj8DCqKE9_ftZTKfj8UY5tnDUnPhETN++3SjeNDT_S4_iA@mail.gmail.com>
In-Reply-To: <CANNYZj8DCqKE9_ftZTKfj8UY5tnDUnPhETN++3SjeNDT_S4_iA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 30 Mar 2024 14:06:33 +0100
Message-ID: <CA+chaQd5mQv5ciJWbXHG1OdsQ7AW_H8dfVJrNaTV-p7qiqHusw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>, Marta Rybczynska <rybczynska@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 13:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197651

From what is publicly known it injected malicious code (through m4
macro using payload hidden in obfuscated compressed test file) into
built liblzma.so.5 which then hijacks RSA_public_decrypt call e.g. in
sshd (when sshd is built with patch adding systemd notifications which
brings liblzma dependency to sshd e.g. on debian and ubuntu based
systems).

The build systems which just built this xz version shouldn't be
affected (as it won't be using the liblzma.so from the OE build on the
host).

This publicly known part should be OK for OE, but it's right to be
worried about the other things which aren't known (not only from these
guys or from xz project).

Regards,

On Sat, Mar 30, 2024 at 1:52=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I=E2=80=99m slightly worried. Does this compromise build systems (given t=
hat back door was injected into autoconf scripts) or only systems where xz =
binaries are installed?
>
> Ale
>
> On Sat 30. Mar 2024 at 13.26, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> wrote:
>>
>> On Sat, 2024-03-30 at 13:08 +0100, Marta Rybczynska wrote:
>> > Absolutely confirm. DO NOT UPDATE
>> >
>> > Marta
>> >
>> > On Sat, 30 Mar 2024, 02:04 Mark Hatle,
>> > <mark.hatle@kernel.crashing.org> wrote:
>> > > I know this request is a week or so old..
>> > >
>> > > But do NOT upgrade to 'xz' 5.6.0 or 5.6.1.  It has been
>> > > compromised:
>> > >
>> > > https://www.openwall.com/lists/oss-security/2024/03/29/4
>> > >
>> > > --Mark
>>
>> We're not going to. The upgrade was already dropped after it failed
>> build testing. I do wonder why it failed.
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/8737
>>
>> I've ensured the sources were removed from our mirrors too.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197650): https://lists.openembedded.org/g/openembedde=
d-core/message/197650
> Mute This Topic: https://lists.openembedded.org/mt/105226831/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

