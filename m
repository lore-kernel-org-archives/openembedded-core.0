Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC308C46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 08:38:54 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.142074.1703839134338217982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 00:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnHyLZ3I;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7dff3e9fso3640826e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 00:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703839132; x=1704443932; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wn72F0af6Sl4AJermMXWytAb9+1oLhKPFOx1OQYSNI8=;
        b=LnHyLZ3I07uTS1PqQdV8BcTjIGaqCL0VbL6G2tXgJ7ROYCx7UVxXJ8JD2u/Kl+jfnW
         RMgPczvSNUNnVebufXQ1E/FJzmWmX8e3wHK7FFbacRzB/4YGdrhOeiRRxyHi/qzBt/fY
         ag1Iy7OFEPIQKGP/OsH36ywy4iq7ElSYzeOnDxt7QOLArbFMDEFDHbLvoKgvihCDEaJD
         v1O0xwEvhml721AeXtdi7uA41taNw+5iFnZL/JDkidtqPWvgRP0mLp2W+5jKMDwv+9Ye
         VDw+EUsfHVMB3VJ8NkEQ0v5EPe7khVB49GLnPRQnX9/CnIUgn4eXgYxbnOqGsbV3ebu2
         6e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703839132; x=1704443932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wn72F0af6Sl4AJermMXWytAb9+1oLhKPFOx1OQYSNI8=;
        b=Zd24FqVLadEzTHAG/Mv+INj93Cxu9rK/aYV1ZbBvsEOyWuoL83M1FzTGW2fZfBuV64
         b8euPVmeSzP6gc0e8d2YYSqKgLo350YMoogjl5nLdyKcODjTv20h80Rjkfd+RpSFz+5Z
         JED3DM1KIQprFYpgR35RNw1nkvp0Bbnmi/FzkGN3HAERPWmEgLVM2y6Rx2V7vraxz7MQ
         pNzMgs/t2zbRicZ1eJNQnvYvuYFPJupgDrA31bEo8f2BRv/zAKfrP18Xi53VlxHrt4U3
         HV+8/JcjBkrMBrhj9o93xUJ8C+NpAMBxpyWg250FA2g89JSIskCgR3G0cyIH7vG5JpRV
         ZupA==
X-Gm-Message-State: AOJu0YwWKaPAIEOUGeb2K9EUG+HZs0Hl1bVOj1nygIPFp0RT6xUMV8Xl
	wB6wfsGEbEHNgwUE56/6GW2b3Lh8ecLr4LqI0dk=
X-Google-Smtp-Source: AGHT+IEbnATlm6bqIEVPevcuOPf9zlPq2kvj3kKnG0/U7FlnmK5itjfz3E7p65MTKx69IQwkm9XxM+0w2a3l75r2ad8=
X-Received: by 2002:ac2:44c6:0:b0:50e:546b:53bb with SMTP id
 d6-20020ac244c6000000b0050e546b53bbmr4335493lfm.136.1703839132245; Fri, 29
 Dec 2023 00:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
 <20231228145917.18147-4-alex.kiernan@gmail.com> <202312290807021ede5c85@mail.local>
In-Reply-To: <202312290807021ede5c85@mail.local>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 29 Dec 2023 08:38:40 +0000
Message-ID: <CAO5Uq5RiPPJDjW=nAP3-FNswC5Obus-7xcMZzG-sqUOkzbg-gQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v3 03/10] meta-selftest: hello-rs: Simple rust
 test recipe
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Frederic Martinsons <frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193001

I wondered if that was going to be the case, since we saw that with
zvariant too... I guess we exclude it :| I'll respin the patch set

On Fri, Dec 29, 2023 at 8:07=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Alex,
>
> This fails the reproducibility test:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4159/s=
teps/13/logs/stdio
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231228-881d=
x278/packages/diff-html/
>
> On 28/12/2023 14:59:10+0000, Alex Kiernan wrote:
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > (no changes since v1)
> >
> >  .../hello-rs/hello-rs-crates.inc              |  8 +++++++
> >  .../hello-rs/0001-Greet-OE-Core.patch         | 24 +++++++++++++++++++
> >  .../hello-rs/hello-rs_0.1.0.bb                | 19 +++++++++++++++
> >  3 files changed, 51 insertions(+)
> >  create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs-cr=
ates.inc
> >  create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs/00=
01-Greet-OE-Core.patch
> >  create mode 100644 meta-selftest/recipes-extended/hello-rs/hello-rs_0.=
1.0.bb
> >
> > diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.in=
c b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
> > new file mode 100644
> > index 000000000000..9646482b2875
> > --- /dev/null
> > +++ b/meta-selftest/recipes-extended/hello-rs/hello-rs-crates.inc
> > @@ -0,0 +1,8 @@
> > +# Autogenerated with 'bitbake -c update_crates hello-rs'
> > +
> > +# from Cargo.lock
> > +SRC_URI +=3D " \
> > +    crate://crates.io/figlet-rs/0.1.5 \
> > +"
> > +
> > +SRC_URI[figlet-rs-0.1.5.sha256sum] =3D "4742a071cd9694fc86f9fa1a08fa3e=
53d40cc899d7ee532295da2d085639fbc5"
> > diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Gree=
t-OE-Core.patch b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Gre=
et-OE-Core.patch
> > new file mode 100644
> > index 000000000000..7569ccef7bbb
> > --- /dev/null
> > +++ b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Co=
re.patch
> > @@ -0,0 +1,24 @@
> > +From 3aea1ece0ca6ac0bf0ffe42736827af22966f767 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alexk@zuma.ai>
> > +Date: Wed, 27 Dec 2023 09:55:48 +0000
> > +Subject: [PATCH] Greet "OE-Core"
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Inappropriate
> > +---
> > + src/main.rs | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/main.rs b/src/main.rs
> > +index f4a310758b19..224eca65c38d 100644
> > +--- a/src/main.rs
> > ++++ b/src/main.rs
> > +@@ -3,7 +3,7 @@ use hello_lib::greet;
> > +
> > + fn main() {
> > +     let standard_font =3D FIGfont::standard().unwrap();
> > +-    let greeting =3D greet(None);
> > ++    let greeting =3D greet(Some("OE-Core"));
> > +     let figure =3D standard_font.convert(&greeting);
> > +     println!("{}", figure.unwrap());
> > + }
> > diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb =
b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
> > new file mode 100644
> > index 000000000000..0046b2ca0356
> > --- /dev/null
> > +++ b/meta-selftest/recipes-extended/hello-rs/hello-rs_0.1.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "Simple hello world example"
> > +HOMEPAGE =3D "https://github.com/akiernan/hello-bin"
> > +LICENSE =3D "Unlicense"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7246f848faa4e9c9fc0ea91122d=
6e680"
> > +
> > +SRC_URI =3D "git://github.com/akiernan/hello-bin.git;protocol=3Dhttps;=
branch=3Dmain;subpath=3Drust \
> > +           file://0001-Greet-OE-Core.patch \
> > +           git://github.com/akiernan/hello-lib.git;protocol=3Dhttps;br=
anch=3Dmain;name=3Dhello-lib;destsuffix=3Dhello-lib;type=3Dgit-dependency \
> > +        "
> > +SRCREV =3D "d3d096eda182644868f8e7458dcfa538ff637db3"
> > +
> > +SRCREV_FORMAT .=3D "_hello-lib"
> > +SRCREV_hello-lib =3D "59c84574e844617043cf337bc8fa537cf87ad8ae"
> > +
> > +S =3D "${WORKDIR}/rust"
> > +
> > +inherit cargo cargo-update-recipe-crates ptest-cargo
> > +
> > +require ${BPN}-crates.inc
> > --
> > 2.39.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192985): https://lists.openembedded.org/g/openembed=
ded-core/message/192985
> > Mute This Topic: https://lists.openembedded.org/mt/103401571/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Alex Kiernan

