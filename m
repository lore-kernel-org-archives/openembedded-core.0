Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20824C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:20:23 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.22243.1747750813228000695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 07:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=NHZt5Y4f;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.173, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70ccf9a4ab3so24702347b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1747750812; x=1748355612; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LaQ0XAaiFeAYyFf9jVXCowX54BOr1G9OOFDvQkJ/ru8=;
        b=NHZt5Y4f7+2G/Ia5D6VCVvI1CgKIc0RKjjVpLeDQ+t8GquZ4D7ut7eMEeDvvxyJAdC
         aAwA/UuH2bqbWc30cVzEfDFbS9XniTLgfDA5WU48vgDW6wIAWqR5a7ZzjThKmAAmcdyx
         jSMLGC/ivqJYkly2OcQSLUjaxoyPRUsZ3f65DsPdj48AqKT9JyhbpY8D5sJ0Xfb7q/xt
         e0SzwqcLAxoigJsNmntchyFJwLK0cXzLZbi/OpLunSMmjgniTd/0Lso6cJiRDqMtqERs
         /L3mgrkmLAFMJTIjPm48Cd6vE0xB7Ilz6nNDT5R4d26IXC4zNWLeLEFLGQnkPTR9GQE7
         gF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750812; x=1748355612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LaQ0XAaiFeAYyFf9jVXCowX54BOr1G9OOFDvQkJ/ru8=;
        b=eJvZnZ4yrJzJ1e3aBXiUa0Fvj74EX+TeVw0XeV461YLoMo6givRjqELB+ImhlgIZyN
         iaCkoJguI3lRfOcyuuARRxCmB9Wk33Z0C1cigFXbdHt+Ptw5wZziPxRp3PQRg6InJhh9
         WCDsWZqCND6Qb2zS8KeLG3rYbkqQ7cvGSYcl65XujA7CGB2/qDLDjze0MpGYwkv1NVHN
         DyFs7Ow1uepfVs5LglHq5ifdaKKkObX54vLIbfx9tqqRKQflZZpQNsViMGhW5eki62Wx
         iSsYYsxeyvk4/6s4nzKeVzsuBnRPHgrZrb08U3I9S+Wba1E1PgDJ7EHjvT0LJFKZlTfV
         jt+w==
X-Forwarded-Encrypted: i=1; AJvYcCXZXdPZXkaRbC7BNigZbJRPMJBCDVvO//Dkm/vqLOFz7DnilsEXJvn58xunksSQnCBlCItweTrM4xZH4LR01Pt7yQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzn+IYAthvhWknIQBSssd3CtY4HAOmi5Dpr1Ip4mnqZL2ghnT4V
	tr7xcRqCDechBSFFJKNRjEI+0vEEr18Y+BfeLs1BZ4PXfptZc+Zh3VqCiHCkW8BlK6PTiBklb2o
	A2vPL18bJN7HYIu7Zl9D9h3MeUZdIhbZw/9cR+n48mQ==
X-Gm-Gg: ASbGncuxauG3ej9p1/lvJmZFIoaGyfnu+HsS5n48Qjyb9BzQ6TAX3owIyGwK9trB/6W
	93lnGhyP3uhB4cqwPhD7P+fnX03A9lDIr5tHov89vs5M2YwFFwByARGBNEoGYVz37ZGZDTqVIyw
	yf9Yj5bFbdJHD8q8Ng9Htdd2lk9vzAToaCoyI=
X-Google-Smtp-Source: AGHT+IEc3Ol6ZvYW9YLDRisVCXLCY5o8Xa46/yAGq5W1c7t7xn237TwdaRta+5OPiT+zhmjgCVlSZK2ejJXTxWGx/c8=
X-Received: by 2002:a05:690c:45c9:b0:6fd:a226:fb50 with SMTP id
 00721157ae682-70caaf72640mr239639747b3.13.1747750812080; Tue, 20 May 2025
 07:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <17C008DA5E69D9E5.27941@lists.openembedded.org> <183C6D415DE5406F.22941@lists.openembedded.org>
In-Reply-To: <183C6D415DE5406F.22941@lists.openembedded.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Tue, 20 May 2025 08:20:01 -0600
X-Gm-Features: AX0GCFsCkbrLWyrfct_raAUf-cNWL0T9__0zGOLY7ZfhSDkw8MSWvJXYwCT6Ofw
Message-ID: <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: anibal@limonsoftware.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000004f78ae063591f2e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 14:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216919

--0000000000004f78ae063591f2e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just a ping.

After apply this Bruce will apply the meta-virt one,

https://lists.yoctoproject.org/g/meta-virtualization/message/9252

Thanks!,
Anibal

On Sun, May 4, 2025 at 2:34=E2=80=AFPM Anibal Limon via lists.openembedded.=
org
<anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:

> Hi,
>
> Finally sent a patch to meta-virtualization, to fix the problem when
> rename the wic source plugins to allow re-use.
>
> https://lists.yoctoproject.org/g/meta-virtualization/message/9240
>
> Cheers!,
> Anibal
>
> On Mon, Mar 25, 2024 at 8:39=E2=80=AFAM Anibal Limon via lists.openembedd=
ed.org
> <anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:
>
>> Hi,
>>
>> Thanks for reporting, I will adapt the tests.
>>
>> Regards,
>> Anibal
>>
>> On Mon, Mar 25, 2024, 04:18 Alexandre Belloni <
>> alexandre.belloni@bootlin.com> wrote:
>>
>>> This breaks some selftests and meta-virtualization:
>>>
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6573/=
steps/14/logs/stdio
>>>
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3005=
/steps/12/logs/stdio
>>>
>>>
>>> On 23/03/2024 13:53:04-0600, Anibal Limon wrote:
>>> > Python not support importing modules with - so change to _.
>>> >
>>> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>>> > ---
>>> >  .../source/{bootimg-biosplusefi.py =3D> bootimg_biosplusefi.py}     =
| 0
>>> >  scripts/lib/wic/plugins/source/{bootimg-efi.py =3D> bootimg_efi.py} =
| 0
>>> >  .../plugins/source/{bootimg-partition.py =3D> bootimg_partition.py} =
| 0
>>> >  .../wic/plugins/source/{bootimg-pcbios.py =3D> bootimg_pcbios.py}   =
| 0
>>> >  .../source/{isoimage-isohybrid.py =3D> isoimage_isohybrid.py}       =
| 0
>>> >  5 files changed, 0 insertions(+), 0 deletions(-)
>>> >  rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =3D>
>>> bootimg_biosplusefi.py} (100%)
>>> >  rename scripts/lib/wic/plugins/source/{bootimg-efi.py =3D>
>>> bootimg_efi.py} (100%)
>>> >  rename scripts/lib/wic/plugins/source/{bootimg-partition.py =3D>
>>> bootimg_partition.py} (100%)
>>> >  rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =3D>
>>> bootimg_pcbios.py} (100%)
>>> >  rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =3D>
>>> isoimage_isohybrid.py} (100%)
>>> >
>>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
>>> b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
>>> > similarity index 100%
>>> > rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
>>> > rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
>>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
>>> b/scripts/lib/wic/plugins/source/bootimg_efi.py
>>> > similarity index 100%
>>> > rename from scripts/lib/wic/plugins/source/bootimg-efi.py
>>> > rename to scripts/lib/wic/plugins/source/bootimg_efi.py
>>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py
>>> b/scripts/lib/wic/plugins/source/bootimg_partition.py
>>> > similarity index 100%
>>> > rename from scripts/lib/wic/plugins/source/bootimg-partition.py
>>> > rename to scripts/lib/wic/plugins/source/bootimg_partition.py
>>> > diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
>>> b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
>>> > similarity index 100%
>>> > rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
>>> > rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
>>> > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>>> b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
>>> > similarity index 100%
>>> > rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>>> > rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
>>> > --
>>> > 2.43.0
>>> >
>>>
>>> >
>>> >
>>> >
>>>
>>>
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215972):
> https://lists.openembedded.org/g/openembedded-core/message/215972
> Mute This Topic: https://lists.openembedded.org/mt/105108998/8181911
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> anibal@limonsoftware.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f78ae063591f2e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a ping.=C2=A0<div><br></div><div>After apply this Bru=
ce will apply the meta-virt one,</div><div><br></div><div><a href=3D"https:=
//lists.yoctoproject.org/g/meta-virtualization/message/9252">https://lists.=
yoctoproject.org/g/meta-virtualization/message/9252</a></div><div><br></div=
><div>Thanks!,</div><div>Anibal</div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 4, 2=
025 at 2:34=E2=80=AFPM Anibal Limon via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;anibal=3D<a href=3D"mailto:limonsoftw=
are.com@lists.openembedded.org">limonsoftware.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr">Hi,<div><br></div><div>Finally sent a patch to meta-virtualiz=
ation, to fix the problem when rename the wic source plugins to allow re-us=
e.</div><div><br></div><div><a href=3D"https://lists.yoctoproject.org/g/met=
a-virtualization/message/9240" target=3D"_blank">https://lists.yoctoproject=
.org/g/meta-virtualization/message/9240</a></div><div><br></div><div>Cheers=
!,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Mar 25, 2024 at 8:39=E2=80=AFAM Anibal Lim=
on via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.op=
enembedded.org</a> &lt;anibal=3D<a href=3D"mailto:limonsoftware.com@lists.o=
penembedded.org" target=3D"_blank">limonsoftware.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks f=
or reporting, I will adapt the tests.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Regards,</div><div dir=3D"auto">Anibal</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2=
024, 04:18 Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootli=
n.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This breaks some self=
tests and meta-virtualization:<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215972): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215972" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215972</a><br>
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

--0000000000004f78ae063591f2e4--

