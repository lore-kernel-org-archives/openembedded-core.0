Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DCEC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 14:29:21 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.29546.1652711360155873735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 07:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GalpIxSd;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id s3so3411732edr.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2VOoGBBToQRBMOrEHofx7zAr7g9H0yrqGzfdpVBJzlo=;
        b=GalpIxSduYz0cMyYTuD0fNx59qv/xfqy/fKmX1iL0Sy8u6aXWzgJDmL71lAw0WE24B
         WET7z/wkmjyzoA4R3SPElUoBJbUMnlsaFA/X2jcDfQ8OuY1210kQ2+6whDMoOucHktaQ
         W7bXfOO6FD5tXHkFVHpgvnmoZgTm6OSjWyQH2sunPHUPv2e4DlXommJnfGTh4XO7OIMz
         m5EQVzOpDbqpZiU34pjsJOMLw2fcNMK5YMmd8jlrJKvMqkK+6OERmnTzOaKZ05TGv7vt
         G3kXpDix2UPsykgBafWhv1wrIuHzobamMNig3mX04FMuarV480phJ6pwvrTxZYModMAO
         evbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2VOoGBBToQRBMOrEHofx7zAr7g9H0yrqGzfdpVBJzlo=;
        b=Qev+x16tNkf+RoLYivCFi+O4NEmb4Nbs+UXZWlvhNGngMCJi9+RcfU938d05b+yZsc
         KLLel4+vfc+7FFIc/HZ0HUltLnT+A2h+XuHx2JYBzReMMFU96qS00Fuga0mxXRDEykyB
         d/D9BKhzyK9xoAGRKf5w70K21ycuYJo2PpWLAfFAf/UJ34cWbe18aPspPGWSrLgwrPm2
         mSJK8sWyJzINVyGMa2jno5Q6L6h2koxtBO53Kj04KnHK3FZ2vOs60EELmro6yZZALUaa
         vzA7e3b12RmzPVPwLjThERG5LJmIEMV1eTvSYmOTHC6X9vtwnDVnEbwW0YXeeaOTaVBH
         5I4A==
X-Gm-Message-State: AOAM530m8o3FWCE/CbU+wWyYLi9Um8pF7zvhvqhy0MHlxJrnZHN+dC4r
	906hCg1OixbC/Wyg1UDxxB7lauz2KIKYOUld3jN/qQ==
X-Google-Smtp-Source: 
 ABdhPJzm5Tooahglt8o1/dlVbh8xfsYENw+wOUbB77NDOWLwpWNevBDUIxez8bN2pxGjiMc+XMmxGKz41O6Ve/9HdXs=
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr9581782edb.71.1652711358475; Mon, 16
 May 2022 07:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220515124346.8095-1-liu.ming50@gmail.com>
 <20220515124346.8095-2-liu.ming50@gmail.com>
 <4b08ee55f793b321f6d23c207fdb4fb0802297ed.camel@linuxfoundation.org>
 <CALatG=6SEmPaOFecWLQ6_hj63VobektQ6tKHZ5MKYExhqEPfAg@mail.gmail.com>
In-Reply-To: 
 <CALatG=6SEmPaOFecWLQ6_hj63VobektQ6tKHZ5MKYExhqEPfAg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 May 2022 04:29:06 -1000
Message-ID: 
 <CAOSpxdbUNU+QYFmT7CMWT64Q3Q3n+soenUHL2HHfoPr9e=YJ5Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH 1/1] mmc-utils: upgrade to latest
 revision
To: Ming Liu <liu.ming50@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 14:29:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165685

On Sun, May 15, 2022 at 9:17 PM Ming Liu <liu.ming50@gmail.com> wrote:

> Our products are based on LTS kirkstone, we found a build issue of mmc-ut=
ils, which has been fixed by https://kernel.googlesource.com/pub/scm/utils/=
mmc/mmc-utils/+/0d493fb091b592bde6004a618c28f1c3619af1a4

So this error only occurs if you are using a BSP with a 5.4 kernel?
That would explain why I don't see this in my testing, since it uses
only 5.10 and 5.15

BTW, for future kirkstone patches you should cc me instead of Richard
since I am the kirkstone maintainer.

> this uplift only involves in two commits including the above fix:
>
> ```
> b7e4d5a mmc-utils: Add General command CMD56 read support
> 0d493fb mmc-utils: Fix build error MMC_BLOCK_MAJOR undeclared
> ```
>
> considering kirkstone mmc-utils recipe fetches mmc-utils master branch an=
d does not stick to any release tag, so I think we can uplift mmc-utils to =
the latest rather than backport that fix to kirkstone.

This seems reasonable to me. I will add this patch to my test queue
and edit the commit message to include the above information.

Steve

> <richard.purdie@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8815=
=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:42=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>> On Sun, 2022-05-15 at 14:43 +0200, liu.ming50@gmail.com wrote:
>> > From: Alexander Kanavin <alex.kanavin@gmail.com>
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
>> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> > ---
>> >  meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>>
>> Why does kirkstone need this though?
>>
>> Cheers,
>>
>> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165665): https://lists.openembedded.org/g/openembedde=
d-core/message/165665
> Mute This Topic: https://lists.openembedded.org/mt/91117508/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

