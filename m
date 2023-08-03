Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FEBC04A6A
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 11:15:37 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.12167.1691061328128785023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 04:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Hi4h7mUc;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b962535808so12075851fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691061326; x=1691666126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIFcGscSnY46fx6wMRBzSa2wKJtpOHGpm3G6LYFUx70=;
        b=Hi4h7mUcUvfPTFqN1JStLBiu6ZKeodg5lHD7KZLANbRSZeaPLBt2ZGyJ7/1m3+83CF
         ZKZ5FjKu9pxHXC7y6kVFLHHHO+8HESy8oY6+ldlw1j6yMJVk++ikWRhOxisCRN4esf7R
         l2JWatAsWPyD/tbm3NqGXrA/YQamjn3rYM+/WlmT4mbeFJ9YZqjuExadi92jwsBJirrx
         o1BOZVtAXneKQb9n/k1wqOnv3xRdu35cDGWNpxeWCTnpjL/gVh1H3g2H3LLHehRwHnsX
         FbA5DxGCa24GizvT9tVchSUPdQgPQpoa4XmanPHTCt0GO71KbQ1mM1Sl6YuhXGYNIS6V
         ERbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691061326; x=1691666126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIFcGscSnY46fx6wMRBzSa2wKJtpOHGpm3G6LYFUx70=;
        b=Q8EGl/tXEH+QvinOE02IjAmayknf5D6WNz9zS3ZW/SmhqGciXDJPDWPGC8RvAadHkw
         U2SmS1R6hemEHen9wPcTVOTc9+I4aB4X8MVKvpUxkJXCxvBb0gS4aEXukQAh8xzvsGbA
         UA5TGmug6tdz8kM3j2ArcEHL8QxD7J/NgNKZ1BB8nBwkB08J4OSGkwR9+1xHw9hCdLdd
         mrRBVtsupOIfrj9KB3eZtH3VdW2CJtVOWE9e4BW4jN2krtQHji7yzASmKTQdwgksLLik
         nsBEuu0UlnJonjFei6HV9y1AAGp+OFvVB6jI7EXsZAomVd6sbOeZkk54KAR0dlGhGbnh
         Crkw==
X-Gm-Message-State: ABy/qLbxsNMBdYydUbgPFzDN3mYePmMAznzuYrNIvu9EnIRws4e72E8T
	P0IQWEG510oPc0pEogzsyk9SF1/ikGTFEYsaUi8=
X-Google-Smtp-Source: APBJJlH2xhAjvVFihFo5HdjvWKcBYjvFAPXG3rHSH5PEE/PcRTiZJ+Lr1by/cJZRw8OGd4ctaHf38tpnBqJr/Dr+ENs=
X-Received: by 2002:a2e:9d45:0:b0:2b9:3523:6f20 with SMTP id
 y5-20020a2e9d45000000b002b935236f20mr6717092ljj.51.1691061325923; Thu, 03 Aug
 2023 04:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230801132957.401557-1-zboszor@gmail.com> <20230802134131db3e0b1e@mail.local>
 <e4dcb013-25f0-63f8-4713-8d4b71757cb4@gmail.com> <CANNYZj_WpBs=f0thUNdEgBi9G-VepAF-_hf2gxsRP1mOjD1vtA@mail.gmail.com>
 <ffd0b874-711a-abc8-0445-2884e24f8a3b@gmail.com> <CANNYZj-hE=Cct9bLOhy_kWA9NZqnpUAJ3ZTXW2RnoXzz65B1fw@mail.gmail.com>
 <2b5bc564-f05c-3c14-688e-50b3ba62eb2e@gmail.com>
In-Reply-To: <2b5bc564-f05c-3c14-688e-50b3ba62eb2e@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 13:15:14 +0200
Message-ID: <CANNYZj9sn6UyaQwpXwcywBZJ=+PMvUwsZ5AtVx4eeSVqk9xCiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings externally
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185473

On Thu, 3 Aug 2023 at 12:59, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> When /etc/rpm/platform exists, its content is read and
> /usr/lib/rpm/platform/`cat /etc/rpm/platform`/macros will be used
> for setting up essential macro values, even if this file does not exist.
> rpmbuild will look no further for other fallback "macros" file, like
> /usr/lib/rpm/platform/x86_64-linux/macros in my case.

But /etc/rpm/platform contains:
qemux86_64-pc-linux

Do you know at which point '-pc' is stripped from the middle?

Alex

