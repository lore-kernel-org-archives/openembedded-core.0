Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2BBEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 17:12:25 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1550.1689181944203156493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 10:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Q326HjFb;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb41682472so10877840e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689181942; x=1691773942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4A0VQ/X/G+DpQb+692d7XFTBQYYxh2x8NA1PspbS0vE=;
        b=Q326HjFbBaaa6ectBoM6Ff2stsbaPMyez4xEov38q6qWkz1BVkrn59cwn8X5YiJBe5
         NwUQcZaZXs/5eiyrToSBr5hcKtpZWuLOTVhc/JKnr4YnLDe/3DwZfJdQiE7ZqO4tv+hW
         RGd361Qn0KmdfcTQl2mM5pQeMBZIMhZJu335oCYuHLLhpfp4Rhq4zZpHCH8M1/IDkSnb
         /2CLqflE81b1odKa3wlpPg2Az3B1hsBs0j/y2MCIKKDYZghBltakeElyArniTjQ80ahn
         F8uHa4bcE4/5mTDeZPAZpi/K5i9zITkGEuBSOIcS6FBIzqnC/oweFEoLCHv2xBvCeo6l
         NBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689181942; x=1691773942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A0VQ/X/G+DpQb+692d7XFTBQYYxh2x8NA1PspbS0vE=;
        b=lm7ogcRPHgRE9GVrfirzO4eHd4hGiyznOn8rZG1kiCrCkBrvn1NBHG4HrlPNeC97Hu
         yCJv67HLHnKqJtaX+kjXsxR1LC1a4uTfYZCzz/PRhrGj1EhklzVB2wlFFjKT5oiSJ8dM
         r03F6lAZhRg1pigBf8Al3i87r+e1lHcYqvu3wfsHcepY/Gg5D2SrvAR0c2fOsTQ+ehFo
         1EW+mbDrRwtC3IrCTWxkc2zxb6rtCISLJ7DmRlpVkt3vFQiD9zmSLORzId98lZ8dFkug
         9QrGk2hNYfVsQvGDdYmJJjfuFXaHqHDZl21wqhBesmwb/ur08WL/ZIec1JhMXWfyAeRa
         lU9Q==
X-Gm-Message-State: ABy/qLbIOSjV/2bEvXvNxNAxpmDISixrY6m+iBpFSxXlkXd27H9fvO5a
	v88IeZaWYzwAW/Tyx4pRcRNJDNCK22HAx3Tt/gY=
X-Google-Smtp-Source: APBJJlFp6aFJghxndOE7zME1HPdfaBo3ghTcmBrcYmIuEraVLRqo55nmPHU2jB/vQGrOALWbXTf0UX2gx4fILKYKMME=
X-Received: by 2002:ac2:498e:0:b0:4fb:9884:43d8 with SMTP id
 f14-20020ac2498e000000b004fb988443d8mr17347716lfl.43.1689181940451; Wed, 12
 Jul 2023 10:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <ly5y6p1hbx.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <ly5y6p1hbx.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jul 2023 19:12:09 +0200
Message-ID: <CANNYZj8AyC22V5vmFLrDrXXhybg4i8tP=xaQgm5OcVq5+QZ22w@mail.gmail.com>
Subject: Re: [OE-core] RFE: add 'LAYERDIR_<layer>' variable
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 17:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184209

I would generally not want to encourage reuse of recipes this way. If
I have something in my layer I want freedom to change it as I please,
and I don't want to hear complaints that I 'broke' layers I have never
heard about because those layers include bits and pieces of my
recipes. If you want reuse, put the reusable bits into .bbclass.

Alex

On Wed, 12 Jul 2023 at 13:48, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
> Hi,
>
> currently, it is difficult to reuse recipes from other layers because
> their path is required but not known.  E.g. when one tries to add a
> backported imx-gpu-viv recipe [1] to a local layer by
>
> | require recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc
>
> do_fetch() will fail because some SRC_URI can not be resolved.  To
> support this, FILESEXTRAPATHS must contain the path of the original
> recipe.
>
> Determining this path is difficult at the moment, because it is unknown
> and depends on the layout of BBLAYERS.
>
>
> I suggest to add a new standard variable 'LAYERDIR_<layer>' which
> points to '${LAYERDIR}' of the layer.  It is probably difficult to set
> it automatically (value of <layer> is not known); instead of, it must
> be defined manually in 'layer.conf' like related variables.
>
> E.g.
>
> | BBFILE_COLLECTIONS += "freescale-layer"
> | BBFILE_PATTERN_freescale-layer := "^${LAYERDIR}/"
> |
> | LAYERDIR_freescale-layer := "${LAYERDIR}"    <<<<<<<<<<
>
> Diagnostic should be easy (iterate over BBFILE_COLLECTIONS and emit
> warning when corresponding 'LAYERDIR_<layer>' is undefined).
>
>
> What do you think?
>
>
> Enrico
>
> Footnotes:
> [1]  https://github.com/Freescale/meta-freescale/blob/master/recipes-graphics/imx-gpu-viv/imx-gpu-viv_6.4.11.p1.0-aarch64.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184185): https://lists.openembedded.org/g/openembedded-core/message/184185
> Mute This Topic: https://lists.openembedded.org/mt/100097753/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

