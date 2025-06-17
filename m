Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D624AC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 22:37:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.32845.1750199818207490734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 15:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RlwtIz97;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a375e72473so3458803f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750199816; x=1750804616; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pkJ7jaraXZyXoFa91DwYheFCgSMpabZzHAdsOLk+4n8=;
        b=RlwtIz97Dz1eOOKE8QZnNQzEoEA/rKZC1Az6MlSZsq640hSZGCPx1TZzHYg0m8MgYT
         xdcgA3u2RVaHkOhAZQ0OTuynC+Fka2/hY1XPbQfvfesacTUWVjMiEOFkVxsN9JQnzHqt
         pIM97LsKcppPCSbdLwY2lwAVeZRGpBRmkysek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750199816; x=1750804616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pkJ7jaraXZyXoFa91DwYheFCgSMpabZzHAdsOLk+4n8=;
        b=eUY/K13wVO+lRyJmh55IRX84xI1TUjQvTYR6dgjmTeeMU9btEinpmKNxuacKWdoh7I
         Q0QxCrK0OJyPcT22VTy7dMBoRmyC36qXjrRaIPqAa86BwzYqlynUv+LP4z3+Dc85FPu/
         9r31SHOjx/nFtmZN+jPYOejAY9ujRqGXyTwSmDo2ycqGrGs9mcaENDZABYTofdRoNgNf
         HMhKQaJss4ju17vKt7sVooFOSjzsHps4FHzte5Oxis9WhQzmr4U3oAvNDjiWUVDL/o8R
         KXx4Cwkq223VYKh/mIg5Exl9CP1ropQY/2N5KxbIDOpVEErBTlZG0t0kuc36BngX2WNc
         ToVA==
X-Gm-Message-State: AOJu0Yy3+UqgCo6+fk7mSHsYCWRLUXOzMaLN6/CNGSAVk0LEsUMBKp4Q
	oiqemfUVvgBl0k0hWILOBdFLQ+FdpneJQXmV5mktyXg4qKhhaW4Fs2c4qF7qvNTEqEg=
X-Gm-Gg: ASbGncuNUVj6vu8IzIJjcu5qUSjXWC7HAm9Jz6SQjFuuueTo+YFMOYMFTBJtos7QB88
	3IPIPZMEdV0xRtpa1O+UvAZldlJiQWXQrOmxEoGIMErn6Jb0Rh2weO+zgHZR7eAjdCmYlbP7D2i
	hKRi8EyJvKEUwnHGSQrlSjPZnM8aT6YY7WyGhoCzqZw6RKScq6UgTEUJY+Hsgn08h0ic0dTD847
	qfYPuQihX5EimO49FLNvZHn6y/kJ5zk8nFduUga/PBNvSQVwR7LG9dFe6q1R1DXjzuqmLgWcrRv
	DMsGCNMpdsSUZBmpYO66DmpK/KaC2QrH9uOQ2GzywcPjVDBjPT+1e3go42tpBpgX55rpZSXGVNz
	blhdkSNyIEgWrzfPNpuIsy2+PejpkGADOVaQQIngpoCK/tetBAI9C9eOFbl5G5Q==
X-Google-Smtp-Source: AGHT+IEmOxNzkRypTf03Jq9ciadUI1AQD2I4wiqWtb85nyp1mjNxwRAQZyRORsIo5H1Avi1twSVKMQ==
X-Received: by 2002:a05:6000:40c9:b0:3a4:ef48:23db with SMTP id ffacd0b85a97d-3a572e66ea0mr12664923f8f.59.1750199816602;
        Tue, 17 Jun 2025 15:36:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7be4:6296:45d5:785a? ([2001:8b0:aba:5f3c:7be4:6296:45d5:785a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1eb9bsm15297529f8f.69.2025.06.17.15.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:36:55 -0700 (PDT)
Message-ID: <30d228f2eb790733b8eacc50fd5ab24ff6cbd9eb.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] u-boot: Allow for customizing
 installed/deployed file names
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: reatmon@ti.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2025 23:36:55 +0100
In-Reply-To: <ccb00e82-a47b-4917-8c97-c7a67fe5b090@ti.com>
References: <20250611190430.13378-1-reatmon@ti.com>
	 <12269899-C562-4B4A-987E-27A2F770B694@arm.com>
	 <ccb00e82-a47b-4917-8c97-c7a67fe5b090@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 22:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218945

On Tue, 2025-06-17 at 13:01 -0500, Ryan Eatmon via lists.openembedded.org w=
rote:
> On 6/17/2025 12:16 PM, Ross Burton wrote:
> > On 11 Jun 2025, at 20:04, Ryan Eatmon via lists.openembedded.org <reatm=
on=3Dti.com@lists.openembedded.org> wrote:
> > >=20
> > > When assembling all of the various filenames that are installed/deplo=
yed
> > > from u-boot, we have been including the PV and PR in the filenames.=
=C2=A0 This
> > > change introduces a simple variable indirection for those places so t=
hat
> > > the values for PV and PR can be modified if desired.
> > >=20
> > > In this case, we are wanting to use the value for PKGV instead of PV =
so
> > > that we can pick up the git commit, but a change of that magnitude in=
 a
> > > bbappend would be impossible with all of the places where PV is hard-=
coded.
> > >=20
> > > This change should not be disruptive since the default value for the =
new
> > > UBOOT_PV and UBOOT_PR are just PV and PR respectively.
> > >=20
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > ---
> > > meta/classes-recipe/uboot-config.bbclass | 15 +++--
> > > meta/recipes-bsp/u-boot/u-boot.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 80 ++++++++++++------------
> > > 2 files changed, 50 insertions(+), 45 deletions(-)
> > >=20
> > > diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-=
recipe/uboot-config.bbclass
> > > index f44605cb6a..6287701888 100644
> > > --- a/meta/classes-recipe/uboot-config.bbclass
> > > +++ b/meta/classes-recipe/uboot-config.bbclass
> > > @@ -22,12 +22,17 @@ def removesuffix(s, suffix):
> > > UBOOT_ENTRYPOINT ?=3D "0x20008000"
> > > UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
> > >=20
> > > +# When naming the files we install/deploy, the package version and r=
evision
> > > +# are part of the filename.=C2=A0 Allow these to be customized if de=
sired.
> > > +UBOOT_PV ?=3D "${PV}"
> > > +UBOOT_PR ?=3D "${PR}"
> >=20
> > > -UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT=
_SUFFIX}"
> > > +UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${UBOOT_PV}-${UBOOT=
_PR}.${UBOOT_SUFFIX}=E2=80=9D
> >=20
> > Every instance of this is PV-PR, so why not have a single =E2=80=9CUBOO=
T_VERSION=E2=80=9D variable that defaults to PV-PR?
> >=20
> > Putting the PR in the filenames seems wrong, but that can be a follow-u=
p patch.
>=20
> I can make that change.=C2=A0 I had thought about doing something like th=
at,=20
> but decided for the more specific change.=C2=A0 I'll take a stab at that =
and=20
> send in a v2.=C2=A0 Thanks!

FWIW I don't think we need/want PR in this, at least by default and I'd
prefer to drop that as a follow up patch too, simplify things a bit. PR
doesn't tend to change much now.

Cheers,

Richard


