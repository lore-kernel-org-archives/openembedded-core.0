Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6640CE7AB5
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:02:04 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.68302.1695664917390081295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeeFWt3S;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dc9c2b2b79so3199347fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695664916; x=1696269716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVOyKm788SiysBpgxh9JSGH7ImdCLfMv1zbVJX32rQI=;
        b=OeeFWt3SPJbC+sG8nTKGckXAusuUWx5BK5ba/YLu97ZYt+C6o3MBinvoKujNSzJU+k
         0deCFdRoa8Wz0uuj5Q7KnuIt6AW0cD/6AEUb8QRcEEP0gSSbCuKzumt994tkX5M632Mj
         566TFzdOmhLn7JLPje2B8Nt7nEezPnB06cP4Ht9ArTlLi6kd6U6fNhEy+Wo2QpPOKGuE
         4ZzDwJRXqedsCZwvOBPXQvfLNyNYIjl1NTIW6SDyJj7nO0aK4Yd38EFkc+1wHA5GC42q
         ILzHk/t5z3HsmO1sjqMZKn+4y7KGd7DjGLCC8Gd8LqnU+TxeZr/UPkSrjiAy5m4br7FY
         Nd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664916; x=1696269716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVOyKm788SiysBpgxh9JSGH7ImdCLfMv1zbVJX32rQI=;
        b=njq2IEPXw3CKBIeRkQR+v4oSZ46ZfJyLqKNhAngirQfEwsR4693Eq4apFOGVx7LXlL
         aGbjDYwedxnuKpyNyCQWrILj4s9EMVEqqrCaCjtjMfgCyNpYt2f8A+p3TojnYN5scepr
         s5PAX2kb4xskbxxE63x03ESchP8H36QXFVZ79vyo1WJW5Qi5ao+8gBs/EXUa7c32kkzk
         To8PRh991gr7EHOfrkET2q+FFgRYm7qnuvlXP0yvFeXduCZee5g/UVIh+wswVW+AxBcH
         cUYDkvMP4ogzU8KbJT76g4/GAfxUtIZKZhzg2jJ9mx08G92RitVW93X2qimeavVjMC1z
         v26g==
X-Gm-Message-State: AOJu0Yz/EaIk3ZAekgkdxVshjSl377eer7YK93NPBU5SLLXlapTMrSmE
	fuJIvJ3ChDgqHKCwkqu9TOpJ+2GNTPiVYYpYEtm8BoplGmI=
X-Google-Smtp-Source: AGHT+IG3afHNWfIF3ddY7/dAUvzjELAW5/kAGgo2CUA+ermfLcdDbJyuK/+J7ioUO01rfK5bqHIYAqVQtINOCdgHLc4=
X-Received: by 2002:a05:6870:9122:b0:1bb:eb37:1d69 with SMTP id
 o34-20020a056870912200b001bbeb371d69mr7761837oae.14.1695664916599; Mon, 25
 Sep 2023 11:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230923204507.882395-1-raj.khem@gmail.com> <20230923204507.882395-2-raj.khem@gmail.com>
 <CANNYZj-9wiNejuCKxtcT5_Dp9uG8y54E+qV_RBD1SCCd-HcF9A@mail.gmail.com>
 <CAMKF1sqzGZTZj7CfrkZPf=C=H4wDYMV1fs3PLo4AKZ2DW2kV=Q@mail.gmail.com> <CANNYZj8fv9T5qRyuZ=OHSH-zdfJinKXF4XRW2H8DSpvGFMCo2Q@mail.gmail.com>
In-Reply-To: <CANNYZj8fv9T5qRyuZ=OHSH-zdfJinKXF4XRW2H8DSpvGFMCo2Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 11:01:30 -0700
Message-ID: <CAMKF1soNZGSAH7hYRbVwYgVP4uyo8Oe8MQoTcctt2ietFfQV6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: Remove failing ptests on musl
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188202

On Mon, Sep 25, 2023 at 10:53=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 25 Sept 2023 at 19:21, Khem Raj <raj.khem@gmail.com> wrote:
> > They are not triaged so no root cause reason is mentioned.
> > The failures are listed in commit with some details that ptest shows.
>
> I still don't understand why the failing tests should be removed. Just
> let them fail, or exclude glib ptest from musl CI altogether. No one
> wants a fake green status.

This helps in creating a baseline so it does not regress further,
while the information
is still maintained in the recipe if it needs to be triaged further.

>
> Alex

