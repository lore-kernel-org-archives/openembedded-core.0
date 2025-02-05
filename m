Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA17C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 12:04:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.10392.1738757037678132249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 04:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gb8J9iR5;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f0b5d6c6eso10919435ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 04:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738757037; x=1739361837; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weMF/+ewWPRdpUuoWcyWVhn9vxBr61kdMWxGwzyqZ1g=;
        b=gb8J9iR5ux31xvcYr/6lJtmTJOmcUiZi4Rs8K2Q6x+lGLD4/JxY8Xutc4wG7aTuggP
         ONkHy4ihTS7nNCwuQxj3DV7oUr1/ybNX+bHWqo9CfDdCy2yT8m9C+mdCFbPBHXBMWtBQ
         9EFr+PqkYc1GxQoHKzuOlhXk8ljH8mc5ZIp/m7Ze2shOwWeuQrPpbJDpQmYecqBd4KCv
         4iAP648UMWvh8s+wrzHeegL2bRqqWG2J8XETIq/mYsVjtTCmS0igLF+Fay1nTgKMbmO0
         Winz/vyEWggrc0XYgxIkt3uzNrPNerWO2igQsbmCp6pDMmV1cUiSYJGEE5FMs73nYTBk
         +qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738757037; x=1739361837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weMF/+ewWPRdpUuoWcyWVhn9vxBr61kdMWxGwzyqZ1g=;
        b=d5yuaY8bqM3HHcHuqPsRkePzsmVGvqAX/+WKabxi88pjgMCVp5Ac3YSaj/hPuiSKiw
         2hUG8pyPxDlygm/eUlySobleQ/HfwZKeWc37/4fanjhWNT4RUmU/Auq5ZrZrALhDMcs8
         f2rfBK5yHr45I9CviSn7zBxsJI7lQzxFdsLkotGpap+nYLWW1DM8Y4qhWx3Eq5ePcY3U
         5GA4i3leQGypFgBZ93CcnkdrhnoO7irUST6HR2Ue9FYMGdcbl4lDgR3etnMxeyvLclmS
         nduUp79zl7udVFExv5nUF1X+NLFl1iT+5a3QO41LeF6XIiRCm2o/TyQAWRZx+G/rCGyt
         wL7w==
X-Forwarded-Encrypted: i=1; AJvYcCUbcAyqZyDQ7K0G9VPjXuJufIl3qEDlKLyhiJ3ljeYV0Y6IJB3s15W7WRV0kG8K5s+qNK5XfaPYEgWrpfwZm+OAuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYY2r0FNI4q3iNZ9bstaLXsS0YBD/AhjUMI1ShxBALtUebO57V
	s/OYO/cY8LcJsx9xX4VchMk4OcHpQut2dIRqmxxoE9hhQrx0sJFT7RZuiKTPko6WH+19Hio8XBV
	1vq0V+vAcRoxn0hQXhfJIAlEvdgY=
X-Gm-Gg: ASbGncvnso4n4iHg8pIx74FsFw5ihDpfiYX9zHbigx7moSwlGmavrc0OekX9lM1yLFk
	11luNaoEF5c1vVUQuGvBJTjWufzTXpL/TKHgGYTaLi2toQiaZxNNmG4L+v7uA6QaiG3rYRedVMQ
	==
X-Google-Smtp-Source: AGHT+IHec4/35iDUew4PtvkqZ4PAC8hD1uqcMppPkzJclIefnefeNaTOLZIdDYiKKdCstyFx20SlHlJn5pEPwaR1XVU=
X-Received: by 2002:a17:902:ec8f:b0:215:b18d:ca with SMTP id
 d9443c01a7336-21f01cf5fb5mr99219035ad.18.1738757035934; Wed, 05 Feb 2025
 04:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
 <20241224102557.9300-5-marta.rybczynska@ygreky.com> <6703A7E3-30BD-44E9-875C-058BD2EAF58C@arm.com>
 <90F815DC-7009-4529-91DC-93F33737DEC4@arm.com>
In-Reply-To: <90F815DC-7009-4529-91DC-93F33737DEC4@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 5 Feb 2025 13:03:44 +0100
X-Gm-Features: AWEUYZnh2udLE09yj6zcobu6YvD4mKwRuvAQ44xpX6xls2jSkbUlJR1E8JJFRNU
Message-ID: <CAApg2=RHnjm7A9DW1JB8UH_AcUQXcUkY4v-aNdAd9ZpjN5jkkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2][OE-core 4/4] cve-check: allow feed choice
To: Ross Burton <Ross.Burton@arm.com>
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007a4c0d062d63eb6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 12:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210845

--0000000000007a4c0d062d63eb6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
This one is simple. cve-update-db-native is starting from 2002, while
cve-update-nvd2-native from the beginning of the database, so 1999. We
might unify this, but I do not consider it  priority.

Kind regards,
Marta

On Wed, Jan 15, 2025 at 1:23=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Hi,
>
> Also I ran the scanner against core-image-sato for each of the feeds and
> interestingly nvd2 was the only one to report CVE-1999-0524.  Do you have
> any idea why this might be?
>
> That said, a fetch taking a minute or so instead of almost an hour is a
> great improvement!
>
> Cheers,
> Ross
>
> > On 14 Jan 2025, at 17:54, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > On 24 Dec 2024, at 10:25, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > There=E2=80=99s an inconsistency:
> >
> >> Set the NVD_DB_VERSION variable to choose feed:
> >> NVD2 (default) - the NVD feed with API version 2
> >> NVD1 - the NVD JSON feed (deprecated)
> >> FKIE - the FKIE-CAD feed reconstruction
> >
> > =E2=80=9CNVD1=E2=80=9D
> >
> >> +# Possible database sources: NVD1, NVD2, FKIE
> >> +NVD_DB_VERSION ?=3D "NVD2"
> >
> > =E2=80=9CNVD1=E2=80=9D
> >
> >> +    if nvd_database_type not in ("NVD", "NVD2", "FKIE=E2=80=9D):
> >
> > =E2=80=9CNVD=E2=80=9D
> >
> > I=E2=80=99m thinking =E2=80=9CNVD1=E2=80=9D should be used everywhere.
> >
> > If you set it as the documentation says then every recipe throws a
> warning, which is quite the pastebomb.  Might be better to make it
> bb.fatal() and tell the user to fix their typo?
> >
> > Ross
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#209811):
> https://lists.openembedded.org/g/openembedded-core/message/209811
> > Mute This Topic: https://lists.openembedded.org/mt/110270325/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000007a4c0d062d63eb6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>This one is simple. cve-update-db-na=
tive is starting from 2002, while cve-update-nvd2-native from the beginning=
 of the database, so 1999. We might unify this, but I do not consider it=C2=
=A0 priority.</div><div><br></div><div>Kind regards,</div><div>Marta<br></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Jan 15, 2025 at 1:23=E2=80=AFPM Ross Burton &lt;=
<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Also I ran the scanner against core-image-sato for each of the feeds and in=
terestingly nvd2 was the only one to report CVE-1999-0524.=C2=A0 Do you hav=
e any idea why this might be?<br>
<br>
That said, a fetch taking a minute or so instead of almost an hour is a gre=
at improvement!<br>
<br>
Cheers,<br>
Ross<br>
<br>
&gt; On 14 Jan 2025, at 17:54, Ross Burton via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" targ=
et=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; On 24 Dec 2024, at 10:25, Marta Rybczynska via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; There=E2=80=99s an inconsistency:<br>
&gt; <br>
&gt;&gt; Set the NVD_DB_VERSION variable to choose feed:<br>
&gt;&gt; NVD2 (default) - the NVD feed with API version 2<br>
&gt;&gt; NVD1 - the NVD JSON feed (deprecated)<br>
&gt;&gt; FKIE - the FKIE-CAD feed reconstruction<br>
&gt; <br>
&gt; =E2=80=9CNVD1=E2=80=9D<br>
&gt; <br>
&gt;&gt; +# Possible database sources: NVD1, NVD2, FKIE<br>
&gt;&gt; +NVD_DB_VERSION ?=3D &quot;NVD2&quot;<br>
&gt; <br>
&gt; =E2=80=9CNVD1=E2=80=9D<br>
&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 if nvd_database_type not in (&quot;NVD&quot;, &quot=
;NVD2&quot;, &quot;FKIE=E2=80=9D):<br>
&gt; <br>
&gt; =E2=80=9CNVD=E2=80=9D<br>
&gt; <br>
&gt; I=E2=80=99m thinking =E2=80=9CNVD1=E2=80=9D should be used everywhere.=
<br>
&gt; <br>
&gt; If you set it as the documentation says then every recipe throws a war=
ning, which is quite the pastebomb.=C2=A0 Might be better to make it bb.fat=
al() and tell the user to fix their typo?<br>
&gt; <br>
&gt; Ross<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#209811): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/209811" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/209811</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11027032=
5/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/110270325/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000007a4c0d062d63eb6c--

