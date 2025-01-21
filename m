Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5893BC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 10:34:02 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.13290.1737455637937091659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 02:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dzk1jLEE;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e1a41935c3so76549426d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 02:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737455637; x=1738060437; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmdn35sUDwQkxhOB2ljiErmo+fGat6MNiDNSXUV9blE=;
        b=Dzk1jLEEM7uaA1xNUsLPZQ/UEw8ukLY0VBfN4q4/jFxXKRKfZR7JipBK5WGKIoDr0E
         TN6hsNNQOLFK4OAksaLg74kCWDvJZMtQ2aHsgx9td+lMaXvlYpd9eTVAD4AB2hj040iM
         yhvfzvnjqvm1bcKMrSZ/+Fw9fCxUQBfRvicBvouLbqnI1hocge5yQGF3TH4a1C9PWk+2
         p4uSsAxAL+yVQp6rq1LI1x5sN4DAULtr0MCSxM0Ch2QStTnC9nrrAkmEs0qCAsZkt4sV
         iOcWoDuqQJ8nffoU4T3j4pUiSSIN/6k+jOMbYsiubZDGZqk8bfoRtbR5UMDsGm43uHuI
         EPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455637; x=1738060437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lmdn35sUDwQkxhOB2ljiErmo+fGat6MNiDNSXUV9blE=;
        b=IxYJ/qn+P8qbAusDroH7J06ZZYQty601e/07F4AmFow97QaZ4/Blzwzq1ghrUyopdO
         bw2atbPJ2tr9ETgUYnca3tewO7oL9TIKiQ9IBgvtbrmZlYC7Y6glf/aFrOKEFlvXsBPu
         CqSX7aquKD4rdB5guzopwWxycd7uPG1+drTMPqtQthWQJjBptZXHGWbIklSDTFTKV/t8
         X08mzjl/S3xB4tbCAkXh1VKxpZLBn59ro0HUUoGr+GFj0NzQDAUsidg/YEAuH3IE7Nno
         ap6Mj+ZB3QAEcnAP9EfAHjTmB1jYWfXaclIVNI8C4XDSEqOA1uoZglaEuEiwXR6aS2aS
         IJwA==
X-Gm-Message-State: AOJu0Yxkg+sr7OSpd5Fm0SnWDeaaF4yArFdiL2JWMgwIgua0C2LoaErL
	HxxyexR3k7Y/vyWwSmCHQfY6wIdV+YSvXscfjcIIOM1kQ1r2RPv11zOva0JJQN7JNli4b/QzPJj
	COSldneBmNl5olSPH/BljP1hn4F8=
X-Gm-Gg: ASbGnctVVDTAU0aIvtftbBWjYegpwbUht/r3UJLnHrKAOYh7w7IrEGT9u5qX+Hpkxj0
	1NZZzx54e1s3YXbyl20yk2U9YmNiEszX5FWKP4wwoaJ0imjFKfPyvr4P+QhgAKSUZtm8T4+rq0w
	XF3kAbzzPw4A==
X-Google-Smtp-Source: AGHT+IEmCmdPacFLTrjVBcIywIQTrb2eilvzo1ZK6JxnPFTmgfRSGhjbtBrnwjOsgSjjsDVesOzvbuFNncNmntonOvE=
X-Received: by 2002:a05:6214:1c4a:b0:6dd:d513:6124 with SMTP id
 6a1803df08f44-6e1b220a540mr271531736d6.35.1737455636948; Tue, 21 Jan 2025
 02:33:56 -0800 (PST)
MIME-Version: 1.0
References: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
In-Reply-To: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jan 2025 11:33:45 +0100
X-Gm-Features: AbW1kvbjs5fhUGwophYZ_AjSFBFqd6aYjEkCjPME5zK4MyZhJ9pfiZJC4RlKPo0
Message-ID: <CANNYZj8Jv9Dkp4damnuGdvO9r4irwWZBUtPWJ0Cf_GCvvNgKeQ@mail.gmail.com>
Subject: Re: [OE-core] npm based packages omit dependencies since Yocto 5.1
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 10:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210085

There have been recent npm fetcher fixes in master, can you try that please=
?

Alex

On Tue, 21 Jan 2025 at 11:31, Zoltan Boszormenyi via
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
> Mute This Topic: https://lists.openembedded.org/mt/110731121/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

