Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB85C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:15:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3621.1691000156355178589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 11:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kbslY4ME;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bdd262bb0so16279466b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 11:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691000155; x=1691604955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjr5bKPkcOL1HojlYCi45Tsut4xs8eE32+9Rn18HkXU=;
        b=kbslY4MERwrIcyt/hc3YkLExx7flToxaSoRit3RgBIPSrFFF6zMbAWfGsgNR35I0Oo
         Saf+ihi6FxzXbqzM4/L9Y4RuA5eHymiZy9ZBq44wpRfWnXD6wSq3Dk33WVlZOqzGborS
         m99g8cQizVdA+x9BR9aK776bzblO29MMbRJ+WssHgROn2J5FRY1ssZYSUfFle6pagsah
         dnYQYhbH7iDjq0WKdkmXigG2M/33mZGYL/yznmbJ/6/xfs6Y5LLJ2YhxbnIbjCKAAycC
         ZfU2sY/QwepvBtiA4Iu3rtnHGdP3NfgNBR+wJyxuWlWMPZS1bMUWqIkseWp4OMGOI7KN
         T7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691000155; x=1691604955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fjr5bKPkcOL1HojlYCi45Tsut4xs8eE32+9Rn18HkXU=;
        b=DKUuKEzln52Dcu5ZZBah/ZNh0v8Eh+MukwDfPcMUF7u61cXYhcJekKWgwvaWQ4AdVi
         wllIxGUYTDd6PLuS93TbFujHVUUmTW8wEHM0VBKv0lJmLxv1OJj9PIlk1Pmf4qDn3Rr+
         GcCxtzpSlSnfKGUkeDhI28vJ2CanizQLDm+BZpYoJLqjrAntnMyRLPd80Hk3G1nLrYCF
         JN7fIGwrY2rboazLIBnAUOvSAo1vMBafrDRK8u4V7y21iWfDp/Y2v3ZZnldMS6UkQLXL
         7Db/LfLipk1FBmTqtwHoaMbOnDKJm5sm1OpDVTPESgV6Oip/eyB/EfkSrUnjZoFAN31U
         VliA==
X-Gm-Message-State: ABy/qLYciofPMxSRGfliF6op/hL/QAwfZoIz7kviT5g/KMaol9HDWGSZ
	V1lOAi1RKiRVtsVFQdJljrfJG8mjfnoraOuOry75NA==
X-Google-Smtp-Source: APBJJlHEorxSSaLACwasfcABFKv0gKvRsvW63sovKRMYnYaYUwZXyt9AW/PruY7mt9pfqtXGZys/1DmDKO4jd95K8LE=
X-Received: by 2002:a17:907:2c77:b0:992:48b7:99e3 with SMTP id
 ib23-20020a1709072c7700b0099248b799e3mr5563145ejc.63.1691000154799; Wed, 02
 Aug 2023 11:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <d106870a-120c-7c32-8a12-8bcd9ef52ddc@gmail.com>
 <24636.1690825719292717322@lists.openembedded.org> <CAMKF1spOdFdb1ZmM7W-aRTkUF2GnOf7RMFKy+_Z3scY_rNgTKA@mail.gmail.com>
In-Reply-To: <CAMKF1spOdFdb1ZmM7W-aRTkUF2GnOf7RMFKy+_Z3scY_rNgTKA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 2 Aug 2023 08:15:43 -1000
Message-ID: <CAOSpxdZm0A+W+MhD-PEkdyPeere=FNdiRayh_hwcpanQWYY4Xw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc : upgrade to v11.4
To: Khem Raj <raj.khem@gmail.com>, sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 18:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185426

On Mon, Jul 31, 2023 at 12:59=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Mon, Jul 31, 2023 at 10:48=E2=80=AFAM Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > Hello Khem,
> >
> > There are 393 New Test Cases added with this update (Refer the attachme=
nt). Out of those,
> > 88 Failed cases: Mostly from gcc.c-torture, gcc.dg, gcc.target, c-c++-c=
ommon modules
> > 13 Unsupported cases: All from gcc.dg module
> > and other 292 Passed.
> >
>
> Thanks as long as we dont have failing cases which passed in the prior
> release. Its fine

Sundeep, can you confirm whether the above is true or not?  I need to
know in the next 24 hours or I can't take this version bump for the
upcoming 4.0.12 release build.

Steve

> > We are currently working on glibc failures as reported earlier by Richa=
rd and we will look into these gcc failures after that.
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185182): https://lists.openembedded.org/g/openembedde=
d-core/message/185182
> Mute This Topic: https://lists.openembedded.org/mt/100387943/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

