Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3246C6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 18:02:04 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.15728.1679853715247782096
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 11:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwfIxOCj;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id j11so8380660lfg.13
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679853713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYqCZyUHZf29Cs08gi7gw/IOnrxqKKd6NY8XGH6ncHk=;
        b=PwfIxOCjuqIWReQsjrtuLmP1UF7SvneQrvS7E+eR0TfNGH/4O6BQkBUCje/ni8sO0Q
         +JzSc+PaTox9Qb3RzuZK/hcPJwKJsIjipsEqZGQSApPEgvYtIzq9a/oCf95cyJ/pMyMz
         c6I6xrM9P+BDyzhfVIqD8PdyWTBd0jdqKLiemn7vAR1Fv+Lvn++YgsYoN6MKki9B67++
         Rk582oOcBpAyPZI8rHut2+UxLHjz8HY4FUA4jKN/XEjbZvfZ30DGhOXWZVY655porUDw
         5kDujNqCUPSPS+U4wlHmqDH0eetmtbbPllFpw2pqdl7xdd0DMkrxWp/84F7kZdS/aOj4
         L00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679853713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYqCZyUHZf29Cs08gi7gw/IOnrxqKKd6NY8XGH6ncHk=;
        b=Iw/TgcCNaqQx1pa+InZ34pJWw8BvSIr10zkxUhIAS795V/5jDq2EaXSpebQkMwscr+
         F3sQ/mpbfgZ+0uZuzrCXsDj13VLJvLyZI29BOWAqgEV3g2PBvUGoK3OyJy7yfBtGNR1f
         SEWoxGOvw0nX18nekvMNbU/x/ZufI+89gTMvL5B1loQlF1qvfxvYii8Vb4zzenZiIYig
         jefksgr+UNCOSBoU7cv1TF6VWIpo706MuYNG2S7rYW+bD+bast2YAXMUnZkdeaQwJFHj
         qJ2wet1UiCFlId1YHh5Lto+V1HX2i5OKerRgCst9rraW2cy1rrj8vYDkOtRzFLdLIOmJ
         Bgtg==
X-Gm-Message-State: AAQBX9dc/MSQ3SYy2KvgjYXND7K9X51ya1oYTqwFEX5v54q20vlLoucq
	HhP8wgll5pTNm3B4kQvgf0RH6vwLdRMIM2dSozY=
X-Google-Smtp-Source: AKy350aJBqGgs0WxV6BMCBcPkRJpTnvq23/29KJNFGncgL4xzQWS8u2LKqiWZPiUUYRm7zO7SRPhkqhj8yJrhZ88Bys=
X-Received: by 2002:ac2:4884:0:b0:4e8:426d:123f with SMTP id
 x4-20020ac24884000000b004e8426d123fmr2595108lfc.11.1679853713461; Sun, 26 Mar
 2023 11:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj_W+qLQRMVTuW8RMSJeBSgstixSPh1rZh77KxvN4vsCgg@mail.gmail.com>
 <CA+cAkep6MPVsP=sY_y9jonjgn8X2oEJL4OPiidfGyT5jJUjVzQ@mail.gmail.com> <CA+cAkeqFrnuoSL5Z2d1MrPNv3VbmLfUPV0w0BBQ-w3Jd2-A3YA@mail.gmail.com>
In-Reply-To: <CA+cAkeqFrnuoSL5Z2d1MrPNv3VbmLfUPV0w0BBQ-w3Jd2-A3YA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 26 Mar 2023 20:01:41 +0200
Message-ID: <CANNYZj_B6vmr86JBZ-DPzJnJ=g9DHAvOwAt6=vPANHGDGcgkgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 18:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179135

I'm fine with v2, except for the zvariant recipe, that should probably
go to meta-rust (which itself should go to meta-oe, with cleanups).

Alex

On Sun, 26 Mar 2023 at 16:58, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> I submit a V2 series where I made modifications you suggested, I choose t=
o use a more
> generic type (git-dependency instead of cargo-dep) since I foresee that c=
ould be used also
> for npm based recipe (see https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D11015)
>
> For the moment, I let the example recipe in oe-core because I don't know =
where it should
> go (or even if I should keep it or remove it)
>
> On Sun, 26 Mar 2023 at 07:15, Fr=C3=A9d=C3=A9ric Martinsons <frederic.mar=
tinsons@gmail.com> wrote:
>>
>> Ah, good idea, I'll try that and provide a V2 of this series if it fits.
>>
>> On Sat, 25 Mar 2023 at 20:02, Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>>
>>> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
>>> <frederic.martinsons@gmail.com> wrote:
>>> > @@ -72,6 +73,8 @@ python () {
>>> >                      url_data.type =3D=3D 'npmsw' or url_data.type =
=3D=3D 'crate' or
>>> >                      'type' in parm and parm['type'] =3D=3D 'kmeta'):
>>> >                  local_srcuri.append(url)
>>> > +            if url in cargo_git_deps:
>>> > +                local_srcuri.append(url)
>>>
>>> Come to think of it, it's better to use the same type parameter with a
>>> special value as in kernel recipes:
>>>
>>> git://.....;type=3Dcargo-dep;...
>>>
>>> This would avoid the ugly special variable.
>>>
>>> Alex

