Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEEBC6FD1F
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 15:41:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.23015.1678722076727116521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 08:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=Nig7TKNc;
 spf=pass (domain: inovex.de, ip: 209.85.208.53, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-ed1-f53.google.com with SMTP id er25so22309569edb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1678722074;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/f4i7HK8O/bKhnOYwBzBDhHKGjQVGNHsZPo3U75p74E=;
        b=Nig7TKNcrTyzCzPHeE5YMCPCGHGD+zBlSgzN+uFrriiEfWUC5JYBHph4qkKaqrh0xN
         UKoxijNcRvf/evnjZYoR0eY98xA9J0XTkAbC+aNI98De2Y9zsLreZ577a6MRclVZj3aq
         hqtk1uCNsnEmQDyqFDeSM3DnT4Tuy30OOXAYd6IvBk6j97gBsuAIb20qtNRFT0wWpLWb
         +6UxbaPyIRDT4ZW0LYHexAQInovNHvRmdDjJbjcgQga1xQh3sV0dDW5uSnFyrzKdIGSo
         6X1HPMOYhJMOv454Fgx3qoYp0Kk/HJZVO9nunYVGRI9yxlcrCtW/qH/+oE09sXIuEQjm
         qqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678722074;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f4i7HK8O/bKhnOYwBzBDhHKGjQVGNHsZPo3U75p74E=;
        b=4HoAXJuTExAwwxfA3xkUIhU+ArW/v9INKlm/RRf1/tYn7szyOiRzP8ImLlPb6YyGGc
         vjTHwvbZ00QHlujBjQTRjbhD2CxCE6IltEuv4DGISHpIA+IpLxrEgfNpSQMutO5EHvog
         sgHEYGJEFv+A3bKh15PEi8QOLc6x4fQFUwpZSKNFfNfIkBjv9FIRZyOBeBuXcDDdJXL6
         eaOjEeKCJE5OGX1U+qoFl9vxZQSHHazHwD6Do20TyEfmQ2T7BN7GrgAwoHRMTnYBYNn+
         JxY7o3yRPule7cPJLOZvQth8cKTi1uD+JFeaA5TDTLTj5wBrKxBgsTxCU+FllLoiD2BA
         Jx/Q==
X-Gm-Message-State: AO0yUKWJGDTLfnKVVbNBwDSv40K2E6kEJK/calUcOcQE6I4FY3DCa977
	s2ENzGts6KSPqRD7Ysk8abypx9K1x+vaaIu1d6NDfFMySxQ2mycn2eo=
X-Google-Smtp-Source: AK7set/cfJRnFKWd1PY1wWfN7N91pcgHRZ7zr+u2q1J4Xq4Sz7mOQJQmreOZeqRpUchS6MQX1AEBBrBKE9Ea49LgZzM=
X-Received: by 2002:a17:906:eea:b0:917:ee94:899b with SMTP id
 x10-20020a1709060eea00b00917ee94899bmr10105872eji.9.1678722074539; Mon, 13
 Mar 2023 08:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
 <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
 <Y/4b0dLAaxLcHKSc@mail.local> <CABFt5okSFyMcjJ506pgdu9jD00AFZco2XhNKQCRXUh8nQ_zPBA@mail.gmail.com>
 <CANNYZj_a4PrXBZHU_2y8=dXumVsV2Zz2PtNTL9aRG94sRkEeZw@mail.gmail.com>
 <CABFt5onpZJo6+cwDiX6JniYQfSXtO1ebSwR_9w-NL8Wb9h1JcQ@mail.gmail.com> <6631BE97-0F51-4630-AF03-F6C4C179E247@arm.com>
In-Reply-To: <6631BE97-0F51-4630-AF03-F6C4C179E247@arm.com>
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
Date: Mon, 13 Mar 2023 16:41:03 +0100
Message-ID: <CABFt5onGKtb5d4SbrnppbZXBpj=kkgb0ZZn-MSOPnO35g4UzeQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs plugin
To: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000ee0c4b05f6c9f0a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 15:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178453

--000000000000ee0c4b05f6c9f0a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

> The other option would be for the test to determine if the recipes are
available, so adding meta-filesystems would enable the tests.

I'm not sure if I understand your proposal correctly.
If the idea is to add meta-filesystems as a kind of before class/test
setup and remove it afterwards (like tested in
meta/lib/oeqa/selftest/cases/bblayers.py)
- yes, I think this would be possible, if its an acceptable way to do it.
If not, please give me a hint about what you meant.

-- Anna



*Anna-Lena Marx*
M.Sc. Embedded Systems
Embedded Software Development

inovex GmbH =C2=B7 Ludwig-Erhard-Allee 6 =C2=B7 76131 Karlsruhe
015233181260 =C2=B7 anna-lena.marx@inovex.de =C2=B7 www.inovex.de
Sitz der Gesellschaft: Pforzheim =C2=B7 AG Mannheim, HRB 502126
Gesch=C3=A4ftsf=C3=BChrer: Stephan M=C3=BCller, Tobias Joch
Wir nutzen Technologien, um unsere Kunden gl=C3=BCcklich zu machen. Und uns
selbst.
blog.inovex.de =E2=80=93 Deep Dives in digitale Innovationen.
culture.inovex.de =E2=80=93 Werte & Worklife bei inovex.
newsletter.inovex.de =E2=80=93 1 x pro Monat News & Events.
design.inovex.de =E2=80=93 Digital Product Interfaces von inovex.




Am Mi., 8. M=C3=A4rz 2023 um 14:33 Uhr schrieb Ross Burton <Ross.Burton@arm=
.com>:

> On 6 Mar 2023, at 15:10, Anna-Lena Marx via lists.openembedded.org
> <anna-lena.marx=3Dinovex.de@lists.openembedded.org> wrote:
> >
> > Hi,
> > moving the support or the tests to meta-filesystems does not make sense
> to me.
> > Wic is located in oe-core, move support and tests would not really work
> at all and create another dependency.
> > It may be an option to move f2fs from meta-filesystems to
> meta/recipes-devtools where e.g. btrfs, dosfs tools and erofs are located=
.
> > Otherwise, allowing it without tests would be an option, but that's not
> ideal either.
> > On the other hand is there merged support for some filesystems in wic
> without matching tests.
>
> The other option would be for the test to determine if the recipes are
> available, so adding meta-filesystems would enable the tests.
>
> Ross

--000000000000ee0c4b05f6c9f0a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<br><br>&gt; The other option would be for the tes=
t to determine if the recipes are available, so adding meta-filesystems wou=
ld enable the tests.<br><br>I&#39;m not sure if I understand your proposal =
correctly.<br>If the idea is to add meta-filesystems as a kind of before cl=
ass/test<br>setup and remove it afterwards (like tested in<br>meta/lib/oeqa=
/selftest/cases/bblayers.py)<br>- yes, I think this would be possible, if i=
ts an acceptable way to do it.<br>If not, please give me a hint about what =
you meant.<br><br>-- Anna<br><br><br></div><br clear=3D"all"><div><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><pre cols=3D"72"></pre><div><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif"><b>Anna-Lena=
 Marx</b></span><br></div><div><font face=3D"arial, sans-serif" style=3D"ba=
ckground-color:rgb(255,255,255)"><span style=3D"color:rgb(34,34,34)">M.Sc. =
Embedded Systems</span><br style=3D"color:rgb(34,34,34)"><span style=3D"col=
or:rgb(34,34,34)">Embedded Software Development</span><br style=3D"color:rg=
b(34,34,34)"><br style=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(34,=
34,34)">inovex GmbH =C2=B7 Ludwig-Erhard-Allee 6 =C2=B7 76131 Karlsruhe</sp=
an><br style=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(34,34,34)">01=
5233181260 =C2=B7=C2=A0<a href=3D"mailto:anna-lena.marx@inovex.de" target=
=3D"_blank">anna-lena.marx@inovex.de</a> =C2=B7=C2=A0</span><a href=3D"http=
://www.inovex.de/" rel=3D"noreferrer" style=3D"color:rgb(17,85,204)" target=
=3D"_blank">www.inovex.de</a><br style=3D"color:rgb(34,34,34)"></font><span=
 style=3D"color:rgb(34,34,34)">Sitz der Gesellschaft: Pforzheim =C2=B7 AG M=
annheim, HRB 502126</span><br style=3D"color:rgb(34,34,34)"><span style=3D"=
color:rgb(34,34,34)">Gesch=C3=A4ftsf=C3=BChrer: Stephan M=C3=BCller, Tobias=
 Joch</span><font face=3D"arial, sans-serif" style=3D"background-color:rgb(=
255,255,255)"><br style=3D"color:rgb(29,28,29)"><span style=3D"color:rgb(29=
,28,29)">Wir nutzen Technologien, um unsere Kunden gl=C3=BCcklich zu machen=
. Und uns selbst.</span><br style=3D"color:rgb(29,28,29)"><a href=3D"http:/=
/blog.inovex.de/" rel=3D"noopener noreferrer" target=3D"_blank">blog.inovex=
.de</a><span style=3D"color:rgb(29,28,29)">=C2=A0=E2=80=93 Deep Dives in di=
gitale Innovationen.</span><br style=3D"color:rgb(29,28,29)"><a href=3D"htt=
p://culture.inovex.de/" rel=3D"noopener noreferrer" target=3D"_blank">cultu=
re.inovex.de</a><span style=3D"color:rgb(29,28,29)">=C2=A0=E2=80=93 Werte &=
amp; Worklife bei inovex.</span><br style=3D"color:rgb(29,28,29)"><a href=
=3D"http://newsletter.inovex.de/" rel=3D"noopener noreferrer" target=3D"_bl=
ank">newsletter.inovex.de</a><span style=3D"color:rgb(29,28,29)">=C2=A0=E2=
=80=93 1 x pro Monat News &amp; Events.</span><br style=3D"color:rgb(29,28,=
29)"><a href=3D"http://design.inovex.de/" rel=3D"noopener noreferrer" targe=
t=3D"_blank">design.inovex.de</a><span style=3D"color:rgb(29,28,29)">=C2=A0=
=E2=80=93 Digital Product Interfaces von inovex.</span></font></div><pre co=
ls=3D"72"><br></pre></div></div></div></div></div></div></div><br><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Mi., 8. M=C3=
=A4rz 2023 um 14:33=C2=A0Uhr schrieb Ross Burton &lt;<a href=3D"mailto:Ross=
.Burton@arm.com">Ross.Burton@arm.com</a>&gt;:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On 6 Mar 2023, at 15:10, Anna-Lena Marx via <=
a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.openembedded.org</a> &lt;anna-lena.marx=3D<a href=3D"mailto:inovex=
.de@lists.openembedded.org" target=3D"_blank">inovex.de@lists.openembedded.=
org</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi,<br>
&gt; moving the support or the tests to meta-filesystems does not make sens=
e to me.<br>
&gt; Wic is located in oe-core, move support and tests would not really wor=
k at all and create another dependency.<br>
&gt; It may be an option to move f2fs from meta-filesystems to meta/recipes=
-devtools where e.g. btrfs, dosfs tools and erofs are located.<br>
&gt; Otherwise, allowing it without tests would be an option, but that&#39;=
s not ideal either.<br>
&gt; On the other hand is there merged support for some filesystems in wic =
without matching tests.<br>
<br>
The other option would be for the test to determine if the recipes are avai=
lable, so adding meta-filesystems would enable the tests.<br>
<br>
Ross</blockquote></div>

--000000000000ee0c4b05f6c9f0a7--

