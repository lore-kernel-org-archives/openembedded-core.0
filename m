Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B05ACA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:19:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.19349.1756383590960915543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkIWIyRO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3366307712dso8636551fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 05:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1756383589; x=1756988389; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea8XDFEyK9rkn9J9oynzJpRE92TxT6MQaLMR0jo1GtU=;
        b=PkIWIyRO+CVnn8l4MHbcBO9WUELNRz59Ls5Z/0VhlPyP+FEGjk12OwcK9JInNdDF+Q
         f4pECOqNsU7vtYfnkdAIlk3G2DnH2q+bO0WjBFlbjjtP/PAoS7I5npdaXYY4l0VGGebM
         pdPwGlJlMOndXuZxoGB519TJTOTKdFsqkB8FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383589; x=1756988389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea8XDFEyK9rkn9J9oynzJpRE92TxT6MQaLMR0jo1GtU=;
        b=ROkCihU87YgwTFAHNTlNesB4AkbiOX8dUTxBqkdimgcUOjYuaRGdBrdnjoDErDpb7N
         6xJLwglETDz8JUXT2H5EAWj2hxRXvnxCc1k3Qk7LOoD9XKU0AC3+uq3RYOX271motPxT
         zmAUAHnoMpQbD7nqkcP95lNHtkIfPBSpaRVqB5ySzE1Bo4+QTnRdpc5dBM3hOfckdYG9
         DqbzvVxxhy/1B7eHfrlvLW5jofGWd+GkWVkEUVPVSzd01V5ua0CFuS7HXTKmoFEwMkf9
         CXyGy3LKZxZwMu3SbdqzIr+ywUm1MJH0andAs3Ai3FLkpTHWI7IsN7Vakp5YTEilGk7r
         gABA==
X-Forwarded-Encrypted: i=1; AJvYcCWZWdglATJlnVtN5tvDzSt7xW47QXMdzwAPGY2Fy21TZj9fVpSXrvXGLzYXZSCySxwTo9YpfJtKVevqRxiO92xt9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMvSzyLSWoBFQXpTl5U3vWf13b97bgXa2q8ZtvGycc/q5UlDhv
	Qrc59OLjBBzPVdUJUyhM0Z0xTGXdN+4eb+FJEqH7jLaXaUDImASf8atPO1BtxLqtD/M31bbOipM
	oZKrnBvQrMrB5CuBs2GkXDIadYpX6m9VVvd8AYmIcVw==
X-Gm-Gg: ASbGncvZrwqGMPprbfjIxwX/LlqlljAyYCtBz+hRGHXVF2XoJG4CU3/R4y+QO0kLyIA
	a6pJFYS/+jZQiEpIzKMMN6kLwjVynpV9Y1xFCbw4SOrx32z5JRwhsvmbGKwomgH6NPFJz3Vjq3e
	FuXQLPmMS9HngiDEiuPfwKtIZKzFhqStiq1iX7v3bzUjAtwtCXiH3E8/MLae1I+swV1IUDXTwaP
	73RCHH+4XIZNaTNH8E=
X-Google-Smtp-Source: AGHT+IE6o2Ok918ye2LW0ksCaBYR/IsjwzqyQDFoinmHIYhHfwtV8l4gjKa0MpicBtkGxtMlvi0pBkBlY8WHOiaF4aE=
X-Received: by 2002:a2e:a007:0:b0:336:6501:1aca with SMTP id
 38308e7fff4ca-3368b723845mr17577051fa.9.1756383588991; Thu, 28 Aug 2025
 05:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250828104332.75862-1-mhalstead@linuxfoundation.org>
 <DCE0QLXNCY9D.2R8F48WOAHJRW@bootlin.com> <CAMSfU+416rkVhHAzZjTXLwODAUdp1yddoMmWoEDRqcz_OaCmBA@mail.gmail.com>
In-Reply-To: <CAMSfU+416rkVhHAzZjTXLwODAUdp1yddoMmWoEDRqcz_OaCmBA@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 28 Aug 2025 14:19:36 +0200
X-Gm-Features: Ac12FXyldhJcK1pzKcwVO0piph3vBB31N517_GMle6DBMt98vZJDW6imdza8X94
Message-ID: <CADfgfoa=gA_dLttEOn-5ghVFUjyQCNjwC4aCuWNbpv4A+BQibA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] default-distrovars.inc: Switch to the canonical
 website domain
To: Yoann Congal <yoann.congal@smile.fr>
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222569

It's probably best to take Deepak Rathore's patch instead. Avoiding
redirects on a connectivity check is a good idea in general.

I want to follow up and describe the specific issue that cropped up on
the autobuilder for history's sake. Our redirection service switched
from using ISRG Root X1 to ISRG Root X2 yesterday. This is less
compatible but more efficient (https://letsencrypt.org/certificates/).
ISRG Root X2 is not in ca-certificates (20230311) which is the current
package on Debian 11 bookworm and is not likely to change. It also
appears AlmaLinux 8 was unable to connect after the change.

On Thu, Aug 28, 2025 at 1:22=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
>
>
> Le jeu. 28 ao=C3=BBt 2025 =C3=A0 13:20, Mathieu Dubois-Briand via lists.o=
penembedded.org <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org=
> a =C3=A9crit :
>>
>> On Thu Aug 28, 2025 at 12:43 PM CEST, Michael Halstead via lists.openemb=
edded.org wrote:
>> > yoctoproject.org redirects to www.yoctoproject.org. Switching to the
>> > true domain we avoid an unnessary redirect and avoid certifcate errors
>> > on a default Debian 11 installation.
>> >
>> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
>> > ---
>> >  meta/conf/distro/include/default-distrovars.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc
>> > index 9ea3b5414c..bbd936efa6 100644
>> > --- a/meta/conf/distro/include/default-distrovars.inc
>> > +++ b/meta/conf/distro/include/default-distrovars.inc
>> > @@ -63,4 +63,4 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
>> >  # fetch from the network (and warn you if not). To disable the test s=
et
>> >  # the variable to be empty.
>> >  # Git example url: git://git.yoctoproject.org/yocto-firewall-test;pro=
tocol=3Dgit;rev=3Dmaster;branch=3Dmaster
>> > -CONNECTIVITY_CHECK_URIS ?=3D "https://yoctoproject.org/connectivity.h=
tml"
>> > +CONNECTIVITY_CHECK_URIS ?=3D "https://www.yoctoproject.org/connectivi=
ty.html"
>>
>>
>> Hi Michael,
>>
>> Thanks!
>>
>> Can I ask you to modify also the URLs in the test cases?
>> We have two occurrences in meta/lib/oeqa/buildtools/cases/https.py.
>
>
> Related: https://lists.openembedded.org/g/openembedded-core/message/22255=
9
> Same patch which does seem to do what Mathieu is asking for.
>
>>
>>
>> Best regards,
>> Mathieu
>>
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#222563): https://lists.openembedded.org/g/openembedd=
ed-core/message/222563
>> Mute This Topic: https://lists.openembedded.org/mt/114932649/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [y=
oann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Yoann Congal
> Smile ECS



--
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

