Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFF4C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 20:34:51 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.36015.1746390882811382387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 13:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=riav6w2u;
 spf=pass (domain: limonsoftware.com, ip: 209.85.219.182, mailfrom: anibal@limonsoftware.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e75607f50e5so2732952276.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1746390882; x=1746995682; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GlIwA6fIQySzf5RjxfSD4e3oyP0B1PnBV3lCXSqOdT4=;
        b=riav6w2ufgjK3dCS7SSKCmW4MKwvK0IeI0HGs4kQWLL3VAGUw2lDOgR0lSnU8S4x4Y
         c5zCuUv9wYrAfjVr9rdHzWAlmgW3FRl4Z78Uu7DmuvpXNckSGIAdGKWBXL0R7SjmfttW
         GGjtOj3NuuDL0vRtMru5ZuQFNhO9KYZhtkPTq7zz8B9OJRmpCHZo8Aap1aA0QK0hto8K
         4cZFobnN9O0TWA7NuQOg7fm3fPJ/UWIhHpSD51YcLiIqt0UTS30KqukhSjcdU+r3iymY
         VziqQ+D7ZRaKmgAC0QPlPvMLlfPbH5a+FuFJsk4np0bK/zafdOzrlUCqfwNavlZykDP/
         nlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746390882; x=1746995682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlIwA6fIQySzf5RjxfSD4e3oyP0B1PnBV3lCXSqOdT4=;
        b=DTMNKKAT5HGKaqTZg7Y+FbiQyukNRo/OAq+2lzcunLHhdwErpHjEMiNOYQXjpzuXQ8
         JNaWRnqs+0DdOgsFzg3J3D5M5bzCcOn2l5+p5RIxX/49xlMPIWJsgOjcabBF+avEtunQ
         EAueOu5y4RETYcj2E5vXbRxxx03KHPDrB31rQLWCZYW76K3BXo6u1HPs42tQtp8OqivP
         553PQGgayfHj0RALKP1Ok8AozfmD/Y7xvxNdk7+ffLfRoj9smlP0QCeiNBbOn+tFfnbC
         kSBz9lZud++AZyrJyqy7gS2A5r9oDmIlEHwnzb0lZOMVBpmwGSPfa6Jr1wqTa3UjjTda
         gTTw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Lcay2D8okZEqoRuQw0kpN8+GQINhW65nqTMC98bk70g0gg+eAHvXWq2ajMW8pOrhFji30yYOyaVOJnwYHIFRTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbnHPELkgrH/u5R2bTzKlugZhPHv7rNjOxcsLxdczQTQWJzAEh
	8BUDZ95pNqpC+rtMQozBl1Mli0KDB5aCMFGEdVCBUTbYlyWsO+LMZs/6E2PfeqbQcUHCpRavI/D
	bdyOKqWs+bAjpwX0NgdbB/YaZFRo3yPo4eqRuiw==
X-Gm-Gg: ASbGncvs6TPk79AoXGgmrK3c9iIcHeAPKsCgCU5CR0wkFR6nqoJKrwYDvIhYyNPuAbu
	lqTlbqrhkqVW1izy2s1IvhXSBAIAbv13nj31QpBIbg3eAtFU7dZ2QVBmP1C4ITcL1T1IwXkYOr8
	VUeJZv8K045RVtl5N8FBsFBfk=
X-Google-Smtp-Source: AGHT+IEtH7Hk1gwvy+bjAq0mO8wVXbHIuYBqTu6cSspq5JIcwFMnM5svWLR96m13C8dO4oV0jPjDhkbl4dZnGuMu/nY=
X-Received: by 2002:a05:6902:15cc:b0:e75:608f:b065 with SMTP id
 3f1490d57ef6-e757d2f3552mr5975336276.29.1746390881952; Sun, 04 May 2025
 13:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <17C008DA5E69D9E5.27941@lists.openembedded.org>
In-Reply-To: <17C008DA5E69D9E5.27941@lists.openembedded.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Sun, 4 May 2025 14:34:31 -0600
X-Gm-Features: ATxdqUH2LiLkaQ-hjg48Mt9fm-1QzGpdLMEbNfmxf43LAubbHVLkzR1VE2NWNtc
Message-ID: <CAOU5ZMtiPEG-CVhFH=zqNwOnPGhopBUWH7rT=b3+01McfCongA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: anibal@limonsoftware.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="000000000000287c8406345550d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 20:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215972

--000000000000287c8406345550d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Finally sent a patch to meta-virtualization, to fix the problem when rename
the wic source plugins to allow re-use.

https://lists.yoctoproject.org/g/meta-virtualization/message/9240

Cheers!,
Anibal

On Mon, Mar 25, 2024 at 8:39=E2=80=AFAM Anibal Limon via lists.openembedded=
.org
<anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:

> Hi,
>
> Thanks for reporting, I will adapt the tests.
>
> Regards,
> Anibal
>
> On Mon, Mar 25, 2024, 04:18 Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
>
>> This breaks some selftests and meta-virtualization:
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6573/s=
teps/14/logs/stdio
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3005/=
steps/12/logs/stdio
>>
>>
>> On 23/03/2024 13:53:04-0600, Anibal Limon wrote:
>> > Python not support importing modules with - so change to _.
>> >
>> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>> > ---
>> >  .../source/{bootimg-biosplusefi.py =3D> bootimg_biosplusefi.py}     |=
 0
>> >  scripts/lib/wic/plugins/source/{bootimg-efi.py =3D> bootimg_efi.py} |=
 0
>> >  .../plugins/source/{bootimg-partition.py =3D> bootimg_partition.py} |=
 0
>> >  .../wic/plugins/source/{bootimg-pcbios.py =3D> bootimg_pcbios.py}   |=
 0
>> >  .../source/{isoimage-isohybrid.py =3D> isoimage_isohybrid.py}       |=
 0
>> >  5 files changed, 0 insertions(+), 0 deletions(-)
>> >  rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =3D>
>> bootimg_biosplusefi.py} (100%)
>> >  rename scripts/lib/wic/plugins/source/{bootimg-efi.py =3D>
>> bootimg_efi.py} (100%)
>> >  rename scripts/lib/wic/plugins/source/{bootimg-partition.py =3D>
>> bootimg_partition.py} (100%)
>> >  rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =3D>
>> bootimg_pcbios.py} (100%)
>> >  rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =3D>
>> isoimage_isohybrid.py} (100%)
>> >
>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
>> b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
>> > similarity index 100%
>> > rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
>> > rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
>> b/scripts/lib/wic/plugins/source/bootimg_efi.py
>> > similarity index 100%
>> > rename from scripts/lib/wic/plugins/source/bootimg-efi.py
>> > rename to scripts/lib/wic/plugins/source/bootimg_efi.py
>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py
>> b/scripts/lib/wic/plugins/source/bootimg_partition.py
>> > similarity index 100%
>> > rename from scripts/lib/wic/plugins/source/bootimg-partition.py
>> > rename to scripts/lib/wic/plugins/source/bootimg_partition.py
>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
>> b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
>> > similarity index 100%
>> > rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
>> > rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
>> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>> b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
>> > similarity index 100%
>> > rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>> > rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
>> > --
>> > 2.43.0
>> >
>>
>> >
>> >
>> >
>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197487):
> https://lists.openembedded.org/g/openembedded-core/message/197487
> Mute This Topic: https://lists.openembedded.org/mt/105108998/8181911
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> anibal@limonsoftware.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000287c8406345550d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Finally sent a patch to meta-virtua=
lization, to fix the problem when rename the wic source plugins to allow re=
-use.</div><div><br></div><div><a href=3D"https://lists.yoctoproject.org/g/=
meta-virtualization/message/9240">https://lists.yoctoproject.org/g/meta-vir=
tualization/message/9240</a></div><div><br></div><div>Cheers!,</div><div>An=
ibal</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2024 at 8:39=E2=80=AFAM Ani=
bal Limon via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;anibal=3D<a href=3D"mailto:limonsoftware.com@lists.openembedded=
.org">limonsoftware.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hi,<div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks for reporting, I will adapt th=
e tests.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><=
div dir=3D"auto">Anibal</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2024, 04:18 Alexandre Belloni=
 &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">ale=
xandre.belloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">This breaks some selftests and meta-virtualizatio=
n:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/6573/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6573/ste=
ps/14/logs/stdio</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128/buil=
ds/3005/steps/12/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3005/s=
teps/12/logs/stdio</a><br>
<br>
<br>
On 23/03/2024 13:53:04-0600, Anibal Limon wrote:<br>
&gt; Python not support importing modules with - so change to _.<br>
&gt; <br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" rel=3D"noreferrer" target=3D"_blank">anibal@limonsoftware.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 .../source/{bootimg-biosplusefi.py =3D&gt; bootimg_biosplusefi.p=
y}=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 scripts/lib/wic/plugins/source/{bootimg-efi.py =3D&gt; bootimg_e=
fi.py} | 0<br>
&gt;=C2=A0 .../plugins/source/{bootimg-partition.py =3D&gt; bootimg_partiti=
on.py} | 0<br>
&gt;=C2=A0 .../wic/plugins/source/{bootimg-pcbios.py =3D&gt; bootimg_pcbios=
.py}=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 .../source/{isoimage-isohybrid.py =3D&gt; isoimage_isohybrid.py}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 5 files changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =
=3D&gt; bootimg_biosplusefi.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-efi.py =3D&gt; bo=
otimg_efi.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-partition.py =3D&=
gt; bootimg_partition.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =3D&gt;=
 bootimg_pcbios.py} (100%)<br>
&gt;=C2=A0 rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =3D=
&gt; isoimage_isohybrid.py} (100%)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/s=
cripts/lib/wic/plugins/source/bootimg_biosplusefi.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/l=
ib/wic/plugins/source/bootimg_efi.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-efi.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_efi.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scr=
ipts/lib/wic/plugins/source/bootimg_partition.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-partition.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_partition.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/script=
s/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py<br>
&gt; rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/sc=
ripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; similarity index 100%<br>
&gt; rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py<br>
&gt; rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197487): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197487" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197487</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105108998/818=
1911" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105108998/8181911</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:anibal@limonsoftware.com" =
target=3D"_blank">anibal@limonsoftware.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000287c8406345550d1--

