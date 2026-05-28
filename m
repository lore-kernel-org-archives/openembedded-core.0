Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDE3CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:18:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16763.1779990398728734220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q6WjI8CM;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: adityags2004@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a877510541so14321688e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779990397; cv=none;
        d=google.com; s=arc-20240605;
        b=gUROMhD1YZBYV4v/xL/zGTK6oksLplQAZF/nS7jv6Gj/naUroxiRPGxOYHI8jKnkUg
         EevKNawPOZEP0eBvITd4xq6plTHuXjotmZPeZapZeUz7Iydmsrd85S2goeXjIAIznNRV
         IT+PToi2pVf8u+HBBiJil+LrtiRQboDSFmL49hn/YAhelsmvKr4yDpb8hTxSS9y31ulO
         jfLUcEr+uLYnRzonVObL3x1oFBm7jL7nfj2Mqym1OJmzMOcOxN7NiZaobQ6MGorCgosT
         ZDaLW3pb/acb/DDWqDPDzDIWzBRbMwuQMoyFzB7qcm6Dc1LKfIOF/TkprDxF55hDaFBf
         3t3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sFWc+5xcaFwZt55WOMNjnog7QtlcMaHTTpIlxEYeW9I=;
        fh=VuqgHaMeX4z8Qp1VsXXqUtZc9hkPX/VdRdqA0SY2Ct8=;
        b=V19GFaPqSueva3q6uF0n4AS/RL3DBHXWtL5ySPpX0/tsxHeo5ykFl+jMZNc2Y/Kk4K
         MjEzgfajzJuOr2hG+wfQz97NmQHgIEvhoflbgXHW8tSqimH2XoUkSpKDqZzXeCNMzPYc
         mpL0JWUGhD07FQl5IaSXAieY7SiHgrmEckx/pOlof+N1ISdDNyXr+UH1847As4nVzPa3
         yiLusd75XzmGfQXmsItGNGpnqTGlyHVi10FArP/KkXNnhmJVGtwCNaGYOdAdEQSZMcgg
         eCx9qmONEjasZyVTRq7pbj3eQ1n0jU0zDimPnfLzUSSe2G+PsUN42n/ffkH9DKgK54Bu
         awpQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990397; x=1780595197; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sFWc+5xcaFwZt55WOMNjnog7QtlcMaHTTpIlxEYeW9I=;
        b=q6WjI8CMiox7uzisahchG+XYA8Eo5xUUcT9A/8WEXpCINNmMV7fRO+oyF++G/+mzog
         4E+BN/a34dggsXeIeEukgvD2Ng2KwRmV91qMr7PuPStuH86XHKyi/4BzY4LDHmZg/tph
         vVSMszj9UtcpnQsrkCbfpjUEVqOVTqr55fx30uEGvSnPt972iEn1Ddgu0FKWmAqsqe4m
         aeFWYVC0cAU4RMVl4L3intyX/lJJ+rtKk9rs11QgocSdR8WzNQSJYky1Y4t7Po9QilDp
         8tvRuijlcypJXTiBBaJ0SO50D2rQdVIsAuv77xWqItu84uVKTdue0IVgE2e9vuioVwCA
         bIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990397; x=1780595197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFWc+5xcaFwZt55WOMNjnog7QtlcMaHTTpIlxEYeW9I=;
        b=bGBWf/G/Lq9xUIoAKBPpYtg9dh3qKzCrYkq0OhrU10ROs8CsLoZoer97dC4zuwIx8m
         CKmXVk4XRxxyBpm2MxWWMdv38z8eFzVxxjXBoAxxgloEpZ+4p2jRbj6ely6JhMTMYTJf
         W6oGOqkICXISC6MZwtpXcghB9v1di8nGCksypkWyCpa5K3JY0hPfkSVHz6mCivJLS+Fr
         yqVKZPdydqt4A8lrMKshradm7kDzdSBA0mJo50l3JUeUs+PVBt79pBQ1YexcFGfJs/6I
         i4r7z+adWzoFpaTanYIVRY+rf3tdKv3MazSo0ZlpwpOGimNZ4pItNtcxS+W8srAxeWBq
         IOHg==
X-Forwarded-Encrypted: i=1; AFNElJ+T1xLC4scWNQs1ExQtIyOZ8/MXuIHRN+J0+kHpVxtJaFLlgY461fxp7JtTTb5WWe/mJExAKzdl+XwAx8JO2d0dwQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHfGt5a8dMadY6n83iWHINqMrlM8kLLH9WKvB47E1J1G8DPmAa
	ERE1z9QwrjC+nW1lgP3ri2AvTZzagfm24QhAkPGyCVy7o9FJXq8TdtkS9TnbXGCFJDoTjJIgqzF
	fuxcaCeyZ7ib7B+U8KbsgJldhRHhDy7o=
X-Gm-Gg: Acq92OE8ARvgJ3u57PtFPsa8r+vRpmjy+xrbkHffsfzGTQqPZwp0ImIGzg21nPHxG06
	Ip7oDXSeqT7eUHj8pQAKc8+F9pthhjkp02ecqTlMOOciW7BQVKMu+chq6T5OMHzbyG03McGhcZb
	S7dARQ6Be7c0NDYf2grfN/v6pr5/Xh0eFzn1MHAoYIW9KOTXM/p7oFVcevQQezUEBkd777Pd5P0
	sA14PPK1VB2XMFa4H2o3MCYCbkTL5oI44aUxwr0ruqVWu3O+Tu5zLA+hcTOVguXPhsbvsK0jIZT
	k6M8ewcrkRTUvs8HxTNZ4syvi8kZDZM=
X-Received: by 2002:a05:6512:607:20b0:5a8:6c7b:f9d7 with SMTP id
 2adb3069b0e04-5aa57e72b44mr26977e87.41.1779990396706; Thu, 28 May 2026
 10:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
 <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
 <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
 <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com>
 <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com>
 <f396af25d398685f31b9b55c079aa9fbb757dc1f.camel@linuxfoundation.org> <CAHaUZZBwnoENFCg=kJsmB7t2jU3GciHQixxDy+VXwP02XD0d1Q@mail.gmail.com>
In-Reply-To: <CAHaUZZBwnoENFCg=kJsmB7t2jU3GciHQixxDy+VXwP02XD0d1Q@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Thu, 28 May 2026 23:16:24 +0530
X-Gm-Features: AVHnY4LNlbX2-p2ySpJEmh5ke21FBWw_48lBCX5k6j-R1L8pt-HcEan4WlqHmnM
Message-ID: <CAHaUZZBFfp2iS=9nNbW3zCCB5KYGJEdn50iROvyJz=8jse6a2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	joaomarcos.costa@bootlin.com, ross.burton@arm.com, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000004ca26d0652e44fe3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237731

--0000000000004ca26d0652e44fe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex, Richard,

I've sent the backport patch to the openembedded-core mailing list for
review, based on the upstream fix.

Please let me know if any changes are needed.

Thanks,
Aditya

On Thu, May 28, 2026, 10:45=E2=80=AFPM Aditya G.S <adityags2004@gmail.com> =
wrote:

> Hi Alex, Richard,
>
> Thank you for the kind words and support I really appreciate it!
>
> I'm currently working on preparing the backport patch for oe-core based o=
n
> the upstream changes, and will share it shortly for your review.
>
> Please let me know if there are any specific expectations or guidelines I
> should keep in mind while preparing the patch.
>
> Thanks,
> Aditya
>
> On Thu, May 28, 2026, 10:33=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2026-05-28 at 20:43 +0530, Aditya G.S wrote:
>> > I wanted to provide an update on this issue.
>> >
>> > The proposed fix has now been accepted upstream by the gawk
>> > maintainer.
>> >
>> > The changes to randtest.sh have been reviewed and integrated into the
>> > upstream repository, with appropriate updates to the original file
>> > and test/ChangeLog.
>> >
>> > Given that the root cause has now been addressed upstream, this issue
>> > can be resolved in oe-core by backporting the corresponding upstream
>> > fix, rather than relying on a workaround such as skipping the test.
>> >
>> > Please let me know if you would like me to prepare a backport patch
>> > for oe-core based on the upstream changes.
>>
>> Big thanks and kudos for getting it sorted upstream!
>>
>> We would happily take a backport patch.
>>
>> Cheers,
>>
>> Richard
>>
>

--0000000000004ca26d0652e44fe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex, Richard,<div dir=3D"auto"><br></div><div dir=3D"=
auto">I&#39;ve sent the backport patch to the openembedded-core mailing lis=
t for review, based on the upstream fix.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Please let me know if any changes are needed.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto"=
>Aditya</div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2026, 10:45=E2=80=AFPM A=
ditya G.S &lt;<a href=3D"mailto:adityags2004@gmail.com">adityags2004@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto=
">Hi Alex, Richard,<div dir=3D"auto"><br></div><div dir=3D"auto">Thank you =
for the kind words and support I really appreciate it!</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I&#39;m currently working on preparing the b=
ackport patch for oe-core based on the upstream changes, and will share it =
shortly for your review.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Please let me know if there are any specific expectations or guidelines I =
should keep in mind while preparing the patch.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Aditya</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, May 28, 2026, 10:33=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Thu, 2026-05-28 at 20:43 +0530, Aditya G.S wrote:<br>
&gt; I wanted to provide an update on this issue.<br>
&gt; <br>
&gt; The proposed fix has now been accepted upstream by the gawk<br>
&gt; maintainer.<br>
&gt; <br>
&gt; The changes to randtest.sh have been reviewed and integrated into the<=
br>
&gt; upstream repository, with appropriate updates to the original file<br>
&gt; and test/ChangeLog.<br>
&gt; <br>
&gt; Given that the root cause has now been addressed upstream, this issue<=
br>
&gt; can be resolved in oe-core by backporting the corresponding upstream<b=
r>
&gt; fix, rather than relying on a workaround such as skipping the test.<br=
>
&gt; <br>
&gt; Please let me know if you would like me to prepare a backport patch<br=
>
&gt; for oe-core based on the upstream changes.<br>
<br>
Big thanks and kudos for getting it sorted upstream!<br>
<br>
We would happily take a backport patch.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>
</blockquote></div>

--0000000000004ca26d0652e44fe3--

