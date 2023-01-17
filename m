Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4503C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 16:51:05 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.201932.1673974261903620493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 08:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ACkU+irF;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id o7so33415015ljj.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JGBuRpeLAcAYmqWxuFE9M7KuobLnwkodLFUK5Zp/pY=;
        b=ACkU+irFaYpgqWmyUQ4IR3jCnQssi5jb2SsfcAw0Eb3+Il6YR7o2aSFxZOEgTSv2pF
         jmvOwNmgdG7H/sixs56HqYx+WtGGXWi4LzKI3dn8zMn+I0drLI1b6eV+HVJvsS/xMJR/
         inFCW1z+EgPOSJvXVL2t3PRXz5HZp/hSUGOzNkOe8WXiWCaOxs2vqiSDO8uEK+2DNVFN
         WktjyuxSA2aR/M4/f4DwP1fnl7j35S3pDaP6je8N7RDVTaLm3KRKD80+1p6VYU06x6EY
         lLKAXHSY8S3UrxnxNFSopMhCcyVIJUO4XgpBIYCjQUmGVgBAv0iYIE+a/F2MkR+7/+yY
         qKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JGBuRpeLAcAYmqWxuFE9M7KuobLnwkodLFUK5Zp/pY=;
        b=JkYPb1FLNFwflbQaxsoBxeeZDyIqLEPTq/SwHMJh0gTUzyiuwXrOJ/aAIoAxYAhb82
         dUV0c/0+5gIBd6dps+3JvQW4VYJG2KTfrW4HKmxowVf9ebnBW4wWGhVYxnNGJd4jrhAj
         ulUTNfRJgDweHOtKIQNdqvcWcd9QTnXlX02Vkcav8KQqHn4+0k0mQaMJiIm3mulqvybK
         AbLb99itWT8Ydw/ZK8l9oSMOTKgHq7aC9/qxzvx7m5aLft7xFhNITMhLV/sGHn+BdJtL
         c2Dub3wp+x1oxYU77ugVAOhC8hNHK9RLQniYnZ+roVHIfk/suQfMbW60eqAmdaCHd1W8
         9HSg==
X-Gm-Message-State: AFqh2kqDshbbdvVz09Jdv4gcqqWD6SLI5V6Qe9hYFJ8laZnvVANk0kIn
	VeTCm6HGIaGYHd/9kq8ZalZOhu2Ruu7PtYVWm94=
X-Google-Smtp-Source: AMrXdXvbWuQy1Ck62QfoNCtfvDVj1CrFVdl0yNqawY+GnsaTzqTIpkcVek5++nUSxpKAW65i4YfTEstIbLc3r/UjQrQ=
X-Received: by 2002:a2e:7311:0:b0:28b:6407:3cf3 with SMTP id
 o17-20020a2e7311000000b0028b64073cf3mr223392ljc.222.1673974260101; Tue, 17
 Jan 2023 08:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com> <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com> <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
 <e46977d84bbc4fd6ba7966b02937e8e9@2n.com> <CANNYZj8LTq_oXKzZUGYjjU0AU=Q8rXvaM0ne0xvz_CaNAV0NjQ@mail.gmail.com>
 <DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB10030E1A4CEFF3F064DF2F2EBE2FD9@DB4PR02MB10030.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Jan 2023 17:50:48 +0100
Message-ID: <CANNYZj-24WyZK=1vG7rbuoi9mquxkB3uGTkyTTA2R0F=R=x=5A@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 16:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176055

On Tue, 17 Jan 2023 at 11:57, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wro=
te:
> I'm slowly progressing with the patch but always end up at the principal =
issue of hard dependency on g-i being enabled.
>
> For example, graphene recipe does not reflect on "gobject-introspection-d=
ata" being/not being in distro features, claiming gtk4 requires build with =
introspection. Graphene can be patched to be buildable under both circumsta=
nces but gtk4 then (unsurprisingly) fails in do_configure step due to missi=
ng graphene-gobject-1.0 if g-i is disabled.
>
> I don't think gtk4 can be patched to build with g-i disabled, do you?
>
> If you agree with me, how can we proceed with the fact that some packages=
 (namely gtk4) basically cannot be built without the feature, while still a=
llowing to disable that feature? Is it really necessary to have everything =
buildable with g-i disabled? Apparently, it's not buildable now.

It helps if you show the errors you are getting, and source code lines
they are coming from, so I do not have to guess what is happening or
dig around source code.

The way I read gtk4 and graphene source code, what the recipe claims
is not true: you can disable introspection in graphene, and it would
still build and install graphene-gobject.pc which is what gtk4 is
looking for. If the needed piece is not installed, then you need to
get to the bottom of why, e.g. specific source code lines where that
decision is made.

Alex

