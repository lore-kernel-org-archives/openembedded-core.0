Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F107CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 22:07:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14623.1777759648843487634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 15:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xc7xb96i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so27127105e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 15:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777759647; x=1778364447; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qk+sMvPo0qefK68jm7lzFHQtSBYCLQSixXzT4sm+qtQ=;
        b=Xc7xb96ijqjy00G8G9okiljzJjOwpOUj7ttDYibpr9y0IMATllEzAk9wYwuc1kCYp+
         q/dvm/t0AkIYaIKV1dCU5wSFYkIiKUeFHzThhEdf4Rh7QKOfIf6dWey7r15mMVcKQuBV
         38p8hZK89gSTVtS7JxmuERMMZesfWI7vxVcAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759647; x=1778364447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qk+sMvPo0qefK68jm7lzFHQtSBYCLQSixXzT4sm+qtQ=;
        b=cq1OyER5ogm62sX5VZ+ShbZGTgMjzIFMbjMmfofYmTqGxX8dQM6R8CvX1kjT9RV7gf
         +tEg0XwQnLichGgT+LUYqutGJmklCuOZ1ceubzy3LrylxNotxHMQ5ADMthwGJ2m38xkN
         BZIDoBF9qMy/Wsrvare/QQ4jydqQa78uco/NtFn4EcZLClDL8ogX63HVr21o6TOmM1Bs
         AKdns5pfzzYif3jYdXaphsJQFkntJdzH+uWephYtBYyS9zXq+1A7lKB1qXD5oj/J4XKT
         7sQ1eEbgEesxNq9Rssid031YjU4480ZC6bUJ1pf/MDpPkaampQ29LK9eFo/UKcA9mU7G
         DlDg==
X-Forwarded-Encrypted: i=1; AFNElJ9LADBPsO60o2bd43WKyA1YmxeZbh2GX2TTau6wjf1CioFqQVYfWFJmzAxDJ9vsJsSzAYuxegBaghHOWKZa2O2yHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZnMLCGEcygPiLaXczP9T3tENNmiZoFsUv/a5MH6aGhuNdTcXU
	OyOk/JKf8xnwUUyOl9C+wD8oYbMSMIh2xJjSDPYVPzukoT3Ml+d2poET0DzSmkmjBMi8DTY/fRs
	xYff6D3AlS/WJlh21wGXGHxbp/zUCkUTIIxn3294YOG+Mor2I8UFtfkF3OtOORSjKNaKlUwdGFB
	E=
X-Gm-Gg: AeBDietQuiotVj1WQPMJiG2cenT6/LP4/Cdz6aaVcOCDU7+7hih38FlYk/8w3xo7YO6
	V0sADAAVpoArx1kmho3Yfxhtwf0R/PUCcpXQW/Q9yOP+n4fd3mJ1ojXAbMdsVnAwEOD5bjBBtCz
	ez7/C3tvgCxI4kzs8FwEYKxl+NHjubHby10t0gPU/OV/A2wCwKocbGMo40hzN95gSYcKSftgJ99
	LITbK7Y3c3mTv7Dtwq2FJDcvIFK59i5F18XvQ/EoM+5AlzVoSesPs793ReaTDnm1oBUkv6G4Jow
	6qRWjegFmcDkpWWlesDVbeCl+YIibOYj8LXI0NcLcJ7LvtZVZ9wNjQLP6Xo5rGxyAz1Vtn3qXrl
	+wuPVicagq46XY1hmViyK9mbkf2Z6mzOVcttRw+BoIIn9yYlIkc7GwVbDKsfXCs08nrHSdCv8Kk
	s/aHWeORc6a+TEQgYJ/NIyPojvJ7KdGdKmT8BV6NLaXTCa5dYEYiIR1fTuuZhhD3JihFoKfXPvt
	hWyV9rVWZmjWxO4hMl9R1lSfKQ=
X-Received: by 2002:a05:600c:c170:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48a9852e515mr63175285e9.3.1777759647271;
        Sat, 02 May 2026 15:07:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b4ee:e403:1d50:12a9? ([2001:8b0:aba:5f3c:b4ee:e403:1d50:12a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm15347874f8f.29.2026.05.02.15.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:07:26 -0700 (PDT)
Message-ID: <be574cf23e4adf794471c99899db4a862d87c370.camel@linuxfoundation.org>
Subject: Re: [PATCH] populate_sdk: Execute populate_sdk before rm_work if
 rm_work.bbclass active
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marek.vasut@mailbox.org>, 
	openembedded-core@lists.openembedded.org
Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>, Alexander Kanavin	
 <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>, Patrick Ohly <patrick.ohly@intel.com>,
  Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Philip Lorenz
 <philip.lorenz@bmw.de>
Date: Sat, 02 May 2026 23:07:24 +0100
In-Reply-To: <a8d75cfc-a4db-4c5c-b50e-1bc5f5df4511@mailbox.org>
References: <20260429233224.562584-1-marek.vasut@mailbox.org>
	 <e1a87043b8d16e9d2d49d5b0a2ac6ca48a023644.camel@linuxfoundation.org>
	 <a8d75cfc-a4db-4c5c-b50e-1bc5f5df4511@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 22:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236427

On Sat, 2026-05-02 at 19:29 +0200, Marek Vasut wrote:
> On 4/30/26 10:46 AM, Richard Purdie wrote:
>=20
> Hello Richard,
>=20
> > > diff --git a/meta/classes-recipe/populate_sdk.bbclass b/meta/classes-=
recipe/populate_sdk.bbclass
> > > index caeef5d2b2a..3b89ff997f5 100644
> > > --- a/meta/classes-recipe/populate_sdk.bbclass
> > > +++ b/meta/classes-recipe/populate_sdk.bbclass
> > > @@ -10,4 +10,11 @@
> > > =C2=A0=C2=A0inherit populate_sdk_base
> > > =C2=A0=20
> > > =C2=A0=C2=A0addtask populate_sdk after do_install before do_build
> > > -
> > > +addhandler inject_sdk_rm_work
> > > +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
> > > +python inject_sdk_rm_work() {
> > > +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_popu=
late_sdk', 'do_rm_work do_build', ' ', d)
> > > +=C2=A0=C2=A0=C2=A0 else:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_popu=
late_sdk', 'do_build', ' ', d)
> > > +}
> > > diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/cla=
sses-recipe/populate_sdk_base.bbclass
> > > index b427ff27616..073949ebcde 100644
> > > --- a/meta/classes-recipe/populate_sdk_base.bbclass
> > > +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> > > @@ -435,3 +435,10 @@ do_populate_sdk[rdepends] =3D "${@' '.join([x + =
':do_package_write_${IMAGE_PKGTYPE
> > > =C2=A0=C2=A0do_populate_sdk[recrdeptask] +=3D "do_packagedata do_pack=
age_write_rpm do_package_write_ipk do_package_write_deb do_package_qa"
> > > =C2=A0=C2=A0do_populate_sdk[file-checksums] +=3D "${POSTINST_INTERCEP=
T_CHECKSUMS}"
> > > =C2=A0=C2=A0addtask populate_sdk
> > > +
> > > +addhandler inject_sdk_rm_work
> > > +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
> > > +python inject_sdk_rm_work() {
> > > +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_popu=
late_sdk', 'do_rm_work', ' ', d)
> > > +}
> >=20
> > The solution is creative but I suspect it will cause problems with
> > populate_sdk being injected into builds where it otherwise wasn't going
> > to run.
>=20
> Currently, both populate_sdk.bbclass and populate_sdk_base.bbclass=20
> already contain "addtask populate_sdk", so aren't those tasks already
> injected into all such builds?
>=20
> My understanding is, that bb.build.addtask() only extends that addtask=
=20
> with optional " ... before rm_work" in case the rm_work bbclass is=20
> inherited in the build, so it shouldn't change the current behavior of=
=20
> these bbclasses, except for the rm_work case.

When you run "bitbake XXX", it executes the default task, which is do_build=
.

If you add:

addtask do_populate_sdk before do_build

it will always run do_populate_sdk when you run "bitbake XXX", which is
a change of behaviour to what currently happens.

Cheers,

Richard

