Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183F2C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 11:27:07 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.12796.1676460423145444448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 03:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n4lyQUSv;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id d8so21766105ljq.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQkJnf6rK21rmoi12e1JHse1XIhrkBeFUBnSVWDma9o=;
        b=n4lyQUSvk1rpKqQXjvGssYdwSuW9JuGCtFeI3GeerJRsWHBSF7Ox2NeG0/bpGecgI+
         P1Sprwo/C9Tj+MDVUx64CyzKDoL7a1m/WZtRar/NlpJ0G/lI7g1RI4j7TRxUyV8igL80
         uFFKEC5zaIpsatQ1bf4fhhNzyRxYbMpcDbIKjXJubdwF9Wbu7vcTMcbtXiM0pnE62W4b
         8IMua7/k4A152MgEvNF1Vco55UMDCbAjSj7ZesDgQebUX6eT3Bffj3Mvz0WwqWq44LIo
         vqpKDeQDyl9e8Dj7W2apcHJjgxNFiIV5qp1bZGmL2JgI28jaCWY9YVMjkJOkkZE8owcy
         kktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQkJnf6rK21rmoi12e1JHse1XIhrkBeFUBnSVWDma9o=;
        b=eYEcK3QyqlEAEtq9oPJsbMcsTv4HoovCrlLv3I2VcFpLURN7PiZMl/DzgtiZplIiK/
         CglUJbKQzb2nej5qi9ZNNJq2vIuy40eFfilKzsgvntatoQtJnNuIQOOIESoaYz3bj7+L
         SmgheETpnWwhpHjTSgawxPlTjtM8IHqy1mn/z/wycZqYHURSGfoBbO0dse0Dlkr2GwSp
         mSuCt7ZrX2xcCtDWCPeptIpRuumzETpOsOHLknqlKSPwR3MnC5bZG9iFLxRB1qxjekxD
         dkrJBg57ecM+KslN6f2WvlgzIKxDnkwF+kXoJDN4ITM/3waD1w0mvOCDY8do4xz7D2CV
         pCsw==
X-Gm-Message-State: AO0yUKXsflEcudXRcT1HZMrUYbJMQG/+8QmcwocaEOLI/SqR2U6xkxVX
	GH5sSko0JLANo20d9k51d+gIow2i0PlTACuWiJw=
X-Google-Smtp-Source: AK7set/rxNxcRvNP9Lc2tP6wLZeAbzc1azPY/xVMGKqljP7aDZzfznhlRjBiCTiVe38tNU5u8XBf1g+Fnq2qgr6IFUg=
X-Received: by 2002:a05:651c:1688:b0:290:5bc0:65a with SMTP id
 bd8-20020a05651c168800b002905bc0065amr448460ljb.5.1676460421168; Wed, 15 Feb
 2023 03:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com> <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com> <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
 <e46977d84bbc4fd6ba7966b02937e8e9@2n.com> <CANNYZj8LTq_oXKzZUGYjjU0AU=Q8rXvaM0ne0xvz_CaNAV0NjQ@mail.gmail.com>
 <DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <CANNYZj-24WyZK=1vG7rbuoi9mquxkB3uGTkyTTA2R0F=R=x=5A@mail.gmail.com>
 <173FBEEB24ED84F2.30239@lists.openembedded.org> <DB4PR02MB100306D119372AABB30DD918BE2A39@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB100306D119372AABB30DD918BE2A39@DB4PR02MB10030.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Feb 2023 12:26:49 +0100
Message-ID: <CANNYZj-c37gfPD7y84qr88YtniAbLQ2Q6d_LxOt+WdnKbVmgfQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <Kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177185

On Wed, 15 Feb 2023 at 10:39, Petr Kubiz=C5=88=C3=A1k - 2N <Kubiznak@2n.com=
> wrote:
> > The way I read gtk4 and graphene source code, what the recipe claims
> > is not true: you can disable introspection in graphene, and it would
> > still build and install graphene-gobject.pc which is what gtk4 is
> > looking for. If the needed piece is not installed, then you need to
> > get to the bottom of why, e.g. specific source code lines where that
> > decision is made.
>
> That's not really true. If no patches are applied and g-i is disabled, gr=
aphene fails in do_compile:
>
> [75/75] /home/kubiznak/projects/poky2/build/tmp/work/core2-64-poky-linux/=
graphene/1.10.8-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper src/Graphen=
e-1.0.gir --output src/Graphene-1.0.typelib --includedir=3D/usr/share/gir-1=
.0
> FAILED: src/Graphene-1.0.typelib
> /home/kubiznak/projects/poky2/build/tmp/work/core2-64-poky-linux/graphene=
/1.10.8-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper src/Graphene-1.0.gi=
r --output src/Graphene-1.0.typelib --includedir=3D/usr/share/gir-1.0
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --i=
ncludedir
> error parsing file src/Graphene-1.0.gir: Failed to parse included gir GOb=
ject-2.0

I replicated this locally. graphene isn't being correctly configured
when introspection is disabled globally, and the attached patch is
correct. Can you resend it as a proper oe-core submission?

I haven't seen webkit fail like that before, and it does not fail for
me locally this way.

Alex

