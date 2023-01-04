Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86A4C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:00:12 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.10251.1672833611988468051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QmeGOWrB;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id bn6so25266171ljb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 04:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu9dYT2SCBUPCZNE9Ndxcd9z25cYaJb6w8bxAmTIm1g=;
        b=QmeGOWrBuaAvQKXOx61iNalIBizmHZZQiiQr4Pul517sOYyC6V6ICczwLgOkxgOu1O
         L/0AstLGIse/llvlF4Yev7wMZUP+A16nDdD0o1y/QgFyJgH6vCo0/eug0kcRpBgkONwf
         F0nhhSbIqaqxwvdCDCIkSXPfxl026vIC1TECHO2o9C90VsQ4FKKjGCl46XbjgKRUGWiY
         tgI8jcX0QwFfcSADX4OjgQOzRbdatY8wM8dpzaVeG7AUcTVGigzI5iXyvYf1fnws/8Rl
         9CK2IAslMLTMa2p7vl/UyxKbijKw0n6HLuNeFDd9GYJD/LLJdZYeRTSwaL1eIfkzRmRU
         bYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qu9dYT2SCBUPCZNE9Ndxcd9z25cYaJb6w8bxAmTIm1g=;
        b=JcV91fxzQRkNR/zjiOgi4Q9rWzxyOGpLZkEHW/P9wpI0mAKumqMtmyMfjo1YwepvZn
         02gHIhtDZ0bmnt3sFXm9+UbCEvFGm2XKwvB/za2RQX/hGBPHw8WULvII/ZQqHCqTRmr4
         EoaIrmvKIWWD8HJ00n568R/UTj2UbP/7RQf0MgcCbaA8a34u2a2L7GxG7eD8C7mYGmpS
         QyEnS1jfy5OSixmY8AFMhEVp9NUgu3e6s/mpvNMJSBuHc5RydvoLz8N4YL0SFq10B/qg
         6+uELdztvVaBfi7D54wM17Yjxp0OGk84DjeMbXLBZ4Ex5cpejt9QgNAIWAZ89X1x7fyj
         d0Iw==
X-Gm-Message-State: AFqh2kr2++sfuQJPw5fQILNkhK1qvmL4QL1hlJViofO/yneuAwI3VVA/
	02OWogwI8K0V++FA9NI5x5PfoYNovnsHpsJS4Hw=
X-Google-Smtp-Source: AMrXdXvCh7aQG/8bOXZcSkgwAL4WuNzyVMK0TQY/zJUwzJYtzfO5H5a48Jw3130zyenyHK+V0NPr0mNF5iyDqEKmkcc=
X-Received: by 2002:a05:651c:1426:b0:27f:dea6:3d2a with SMTP id
 u38-20020a05651c142600b0027fdea63d2amr1540668lje.45.1672833609842; Wed, 04
 Jan 2023 04:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
In-Reply-To: <17371904FDF90491.29426@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 12:59:58 +0100
Message-ID: <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175468

I mean, if you want to do this to reduce dependency chains, then
depending on qemu-native and g-i-native isn't necessary either. But
the patch as it is seems like going halfway.

Alex

On Wed, 4 Jan 2023 at 12:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 4 Jan 2023 at 12:46, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wr=
ote:
> > When GI_DATA_ENABLED is 'False' (e.g. because
> > 'gobject-introspection-data' is not in DISTRO_FEATURES),
> > gobject-introspection should not be added to DEPENDS.
>
> Why?
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175467): https://lists.openembedded.org/g/openembedde=
d-core/message/175467
> Mute This Topic: https://lists.openembedded.org/mt/96048399/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

