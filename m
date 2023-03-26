Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6CCC74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 05:16:21 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.4324.1679807770577944577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 22:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cm4C5dPR;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id t11so7300994lfr.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 22:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679807768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=topQi4B7pqTF9H/muNAAZVnB+lyqawyKG2JXr/aQCxw=;
        b=cm4C5dPR835wMK4KlBnlFENF7FtxJcnb4GAR709xh+eodwktI6cbS6URAEYn2NOCRY
         uhoOGcy69R9vwmdoBNLFZGd1zNBPwB0a6NcQA1ewUvahZUiYn9qfCGOvHy4q77OpPgqb
         SagKaikxRajqSJl00ePpRk824F/vrXelxqdXS2OcYt80ABZbMJsJSToDmTfEazFeqPs+
         hcefkSMPs+1fhlalrFOvKuoUc3O8kO5FGFvREU+yUrKqQmsH4WT4I10Qkdr9Pxt43O8a
         TBUG4yZcRhJZiADkl1T2l2jraK2j/joKkNhfTwpj/p65PwcruRZVeY/bxjD1KT6/+6Bt
         kEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679807768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=topQi4B7pqTF9H/muNAAZVnB+lyqawyKG2JXr/aQCxw=;
        b=uPzPpUaMl+BDSqU7Sc+7bsn2mkpdUa4pNaZRMFUWZYHly0x54LYYPnjUv4xJ8e+gaV
         8mkPSZ8pRw8wRzKdDbyl+mf7DkVesM8r07JTPU/LSXO1RMjEj1osEM4Tjxli7QN8060/
         rYPKjMdJVFQOgKe9EUyEVQsGIAv1zOQdKM1gVEyNKy8Q+ehBEKMKdIxrzAfwyTnp6fWX
         PmzI+j3tlLEnKWoGYcl15U4hYuhgUuRQ3yMOw19/FJIthJAqT1fK5x0GVIxVH1Ky1Vsi
         rOnUJx80bQlZ10ih+k0vGvQA4glMMLmgJU/Q4ecxRJDapkQ714nDOoV2Y5Ndl2hcxLgv
         cv/A==
X-Gm-Message-State: AAQBX9egL7gGdA6Jzwsl7DyQr9vPZ8UdvGHwJY1v9eEFQqMSWYVBqJiq
	m/BdYezF2eI7ez3/6gkavkzsl0fMRtGFm99W1AI=
X-Google-Smtp-Source: AK7set9SosoIcE0M4BfvMqr8UrhwFbhzGPteBxiCZmuxbzG872EvgabHCMBBE7Ct96+PHe+lHLtmwCoa1i2R0z1jp7w=
X-Received: by 2002:a05:6512:2523:b0:4e8:3ee1:db14 with SMTP id
 be35-20020a056512252300b004e83ee1db14mr7594236lfb.6.1679807768550; Sat, 25
 Mar 2023 22:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <b48dd61e593e57d7673b65a34a44cd304cb7b7b8.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj_W+qLQRMVTuW8RMSJeBSgstixSPh1rZh77KxvN4vsCgg@mail.gmail.com>
In-Reply-To: <CANNYZj_W+qLQRMVTuW8RMSJeBSgstixSPh1rZh77KxvN4vsCgg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 26 Mar 2023 07:15:57 +0200
Message-ID: <CA+cAkep6MPVsP=sY_y9jonjgn8X2oEJL4OPiidfGyT5jJUjVzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] devtool: add support for multiple git url
 inside a cargo based recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: multipart/alternative; boundary="00000000000055dfe905f7c6b983"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 05:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179111

--00000000000055dfe905f7c6b983
Content-Type: text/plain; charset="UTF-8"

Ah, good idea, I'll try that and provide a V2 of this series if it fits.

On Sat, 25 Mar 2023 at 20:02, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> > @@ -72,6 +73,8 @@ python () {
> >                      url_data.type == 'npmsw' or url_data.type ==
> 'crate' or
> >                      'type' in parm and parm['type'] == 'kmeta'):
> >                  local_srcuri.append(url)
> > +            if url in cargo_git_deps:
> > +                local_srcuri.append(url)
>
> Come to think of it, it's better to use the same type parameter with a
> special value as in kernel recipes:
>
> git://.....;type=cargo-dep;...
>
> This would avoid the ugly special variable.
>
> Alex
>

--00000000000055dfe905f7c6b983
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, good idea, I&#39;ll try that and provide a V2 of this =
series if it fits.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, 25 Mar 2023 at 20:02, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 25 Mar 2=
023 at 10:01, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; @@ -72,6 +73,8 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 url_data.type =3D=3D &#39;npmsw&#39; or url_data.type =3D=3D &#39;cr=
ate&#39; or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;type&#39; in parm and parm[&#39;type&#39;] =3D=3D &#39;kmeta&#3=
9;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_sr=
curi.append(url)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url in cargo_git_deps:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_srcuri.=
append(url)<br>
<br>
Come to think of it, it&#39;s better to use the same type parameter with a<=
br>
special value as in kernel recipes:<br>
<br>
git://.....;type=3Dcargo-dep;...<br>
<br>
This would avoid the ugly special variable.<br>
<br>
Alex<br>
</blockquote></div>

--00000000000055dfe905f7c6b983--

