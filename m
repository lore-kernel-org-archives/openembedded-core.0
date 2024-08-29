Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1795CC7115C
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 01:46:41 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.3030.1724895996269379863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 18:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k21u1kMI;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3db1d0fca58so76207b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 18:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724895995; x=1725500795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HWLUoJwA+3ug8oQCximBDZKbqNgvBZSwcwifZ7xs3Bo=;
        b=k21u1kMIpyWWQ6GQe2dO6jCzE6tXwgKg3SLgGQVViMxJlXslYvR+H6mzVZy+iFyLM0
         p31rprVqFcbgDCMZvWNcJU+FCmaHqVtcvHnipz+egdEJmuw17Ac48HqbXsuj40+COpHR
         3MykBQuIaCJpeSZaxmwqxT5EfQCMXYdRuGVm9/1DGI13O1PACpw7HSY+HyGRlZF3bjCd
         56pIRsl3DsjFsPetTLqVB1gQxS8Ja7XZGDYbXnLs7Eq1XCJtTGHFdAKhvsTBlbCazNGO
         jI0DuApA3cOR0igP6Xw1likJzexdqdK58mqUXdtK1OKxg+pnq2jXb4apvGuW6AsfLF5g
         MXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724895995; x=1725500795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWLUoJwA+3ug8oQCximBDZKbqNgvBZSwcwifZ7xs3Bo=;
        b=r10C81TPwffS8vTpq8m9m6Q+L+iFYrboUi8MW2las2fbafiv7HZ/5vRwVqNyhxQdb6
         DxXzqAzomtDYSXxM1KEtCnaewJa6HaOqLlIKvDzinu5DNYiJbtzQQQChPvv2Xu8WnuxW
         ewSOf9fhV/AYVveEXuC74IQ5EgrbiLxxwEIesQdowI1t/yj6W/JcEMwYa620YqreJIe+
         SKzgCVU4i7ZDESLBzqP3z7aiVT2Tvn9atauiVcYCtbnZhzJ6Qgnb1fh7Cb3nmpw+9UVN
         veTBRi5wjr++Mg8PAlZKtIaMivESjrt0bmJpiBTF5n9OVKMed1FDwQ39mvfCKTynmYhW
         lcqA==
X-Forwarded-Encrypted: i=1; AJvYcCV7NnE2A5Eu/0xt5j5bgY1XeGH+I1oPIOb+Hzr0xrxU4UoX2kegFbAkFuAedFLZNfs4dqF2n6AIyOlmA2bsWn1XnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyk/HEemQwaZ+z4LiSIhLrkPX5wBUjq2TrzltG4txH8+W3g8iC6
	zqEP/immZCCcfxRRCO5MSfXOJxGcNTNx85ou6hGYtMIXZ+uy2Gvr1XfJaHXc6p1SubY7AwtVxoz
	JAbs9bg2RXUWa5MGnqdUadcp/2Bg=
X-Google-Smtp-Source: AGHT+IHjNW7kGFmaS+Q3Ls3yQhI7P6ZaTOj8swtPBCOP08mDXopqWB+7t1hWhUpz8PVbZ9MsWkJf4+QR5Y78n9CvJiU=
X-Received: by 2002:a05:6870:4728:b0:270:25e:b341 with SMTP id
 586e51a60fabf-277902e29b4mr1606549fac.36.1724895995388; Wed, 28 Aug 2024
 18:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj9KSfNg=VOBHqFAFOHpoGTPJe7s8rEii-gDxp-t5K=Uig@mail.gmail.com>
 <TYWPR01MB11861DF67DC120A05FD4373A6DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj-hhrupgJeDZim3SbDsEOXabPUJ-mqs1DBye0x4BzFF+Q@mail.gmail.com> <TYWPR01MB118613BE06C6CFD075C898628DC962@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118613BE06C6CFD075C898628DC962@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2024 18:46:23 -0700
Message-ID: <CAMKF1soayytWV94n7F_mi5uZ5G0j8R+fVt8Pa2id0TpN0-rO2A@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
To: wangmy@fujitsu.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000146b120620c8a54d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 01:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203899

--000000000000146b120620c8a54d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 6:22=E2=80=AFPM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> | Are you using package_rpm and dnf to compose the image?
> Yes.
>
> I checked the permission of rules.d, they are different:
>
> systemd: %attr(700,polkitd,root) %dir "/usr/share/polkit-1/rules.d"
> polkit:  %attr(755,root,root) %dir "/usr/share/polkit-1/rules.d"
>
> If the permission need to be unified, which one should be unified into?
>

Stricter is better so 700 seems good from security pov but we need to
ensure it works with polkit

>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, Chi
> <https://www.google.com/maps/search/6+Wenzhu+Road,+Nanjing,+210012,+Chi?e=
ntry=3Dgmail&source=3Dg>
> na
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Wednesday, August 28, 2024 5:15 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives
> to
> > solve conflicts with polkit
> >
> > On Wed, 28 Aug 2024 at 11:04, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com=
>
> > wrote:
> > >
> > > The name of /usr/share/polkit-1/rules.d are the same, but the files
> contained
> > in the path are different.
> > > What methods can be chosen to solve this problem in this situation?
> >
> > Are you using package_rpm and dnf to compose the image? If so, you can
> look at
> > the spec files used to produce the packages in ${WORKDIR} of systemd an=
d
> > polkit to see how /usr/share/polkit-1/rules.d is specified in both. It
> might be that
> > permissions or ownership are different and dnf can't resolve that.
> >
> > Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203898):
> https://lists.openembedded.org/g/openembedded-core/message/203898
> Mute This Topic: https://lists.openembedded.org/mt/108138529/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000146b120620c8a54d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 28, 2024 at 6:22=E2=80=AFPM wangmy via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D=
<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">| Are =
you using package_rpm and dnf to compose the image? <br>
Yes.<br>
<br>
I checked the permission of rules.d, they are different:<br>
<br>
systemd: %attr(700,polkitd,root) %dir &quot;/usr/share/polkit-1/rules.d&quo=
t; <br>
polkit:=C2=A0 %attr(755,root,root) %dir &quot;/usr/share/polkit-1/rules.d&q=
uot;<br>
<br>
If the permission need to be unified, which one should be unified into?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Stricter is bett=
er so 700 seems good from security pov but we need to ensure it works with =
polkit=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.<a href=3D"https://www.google.com/maps/search/6+Wenzhu+Road,+Nanjing,+21=
0012,+Chi?entry=3Dgmail&amp;source=3Dg">6 Wenzhu Road, Nanjing, 210012, Chi=
</a>na<br>
TEL=EF=BC=9A+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Wednesday, August 28, 2024 5:15 PM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [PATCH] [OE-core] [PATCH] systemd: use update-alternative=
s to<br>
&gt; solve conflicts with polkit<br>
&gt; <br>
&gt; On Wed, 28 Aug 2024 at 11:04, Mingyu Wang (Fujitsu) &lt;<a href=3D"mai=
lto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The name of /usr/share/polkit-1/rules.d are the same, but the fil=
es contained<br>
&gt; in the path are different.<br>
&gt; &gt; What methods can be chosen to solve this problem in this situatio=
n?<br>
&gt; <br>
&gt; Are you using package_rpm and dnf to compose the image? If so, you can=
 look at<br>
&gt; the spec files used to produce the packages in ${WORKDIR} of systemd a=
nd<br>
&gt; polkit to see how /usr/share/polkit-1/rules.d is specified in both. It=
 might be that<br>
&gt; permissions or ownership are different and dnf can&#39;t resolve that.=
<br>
&gt; <br>
&gt; Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203898): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203898" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203898</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108138529/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108138529/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000146b120620c8a54d--

