Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE247C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 06:55:00 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.5016.1666162492007136072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 23:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cJu08hv0;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id f37so26513262lfv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ip8pk5V5VCpWv4bbmjdlG57ESQCSR5YGlrfG3tQ5mU=;
        b=cJu08hv0ROpVyBLRrzvI9wHGqAHM5aveERpuenNChFNTkSi2dfgQ5G8hI2AVPoIjKe
         PNOpptO21T4W8vDAc/jYJLckX1LNtIPaL48cf4sr1e6GDh8BXZlbbBoezR5vWg/WiOUU
         YIMNYG8KU03Wm5+G1WdVqm1JS1angKSiwvnCL5GSGkzsOvKY2zuaZNndWMJ6AB41xxel
         8YGq6YbEY4eUUuJPy6E2ELpSXs1qYGQyUm+a8QITMKqv7hHg+APWlt3zY5y5TGsi3ElC
         q51kGUurDt5f/38Jdiuxbbwl/+NI2hnA0f0iquEbiHKV0ng4s3JEsg+wWeIbrPL0r0rg
         yh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ip8pk5V5VCpWv4bbmjdlG57ESQCSR5YGlrfG3tQ5mU=;
        b=6KBDehDvBozIj63DxYdrVr/8EqOh35mIibTrhw6+tU/dfNIVLGa6rRpUOQzUx0MM0/
         8p8dYIWKDYozFuZM3oT1W4gGXrfNKSOEeCaEQQflzKJiSJqIaFOrV+Ir6wKpUBVecZ+n
         gliPNUke5GLM4PhUG5iqO+UMZ7wvWrIBQ3xWuVd3jAY8EalwW3utQM/3UEDM/JHoAO98
         ZVwlYjILwMkbHyviGdY8CiFLVeHdhNB9Ka4RK0WI1YsP5r6R49Bxy56HxEIdsqesxg7g
         PI6mFKqG2B2SelPlTDTagPgInnc7A6wN9tRiDD7BeY3KWEQDs/OqR6iPfhYZjkAhClAY
         EkRg==
X-Gm-Message-State: ACrzQf00Vu6YG+vLhVJ6JT/NgYctKBvrmZCMdrBY+g6DywWy8isDDfnn
	iWgI7LOhemaCemAcU1bD6umR3U7E6lYjlzhc37w=
X-Google-Smtp-Source: AMsMyM6uEwB3hmK93VE0ATTtRxUAMqgz8E/RgGnY2dJzMAWuhFC/BuSHPdBnqeKgmnoVgLl+eVB1VFdm9sYf0rtmfpY=
X-Received: by 2002:a05:6512:3989:b0:4a2:7d73:495a with SMTP id
 j9-20020a056512398900b004a27d73495amr2310144lfu.492.1666162489974; Tue, 18
 Oct 2022 23:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
In-Reply-To: <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Oct 2022 08:54:38 +0200
Message-ID: <CANNYZj870m=XRLUe1rjbFfR5C9BUGqrjWYOLa2WFzn7WG5nC3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 06:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171959

On Wed, 19 Oct 2022 at 08:34, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Can you show examples where this is needed? Custom variable does not se=
em a good idea. I also worry that it=E2=80=99ll break automated updates (it=
=E2=80=99s bad enough with mesa-gl, this might make it worse).
>
> https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mesa/=
mesa_git.bb

"require recipes-graphics/mesa/mesa.inc"

Using recipe includes across layers like this is not a good idea. It
imposes requirements on core to continue providing the .inc, and not
doing anything with mesa that can 'break' users of that include.

Please make it self-contained.

Alex

