Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC399C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 10:53:39 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.99402.1674816815129065060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 02:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U/yY7j7n;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id p25so5084293ljn.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 02:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w4K3XTKkM2GBMojwu9TlFidov2viygLgP+XrsuiGzvA=;
        b=U/yY7j7nRNlhCV9m/f9KZPogObCbgKPOxpOeluDXsNa/7iW0BELGnffjtFU+U7eDaO
         Xt2aUVQl8wwI2Ru0QXBFZgTdQIqitH1ainb6bAqM/1xByWiZqEQqWNdQL7OI3t6p7pMr
         etnFYvZNDZTvkzWTOXll5UBXTmCh0Vb7Xm8w21MbI9N47+G5eKGFr8VVECS5WbPqv5wS
         rknHmNCmGHYZm2ksDeQYFiuLdsuy+1JnOqHVRNfRcmi1FgAx4962kOok7jRQCSrJhjkO
         C6+TLLpsxmb7pDoLytjUml+WSHxBFm00fuQSVPPNtDzdGsWXR+0DorHPHQB66m4aCUqW
         8Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4K3XTKkM2GBMojwu9TlFidov2viygLgP+XrsuiGzvA=;
        b=dMYMcU9zgQpV8IXM1O4N4yJogx96wwxM5wY9/NeoGjT4eTnBgX4Fn6Nm/tWIxFKyBG
         /5yRTXqY4QCCd88RZonKwCzALlVjx8Q6emY1FqR6W6irg5U0gnZzoaiqXpNkiXsBml66
         aVIAruzrBnfln3sEM4h1iH0ZYZI6DzlamQ9UejRj0ZeXP8syGnJjD90vSzT12t96SBKD
         JjFJFiRsaT7lKajeWNgG/Z8+XwzT/NCvOcOUVjlwQqEYBJGBbxbO3ZxQkkRW8qoHhPcU
         Kt6Ofts7reZ06DWhutpQyBoU1okfLNFGjML08DeUqZVodeHfp4L0wcoHIj69ddZ9Ipdc
         IauA==
X-Gm-Message-State: AFqh2koxPZWauV7Wlut5zF8P/G31Plv22HhWfn1nP415qyUNA949cEeX
	/CbPjIagyrn2B2CHR1313vA10gSVamUAz5G9msU=
X-Google-Smtp-Source: AMrXdXt9VsKTnW0NVdoFK3ont0julp58JeAoXS6dLdP0qGRImDXwArY5kooRXu8hKjGZVf1iIMZS897Ax4BQk6TBtq8=
X-Received: by 2002:a2e:9b56:0:b0:279:7164:a0aa with SMTP id
 o22-20020a2e9b56000000b002797164a0aamr3775504ljj.318.1674816813026; Fri, 27
 Jan 2023 02:53:33 -0800 (PST)
MIME-Version: 1.0
References: <QRDe.1674815589252044727.Cx0v@lists.openembedded.org>
In-Reply-To: <QRDe.1674815589252044727.Cx0v@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Jan 2023 11:53:21 +0100
Message-ID: <CANNYZj82XYYS6b_iEo1SiyBNckAskZuFHfjF_0beLansgO+pAA@mail.gmail.com>
Subject: Re: [OE-core] Proposal to add recipe for varlink library #poky
To: adinath.mhatre@philips.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 10:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176438

There is already a recipe in
https://github.com/MarkusVolk/meta-wayland/blob/master/recipes-extended/libvarlink/libvarlink_git.bb

Would that fit your needs?

In general, it's good to check recipes availability via
http://layers.openembedded.org/layerindex/branch/master/recipes/

Alex

On Fri, 27 Jan 2023 at 11:33, adinath.mhatre via
lists.openembedded.org
<adinath.mhatre=philips.com@lists.openembedded.org> wrote:
>
> Hi,
>
> We want to add recipe for varlink library to openembedded-core.
>
> Varlink aims to provide IPC from early boot onward.
> https://github.com/varlink/libvarlink
>
> Could you please suggest us where we can add this recipe?
> Since varlink is IPC like d-bus and d-bus comes under the meta/recipe-core,
> should we add varlink recipe there or any other location in oe-core layer.
>
> Thanks, and regards.
> Adinath
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176437): https://lists.openembedded.org/g/openembedded-core/message/176437
> Mute This Topic: https://lists.openembedded.org/mt/96563314/1686489
> Mute #poky:https://lists.openembedded.org/g/openembedded-core/mutehashtag/poky
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

