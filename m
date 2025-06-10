Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F47C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:44:57 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.90090.1749570294322047773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cGRpOdZi;
 spf=pass (domain: snapchat.com, ip: 209.85.218.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade5a0442dfso405833666b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749570293; x=1750175093; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b8kke0TI278GkS8O/niEMXcojcFSTD2bEd39RE0mgk8=;
        b=cGRpOdZixeMMSblehemPh04G1dqxH9CX0f+TQepjoq2KNTW7jk2QsziwpvUpS1x0ra
         oTTb7K+pzfrG2k42tgfn0/FttWCXNfsfB2aMThbbZVkt+fczDuubIX1RNzYAAf8olH7O
         k4pW2w9qDpM1PmqSOTzamhd/AtfGKeAg0mfnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570293; x=1750175093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8kke0TI278GkS8O/niEMXcojcFSTD2bEd39RE0mgk8=;
        b=SUK8uL+kxBuwK069ZaHlQ9qQaGh1Jq5FdKUUd7b+1qyu8QvRuBOHUebmD2TvGHHbFt
         m1TtHMFz54yCwJzTvbDzIIMKkXtxzM6JpPC67Q7GlDagvUqxSg1fn6RSxxhASdB8fj3T
         1MsnKUzxr3HWiZP1lCBUyOWv7FYfWIpQYqPxHMKJ8glFnW1T3nJCzKVUd3UMXW65d5lG
         0ohpXtVg4Ozv2GnRugEjZ2i4elAVTOxHhwEudlZLVW8xzLq/sBex/ydXKHigDV8oaEru
         WXgmsGuhUkX4Z/N0HdbEKpDDSOkAz2e3EVaU/O93cpkHHmqXfI+e1s+07VXK1R+qsevY
         7R9g==
X-Forwarded-Encrypted: i=1; AJvYcCVl/arImYJvjH6ixV6qhpv2eFt6vyCoOJxs6TaAdTbCarLFU33g9vloovp5GWGruMj1zCx3jyKOPOVGTxpzm0ci3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2NvjU6ZRdAgbjAWhkjmeEKD6hx+rnMAUlWq+T9rKv0fEkyn/O
	BFHb5O1BUKJcdLZsNxhBSWTmRywWTz7Bj+4plgPF10ifgkAd7Z63+3ZRObAl1yHFDeTkCKAlL/m
	hnbh+HTJYBnatWBZUMRbqOqSxasE3u7HpDcT2Zih/WA==
X-Gm-Gg: ASbGncsTmcF6nlPAliPrQ3ejMsrM5WzrHIeewhrG5Lrtye6wsUL4fcB+AuI7NT+0XH+
	hwz5FC3ecHSfFGaPranwaM3Hj7ciac9Q7ucniNvDGQW6ag0YNhzzD+JFliuJoAF8TiziR7pKXHD
	Mp7NGwS/rNN/p/YcZTLBHB5xTh9toqF0tPRXsQ0dYZlaDgsVJZ0/FBY/M=
X-Google-Smtp-Source: AGHT+IEf9WdsX2K03ygAs8wCOgGyu/A55/u3GAYzcjPizGzqe1OVvQ2vqJupbKt+DfAsQHDvl4p6mCUMYW2lEW08tPk=
X-Received: by 2002:a17:907:d644:b0:ad8:8689:2cc6 with SMTP id
 a640c23a62f3a-ade1ab2216fmr1524108866b.47.1749570292550; Tue, 10 Jun 2025
 08:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb-PRoA1biG6PA_hX_RndM9QqG7G_7ikYFUZE3goEaP-_Q@mail.gmail.com>
 <8ce48df3-b8a2-4b95-96df-bf0fc1ac1eaa@gmail.com> <CANNYZj9EQ=xjSXRii-6RYk4uzV6kzztzWCDn1Mo5z8nNyvURhQ@mail.gmail.com>
 <96b1e79c-f5e5-4d5f-b609-3ce89757a7bb@gmail.com>
In-Reply-To: <96b1e79c-f5e5-4d5f-b609-3ce89757a7bb@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 10 Jun 2025 17:44:41 +0200
X-Gm-Features: AX0GCFuVQEfyuYH6X6KEh2E0j53xzAJ0Yj4ko8_cXVzHSjxJxaoWQ9szkipxqF4
Message-ID: <CAHUKmYbqgt0vOeKmwM5iKvXAqAP4wSpM5UP9CE8H++YgC-pMRQ@mail.gmail.com>
Subject: Re: [OE-core] [yocto] Yocto Project Status 10 June. 2025 (WW23)
To: yocto@lists.yoctoproject.org, skandigraun@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, sjolley.yp.pm@gmail.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cc31c7063739933f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218367

--000000000000cc31c7063739933f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A good starting point in my opinion is to check those 2 things:
- usage of "LLVM_TARGETS_TO_BUILD=3D" to reduce the number of archs being
built. This is quite low impact however.
- usage of "LLVM_PROJECTS =3D "clang;lld${LLDB}" to remove clang-tools-extr=
a
from the build per default (last time I checked the recipe didn't build
when removing clang-tools-extra, so the recipe probably needs to be changed
for this to work). This was quite high impact on my test setup.

=C3=89tienne

On Tue, Jun 10, 2025 at 5:13=E2=80=AFPM Gyorgy Sarvari via lists.yoctoproje=
ct.org
<skandigraun=3Dgmail.com@lists.yoctoproject.org> wrote:

> On 6/10/25 17:04, Alexander Kanavin wrote:
> > On Tue, 10 Jun 2025 at 16:46, Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >>>     The clang build time and size increases continue to cause
> >>>     significant concern.
> >>>
> >> Is there more info available on this somewhere? I'd be interested if
> >> there are any concrete recipes/configurations where this is showing
> >> prominently and could be used as a benchmark. Or is it more like an
> >> overall "lot of small things add up to a big one" issue?
> > Please trim quotation lines when replying.
> >
> > It's simply the build time of clang-native and clang target recipes. A
> > huge pile of c++ code, probably the heaviest recipe to build in
> > oe-core. At the same time clang is a critical path item for mesa (and
> > thus, anything graphical).
> >
> > Alex
> Ahh, so this is not a regression that could be bisected, but the cost of
> the new dependencies.
> Thanks.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#65502):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_yocto_message_65502&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlNilmzl9NGIA=
ACt9plQHwA29jv7jLEhRC5R5lTyL5jJkvrAUDPw5GGKk1simqOou&s=3Dx-7lAyA_L3PnW-Rnep=
CxBlSrFglTAHQcwyYBf0Bne_0&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_113571342_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlNilmzl9NGIAA=
Ct9plQHwA29jv7jLEhRC5R5lTyL5jJkvrAUDPw5GGKk1simqOou&s=3DsUZCGh57KvDCIWkQnVV=
dz6FMUyMlpVa35X3BWlLWHyw&e=3D
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_yocto_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DlNilmzl9NGIAACt9plQH=
wA29jv7jLEhRC5R5lTyL5jJkvrAUDPw5GGKk1simqOou&s=3DL-KOIYXVkjWWV7JqXS9AHATZCw=
sy-N_tdvXEXcBBf0M&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cc31c7063739933f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A good starting point in my opinion is to check those 2 th=
ings:<br>- usage of &quot;LLVM_TARGETS_TO_BUILD=3D&quot; to reduce the numb=
er of archs being built. This is quite low impact however.<br>- usage of &q=
uot;LLVM_PROJECTS =3D &quot;clang;lld${LLDB}&quot; to remove clang-tools-ex=
tra from the build per default (last time I checked the recipe didn&#39;t b=
uild when removing clang-tools-extra, so the recipe probably needs to be ch=
anged for this to work). This was quite high impact on my test setup.<br><b=
r>=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 10, 2025 at 5:13=E2=80=AFPM=
 Gyorgy Sarvari via <a href=3D"http://lists.yoctoproject.org">lists.yoctopr=
oject.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.yoctoproj=
ect.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 6/10/25 17:04, Alexander Kanavi=
n wrote:<br>
&gt; On Tue, 10 Jun 2025 at 16:46, Gyorgy Sarvari via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0The clang build time and size increases con=
tinue to cause<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0significant concern.<br>
&gt;&gt;&gt;<br>
&gt;&gt; Is there more info available on this somewhere? I&#39;d be interes=
ted if<br>
&gt;&gt; there are any concrete recipes/configurations where this is showin=
g<br>
&gt;&gt; prominently and could be used as a benchmark. Or is it more like a=
n<br>
&gt;&gt; overall &quot;lot of small things add up to a big one&quot; issue?=
<br>
&gt; Please trim quotation lines when replying.<br>
&gt;<br>
&gt; It&#39;s simply the build time of clang-native and clang target recipe=
s. A<br>
&gt; huge pile of c++ code, probably the heaviest recipe to build in<br>
&gt; oe-core. At the same time clang is a critical path item for mesa (and<=
br>
&gt; thus, anything graphical).<br>
&gt;<br>
&gt; Alex<br>
Ahh, so this is not a regression that could be bisected, but the cost of<br=
>
the new dependencies.<br>
Thanks.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#65502): <a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__lists.yoctoproject.org_g_yocto_message_65502&amp;d=3DDwI=
FaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlNilmzl9NGIAACt9plQHwA29jv7jLEhRC5=
R5lTyL5jJkvrAUDPw5GGKk1simqOou&amp;s=3Dx-7lAyA_L3PnW-RnepCxBlSrFglTAHQcwyYB=
f0Bne_0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_yocto_message_6=
5502&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlNilmzl9NGIAACt9pl=
QHwA29jv7jLEhRC5R5lTyL5jJkvrAUDPw5GGKk1simqOou&amp;s=3Dx-7lAyA_L3PnW-RnepCx=
BlSrFglTAHQcwyYBf0Bne_0&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.yoctoproject.org_mt_113571342_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DlNilmzl9NGIAACt9plQHwA29jv7jLEhRC5R5lTyL5jJkvr=
AUDPw5GGKk1simqOou&amp;s=3DsUZCGh57KvDCIWkQnVVdz6FMUyMlpVa35X3BWlLWHyw&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_113571342_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DlNilmzl9NGIAACt9plQHwA29jv7jLEh=
RC5R5lTyL5jJkvrAUDPw5GGKk1simqOou&amp;s=3DsUZCGh57KvDCIWkQnVVdz6FMUyMlpVa35=
X3BWlLWHyw&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.yoctoproject.org_g_yocto_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DlNilmzl9NGIAACt9plQHwA29jv7jLEhRC5R5lTyL5jJkvrAUDPw5GGKk1=
simqOou&amp;s=3DL-KOIYXVkjWWV7JqXS9AHATZCwsy-N_tdvXEXcBBf0M&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__lists.yoctoproject.org_g_yocto_unsub&amp;d=3DDwIFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3DlNilmzl9NGIAACt9plQHwA29jv7jLEhRC5R5lTyL5jJkvrA=
UDPw5GGKk1simqOou&amp;s=3DL-KOIYXVkjWWV7JqXS9AHATZCwsy-N_tdvXEXcBBf0M&amp;e=
=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ec=
ordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cc31c7063739933f--

