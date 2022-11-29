Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E22AC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 17:02:29 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.155958.1669741341853470860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 09:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JvjbgfAu;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id d6so23010094lfs.10
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ryUVrLiSguf6aqxegdIyP6k0LEyJtD6C/V0eYKBU4f8=;
        b=JvjbgfAuQOwHNiUCd0WF0fFXlXRpAE88w1O4bMwwO4PaPu+yvLCVdfnf6STk7Jjq/q
         Tdh3G0OJ7C4f5YYbqKJWcx7cv/mQNfuHuk2Ot+Wwc9DBEoKL9Yq7xS7nmt4/n5TMu1Pi
         3gNengH/3gjnJ0DnYEPWTlBj2iao2m4Yrmmmzy4ln2PkBx4u2AGmY8us6LkJO5Jy9S5H
         Ltv4zKotqSd41+keyiPvrzcX7a/kJpP4hu6p/TYYLrPpe9t+qeuzZfxOuXS6HnOIrMfj
         1CO1DlHPjvuJDKo5WmP6sQBB7ifgdIubWa3XQYeG6QCwhh8H9Rlbnk9E2i7Y9UGb4tdT
         A0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryUVrLiSguf6aqxegdIyP6k0LEyJtD6C/V0eYKBU4f8=;
        b=z6LgI8dOwMVBJtt8slc+k8tTFB+p25ma/svA0ZP/e6hj+gZIgtbSGK7I5wVniKOdCm
         5dBPXZDav1iLCSdtFwbgIWq9WduYMIRzBSMcP/1kGqQHYNWgUCps0kMRzMBxHJzK3H/P
         mjFRQCfzXEjU4Q+7g/ABcFziBgAc3cmIey9i93rk7Uj3T+o1iTpO8HRj5yKcz6KXwB6x
         xnz38GPz2NtHuCqJwke0EemTKhseGQSPWftnUX+PKYoYRDlYRYV+5VCYwxP8ASDEQEdu
         SWY5AYP+i4TfQY5rVSOWo+9TPbeEYzS5YTPYkYEelzXTLyrmu8DTIehhJCHPi95OEHcK
         u2tA==
X-Gm-Message-State: ANoB5pnH5mNJiPfJ5ES4pjxLPfsdF+Qrx6qoBamUXJNSk/vf3gAyQKfF
	C2eq1ZOC+f2ule5s6ecOQyXxP7Q4uZOClqdtg4Q=
X-Google-Smtp-Source: AA0mqf7Gxtz7K+CNE9HSd7vcPBn/EllOO8gnVk1FOvhUsoPWFYLbw1rwegVmFD4MPbEoaGtuv++wT6NoedoHVBa2Qu0=
X-Received: by 2002:a05:6512:25ab:b0:4b4:d443:6550 with SMTP id
 bf43-20020a05651225ab00b004b4d4436550mr15341037lfb.393.1669741338416; Tue, 29
 Nov 2022 09:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20221129132220.6357-1-f_l_k@t-online.de> <20221129132220.6357-2-f_l_k@t-online.de>
 <F7525B10-17D1-43C6-B2AF-DF5BAEE11246@arm.com> <CANNYZj9XvDiuZiUgKmEJcvHX_U7Q4KmH93GFGtH-N8FxqEn=GA@mail.gmail.com>
 <16D4E649-B4FA-4E57-A7F4-853FD7057141@arm.com>
In-Reply-To: <16D4E649-B4FA-4E57-A7F4-853FD7057141@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Nov 2022 18:02:07 +0100
Message-ID: <CANNYZj82FBFUAWoirBL=pPe2mqQdehZyJCoMR48MgxPBWa0Yeg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv7 2/2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Ross Burton <Ross.Burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057d9d005ee9ef337"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 17:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173984

--00000000000057d9d005ee9ef337
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s going to be tested in world builds against gcr 4.x. For me tha=
t=E2=80=99s good
enough.

Alex

On Tue 29. Nov 2022 at 17.55, Ross Burton <Ross.Burton@arm.com> wrote:

> > On 29 Nov 2022, at 16:01, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Epiphany has moved to gtk4 in master. This makes us prepared for that.
> > https://github.com/GNOME/epiphany/blob/master/meson.build
>
> I=E2=80=99d say the recipe should sit in meta-gnome until it can be reaso=
nably
> tested as part of oe-core.
>
> Adding recipes that don=E2=80=99t get tested in any meaningful sense isn=
=E2=80=99t helpful.
>
> Ross

--00000000000057d9d005ee9ef337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s going to be tested in world builds against g=
cr 4.x. For me that=E2=80=99s good enough.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue 29. Nov 2022 at 17.55, Ross Burton &lt=
;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">&gt; On 29 Nov 2022, at 16:01, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Epiphany has moved to gtk4 in master. This makes us prepared for that.=
<br>
&gt; <a href=3D"https://github.com/GNOME/epiphany/blob/master/meson.build" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/GNOME/epiphany/blob=
/master/meson.build</a><br>
<br>
I=E2=80=99d say the recipe should sit in meta-gnome until it can be reasona=
bly tested as part of oe-core.<br>
<br>
Adding recipes that don=E2=80=99t get tested in any meaningful sense isn=E2=
=80=99t helpful.<br>
<br>
Ross</blockquote></div></div>

--00000000000057d9d005ee9ef337--

