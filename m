Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CEFC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 12:51:41 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.43253.1721739096172987406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 05:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fp76Qqyh;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: rybczynska@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3993c6dd822so12089755ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721739095; x=1722343895; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MncTH3o2bWcEgNsI6eTJ245mF4l3n8bTpC+y/Ey2K7Q=;
        b=Fp76QqyhUlvhO/CLljKxYZFk/rTaayOroUJvR1anXU5oquaH1uktEKZjG7Z9RNgfAS
         nuv98XKefL32gkqT2ynXwRLLVDpBU6YvW5dxxRY4oFAku14NGHc+pW4zfGeyrOl8dHDJ
         8ZVPLYpmtlW0K8A8lgmEwINdUOCxhYEK+UF+Uo3JHIST9/8ggN+vX1pPPPkvt6UAFrim
         gCNHs+XmsXdyjBTB/jgDO0VhDtKGbNK03hNf43YgvA2ds2wHVIrdu5fxXEf8R9nU5RS7
         7HHNWKEwlxx2CO9xeTTCJiSeBQ5xtpj2N6Fn82siMO+1MpYOau2INMY0WT02AX8PWrN/
         bW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721739095; x=1722343895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MncTH3o2bWcEgNsI6eTJ245mF4l3n8bTpC+y/Ey2K7Q=;
        b=GPxcdPKYt8ke3nC1APk2KJWukO8KWx+zCENnqhRTO/XBPglQobLrSishyP+cGs6hdh
         6VlDgeoFw80OtaF8aAyDHigfGmHynbpWKRQkreDuJUgcVZshGnoABo2+8vWzn6dtt2ir
         87wiKZSYVpv+K2/Ns8st+YyGjlOtLHlNNgzxtG/1pAQVjBKqZf2VKvHPiHH68HjkqI38
         zsRurfIuJYGdZ9bctfWhWqrqlJN0HUq/xYdXZxHAqPJmyAFfMqgXhCjgz9tztAPYpTLE
         10Cm5Y2Qk8KgiVwPuHNB/4IXa76IO/VgpGCu10Q/dlaYs9ZGbeuAfOlTDrKj0JNGLwZw
         N00A==
X-Gm-Message-State: AOJu0YyaSbFbC+4e0izG9VyhXaL8EMhCdO3mi93mKTv/lp1q3+h9Oivy
	axD6RFKEA6PVkWa+7WBjLA8l12rchPoZq6ZcEnMNI2SJiLN4spG4naF4dqzkh5IqlYvt4K7vyLd
	VsakbTVar39JG+9hjjQRepatlLls=
X-Google-Smtp-Source: AGHT+IFcWz1u0l/TlakbvcQNBIWHDgl70RX3XvzH76XvmdHt4Zuq35gW0CblQXpH+nmKPGVSVqGgLXzPZeOfJo5cg6s=
X-Received: by 2002:a05:6e02:1d8e:b0:375:8b0e:4434 with SMTP id
 e9e14a558f8ab-399403fcf0fmr119560265ab.16.1721739095268; Tue, 23 Jul 2024
 05:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240715102003.10122-1-marta.rybczynska@syslinbit.com>
 <AS1PR10MB56970CABA311ECF1A76C7566FDA32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAApg2=TFYV3aVGNeK=PiWVPRTw86RA3NxNLOaB_z5LTU9-4G3g@mail.gmail.com> <AS1PR10MB56970A238E5052AF17FFE54DFDA82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56970A238E5052AF17FFE54DFDA82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 23 Jul 2024 14:51:23 +0200
Message-ID: <CAApg2=QTGB_WRkJuHbu6eABNRLRyPjUxcfZcccAt6AkqEWx5zQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000002b6dca061de99f71"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 12:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202344

--0000000000002b6dca061de99f71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 11:15=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.=
com>
wrote:

>
> > > I think that there is a fundamental change in behavior here.
> > > Previously we were taking (NVD) DB as base and only vulnerable CVEs
> were compared annotated with CVE_STATUS or our presence of CVE patches.
> > > Now we take the CVE_STATUS and CVE patches as base and add entries
> from DB only if they were not annotated yet.
> >
> > This was a little more complicated than that. get_patched_cves() was
> taking a part of CVE_STATUS at the beginning of the process, then applyin=
g
> the NVD database.
> > The change is to import the totality and then update the status in the
> process. Now, the entries in CVE_STATUS had priority before, and they sti=
ll
> have.
> > Now it is explicit, before it was hidden in the code. I do not see
> changes in the end result, do you have a case in mind?
>
> If with current master I add following to any recipe:
> CVE_STATUS[2025-0001] =3D "not-applicable-config: test"
> CVE_STATUS[2025-0002] =3D "fixed-version: test"
> then the resulting build/tmp/log/cve/cve-summary.json which shows all CVE=
s
> for this recipe regardless of CVE status, it will NOT contain reference t=
o
> these test entries.
> But when I apply your patch, they will be both added to the report.
> So your code changes the behavior a lot (in a good direction from my poin=
t
> of view).
>
>
Hello Peter,
Got it. This is how I changed the description in the last version.

Kind regards,
Marta

--0000000000002b6dca061de99f71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 11:15=E2=80=
=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Mar=
ko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
&gt; &gt; I think that there is a fundamental change in behavior here.<br>
&gt; &gt; Previously we were taking (NVD) DB as base and only vulnerable CV=
Es were compared annotated with CVE_STATUS or our presence of CVE patches.<=
br>
&gt; &gt; Now we take the CVE_STATUS and CVE patches as base and add entrie=
s from DB only if they were not annotated yet.<br>
&gt;<br>
&gt; This was a little more complicated than that. get_patched_cves() was t=
aking a part of CVE_STATUS at the beginning of the process, then applying t=
he NVD database.<br>
&gt; The change is to import the totality and then update the status in the=
 process. Now, the entries in CVE_STATUS had priority before, and they stil=
l have.<br>
&gt; Now it is explicit, before it was hidden in the code. I do not see cha=
nges in the end result, do you have a case in mind?<br>
<br>
If with current master I add following to any recipe:<br>
CVE_STATUS[2025-0001] =3D &quot;not-applicable-config: test&quot;<br>
CVE_STATUS[2025-0002] =3D &quot;fixed-version: test&quot;<br>
then the resulting build/tmp/log/cve/cve-summary.json which shows all CVEs =
for this recipe regardless of CVE status, it will NOT contain reference to =
these test entries.<br>
But when I apply your patch, they will be both added to the report.<br>
So your code changes the behavior a lot (in a good direction from my point =
of view).<br>
<br></blockquote><div><br></div><div>Hello Peter,</div><div>Got it. This is=
 how I changed the description in the last version.=C2=A0</div><div><br></d=
iv><div>Kind regards,</div><div>Marta <br></div></div></div>

--0000000000002b6dca061de99f71--

