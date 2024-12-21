Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE69CE7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:33:52 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.15570.1734820425698263738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kX/y8sit;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5f2d8f62290so1481049eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Dec 2024 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734820424; x=1735425224; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NwKB7FKkPVb08JtlO9AiFhVclN13yeB0hSB3ILg7olI=;
        b=kX/y8sit+4XovTaoQh4fuhJG8wa5SbTEgW8/w5uNtJGJqY4aGN0ki+z5t6ZnGlZplQ
         Jp2O+fdK3wa5/UQ1VRDc7s1VmJTL0NG2At1i66CKEtmxZHY0A2xMu0AoUqXYKnJ9MBt3
         quAKmoNMiJmI0txqLQArbiDa6oAqvo5i0sViZ034Q1CfX7bonGlRHafn9Z8brVa/xA4K
         li996zwNxARHDDCuHyIKUh+B62oCsT3SurvVEQBEzZOZEgpHQ0GYsl3+lEa7s8anTeW4
         C/FwBPvH0k+O96XgSmTkn4ftZXO0J2EW6mfcS3Cvvsy90aoiHq9roMS36ctsbij6L81l
         BJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734820424; x=1735425224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwKB7FKkPVb08JtlO9AiFhVclN13yeB0hSB3ILg7olI=;
        b=jxMd/sOlWeQCK3lfwPa3RkbfYWorJ5hLQQ0IVRXKiId+xRvo67KcWMW6lGJUPYpKa8
         ddSYScfcNfjNWGwjcBZjtu7YPvjBetKnfoWGrBVecfpdUhNNL6Ow0hzd091bnfegtCT6
         68gGzv63VYY1DfSvh6ikLyvYk74oQVIEtJBrfZTiQ5KOzPhHvgWARC+DcFViG6kXHR9U
         m8O+obKlET7L3fYIbCj85gmH7ZZqOewYCtz07hsweIO32a0x00V+qDf/y6j5JXv7LR3x
         49wvy821cVQgxAIaDAXgKuComaib3/0tGib3KEajOdnho0KgpXuLKCKXukbBOyXevV/x
         YIUw==
X-Forwarded-Encrypted: i=1; AJvYcCUHZUK5uY+BWxPT3PSrk5exZXRuUCdNLw01OCdKVpoWdn6ONyT5UdpuSBULDlCvbIVHawbzvgyQT6l7/O7Q9eL+Nw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhvpD1nuWsTqI++sV9GMqTK5Kc83MqKLrJSFh2KAqbrLItQlaq
	/EcWK94a2LrgCEsVYnjnwff+DXrrm3hbN1SSbidbKDgXRRioWyTYdzWyPlV76qV2gSNl4e8VxEX
	bJb+KHacoxqNRaJkL2AHsLUOaFGY=
X-Gm-Gg: ASbGncvAF7EzgFNeNlzf0iVdUeeBdv5SRo1/jDDpi5RsXXQ8nuPQIcSHMeHkssYTKQR
	2ZWHXF9H4se0el8EYac9GxLpSA0J2Sa0aa9TQoNzqqKr4y+RwWRHeU/yKy7PzsjXnPHFY+OxP
X-Google-Smtp-Source: AGHT+IFs1Xdj/Ah9O4iorjEd4EG91rdYlLtjkKu2dZkD3F26To5sDwHqTmjIJGal6Hefkt19qcaK5+4qh1Rgk4xTrQ0=
X-Received: by 2002:a05:6871:8306:b0:29e:6096:c25f with SMTP id
 586e51a60fabf-2a7fb2e94c5mr4621743fac.23.1734820424555; Sat, 21 Dec 2024
 14:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
 <20241219222120.1188742-4-tom.hochstein@oss.nxp.com> <CANNYZj-9Jdf6eeW=SdVPnSd8vVq3m+bhO=m9SZF5KKggcfKGvA@mail.gmail.com>
 <f1df3290-445e-4525-a3e5-7d156c5a45a5@oss.nxp.com> <CANNYZj_V5sxoaN=FpvpaFxfKSRNrrarR1Mcv9nuxKAADtbYXGQ@mail.gmail.com>
 <28220675-1c81-4e19-a935-0b001150ab9a@oss.nxp.com> <CAMKF1soxnjO=PaP92265dSfX7G9zjoeRu2hfrHV0c_8Mg19cfQ@mail.gmail.com>
 <5cd9d111-17f4-4e12-9c3c-91cfbd1454cc@oss.nxp.com>
In-Reply-To: <5cd9d111-17f4-4e12-9c3c-91cfbd1454cc@oss.nxp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Dec 2024 14:33:33 -0800
Message-ID: <CAMKF1sos+HS7jikyMUGwMGoXXyft71dZWTgB0pZma22jOStdPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] weston: Add xcb-util-cursor dependency
To: Tom Hochstein <tom.hochstein@oss.nxp.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000027a4350629cf5b03"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Dec 2024 22:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208993

--00000000000027a4350629cf5b03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 1:45=E2=80=AFPM Tom Hochstein <tom.hochstein@oss.nx=
p.com>
wrote:

> On 12/21/2024 2:10 PM, Khem Raj wrote:
> >
> > Tests sometimes do require additional packages and at times
> > development headers and libs
> > on target for different reasons and these dependencies may not be
> > needed for normal
> > functioning of the package. I would suggest to add them into image as
> > rdeps (if they are needed)
> > conditional upon ptests being enabled.
> >
>
> I don't see that weston references ptests. Is your comment a mistake,
> or do I misunderstand?


No you did not misunderstand. I am trying to help you

>
Hmm. Is there is meson option to disable/enable tests in Weston ? If so
then you can disable the tests by default. Since the error seems to be
showing a test configuration failure



>
> Tom
>
>

--00000000000027a4350629cf5b03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 21, 2024 at 1:45=E2=80=AFPM=
 Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.nxp.com">tom.hochste=
in@oss.nxp.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12=
/21/2024 2:10 PM, Khem Raj wrote:<br>
&gt; <br>
&gt; Tests sometimes do require additional packages and at times<br>
&gt; development headers and libs<br>
&gt; on target for different reasons and these dependencies may not be<br>
&gt; needed for normal<br>
&gt; functioning of the package. I would suggest to add them into image as<=
br>
&gt; rdeps (if they are needed)<br>
&gt; conditional upon ptests being enabled.<br>
&gt; <br>
<br>
I don&#39;t see that weston references ptests. Is your comment a mistake,<b=
r>
or do I misunderstand?</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">No you did not misunderstand. I am trying to help you=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex" dir=3D"auto"></blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Hmm. Is there is meson option to disable/enable tes=
ts in Weston ? If so then you can disable the tests by default. Since the e=
rror seems to be showing a test configuration failure=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br>
<br>
Tom<br>
<br>
</blockquote></div></div>

--00000000000027a4350629cf5b03--

