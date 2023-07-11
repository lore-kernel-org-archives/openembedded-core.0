Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7CCEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 14:27:58 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.1024.1689085670268755425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 07:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Vtk1l5hm;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-98377c5d53eso730538766b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689085669; x=1691677669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2djy9K43d3ZNoQVL5wtAnALFq2Q0+l8Je28Lvv6RhE=;
        b=Vtk1l5hmO05TMOT1xq6JddxLuOmqvYHw/hLby0sgC6MubAPfRIU+GgSkXxpVuEEoyd
         A13oxgbTCiIL5DNihANw6Li44OHPaau0er+72E5ZTMD33z7xX+H5crWfsNPJNS1nuki+
         aFLGXCDBm6lyAjbqX0I9viAmZhEk1m8LybBlYnOn0f42Y+MCKgYhdjJu/RpuSkyZEBc7
         Ihb1LHOXB8klqU9IGXgvmE0SuZxT1V9t/YEMpUeGUi8VCEJI+6S+2zeFoHwvoh9Kq0Fy
         G5y5+IX9bOZDx3YcR/eXmVt4c3FpgN9s7nuLXxcO2aOn578s83x7vjmYG5CKhqKUCr+z
         SeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085669; x=1691677669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2djy9K43d3ZNoQVL5wtAnALFq2Q0+l8Je28Lvv6RhE=;
        b=iw6JRgrDugtRo7+JIDEOYvhLFAFp9qpsa1Zp5Clr9iElly7OB8bwaDf325tixw7MXL
         7Dad4y22YuzIWdBmTUeaIXKjWfCKUGXNYhBdUhJP9R9ozlanHxcnI6+UAvvNtpRXxsYF
         ZqQ6uWpuNW3xQt60LSkihB3nVe84RiJQZ/OxAQ1GSUxuqJlwzhh8o/CXBehlIy9asAYs
         9QhMYNfG3xC5EHm6MQHIuLcWiYAArEr5O7DOvxPBZGkuctfSD9ywAz0ea0Q0nekN78nR
         mN/00frz/UsytXlL5xTINEzJScMJDlL7b1VDXl51o/RPEK8O6DUO2EAQetNjLPY21Gi0
         xrMQ==
X-Gm-Message-State: ABy/qLYQbHkjXe+aTS0HcvDmJCz4gpwawxSCC8FF/ta/kgpBc4oep7EZ
	8Mws53BJBtDBiXevDivVr1K2c4829RJobcUQpgA5yA==
X-Google-Smtp-Source: APBJJlGIwRwUJq/O94ZvNSErgu+BobgezpTpOBGLHdf64kXvqzAqsa7AL31MIUT6jHbGzhCUZU8BKWbxX4EcOtoDAEI=
X-Received: by 2002:a17:906:3f02:b0:973:d076:67ab with SMTP id
 c2-20020a1709063f0200b00973d07667abmr17380462ejj.42.1689085668472; Tue, 11
 Jul 2023 07:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <BE0P281MB024249FEF2246FD96803CEE9BC31A@BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM>
 <Groupsio.1.BE0P281MB024249FEF2246FD96803CEE9BC31A@BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <Groupsio.1.BE0P281MB024249FEF2246FD96803CEE9BC31A@BE0P281MB0242.DEUP281.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Jul 2023 04:27:36 -1000
Message-ID: <CAOSpxdbGVzkb+1stezWHjDwAkE2f39qGD3-=jcap3nvLbHE_5g@mail.gmail.com>
Subject: Re: [OE-core] WIC: erofs-utils-native: Cherrypick commit from master
 to #kirkstone
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 14:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184140

On Tue, Jul 11, 2023 at 1:14=E2=80=AFAM Heiko <heiko.thole@entwicklung.eq-3=
.de> wrote:
>
> [Edited Message Follows]
>
> Hello Steve,
>
>
>
> we are using Yocto (Kirkstone) for a new device. We want to build an imag=
e which contains an erofs partition.
>
> But bitbake shows the following error:
>
> =E2=80=9CWic failed to find a recipe to build native mkfs.erofs. Please f=
ile a bug against wic.=E2=80=9D
>
>
>
> The problem is already solved in the master branch in commit 4e9102a (htt=
ps://git.yoctoproject.org/poky/commit/?id=3D4e9102a83cd2ac42c39f1d3153a1d39=
45e4668d5 ).
>
>
>
> Is it possible, that you cherrypick the commit to the kirkstone branch?

Unfortunately a simple cherry-pick isn't possible due to merge
conflicts.  If you could resolve those issues, test functionality, and
submit a patch to the list I would appreciate it.

Regards,

Steve

