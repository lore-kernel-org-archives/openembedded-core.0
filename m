Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998DAFD8FCE
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 15:41:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72825.1772120488944245600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 07:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dn/W6a/B;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79854193a54so8309447b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 07:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772120488; cv=none;
        d=google.com; s=arc-20240605;
        b=PtFRglAg0QHUgBl/NzYoNsigxsysVLVvR0yHcgvnxOWJLtKcZLvXSD/VUXWB62qav0
         iqYKmg7SwKkaHDzk5ePgl5tSqBCSN8jWgZM+3CrNq2X7x1ytNcQn7XtcQRVNgEvl/oGJ
         C0OaYc43YW+K2t+GM4o3lkIhpKQk7lzR5u+6VZEXBi1roTfGZGs+SYf1XnfshSONv6uk
         PoPmTLqUdqtUkOZojQQrh1oSf70FWnx2RDpKAZLrjOLIQn2ez02e9uE8i6Je6NAjWYr/
         dbtBNVnEUkHXxEdrtuxe7joZbYDvVargKcpzBiim3LSBpv9XQw+ACbAm1w4XIGkroN4O
         g90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gLK20JCEFVplCRrOMYQuYpXVEGsbfRTfGvfYrSIDOKM=;
        fh=IhZ73DyUrHRzBziPZhQFwbQpOsqv9jXjr5vHDvFRvuw=;
        b=OriywC1GgxwQZ2M+mf136ljLCBnV5vh5Ig+OV6AmORAJoNxR2ruBXMXrWZs7B2ZoY+
         yRdTUcauO7IX8m/TfiuQvbhoHZ4sxVWRCSOgH8dpBB/F14QTCjuuYuyiGYiHXVD1zW8w
         wmJSZtXR0t9GIXcSQfWa79GJjFZEKvnHR4sBY6VUR4V3Ok5WvAUj1mg3iI01pveNQuna
         HHQhFQxmQ5pP9l0YP/OHU7PWRZtxwMtoRBxXXXKSomK5uPnTcLxx2ctEkPLqecuAJ7PG
         e6lSq3aWV5QpBVcGr4xaja3CjOgQC+ZcRji192Nv6qr4a7UlAT617mxY0imBITnqT1mv
         4Q/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772120488; x=1772725288; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLK20JCEFVplCRrOMYQuYpXVEGsbfRTfGvfYrSIDOKM=;
        b=Dn/W6a/BIMGMeCCXohFqjM6h9PywXJMABCTKTxc6zmrQaM1m9Wz1go4Y6zasMuJJOr
         zM044Gq30GtOmuIjowGiMLi1g7tOlmyeaPxyzNNhdjCbgiViUYf9uTl1UZfzdaZJSf7L
         G01Heea6+GUWHyTw0sRNy1lYmZ2MuXZZkEJtw2yEUS99faQNyhfX7UO2/NvaD25Cv/VB
         bZncDKzaOAvGSE1ut3XuQ2yDDXe4MrIPF0Pcw8400J6kWjBGqrGrm5V8T+KpEW37f6Y3
         XCqGknDWzi8J+zIcpGJwkK8MDUKyqpfnAnYdl08VSoyS4BB3FOzqbNVJ/dfBHR06AiTU
         3YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120488; x=1772725288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLK20JCEFVplCRrOMYQuYpXVEGsbfRTfGvfYrSIDOKM=;
        b=D4A/fU5qqtCtNjjxlmVUS5X5RixVQcHW0hIkYm3w0H4K7w0FmkAi/PAXhh+1j8wvEE
         bpJcEPoKTJXM71qu52Ld5XLNeKr1kGeDWLdv+7iCAF13MOcy6nbAIt51QUXSOTcwEl4n
         /yevHpixBbcfOlwa+jz6M/3qxVaCj0c1MAtXFFA8+R/JuoTPYOiWaIVxA+PlzSmpOklR
         Em8CEXDqb2l4GB/jHSeQnIdQBch8dc908ffYeVJYiWStA8apX29xQQBdMn/R0Soch5gZ
         SBanEvQL8p69QpVQtxYr3uQXXKZU89SBfh2NDCDDTTUuvkc6LdTNQDhq19aaqEpzCN5u
         Ar/g==
X-Gm-Message-State: AOJu0YyYTHbXBC8zsWGX51eN+rUrR5dJ+oKEHIFSBOb84u8pjoZ8b9bt
	RUpmTi/QJFXgGAd0EYZ8EZZK6vR/6eU07LbE6Na7vERrSlVgTB7jxbVsYYCwaIQD7e3Yv56+vEQ
	YKoUPSnfJS1o2voTcVRQhDiiGEijF0A8=
X-Gm-Gg: ATEYQzwuMy26YrDYFohMeRe0QNAHiqHqpbQioe/CPK3PXLo3P+IMCFHpH76cwY8De76
	G/HvJ3+9f4N1W/k3nCIyzg/8KWsj2sDDkwhLB6Qfz2/TCP/7Bb80127Ig7Ny2MRwk5YmD/n2FnQ
	axpgE8nRO+o5rJg3rYpQzCMCIE615VQJ7zdJuLGwPcM08212A6puJZlkbROHTIWwAFHPxqTYJg/
	4mzLcd6mx/4CU0Qz/h7Gj2WzQEaStDqgO0qqok8HgTkqinXzn8U9YBk7V3isE1Ffyb0WHbTVBKM
	LJPHTM8QmphWycOab2zjMg==
X-Received: by 2002:a05:690c:260f:b0:798:4f55:2c63 with SMTP id
 00721157ae682-7986ff4ebbamr37965957b3.36.1772120488001; Thu, 26 Feb 2026
 07:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20260220154123.376880-1-JPEWhacker@gmail.com> <DGOWOVJXTVRE.10V5UWB69WBCW@bootlin.com>
 <3328290.5fSG56mABF@brobin-bootlin> <8690350.NyiUUSuA9g@brobin-bootlin>
In-Reply-To: <8690350.NyiUUSuA9g@brobin-bootlin>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 26 Feb 2026 08:41:15 -0700
X-Gm-Features: AaiRm50g-2jyVT6eAERP_WJ2DZSdAkoh4QQKzT7ZKc-9LR5sWERg0a9mCP1VwkA
Message-ID: <CAJdd5GYXSdDOpb_cpRxW=dorDrkB+=apnNFbG+H2SLBa5DFbOg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/8] Add SPDX 3 Recipe Information
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232036

On Thu, Feb 26, 2026 at 8:09=E2=80=AFAM Benjamin Robin
<benjamin.robin@bootlin.com> wrote:
>
> On Thursday, February 26, 2026 at 3:27=E2=80=AFPM, Benjamin Robin wrote:
> > On Thursday, February 26, 2026 at 1:52=E2=80=AFPM, Mathieu Dubois-Brian=
d wrote:
> > > And a second one:
> > >
> > > Initialising tasks...ERROR: Task virtual:multilib:lib32:/srv/pokybuil=
d/yocto-worker/qemux86-world-alt/build/layers/openembedded-core/meta/recipe=
s-core/meta/meta-world-recipe-sbom.bb:do_create_spdx has circular dependenc=
y on /srv/pokybuild/yocto-worker/qemux86-world-alt/build/layers/openembedde=
d-core/meta/recipes-core/meta/meta-world-recipe-sbom.bb:do_create_spdx
> > > ERROR: Command execution failed: 1
> > >
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/30=
86
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/32=
53
> >
> > For the second issue, it can be triggered by adding these lines in loca=
l.conf:
> >
> > MACHINE =3D "qemux86"
> > OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib32'
> >
> > With this configuration these 2 commands failed:
> >  - bitbake -c create_recipe_sbom meta-world-recipe-sbom
> >  - bitbake world
>
> I am proposing this fix for meta/recipes-core/meta/meta-world-recipe-sbom=
.bb:
>
> python calculate_extra_depends() {
>     exclude =3D set('${WORLD_SBOM_EXCLUDE}'.split())
>     exclude.add(self_pn)
>
>     for variant in ('${MULTILIB_VARIANTS}' or "").split():
>         exclude.add(f"{variant}-{self_pn}")
>
>     for p in world_target:
>         if p in exclude:
>             continue
>         deps.append(p)
> }

Thanks, I'll add this to my branch

>
> This fix solve the second issue (circular dependency).
>
> Best regards,
> --
> Benjamin Robin, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
>

