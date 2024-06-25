Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930E9C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 12:41:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.171293.1719319292029784798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 05:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGlxSJvM;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f480624d0fso42726665ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719319291; x=1719924091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UQumRwlnZObQeaOGh03NoMN/YLxYH4qRdecMfRHASlo=;
        b=dGlxSJvMZiMRmdT4+RcmH4VDM2q1pK9rRwLU68rO7gLY3Xo7fCSvovsiHolVfbgHXn
         Qt/7CFeTn4u5vPPG7zJnqiABxP7JiYr9EWWhlFo3kWr8sQQvTPW2PZpmiujqGC0Cn98q
         uTr4GAToF13nCGx6oI1kEJQwQb1cs97QHghA0iZvQncC8N39bHPz07vemXPTCmJFaqbL
         BJX8zNDMGBWc7PEKK34tvDeuADA8F1wDymerF6adw8pnqX81EteNqNzXtlQa3tIKNnRM
         IUlit8hvmr7ApH/IHrr0+eIggmqH+6hx201hY1ANhB409ZE/iXYBbEYfJ97VCa3h9rkU
         u3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719319291; x=1719924091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQumRwlnZObQeaOGh03NoMN/YLxYH4qRdecMfRHASlo=;
        b=g6+x7mUsLJH0okbJfQ+wiznW/ATlec53zu/htlDUzuFPnvPvUeOaSvL0SQ3sy/+WXO
         jfvUMTxe6C7SqODfTaUx+PibwG10ZUCHnUpaMasmvOX4j9eug1hPpbv35+69wwkjXYD8
         PdDjx3NhEkaG+pimKBiYIhCXMj/NGGyEsCfAErIQ3KvX8o9Zx7ftP9h95ZZz45HFkspy
         iy06JyClsZ81zCOcUFpYfimMouZucHBXMlMSuP/AWUl+Rwc7kn/NU8dXf58dSYm8y/As
         Fw1Zy0zSAxqn34NMrCuQ0d7YK+3mVwFtwnDrkGyLfE1hzVobjbTIodXcP9kMMllqEQur
         2abw==
X-Gm-Message-State: AOJu0Yzb5C2+hueHfo5BgkFg0Lph2ISgFnFKx7pKhfzVk9Sg7ukLrhLy
	p4+e8yhlY9JrjiDEC0D0mrmJ4NpnCIINzNQeW+o6BAQqdDvWBv022EXQGsaHnsSX1YeALgGKsjt
	wEiVHaGcmwgh+Xs3Ipfsv69h9ssnUF9kd
X-Google-Smtp-Source: AGHT+IEHl1HMzaJIQ/k0H8q+t7iTTqvrYkO4Yuw4VVnIxK0AQZN8JpVHN+uYrDHin1U9aU5cKZgMyXKmJuvTq3WYesY=
X-Received: by 2002:a17:90b:4a86:b0:2b1:b1a1:1310 with SMTP id
 98e67ed59e1d1-2c861436110mr6054312a91.29.1719319291279; Tue, 25 Jun 2024
 05:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=RLRbMABzs=WV-6vzYBGFvQbuVf14trJGAD=P14+Mt7aQ@mail.gmail.com>
 <3067A608-B538-438F-B270-5A6F2234C800@arm.com>
In-Reply-To: <3067A608-B538-438F-B270-5A6F2234C800@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 25 Jun 2024 14:41:19 +0200
Message-ID: <CAApg2=RTTHOLFSKapCTbPy4_r_vc+GwiK6L706j2mORCT-+4pg@mail.gmail.com>
Subject: Re: [yocto-security] RFC: CVE check standalone (introducing yocto-vex-check)
To: ross.burton@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000009cc9a2061bb6376f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 12:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201133

--0000000000009cc9a2061bb6376f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 3:18=E2=80=AFPM Ross Burton via lists.yoctoproject.=
org
<ross.burton=3Darm.com@lists.yoctoproject.org> wrote:

> Hi Marta,
>
> On 31 May 2024, at 15:06, Marta Rybczynska via lists.yoctoproject.org
> <rybczynska=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> >  How to use:
> >  1. Download the database to use:
> >  - for NVD, use cve-update-nvd2-native.py
> >  - for the CVE database, get the CVEv5 git repository: either the
> upsteam one at https://github.com/CVEProject/cvelistV5 or the one with
> OE-related fixes at https://github.com/mrybczyn/cvelistV5-overrides
> (recommended)
>
> This is the biggest issue that=E2=80=99s bothering me right now - the nee=
d for a
> fork.  Would it be possible to load the canonical cvelist and then augmen=
t
> it with extra data (using the Authorized Data Publisher schema?) from
> another repository that just contains that extra data?  Having a fork of
> cvelistV5 and having to rebase it feels like it will lead to problems and
> be fragile.
>


Applying ADP (we'll add support just after finishing the tests in progress
now) requires modifying JSONs for each affected entry. The only ADP today
is CISA and their entries have been merged in the cvelistV5 repo. For us
becoming an ADP would likely take time. Adding ADP clauses separately
requires you to modify the entry, so you need to keep it somewhere. I see
two options: either fork and modify, or copy separate files and modify in
place. I didn't go for the second solution, because entries do actually
change, and copies would likely mean more work (for example, they have
recently converted all entries automatically to the 5.1 schema). For now,
the rebase is actually working well (had a few issues after the 5.1 update
but that was my fault).

What I haven't done yet is submitting fixes for old entries - the number of
affected CNAs is quite small so maybe we can lower the backlog quite
rapidly.

BTW The CISA extension adds a notion of the exploitability of the
vulnerability - this is additional information we can report. Unfixed CVE
that is exploited vs not exploited, this is well a different class of
useful information.

Kind regards,
Marta

--0000000000009cc9a2061bb6376f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 21, 2024 at 3:18=E2=80=AF=
PM Ross Burton via <a href=3D"http://lists.yoctoproject.org">lists.yoctopro=
ject.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.yoctoproject=
.org">arm.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi Marta,<br>
<br>
On 31 May 2024, at 15:06, Marta Rybczynska via <a href=3D"http://lists.yoct=
oproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</=
a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" tar=
get=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 How to use:<br>
&gt;=C2=A0 1. Download the database to use:<br>
&gt;=C2=A0 - for NVD, use cve-update-nvd2-native.py<br>
&gt;=C2=A0 - for the CVE database, get the CVEv5 git repository: either the=
 upsteam one at <a href=3D"https://github.com/CVEProject/cvelistV5" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/CVEProject/cvelistV5</a> o=
r the one with OE-related fixes at <a href=3D"https://github.com/mrybczyn/c=
velistV5-overrides" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/mrybczyn/cvelistV5-overrides</a> (recommended) <br>
<br>
This is the biggest issue that=E2=80=99s bothering me right now - the need =
for a fork.=C2=A0 Would it be possible to load the canonical cvelist and th=
en augment it with extra data (using the Authorized Data Publisher schema?)=
 from another repository that just contains that extra data?=C2=A0 Having a=
 fork of cvelistV5 and having to rebase it feels like it will lead to probl=
ems and be fragile.<br></blockquote><div><br></div><div><br></div><div>Appl=
ying ADP (we&#39;ll add support just after finishing the tests in progress =
now) requires modifying JSONs for each affected entry. The only ADP today i=
s CISA and their entries have been merged in the cvelistV5 repo. For us bec=
oming an ADP would likely take time. Adding ADP clauses separately requires=
 you to modify the entry, so you need to keep it somewhere. I see two optio=
ns: either fork and modify, or copy separate files and modify in place. I d=
idn&#39;t go for the second solution, because entries do actually change, a=
nd copies would likely mean more work (for example, they have recently conv=
erted all entries automatically to the 5.1 schema). For now, the rebase is =
actually working well (had a few issues after the 5.1 update but that was m=
y fault).<br></div><div><br></div><div>What I haven&#39;t done yet is submi=
tting fixes for old entries - the number of affected CNAs is quite small so=
 maybe we can lower the backlog quite rapidly.</div><div><br></div><div>BTW=
 The CISA extension adds a notion of the exploitability of the vulnerabilit=
y - this is additional information we can report. Unfixed CVE that is explo=
ited vs not exploited, this is well a different class of useful information=
.</div><div><br></div><div>Kind regards,</div><div>Marta<br></div></div></d=
iv>

--0000000000009cc9a2061bb6376f--

