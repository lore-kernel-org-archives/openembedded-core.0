Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725BCEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 16:13:23 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.11616.1689178401593307406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 09:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QJg4IkRt;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56344354e2cso4967205eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689178401; x=1691770401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK/EzKz/3w7qvzHDmrQBSEmuLcZS5+wrDX/IPZiqkdA=;
        b=QJg4IkRtazb5MFbSP0nnChZScgfPYy3zaRenR8sSRqeDDBfzGTGh2m/cuWVpvEriNw
         mEa6idrnm1k7PHgELFWA4RfYIec41Q7Pt1R7JD4Ir6QHd0n5HfPW8wPHau3jsBAs7IpZ
         CPWdwmm3k82iXoCOp4bc/VHQPRJzobaNu/GuoV5FL25NuBLz3sknxcsEelBomR70ntF0
         Xm4dJVNi9Et4oIbxPcnIv+oZEgYwnwQY61F1FglMHJfwntE8Zm0drqz/C5Xn+34F/10c
         EF7HTwmysU6v40plZQDvJkkLz9/NtD9tmUH/YyVSaSIbd+EEgM2c0LOVPuv7h4b+KQh8
         pW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178401; x=1691770401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK/EzKz/3w7qvzHDmrQBSEmuLcZS5+wrDX/IPZiqkdA=;
        b=JcGxtD7zm1dgUxFB6s5nQt9DE7a2SusuhRTG1h/VI9jk+MBbZTfHSXl2HKZ4/kzKnT
         5QUD4Z4DSaWLw/KzBgMovQQqEVZtReq9qduWQvYO6WjDBAgac/zhts6aN3Qrn5t/pp1w
         alL8CvZFe0fsrYuYk1b4PnUk57z1kINLo3EgnFlVzKHTpMymPdDBsPGKzH+8kIjr1T2k
         bTYsXlfkqycB3HpM2t++OWaGg9VmTMfjttNnof+ZILNA4AUaVwLjMqWipnw8CKFjD3M9
         kcPkvoZxNJ+Ev+OeCvVIrL2VTNgXETYKjFfJTvtvt7IHh1fwFOTzKIVawM8ajQDI2mjU
         9A/A==
X-Gm-Message-State: ABy/qLatDgwML9HEuXv6tswB05Rye84FwJBIf8lM9rxKCmx9qyqKRS5P
	63FZDU5pD2MEUNE/ZnZOkuJfgeiwAOSPy1oTFbM=
X-Google-Smtp-Source: APBJJlFj1ud//CXOWeDkj30jz3oKV9KcyWu6JcgBM9XHs6Yg56+WZf2VQuitcNxBFWOTmKNuxSTGpIzWePLU2+QfsnY=
X-Received: by 2002:a4a:2a0e:0:b0:566:ec2f:36d0 with SMTP id
 k14-20020a4a2a0e000000b00566ec2f36d0mr1542322oof.2.1689178400548; Wed, 12 Jul
 2023 09:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201042.38285-1-raj.khem@gmail.com> <B1D99B0D-B820-43F0-A699-C7A121D74205@arm.com>
In-Reply-To: <B1D99B0D-B820-43F0-A699-C7A121D74205@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jul 2023 09:12:54 -0700
Message-ID: <CAMKF1spwCD0=UumG2ffh+_1F8AVcsLxxs63+pDkbkvHAwYr7sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] tunes: Add support for sve instructions on armv8/armv9
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 16:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184206

On Wed, Jul 12, 2023 at 3:29=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 11 Jul 2023, at 21:10, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This helps in defining correct compiler options and configure options
> > for glibc and overall ABI for toolchain
>
> Given this, shouldn=E2=80=99t the glibc patch respect the tune flags inst=
ead of forcibly turning sve off?

It will as a follow up.

>
> Ross

