Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9940D12690
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 11:39:18 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.15685.1730806749577300773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 03:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fog8hV61;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb587d0436so55166361fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 03:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730806747; x=1731411547; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KTnSbQNn5Nwbw9rgJkWAM1o1ua4LvbdbPZcKMK+D8Q=;
        b=fog8hV61UzF10EmviQoQ0CYZVWaKexQ8xEjt8qdHRYmSZx4SGpZmK2DCDccv23F3eo
         wfZ/8AkHsvdj2yd6pruhHou2+syfwKCna3z7VXtAgHrU0znS3FDiWUaDPwwy4g1lbl+l
         ZufkRnsH7b89sOOXG/oxRlFqqCw4KK9RJik2dD0Ra6L1TNYBZjqHKI1FBvAtrLElECRA
         rAJ4/s6ha9WZgTHHsMD3tR4ToD+eOE+8dJo1RkXUkRkLAWLDg5b8BILaSPJO9/Z7863f
         jYmj9YklWYKg/jyN1+Mxd6LInqrN7OkiPJnpOrPoSRq8xaVhl1IE61/4ot44v1WGJ5YF
         5Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730806747; x=1731411547;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KTnSbQNn5Nwbw9rgJkWAM1o1ua4LvbdbPZcKMK+D8Q=;
        b=C1UawAYyzFwAj55UQva3+9hwY5P+dkzJdkKs4+smlZgr9NhA25wi+vbLXHscPgKyUp
         varB7Zuo5Sm0KnqK63mVlA1fLXa5Bbzer/oUgEbg2zvXOzgeWmkx4GDNHCPt5+/c9ch2
         q49cAVx4dikua0odw5r5PGG7TUq7CiEgGKdtqfEspyYUZQ+omu82gxEr+dbJ97KjRKZ5
         0/mhsGD0wozCwGavU977XCVjTOR/OV0eoVpXt0ChVGCMrDyksY49CLF+neZ56GtCoO3l
         DgPyMU5hu4y3uOm4WQQQTJWzjCyX+wgCyvbldP9NYgxSy/3vCgnhMPG6lmkItDmSHnL1
         9gZg==
X-Forwarded-Encrypted: i=1; AJvYcCU5CSfjQSL8p5thCZULfGaleMMcWhxwWeY5LDwCxFEM+xYAaqE0H9emPgNLOU+y8F+rTYQKRIMtIYulqkbYL+NWVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzhl4WNOh6OSuAodnuG9WgQ3CurcZ4OZIyP+dVk5iYmgkCUzKop
	pcV2hSrNWSEf5VM3mKd7vsj7G9kHGasTSCpDB2kGkBcPG6BccQ+SWiSBm1CnZkCOs+VLhZh/bdD
	ou+kRmUxx674u/+yCpLAX8GW4NuU=
X-Google-Smtp-Source: AGHT+IFt2ZQO0fRR+nLLb4gP8osmfwhWvmXvdD6/cx3S7XxKsjjJDzlDnSrChyrLDURgS+zJ0bML6SLCjBSRzTROafc=
X-Received: by 2002:a2e:a545:0:b0:2fb:8df3:2291 with SMTP id
 38308e7fff4ca-2fedb7a2e8fmr67130151fa.16.1730806747112; Tue, 05 Nov 2024
 03:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20241104145922.1039681-1-martin.jansa@gmail.com> <Zynq3g7_0jJQGt5f@bootlin-mathieu>
In-Reply-To: <Zynq3g7_0jJQGt5f@bootlin-mathieu>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 5 Nov 2024 12:38:53 +0100
Message-ID: <CA+chaQd4=6E-yG0CkTatF=ks__g=cBMqabPqQbHcgYWgkMZMiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] xmlto: backport a patch to fix build with
 gcc-14 on host
To: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org, 
	steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206703

Yes, sorry, forgot to add kirkstone tag in v3.

Steve: should I resend or did you notice this one?

On Tue, Nov 5, 2024 at 10:52=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Mon, Nov 04, 2024 at 03:59:21PM +0100, Martin Jansa wrote:
> > * need to add dependency on flex-native because now when the
> >   .l file is modified by the .patch file it will try to regenerate
> >   the c code and fail:
> >
> > | make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0=
/build'
> > | /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c xml=
if/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0=
.28/missing' flex
> > | work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line 8=
1: flex: command not found
> > | WARNING: 'flex' is missing on your system.
> > |          You should only need it if you modified a '.l' file.
> > |          You may want to install the Fast Lexical Analyzer package:
> > |          <https://github.com/westes/flex>
> >
> > * backport
> >   https://pagure.io/xmlto/c/32376c053733c6c0ebaca3c25c0725509342fdf3?br=
anch=3Dmaster
> >   as well, so that patched xmlif/xmlif.c is newer than xmlif/xmlif.l an=
d the build
> >   won't try to regenerate it with flex as that leads to random build fa=
ilures reported
> >   in:
> >   https://lists.openembedded.org/g/openembedded-core/message/206412
> >   https://errors.yoctoproject.org/Errors/Details/810853/
> >   https://lists.openembedded.org/g/openembedded-core/message/206496
> >   https://valkyrie.yoctoproject.org/#/builders/29/builds/355
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> > v3: add touch ${S}/xmlif/xmlif.c
> >     to make sure xmlif.c is newer than xmlif.l after do_patch (order of
> >     .patch files in SRC_URI isn't enough) to prevent regenerating it
> >     with flex-native which isn't in DEPENDS
> >
>
> Hi Martin,
>
> This is still for Kirkstone branch, right ?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

