Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21316E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:26:41 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.62137.1734369994540004146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HvMChx+2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2282874f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734369992; x=1734974792; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYvQulaQ66EtVSGXIaoaIsvM6j3uMoWoxDPFq3h0ne4=;
        b=HvMChx+2FQtlsLYiDxZR/xQfJub/KklGEo9ykk7TVAZEE1IA+cbK7dJet0HUV4krob
         1P/FPfOxRJTcLbgqDVwOl0AmGmPevfjuSCCR0+EL15mkd1YEiy9+g0wmBD/CKTI+vF8c
         PuWrsq4Cp9Z6cuq28nr21gni8WVUoyOGj5Uys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369992; x=1734974792;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NYvQulaQ66EtVSGXIaoaIsvM6j3uMoWoxDPFq3h0ne4=;
        b=wmnNtJpP4yt1oPer7HxnqznchAAkdNisCluhxUXSvESI5eF59AoXQPEq5q+aJSpFn1
         UzKWEFmbZkVeO4hzho/iVoeWwBmz1RutG1/qd8ZdnKyJkwulW/zup/uAFbNF5DLJ7fHC
         4fGjHiHgU4M/HrmXP/jvCOEMS0cMtr5C1PwqnPUo6SUXgXLym/y1uHJ/Bhpfh2WRI8dO
         DI+eZGDWQfb0tGaAbn1bqswgc15MHx1UoREDtbOk9jXu7VbfHUekF2+OARA31G8WRC+I
         Ot3pZsVVCtvSSn/+T9CVup2JC2G1p7LrJcZZwe695kfIwQmKGIR76wvTZywlkVTHoTkP
         XghQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtaKea8Ovw9qcPVDqIKZa1Jk+E+FB8+nK+E1g8gEMJ7OQfK8Aa2NOzvUpsLQXxKJ9M27Dtrzb9h7YfhHtyhEJBbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTb2pLBg1nFgZpZhUsS8rwqQo/tgl8f6C3zos8Z2POxtrx1G+I
	Oz1UpxF3D+LMtYTPUL/yohwmMkFSwMShhkVCtkqz4oo0zSWmrKCbuw/qfE5+3mI=
X-Gm-Gg: ASbGnctiKS7jMdj3pnv9orsniiu/jyt5LAifq91Iw6gOXhFqUtxapWew0ExhmExVszR
	7rFbfmcwJl67Dbzqjw9vlHxV7xRvguzYSxC+zAd8137DbhAcPfnIQlRRPrM7h+KAQ+R+QgNuMq5
	NpNd8mOA8PvV7FydGZeTVWl1OwYYSWDjKA4ptbOW+7NzTBZHAGw44Fxb2hXHZIWkX9Q7sY94Xcr
	DKaIbx4ton8gRy1KrCywxGHfVH66kZmgSfJUUxMw5nv56Z6cdVgSvJBuRw4xALOwcYxlDEDUMiZ
	G9BDiRCHmI035/I+Wcl6BXGZVjFdW+bjz8dGcNFk5SKcTg==
X-Google-Smtp-Source: AGHT+IHV/6SqPlrd/QsG7Sh3aQPXEQB/vjkV+Sw1qgHeUu1QlttjzE24QjD0EkmMkn5UeOVvV2zGWg==
X-Received: by 2002:a05:6000:1fae:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38880ad88dcmr10890560f8f.16.1734369992571;
        Mon, 16 Dec 2024 09:26:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7? ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801643fsm8735396f8f.41.2024.12.16.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:26:31 -0800 (PST)
Message-ID: <5da5d53d4c180299fa174dc70e467519e2bdab66.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Revert "uboot-sign: fix U-Boot binary with
 public key"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ryan Eatmon <reatmon@ti.com>, openembedded-core@lists.openembedded.org, 
 Denys Dmytriyenko
	 <denys@konsulko.com>
Date: Mon, 16 Dec 2024 17:26:31 +0000
In-Reply-To: <aa70739a-2a7e-42d1-876e-25cb8bb10cc0@ti.com>
References: <20241206210917.31123-1-reatmon@ti.com>
	 <f33814f998b09438feadedbab1ab04c536600496.camel@linuxfoundation.org>
	 <aa70739a-2a7e-42d1-876e-25cb8bb10cc0@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208784

On Mon, 2024-12-09 at 14:40 -0600, Ryan Eatmon wrote:
>=20
>=20
> On 12/8/2024 4:22 PM, Richard Purdie wrote:
> > On Fri, 2024-12-06 at 15:09 -0600, Ryan Eatmon via lists.openembedded.o=
rg wrote:
> > > This reverts commit 0d14e99aa18ee38293df63d585fafc270a4538be.
> > >=20
> > > The patch removed logic required for correct handling of
> > > UBOOT_SUFFIX=3Dimg or UBOOT_SUFFIX=3Drom.=C2=A0 We need to find a bet=
ter way to
> > > handle the fix for [YOCTO #15649].
> > >=20
> > > Signed-off-by:=C2=A0 Ryan Eatmon <reatmon@ti.com>
> > > ---
> > > =C2=A0=C2=A0meta/classes-recipe/uboot-sign.bbclass | 8 +++++++-
> > > =C2=A0=C2=A01 file changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-re=
cipe/uboot-sign.bbclass
> > > index 7ee73b872a..a17be745ce 100644
> > > --- a/meta/classes-recipe/uboot-sign.bbclass
> > > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > > @@ -122,7 +122,13 @@ concat_dtb() {
> > > =C2=A0=C2=A0	# If we're not using a signed u-boot fit, concatenate SP=
L w/o DTB & U-Boot DTB
> > > =C2=A0=C2=A0	# with public key (otherwise U-Boot will be packaged by =
uboot_fitimage_assemble)
> > > =C2=A0=C2=A0	if [ "${SPL_SIGN_ENABLE}" !=3D "1" ] ; then
> > > -		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; the=
n
> > > +		if [ "x${UBOOT_SUFFIX}" =3D "ximg" -o "x${UBOOT_SUFFIX}" =3D "xrom=
" ] && \
> > > +			[ -e "${UBOOT_DTB_BINARY}" ]; then
> > > +			oe_runmake EXT_DTB=3D"${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
> > > +			if [ -n "${binary}" ]; then
> > > +				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> > > +			fi
> > > +		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; t=
hen
> > > =C2=A0=C2=A0			if [ -n "${binary}" ]; then
> > > =C2=A0=C2=A0				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee $=
{binary} > \
> > > =C2=A0=C2=A0					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> > >=20
> >=20
> > I'm in two minds about whether to take this or not. The code is clearly
> > needed for some platforms however the selftests don't cover it and I
> > doubt it is documented either :/
> >=20
> > If I take this, can we add in some better testing please?
>=20
> The initial commit that starts the img ball rolling came from 2016:
>=20
> https://git.openembedded.org/openembedded-core/commit/meta/classes/uboot-=
sign.bbclass?id=3D4afee787e455ce1d4c002cd5c003182f1fc50028
>=20
> The logic has morphed over time, but there is where it started.=C2=A0 So =
it's=20
> been in there for a number of years.
>=20
> I'm willing to take a stab at the selftest.=C2=A0 Is there any documentat=
ion=20
> to help with that broadly means/entails?=C2=A0 I'll also talk to Denys in=
 our=20
> call tomorrow if he knows and can point me in a good direction for this.

You can run a subset of selftest with "oe-selftest -r uboot" wich would
run the test cases in meta/lib/oeqa/selftest/cases/uboot.py. You can
narrow it to a specific class of tests within that file or a specific
test too, e.g.: "oe-selftest -r uboot.UBootTest.test_boot_uboot".

The aim is to have test cases for key workflows we need to ensure work.

There is some information in the manual:
https://docs.yoctoproject.org/test-manual/index.html
but it probably doesn't go into the level of detail you're looking for
about writing individual tests. That is something we've wanted to aim
to add but we're probably not there yet.

Cheers,

Richard



