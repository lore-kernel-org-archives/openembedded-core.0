Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3555C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 19:18:06 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.6543.1680117483798833032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 12:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=W2s22T3I;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id eh3so67441303edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680117482; x=1682709482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ineICYo3/vvOEUTQLyKX2qjFAS3Q/Q+BH7tS0a2GKiY=;
        b=W2s22T3II/o7+XmKD3GZ2R4zDSHVFuPK1/dg3NM7F1Iqq279TAvDXsnIL+IQJvjn/Q
         H/S4Y/yH3h6OdYvNPF+T6ukOUDkuQKB21Cnx5+tmC/og1Ot2D0MgLrU6Zg11PQ7Du/N9
         kQJCHORbu97cgfLDqpF7b8M2harNsJtZI1DgB4JqSZw5jdmSwa1u8bUi/O2jW9OM1T4y
         fb65kBl0DHYEC+LjuCuiakOzDB2O3fm3GtjK5TYUW3GLCxBeVSXkhSSlMm1UCGC9s912
         KMtzr6Q7YtT125RpZZt7aUmZHfHmeTzOFJrYN/6vFY4vXpn7FqTtwanyzj26QYSppe9I
         hvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680117482; x=1682709482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ineICYo3/vvOEUTQLyKX2qjFAS3Q/Q+BH7tS0a2GKiY=;
        b=tkmSSj54LTE06j32r+EVfukhUycdFd058T7rnqJ7av9YLxdCbXvXb/sOlZv+xOhvHX
         cGtGsdcXf0yAjKz9ym4dB3t1tWHqMCyJLbWZJb5O6JsTLu2Pezox78V1pll8PPSYRtJf
         AgOaigqhDg6/8zGDblsbG4Vnz/tqYkVbPzUI/hCE4UcbdgzlYFB08E0kpfi0CHSKt1dG
         UcpIGXRXVP2zhz/wOR8ienX96PnSF4ZWUt+RUGCEUuNt2TVqxyrxKW7dtswgxxAVc68t
         5US3HkMsrMIrAyznzcEhTtU8dRnxLPQsVmzpsMoNYsdrg0xk2maN8ovMhUZU/sDoNr8c
         Cq2A==
X-Gm-Message-State: AAQBX9fSi78Ck5ZJ2XALWtTnMmgPSJbqWG2etuEI1B869zv0h7mwM8p+
	YZGfc+JLn/tEUz900y1SjRoHB0vsa8Lfe/qtz/URrQ==
X-Google-Smtp-Source: AKy350ZELwW3qoMeJIBsfNOJ5nHMEmRcpQFxPGfRdNU6DoAELS0W71XAvkyijIYkuuhXq5P400DC04jQT3bmMdb2jPc=
X-Received: by 2002:a17:906:ee89:b0:92e:a234:110a with SMTP id
 wt9-20020a170906ee8900b0092ea234110amr10653173ejb.3.1680117481726; Wed, 29
 Mar 2023 12:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR11MB28862F0807337647C5351586C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
 <BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
 <CAMKF1sq0z7KDh1F243rKKCPr2x2thwvWrx68uw93spkx-2z1=w@mail.gmail.com>
In-Reply-To: <CAMKF1sq0z7KDh1F243rKKCPr2x2thwvWrx68uw93spkx-2z1=w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 Mar 2023 09:17:50 -1000
Message-ID: <CAOSpxdaC8YyaVUxkNJBDt5DsPESknkSt7p=S7FWk_rQA8RjSHw@mail.gmail.com>
Subject: Re: [OE-core] Build error with dunfell release "yocto-3.1.24"
To: gauragup@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 19:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179297

On Wed, Mar 29, 2023 at 8:03=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Wed, Mar 29, 2023 at 9:51=E2=80=AFAM Gaurav Gupta (gauragup) via
> lists.openembedded.org <gauragup=3Dcisco.com@lists.openembedded.org>
> wrote:
> >
> > Hello,
> >
> >
> >
> > On latest =E2=80=9Cdunfell=E2=80=9D branch, there=E2=80=99s a compiler =
warning/error when building QEMU.
> >
> >
> >
> > The patch for CVE-2021-3929 applied on dunfell returns a value for a vo=
id function: https://github.com/openembedded/openembedded-core/blob/dunfell=
/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch#L58
> >
> >
> >
> > This results in the following warning/error:
> >
> >
> >
> > <ws>/qemu/4.2.0-r0/qemu-4.2.0/hw/block/nvme.c:77:6: error: void functio=
n 'nvme_addr_read' should not return a value [-Wreturn-type]
> >
> > return NVME_DATA_TRAS_ERROR;
> >
> > ^      ~~~~~~~~~~~~~~~~~~~~
> >
> >
> >
> > In newer versions of qemu, the functions is changed to have a return va=
lue, but that is not present in the version of qemu used in =E2=80=9Cdunfel=
l=E2=80=9D.
> >
> >
>
> yeah perhaps we need to backport
> https://github.com/qemu/qemu/commit/94cbcf530f9d9789b75ef1ae227ba4a4f702b=
f7d
> as well.
>
> https://github.com/openembedded/openembedded-core/blob/dunfell/meta/recip=
es-devtools/qemu/qemu/CVE-2021-3929.patch#L58

I haven't seen this error on the autobuilder!

Gaurav, could you try the patch that Khem suggested above and see if
that works for you?

If so please submit a patch!

Thanks,

Steve


> > Thanks,
> >
> > Gaurav
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179293): https://lists.openembedded.org/g/openembedde=
d-core/message/179293
> Mute This Topic: https://lists.openembedded.org/mt/97933015/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

