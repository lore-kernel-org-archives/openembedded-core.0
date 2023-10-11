Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D27CD6E5D
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 11:03:40 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.13818.1697022217565068159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 04:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QhrDjRAi;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7a2a3fb0713so250846839f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 04:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697022217; x=1697627017; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD/P22e6P3GdxNJ+zh8VYU7s1HGybm9dtqrpjRTaslY=;
        b=QhrDjRAi/w4pi3tS5TDl+uLRwUgKQ6+WEHyVLMUzg/vVx3KjICFTn36m/hZtxrgwEd
         kHENSCrFtucLAoOyTWd8LSWybPcTBiGQlQkyPKKuFnxINxXTf4WRdpE8QYjWrLMCz8vz
         We/OO0BQSFtTQ96CZrtKD+nIZVcar3Hm4ZAq4fOTLIFm75UL9D4ZDS8UFkQjArGXugyR
         LpBXNVjrmeO3bgF8bp7FSidyxtewDtvYcweAg1bZ3jh/GDccAEjcW4KbDALAvI1LPe84
         t+d4hFDkM/ZM7IL50qpCpyHn67jHCzueJFV31rzKVL8uU5RYxuy/0+9RDDqHM8paR5/e
         3ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022217; x=1697627017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OD/P22e6P3GdxNJ+zh8VYU7s1HGybm9dtqrpjRTaslY=;
        b=LiS2b+LQg/ImJ17efbBaMCXEVB7gFaW3JdkFQqPPVBnGUpuvvla5zeZiiqcZJ7al6g
         dmrRtHIpqeChQfE4raMG9tDoLd8hDzpL7Pukd9c3jhwI1/Iv6tkJo8PhZS780ew6zXQB
         rGRONflA6jZeyHNg4+ARJJNhoBQrECdl7lPiyv/4jy3lGfGz5sqa5pTIq6oY6r10l6aa
         KNnFoV7krw8mVhETbyHWGxMrH1hEX6cYUsCo9OEd2y2byn6S2CwqbQfJKp63MlTNuBWQ
         gEKWjvUExymZUFN1knF1k8U2WoXaJAuXeCX0cXVJosLVJQ/KL6bhAyPFsRMgZTMWhdkg
         Di1A==
X-Gm-Message-State: AOJu0YxyY3VrvKQq3b3oreDXnxZLY+8M6wAJ06Hta5emxLjDdoC5ntut
	3WFtX3j6uhB2PYYO7xmNpN2hvjUf160WQWtp464=
X-Google-Smtp-Source: AGHT+IHyT7FDGLT/DZJuzOhnmZO/Hpyzt+yoliv/Hgq1RgwRSPR6GKPD6gqmxRrqSWOYuBntw6gM+6oMmMhpojMtXZs=
X-Received: by 2002:a5d:9654:0:b0:77a:e86a:c24b with SMTP id
 d20-20020a5d9654000000b0077ae86ac24bmr21820020ios.6.1697022216688; Wed, 11
 Oct 2023 04:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 11 Oct 2023 12:03:24 +0100
Message-ID: <CAO5Uq5TK5W8SH5qO=Dc_GtVs+rL1RZNFokdkCaRxEa3nopjHjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	umesh.kallapa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188954

On Wed, Oct 11, 2023 at 5:06=E2=80=AFAM Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>
> [Yocto#14875]
> The '--remap-path-prefix' option removes all references to build director=
y structure in the debug information within the compiled output for Cargo d=
ependencies and the project's binary.
> However, some references to build directories remains in the final binary=
 in .rustc section in the form of compressed metadata and this makes the bu=
ild output dependent on the folder structure of the computer it's compiled =
on.
> So, for reproducible builds, use the configuration option 'remap-debuginf=
o =3D true' along with the '--remap-path-prefix'.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
>

Blimey, well done!

--=20
Alex Kiernan

