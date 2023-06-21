Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F47EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:52:33 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.3885.1687366349573241549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F1r0/+6Y;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3422b25556dso20049575ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 09:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687366349; x=1689958349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsNtE80AcPRYxtVoYy1T66tAmgDtP3Ih++63FxpYoDs=;
        b=F1r0/+6YJSDZNSacqjbO+AORZ8LbxEBUkJoZsZlx7Z5jAlgQMtG8usFOMbKzvLZOFI
         kD1v1koDBL3y/yGesdnSNC65VM6vde21aw02JiRrO96ahU5pwgLrQCgyaYnGY2F94RTh
         YvUO2BzNp7q3pyPT2aUrrEr2pGYVC6mj123MwMawUy9GZQxoD2rEOmOmC4YH2i3HGKKk
         nBygBgrh9yIg6cq0Ges5G5kCGGIgpvGHWyiBqO68oa5aVvB4vnBCSbB5fDeWx1xiHWAL
         5wqy5OpaJ38Va/buli9TZM5R0dN88jcvbps9z76l5p8SVNd+42Xq3e2KLWVNycq/rlri
         kjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687366349; x=1689958349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsNtE80AcPRYxtVoYy1T66tAmgDtP3Ih++63FxpYoDs=;
        b=OkuDGRKkrUeU59tNedvmXNlR/HROUkHu4GfubDEmZy3Zg+P5GP0hUSWxw2hjelPOeR
         jBzTf+KSyhZ78PK2tnpVeSQoTAzKuOk2E4Q1rtygEk3LxWwYrIJ9Q9adXu5rJUPuNse0
         3c1m+p1Nq63NKrWL3TNO9vtUGydcvbUaRBjvOfnfi2OG7/RI5HBNYgG958iLU+Y6CNyt
         1sFJZcHpEVub2GFdhx5qCX5TW7QmpaZvAhueaAsyfiprC2vQ1Ec0myFyTrZrvC7pJhAI
         egKhC2s/RWCH2jErhQTjJFGH8Uytc5rcC1lgoGxZ/TBMe4V1JKZD+bJ+aZ8Fw5uUjn4a
         7Z/Q==
X-Gm-Message-State: AC+VfDxf6Gps+qf+eagmWdKcB4jJA+Y9UOqeRX/+JxJAQXGvSCTlCpxZ
	//Gs3V3JiyfMXigkcMeYLMrh8g54woKulkwTArc=
X-Google-Smtp-Source: ACHHUZ5eNMI3wpEF/LdvozhTB/EpZOKZkErHBSfm3edV34PNy68zB4Z5OqpNgcxcWZ7QY8wQIo65Rq6MwvwrVzYyXiM=
X-Received: by 2002:a05:6e02:68e:b0:341:c917:cbc2 with SMTP id
 o14-20020a056e02068e00b00341c917cbc2mr11450185ils.20.1687366348747; Wed, 21
 Jun 2023 09:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com> <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
 <CADkTA4OsL0HeFhjeU1vRTADqir_OyqHTMQetn-Q8-6woimRUMQ@mail.gmail.com> <eb7e5f60-8780-d133-7dfc-21177f50844f@bootlin.com>
In-Reply-To: <eb7e5f60-8780-d133-7dfc-21177f50844f@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2023 12:52:41 -0400
Message-ID: <CADkTA4NL8JGMhH_j70ontw7oOkMGGENCtL97TBNEVwth9QCVZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Ming Liu <liu.ming50@gmail.com>, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183190

On Wed, Jun 21, 2023 at 12:32=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Bruce,
>
> Thanks for your help.
>
> On 21.06.23 at 18:17, Bruce Ashfield wrote:
> > linux-yocto uses a different mechanism for setting this (and will
> > continue to use that existing mechanism).
> >
> > So this would work in absence of a kernel recipe using CONFIG_LOCALVERS=
ION.
>
>
> That's good to know from a documentation perspective :)
>
> I'm using "core-image-minimal". Is there another standard image I can
> build that wouldn't use linux-yocto then (if I understood correctly)?

There isn't, since all of the core images use the reference kernels in
various flavours.

>
> I want to make sure people know how to use this variable, because
> without further information, I expected that information to be used by
> linux-yocto.

It really isn't a variable that most people will use. Most kernel
recipes that have needed
to set a local version have already been doing it a different way.

Bruce


> Thanks
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

