Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBB6C4708C
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.6107.1649729558335040093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 19:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nhynEu9U;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id l7so29019564ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 19:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wDUU92lqYAcLb4omVNW7tyflRbZRUQBd4QEWgKYVOg=;
        b=nhynEu9UWqZByXD8MQ/OAjhXY/3gPQzYI2DEfvLXrAVaBgjxr0ZXPpcVa65+Nu8Lpw
         /y21HRDugBl3cyPNLF3Omv72lAn+C/QYBVSIHqGdOZIwnp/Gs03dRXFeEkVCIlxIcWje
         81+hog3ggLCfTZ20dZy9WftSAkRpXe9Z3zcNpzF17ckwakNpZezOWRTZ6KYVw0aGUVCq
         UscEHm1bW/tjLtt1/z+k0CChR/gqLRUkC+lmFAsWDrqLE3s7NqbuK5JOolx5Xy2JnuGF
         pNLZCYZ0W/KAuzqSInp8GNHhjbr3FgAjj2YXWw+7BsIdSjejZG7Dye5hOst76SLzuuyj
         LxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wDUU92lqYAcLb4omVNW7tyflRbZRUQBd4QEWgKYVOg=;
        b=4BHy0CsIoFFOj8C1i14WDX9j3g/XvYk0TfTCzO9VKhouAf7LE23em8OKlJUUVAUgXn
         F8YLtY6Kmg9bbjnmkLM0645nnO+wilDPCR80VLV/PYf3z3koDnd2Rk61rj0PKfFCpaSM
         0sD5G0TYItKM8qf4Dy+5wnvG9pSHbpcvQvmCRPLBs2ezVE61Ar+fHaxNev1YnSuwNJZ9
         RjLGDD4USVzE9G/nOH29t0ASMHdDStQsC/P6tumVPIc/6yUntHML/wc6+eJJ/Vz9DPhx
         We7092dsfx5pV65JrvoIzpHI5SRYpVfQL3cLaiHk16rgOq7Q//tOyLucgQL1JroD4blt
         A+IA==
X-Gm-Message-State: AOAM531QxKp8DF0M9bUfkurPB72oWvz2fngPrrwW5k/QVLJyLOgJczIf
	fXs2AEO0r0GLRuDk878t9ZW13wBRCYl2dg03D2w/ww==
X-Google-Smtp-Source: 
 ABdhPJwCNW8SWspyN0qOimEU8KEZ+zhYG+j+GhXfSScba/3ehjFlIHOceCM2yEo5ELnmFQV1sCwPCOJixWoKa/QkM3k=
X-Received: by 2002:a17:907:3f8b:b0:6e8:318d:1def with SMTP id
 hr11-20020a1709073f8b00b006e8318d1defmr23856294ejc.153.1649729556651; Mon, 11
 Apr 2022 19:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
In-Reply-To: 
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 11 Apr 2022 16:12:23 -1000
Message-ID: 
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033394005dc6b98e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164249

--00000000000033394005dc6b98e2
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022, 3:33 PM Ralph Siemsen <ralph.siemsen@linaro.org>
wrote:

> On Mon, Apr 11, 2022 at 6:43 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > I was using qemux86-64 for my experiment, so I guess I need to redo it
> > now using the correct machine!
>
> I have rebuild with MACHINE=qemux86. Same result, all tests appear to pass:
>
> RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (44.80s)
> ...
> SUMMARY:
> core-image-sato () - Ran 64 tests in 61.570s
> core-image-sato - OK - All required tests passed (successes=15,
> skipped=49, failures=0, errors=0)
>

Same here. But I just realized something that is different from the
autobuilder.

What distro is your build machine? On the autobuilder it is using a non
debian distro for the debian build.

My build machine is Ubuntu, so that is a major difference!

Steve

>

--00000000000033394005dc6b98e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 11, 2022, 3:33 PM Ralph Siemsen &lt;<a hre=
f=3D"mailto:ralph.siemsen@linaro.org">ralph.siemsen@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Mon, Apr 11, 2022 at 6:43 PM =
Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank" re=
l=3D"noreferrer">steve@sakoman.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I was using qemux86-64 for my experiment, so I guess I need to redo it=
<br>
&gt; now using the correct machine!<br>
<br>
I have rebuild with MACHINE=3Dqemux86. Same result, all tests appear to pas=
s:<br>
<br>
RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (44.80s)<br>
...<br>
SUMMARY:<br>
core-image-sato () - Ran 64 tests in 61.570s<br>
core-image-sato - OK - All required tests passed (successes=3D15,<br>
skipped=3D49, failures=3D0, errors=3D0)<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto">Same here. But I j=
ust realized something that is different from the autobuilder.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">What distro is your build machine? O=
n the autobuilder it is using a non debian distro for the debian build.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">My build machine is Ubuntu,=
 so that is a major difference!</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Steve</div></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000033394005dc6b98e2--

