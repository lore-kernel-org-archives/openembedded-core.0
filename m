Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A121C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:21:31 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.16714.1684225289547655290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 01:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WMzHPjjF;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso15910564e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684225287; x=1686817287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mWKTdPZdH5W34X/Yr66hFP4FkTL/9ZVvh6Zds2YxrY=;
        b=WMzHPjjFOvC3yU0BxxslQwJKRchyV33B7pPAQRg9iRcRuT+KHzz2DlgFQdv/A/R5pk
         IUhntQ6e27WVuORWMcYxClPL1RSk2jGDrEFkGePcSjVVbB9HogOglmL0OPUXiDu7BsWP
         crLcqHcX93s209Hn7l2S+St0sO7+FICrYPPNyqYDk1+gFXwzu5Mg3nwVmFVdJRsbxlXw
         O0xiD1SDIYFC7aeXCeELsqeFM3NdHjNI22COH37ARTnbdcwbnM9H+GKQTq3jwcV6ymKM
         M9SKUMfuXC4VFwhBSCqp/JZlQSW0RsK76wdsWRo4cEYAMT0LMVE0eqPOxp0rG568c7//
         NoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684225287; x=1686817287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mWKTdPZdH5W34X/Yr66hFP4FkTL/9ZVvh6Zds2YxrY=;
        b=ijSFzyWlklI3AqjENfKCe0xrHiL0oOPRjyUDtGAl17KkyvkgIRJOTCVM8JCNEMuV7X
         2iwFf29HTYVupEnpKx41oJu6vQjUabmRz8QDxoBybn3x7TNNnZcEj2OCEkZuwugiPa81
         cjVu0d0e744aKWDXi7Cl2safDwSj84fmt4ciHh7JHld7py/+r/R9GHyerWtoHPEe8yPU
         b3Tdn2ASIkqlTF4pqZXCyt9m071GtPGMZ6Y0BbbkuDdi30oW4eP9SsxHm+47obg/wQ6H
         x+3CpU66w602BoYy/w/6fMujuLgWjIm8Nul+SSy0q0fKiLVzexCTdQDByCaWXPEbsceq
         zkAg==
X-Gm-Message-State: AC+VfDxHEDyhQb80WBGtqgd6WYZlLJRtWvCQ/9NORCEm30HOAPZJSLNQ
	FzKQkZGWPQ2NE/uH6jM74pfPHDhAI01yhOAXgMc=
X-Google-Smtp-Source: ACHHUZ74Y5r7q3bb8H5rs4yUioMuwnaAfdY8apyF1sRnw0hUZ7rQoxOpRfNDBqnunjZw3EF3iroN7pvmiyS31F+D2Do=
X-Received: by 2002:a19:f50b:0:b0:4f1:47ff:d330 with SMTP id
 j11-20020a19f50b000000b004f147ffd330mr6440650lfb.53.1684225287218; Tue, 16
 May 2023 01:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230403110646.2555294-1-kubiznak@2n.com> <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
 <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com> <DB4PR02MB100309C46E213B4BD625C20C2E2789@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <CB960AF5-CAA9-402B-81EB-01C55B1C0BD0@arm.com>
In-Reply-To: <CB960AF5-CAA9-402B-81EB-01C55B1C0BD0@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 May 2023 10:21:15 +0200
Message-ID: <CANNYZj9ZTBzhd7pgQfROkdnMpaCt70xiNAfn_3BhyX5K+y+-Sw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce dependencies
To: Ross Burton <Ross.Burton@arm.com>
Cc: =?UTF-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <kubiznak@2n.com>, 
	"Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 08:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181401

I don't have a strong opinion here. Petr wanted to trim dependencies
down to bare minimum, but if we need to strike a more reasonable
balance, that's fine.

Alex

On Mon, 15 May 2023 at 18:43, Ross Burton <Ross.Burton@arm.com> wrote:
>
>
>
> > On 15 May 2023, at 15:49, Petr Kubiz=C5=88=C3=A1k - 2N <kubiznak@2n.com=
> wrote:
> > The key question is whether the problematic packages have intrinsic dep=
endency on g-i-native, which can (and should) be fixed by adding the packag=
e in DEPENDS directly, or g-i-native is always needed as Ross says, which w=
ould imply g-i-native should not be conditioned by GI_DATA_ENABLED in the c=
lass.
> >
> > I'm not an expert on g-i so I didn't have strong arguments but feel fre=
e to convince Alex that g-i-native should be always in DEPENDS.
>
> If we grab a package from git that has a empty m4/ and it has optional su=
pport for G-I then it needs a dependency on gobject-introspection-native so=
 that it has introspection.m4 available.
>
> We already inherit gobject-introspection.bbclass, so the dependency can b=
e there.  I don=E2=80=99t see why g-i.bbclass would only pull in fundamenta=
l build dependencies when it=E2=80=99s enabled.
>
> Ross

