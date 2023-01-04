Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AC3C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:36:43 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.10869.1672835801419392638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mUrTNFaf;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id y25so50223210lfa.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra0qnDdzQ1J6Rcx/G/ByZp+zcy+R/8bA83YGf4mXMjw=;
        b=mUrTNFafj9NiqTeP9gChkJhejegy1eQV5S4dS1izs0v6sVripePTml3+P+rEtPKLYo
         jEpcBEP3XvZ4ekm6laZ6dvCZUBKeEtkGlQrOrjiK53Pst4hwbTTAmA6yePiTtc79aUoS
         6aoXNBmFQtRV//nJb9UBTvcZ0ix+688tpppBoiCKtqax/OQGm7aPlfhflA8HC6+JeCwa
         Obg+fvkSWDVPBfAvUvmYg7rYz9WaYm8tNyJdpWdJw+BffmKH4cVXMv/9sSm1aROi4X25
         IudcmP9eY2rm7RBJKCCXUTZU9el9W/sLMd7yLnt9BCzSuqZqfT/IQ8M7RIEq1CLEyqfH
         QdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ra0qnDdzQ1J6Rcx/G/ByZp+zcy+R/8bA83YGf4mXMjw=;
        b=mtdEFis9NNFKV0l5GksfzwuQ9JBBDDMyXfyJkE/54Q9kEfRdxym7U00AcfI9OdM2HQ
         tG16MkJ14DmkoYbQhvyMxmpFks9wgU9OuU8ugU0e0Dkgul6BC/vC5hN3jbqqtXi5Xs0i
         I5DMVNXw3qHk9ZjTiBIlb79p5M2UhtNeZu7k1/cYyOYDSTr5xFnxce0Oehqjw2QVvSDs
         JIJod75x3oJOtv90kV2jaIWtMO/N76t/OBV0ZeE8na3u5nrUKiERAa4PWWupJXNO78Sd
         G8i3XrCn5sb4mX2bjYTuUbXFivMlryDOKt12QFsXxN7S2VtZuEX6m1YApwwMOJ+BoJYA
         GXVQ==
X-Gm-Message-State: AFqh2kqMV173UU3nnreBaqGH3JdAMaY1XKycgvVPMHPOsSzE8Yyijq6K
	zBFt652kLat4t9yw+ZyXEDOg+yYAPn9+e+WrELg=
X-Google-Smtp-Source: AMrXdXsO3mPQ+eWEVxKjFYLf/n9dTSlQEnzhphgJxxtDZclYkwbbhijyesUhHuVZeVaNSZRiEk7H46hBbdH92lCS1ps=
X-Received: by 2002:ac2:5c5a:0:b0:4cb:154d:2178 with SMTP id
 s26-20020ac25c5a000000b004cb154d2178mr1128210lfp.367.1672835799495; Wed, 04
 Jan 2023 04:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com> <35848697143b4b3a8612c027d8852575@2n.com>
In-Reply-To: <35848697143b4b3a8612c027d8852575@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 13:36:27 +0100
Message-ID: <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175475

On Wed, 4 Jan 2023 at 13:24, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrot=
e:
> Yes, that's exactly the reason. I'm particularly concerned about dependen=
cy on glib, but other dependencies are unnecessary, too.
>
>
> This change was sufficient to remove the dependency from the target. I am=
 not aware of potential consequences of removing the -native dependencies, =
but if you think it should also be done, I'm happy to update the patch. Ple=
ase let me know.

I'd suggest that you remove all three, then set up a plain poky master
build with gobject-introspection-data disabled, and issue bitbake
world.

Component upstreams generally only test the gi-enabled configuration,
so this may reveal incorrect upstream logic when g-i is disabled.

Alex

