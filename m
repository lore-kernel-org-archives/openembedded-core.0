Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BBEC48BF9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:11:50 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.14019.1700057507408463107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AM4l/DC6;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so94989651fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 06:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700057505; x=1700662305; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fVMtISV0PXx6zsjCOqWBAudPKS0YnSHx6t3BY4h7YOo=;
        b=AM4l/DC6ghTxz/vT0VVnQJhMJNpsyUeT/QBJRCp/J0Co2zpl647lNeuR5rAtvwvaT9
         hArivWFhktkfcfaWvXPn3sDhMDeFZ7gAB/7arJhzCCPBf2l+b9UVuvOE9El08LyzG6CB
         rrCUrKtSTEe9/D0kAFjV0JmCpL3rNs6M9bcGOg5Jb7DICK/bm7n4rnAPvquN6K04jaZ5
         nxocRjQRJrQBQiuKC5GklCSV7P0Arbrm4rBiTT8co3szgn9Vf2u2rzSl3khIDeB2aO1s
         UH/FT14vP7ECHe1MbbOLu+2x/N43mnK4WyeubX5OX/2pr1EVUEpvD0z0uj7MVOPkk1wY
         jvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700057505; x=1700662305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVMtISV0PXx6zsjCOqWBAudPKS0YnSHx6t3BY4h7YOo=;
        b=Mi+laiRyfal6Opjfdqp1x/adqOpmG3PAzhbAHW9N+cvDWkibBnXb14TiMSzrrXRFKQ
         aoSWrchHb6zZYJaqxAAzT2XjxVIsL6dqBnuN5ofppBWFJBYMBlY6zMNvaIVCs+SgC6eN
         6r3tAOWDwQBKShtyv4MUh07/3MJd/zVfKRJbPKT152s5eStFcHXsDaxibSr7H56X6hav
         5VbGw9WkFOeSEe7itHaaELnXr4caFSrDc5kVPd0FeDhAgc8t8HCOMP1vZ8SrYI2h9IxC
         1VanewNqWkrSD+MYZb5pHZ8AuBKQOckvg2JCh0qWYG8Qvm2ZW53+kRpMqfKw+XRtEIRI
         9tUg==
X-Gm-Message-State: AOJu0YycFri2S/tG69vx4+hCMfL+tNTmVuNuFu0pTfiWICptx+Yk85m9
	booPUbGB/x4zu/dg5+KyeMi659rtRa2WP56T1ao=
X-Google-Smtp-Source: AGHT+IGMqOdoGgQo5JxiUNZhmDhdqukXKITAn7093Y5QW+A4PHucNQiU5xqx29co6aRVA2R3JBBlZrdf3bvPYlX4vgU=
X-Received: by 2002:a2e:bc23:0:b0:2bf:eccb:548 with SMTP id
 b35-20020a2ebc23000000b002bfeccb0548mr5340033ljf.0.1700057505482; Wed, 15 Nov
 2023 06:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
 <20231114203608.1490318-3-joakim.tjernlund@infinera.com> <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
 <4f3483d322d0d4afb65b31ba06b3e0d383b62b6b.camel@infinera.com>
 <CANNYZj9DWffE1qOKO1SpqeMJcfXeaFxOMFFUieivDK-9ooH0yg@mail.gmail.com> <4d8c459ce91ac4071c77c352006d0272d30efc90.camel@infinera.com>
In-Reply-To: <4d8c459ce91ac4071c77c352006d0272d30efc90.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 15:11:33 +0100
Message-ID: <CANNYZj8vhMe9rouBN+S6doVnoo6uiC7ptV=Zw_14PM1SVh+ToQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190601

On Wed, 15 Nov 2023 at 15:06, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:

> Will do, I am just not sure on the overall patch submission procedure and what OW in general thinks.
> Ideally I would like to have this in Kirkstone (and upwards)

Thanks.

Whether any additional component patches need to be carried by oe-core
has a big influence on what people think, so it's in your interest to
emphasize from the start that the patches do come from upstream, and
will disappear in a future version update.

Alex

