Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255CACCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 06:28:44 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.12080.1760941709804633139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 23:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRWLYWjm;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso3774867f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 23:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760941708; x=1761546508; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn9xhKmIU9UGk11NuRgqdnLnKR0fbzS+EZBLxel6AXQ=;
        b=SRWLYWjmUrVkXx8U5eYZ9253/DY3wqw3WzoBp20UNjbGY/1jhSRnm9IHdFIfhfmbwL
         0wEYNpPl0pCvkbRpDIewDqNZesekY/UGRe91/1U/RG8cm05bFI4IeCUjftWHiml7bLkD
         KoWW4EIrSBNhVCMhTdHqCEIKNa890raTe5VL99tLIMA2H7Y9BzUJXiMRfSenmC9RQkfH
         tyi9aZwovColEyw2L6y0zSQx1Geus5mKtZZtGa8zOcf6ML/s8ciMZ+yDHbBJFXVsFJD/
         JqCrlbIYavwnHm6wc2XEZAVJN0UjBNByZjDKRQayVOgp2PNRh0rhAyDuC0p8GlHyERkz
         t29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941708; x=1761546508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yn9xhKmIU9UGk11NuRgqdnLnKR0fbzS+EZBLxel6AXQ=;
        b=Jdmge7vI1fJVOxWQch/b4KTIAdX6m4rnunnWHbRnicZ09MJ3vFFVlsn/nIY6CD7adm
         8iADZUgsr6SRK3/usjpOuJ/VL8YCfnz3AB14B75ibRCI3p5y5aVQ0pkObVURnfDyimce
         vSGdsCdcM7wdYu035RtUGFWon7ntR8ra+eHyC1ktMx2S++PiYaEVvGTTfHz9yUJG/HvB
         DYj6Q6r14VnWoXXjHrinGsAOLxQJuGATKdKJzt5TrAhzb34iCjnsmH/LqFiiJ0SSkH2u
         Enem9szZBOucaQUeFo05XLUspMGf8KZZ8Zj6GzqX+srq8xPQ+UDiv0rlsVKgPuw5SYif
         AK8Q==
X-Gm-Message-State: AOJu0Yx/nQYq3c8Nev5OxQk4G2wCOeTBomf+VhFG754kMqby23NIv38M
	vS64PAIHZvgUKwPEStyslaFVzt+qMcY8tUcek0sPfaeWPKpOfA6xMPfkijd9RyICDfWzMpSAcbT
	NVYD2sOFL1Hk/sY8YcOUEh8P4BDAfZEI=
X-Gm-Gg: ASbGncsw1KWUHxgoMHfY26eHydvAOl8Huf7ScqzRybD2TLyobAxaQn4J/5MwFvA0Jnk
	z/Vajp1a+vd5h0TAQ4v2FDTP+iV2Xl6dgaVd/M3eCMaQPP7F29lhdz1w6Uu2O87lOQKmk3LyyCm
	+mRT8AvpA3cPB2IvNa9prNzJLbsHLcAbCf4f+Za4NQHvrNRfVp322+eVRP7eWy4Tz6/ow3gnt/N
	I/UmbpSWigtj9vUamu7IzF9L+9cxAdO9EiVT6orimvfF3+tN/QLhSRj0n8snSOKtwjyRrOy/1lJ
	3wvlCqwKtBsnlL+Vek06sUX4
X-Google-Smtp-Source: AGHT+IFtRvvszTPvHnvJth2AC+8ptZz3Xgd3+RsKO+gxgmhGHFN4JWgXVKdJUYqTEUvCg0dfPzhq2261pEuMn5SPvYs=
X-Received: by 2002:a05:6000:22c6:b0:3ec:db18:1695 with SMTP id
 ffacd0b85a97d-42704dc9395mr8227532f8f.45.1760941707896; Sun, 19 Oct 2025
 23:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3asfhhUoscOusRRkjWavdC3QvqROuo4WvZnVH2O0sCsuB1oA@mail.gmail.com>
 <774.1760628588661308317@lists.openembedded.org>
In-Reply-To: <774.1760628588661308317@lists.openembedded.org>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Mon, 20 Oct 2025 08:28:16 +0200
X-Gm-Features: AS18NWAXaTjf-yWAjxEcexHNXH10NaTFYRjww0iqa-hmIyFUZko59UQDfbX4BKo
Message-ID: <CAB3asfj-fTNZiOpsysPcLGGB2X-SbLW95gVWqym_7zf4DCJQBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7] kernel-fit-image: allow overriding DTB
 compatible string
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f82ccf0641913021"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 06:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225096

--000000000000f82ccf0641913021
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kavinaya

It would be valuable to understand what gaps exist or what doesn't align
with Qualcomm's requirements. Perhaps others have encountered similar
issues, and we should consider improving the core functionality.
Here I attempted to organize the patches and prepare some test
improvements:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/fitimage-improve=
ments
I'm curious to hear whether your final solution will be a combination of
UKI and FIT images, or if that approach proved to be the wrong direction
entirely.

Thank you and regards,
Adrian




Am Do., 16. Okt. 2025 um 17:29 Uhr schrieb Kavinaya S via
lists.openembedded.org <kavinaya=3Dqti.qualcomm.com@lists.openembedded.org>=
:

> On Wed, Oct 15, 2025 at 10:43 PM, Adrian Freihofer wrote:
>
> >
> > What I don't quite understand yet is: Does this make sense from the
> kernel or
> > DTB perspective? Or are we circumventing problems that should be fixed
> on the
> > kernel or DTB side instead of overriding them on the Yocto side? I mean=
,
> > wouldn't it make more sense to assign a compatible string that is usefu=
l
> for
> > u-boot in the DTB without requiring FIT_DTB_COMPATIBLE_OVERRIDE?
> > >
> > >
> > >
> >
>
> Hi Adrian,
>
> Thank you for all your valuable reviews and inputs. After an internal
> discussion with our colleagues, we feel that the proposed change does not
> fully align with Qualcomm=E2=80=99s current approach to implementing DTB-=
only FIT
> in the format expected by our UEFI bootloader. Given this, we=E2=80=99ve =
decided to
> hold off on upstreaming the change for now. Our plan is to first implemen=
t
> the DTB-only FIT support within our meta layer, refine it further, and th=
en
> propose a solution to oe-core that support both kernel+DTB FIT and DTB-on=
ly
> FIT formats effectively.
>


> Thanks,
> Kavinaya
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224972):
> https://lists.openembedded.org/g/openembedded-core/message/224972
> Mute This Topic: https://lists.openembedded.org/mt/115767371/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f82ccf0641913021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr"><div>Hi=C2=A0Kavinaya</div><div><br></div><di=
v>It would be valuable to understand what gaps exist=20
or what doesn&#39;t align with Qualcomm&#39;s requirements. Perhaps others =
have=20
encountered similar issues, and we should consider improving the core=20
functionality.<br>Here I attempted to organize the patches and=20
prepare some test improvements:=20
<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/fitim=
age-improvements">https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrian=
f/fitimage-improvements</a><br>I&#39;m
 curious to hear whether your final solution will be a combination of=20
UKI and FIT images, or if that approach proved to be the wrong direction
 entirely.</div><div><br></div><div>Thank you and regards,</div><div>Adrian=
</div><br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D=
"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">=
<br></div><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 16. Okt. 2025 um 17=
:29=C2=A0Uhr schrieb Kavinaya S via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;kavinaya=3D<a href=3D"mailto:qti.qualcomm=
.com@lists.openembedded.org">qti.qualcomm.com@lists.openembedded.org</a>&gt=
;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 1=
5, 2025 at 10:43 PM, Adrian Freihofer wrote:<br>
<br>
&gt;<br>
&gt; What I don&#39;t quite understand yet is: Does this make sense from th=
e kernel or<br>
&gt; DTB perspective? Or are we circumventing problems that should be fixed=
 on the<br>
&gt; kernel or DTB side instead of overriding them on the Yocto side? I mea=
n,<br>
&gt; wouldn&#39;t it make more sense to assign a compatible string that is =
useful for<br>
&gt; u-boot in the DTB without requiring FIT_DTB_COMPATIBLE_OVERRIDE?<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
<br>
Hi Adrian,<br>
<br>
Thank you for all your valuable reviews and inputs. After an internal discu=
ssion with our colleagues, we feel that the proposed change does not fully =
align with Qualcomm=E2=80=99s current approach to implementing DTB-only FIT=
 in the format expected by our UEFI bootloader. Given this, we=E2=80=99ve d=
ecided to hold off on upstreaming the change for now. Our plan is to first =
implement the DTB-only FIT support within our meta layer, refine it further=
, and then propose a solution to oe-core that support both kernel+DTB FIT a=
nd DTB-only FIT formats effectively.<br></blockquote><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Kavinaya<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224972): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224972" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224972</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115767371/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115767371/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f82ccf0641913021--

