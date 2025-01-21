Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65826C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 10:54:02 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.13370.1737456832168777563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 02:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BcRK3dvT;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so56599751fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 02:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737456830; x=1738061630; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKH8Z6wwGTX+rvZnk2URH4ncNgennRKLe34nwJoGD10=;
        b=BcRK3dvTrb+k1fMKWdUMxexaUg+8a+QMh9wuzDG/42vPS0Hf7R7IKuvOuh9f1tafae
         u1IhlgWKVTnABGpA1MnNdV9fhXYSTN3+VAx4JOE80Q85VNDOHlcdzfhvUD/IJHVd/HNZ
         wmujmPW8rR2w8+bXkPMDgRUdxnD0uVRUPltHtZVgtwLK2EEU/PfXgW+zTIh/q0ZA+iNQ
         FpJ5+sBw74dvr90GbtfvJJb1vA3uLYmc1yj6fpxExGhepURT7A7j/94VctlHC/+Q0wDl
         HjdAnBFtl5XIPxWAPBSc6sbSAkpKMUDSHuJY9z8V7Pmsu3WM18J87q4dVNopyUpbj07T
         W0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456830; x=1738061630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKH8Z6wwGTX+rvZnk2URH4ncNgennRKLe34nwJoGD10=;
        b=BTjI7XVXDFCMCuCL5YAyL11fD+5dhiH1iK2XqeGCbkVDaOJY2zNz9tN6rXPgXKoC9a
         nyQ5FFBsu7+XQ64DXp1sD657oSa1273vEG2rz6NtxI8jeqvUE2M7cj7cBE4KiaLEBNyc
         a2ZEphCR8SLm/iajEoyaqbVHvFthQiaGtp9kBJtQI9j4afjQxta4LPS71GxGm8O0Ylr6
         O0oOpx+YsxC6iC9tTmGJ+FPUS1CFIzezrSt2W9K5Qm4PQY86JuhXwPi2LJkkkPjFTZm0
         AYmic+sY4C5Oyc7nP6vtMeyBIJkVyirbraz5OV7KG8lLP+AzghFNyKOHWjtxqn/ozU3h
         bpDw==
X-Gm-Message-State: AOJu0YxXub7MVS0VcnhmcM+olOSyZB2OEaVPE652nAphTo9HINs1peYj
	uUTeNbqNvg1AqkELDYOARmmIVLnknZD/J/tudM4KkgkiY42+30QZg/nHJUrtcUFcT+tDF1CzLDq
	iOviiLpuYmiAPq941TJ07T4ErXos=
X-Gm-Gg: ASbGnctUfGSNcn1BugjhWMmzaBy3bwH6QddMpQB/IXtETrlUbhee+EPwhPsYTpr66+4
	jCq2kg/+r4OyW9Af4yCfDMNWYxzN7yNiZcVLXsjblcAMJOZCDCC1MeA==
X-Google-Smtp-Source: AGHT+IEsmNjk5+kI/6H1vi+PDYqJZ+jOqsJV3nES5MgAyzYmhYikYb1xJNFIkbpZuENxXTr5xIbMj8BGjsiyXo4xxJo=
X-Received: by 2002:a2e:bd89:0:b0:300:33b1:f0e1 with SMTP id
 38308e7fff4ca-3072c991370mr58968861fa.0.1737456829885; Tue, 21 Jan 2025
 02:53:49 -0800 (PST)
MIME-Version: 1.0
References: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
In-Reply-To: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2025 11:53:37 +0100
X-Gm-Features: AbW1kvZkJ5uTQZWt3rlp9CcW5MJaNVyLBElc8Byj598p453R4gH4uLalixkIM2g
Message-ID: <CA+chaQePYP7LVSK_Fxbuf-+MexZVwUpnn35CO7=2Ji3xB3nZeA@mail.gmail.com>
Subject: Re: [OE-core] npm based packages omit dependencies since Yocto 5.1
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210087

I believe it's the side effect of UNPACKDIR changes, I had to add
;destsuffix=3Dnpm in all npmsw:// entries (or ;destsuffix=3Dgit where S is
set to WORKDIR/git) for dependencies in node_modules to be unpacked
where they used to be before.

On Tue, Jan 21, 2025 at 11:31=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi,
>
> I have a minimalistic recipe for pm2 (https://www.npmjs.com/package/pm2):
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> node-pm2_5.3.1.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> SUMMARY =3D "Production process manager for Node.JS applications with a b=
uilt-in load balancer."
> HOMEPAGE =3D "http://pm2.keymetrics.io/"
> LICENSE =3D "AGPL-3.0-or-later"
> LIC_FILES_CHKSUM =3D "file://GNU-AGPL-3.0.txt;md5=3D9f9fa01c099265d62f737=
35e404ff8bb"
>
> SRC_URI =3D " \
>      npm://registry.npmjs.org/;package=3Dpm2;version=3D${PV} \
>      npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
>      "
>
> S =3D "${UNPACKDIR}/npm"
>
> inherit npm
>
> do_install:append () {
>          rm -rf ${D}${libdir}/node_modules/pm2/lib/templates/init-scripts=
/openrc.tpl
> }
>
> RDEPENDS:${PN} =3D "bash"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Previously this recipe has built and worked correctly under
> Yocto 4.3 and 5.0, as in the package included its own internal
> dependencies in /usr/lib/node_modules/pm2/node_modules.
> Yocto 4.3 ships nodejs 20.8.1, Yocto 5.0 ships nodejs 20.12.2.
>
> With Yocto 5.1 (node 20.18.0) and master (22.12.0), the package
> only has the pm2 module contents in /usr/lib/node_modules/pm2
> but no dependencies.
>
> It seems that at some point, nodejs 20.x LTS upgraded npm
> to a version with a breaking change which now flattens the
> dependencies into a single level in /usr/lib/node_modules
> from the previously accustomed dependency tree in
> /usr/lib/node_modules/pm2/node_modules.
>
> Is there an incantation of EXTRA_OENPM or the npm:// SRC_URI
> that would allow either to unflatten the dependency tree, or
> include the dependencies as well as the main node module?
>
> Thanks in advance,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210084): https://lists.openembedded.org/g/openembedde=
d-core/message/210084
> Mute This Topic: https://lists.openembedded.org/mt/110731121/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

