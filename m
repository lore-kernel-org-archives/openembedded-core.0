Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F2CCF34C7
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:02:17 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9051.1763564533219914109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f4BwOtHh;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.43, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5e19e72c2a7so460131137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763564532; x=1764169332; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyVG6UJ6HAu01Ns5Gehq8eIXfiDZPzKsKPi/p4oIre4=;
        b=f4BwOtHhJB884QFPc/PzYdW/3nAeH+A0Xg8TavN0sqf7q5pRF2eTFpBEFCAarhNcU1
         UPj1+GF+cPumsABhcuuAlO1G18ARBzIBvTIqITIdiZs1eTnnGstfpCScbZ/q9nrYXpkJ
         kOZmujDirVqPNyPC57NyrKhJYGvTawP3ViNYQq20myK/WsBBY6Gkv+o3XANuOgH5bHcd
         Hi65+Ng4NaaABrDm2rxUEk8sYp/mjuozEc2bM5ABE9du2EwQApR++rfcnwMjM0zop130
         rYC0lewoAGuIKpF+4os8DsYgWqWkBhocbvsmlftky1myYIo7XA6DUMC0tTjwo7sC5m/F
         mzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763564532; x=1764169332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XyVG6UJ6HAu01Ns5Gehq8eIXfiDZPzKsKPi/p4oIre4=;
        b=Gvk2DYxxJ3r/iTGi2cjSSs59H+7++2ymVTV4zWSy1hzfKe8QTanP2pSEvjWBpMAtuJ
         cQlY/B3QQkYqu8EQhrkU+DcbourhqBjhbdAaWZycikheHbr8xVvSGqMjR7d/p3COt2QW
         0Zlq+4gB8duVBR9vTsrdw0mMljpjUC8d2GFlQhB5FPp7SFSmlBWb7OMqw0w85vhpvBsV
         tf1x7ieknVa35Lz+8JnjoQ3iRuA5UzgR+UMaKPyOnQz4wHGk9FxAjdz84X8KlBy9pJnG
         vL9QDynvCWIwje2UIhbpl1pqEYZyr+h5SI3px6/xDnBWZujnEtM5Pg+dWqlt5kL2n/a6
         UA5g==
X-Gm-Message-State: AOJu0YyGomqnr1i7LEX9aLfDrcg5Bjsp+rEDRLmdI4DWmJwkCATwNzb1
	1iZa5YEH0tm08CMGC8Dj/FsnPJiyUdVVG6SYCM00qV4HI57hg7Jr402eaMjWkDWp/FAu8E4AuaI
	99l79rZlXILggoqSKdYKZ58VyhYR210yPD8ik10VD4Y5wNODvfj13xac=
X-Gm-Gg: ASbGncsB3HrY3CJZPLfaYXeYoimSWvke7XDySXbJF7yK7mUmg+WUSFRxA27rl5mLXfc
	FFaQvm8k4NFTW0IUk1sTA+7UcSUVZeX9qs1ef6lmXIy+jXWj8m/fTopaepPHJ2OEjwY3b8Rvu53
	REoc6R26CtrjiTMi/TVSDeju9Ho3Ajf/QlaHlo/y70jBdLTdCLz+8Cb6jqt3eQrg/MmKXSzD7f4
	kM37Hg9LY3rQz/VsC/vP8HqJnBiMW0WEP7QpaxSeS7NSWrs9sy51j6WYCRHPMueSH7FynXILOcY
	5l8voIfdyFl/nGCagTtFfjASJac=
X-Google-Smtp-Source: AGHT+IHLaWY2nwdKyQ5Orn6lXr4f3Zek9JfXJ2XKNgt9b1/ITC6HPSZGBCanN/Pmyx+GI9JCi9/fc3OnINOpt41FMII=
X-Received: by 2002:a05:6102:5808:b0:5dd:89ad:1100 with SMTP id
 ada2fe7eead31-5dfc54ed346mr5239723137.6.1763564531782; Wed, 19 Nov 2025
 07:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20251113122806.16769-1-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Nov 2025 07:02:00 -0800
X-Gm-Features: AWmQ_bnIPdThFovplkGdp5SrKutfPeuOe8gldPyI0UD_97i108gB9vipNou06YA
Message-ID: <CAOSpxdYgTSZ=8fR4eYotZugp1edZu0qaXg8-yPbGCrZgqMVv6Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 0/9] go tests backports
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 15:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226556

Unfortunately I'm getting a lot of failures when testing this series
on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2741

They all seem to be of this type:

https://errors.yoctoproject.org/Errors/Details/888485/

Steve

On Thu, Nov 13, 2025 at 4:28=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> I'm working on scarthgap/go mixin layer where I also want to run proper t=
ests.
> This series makes testing equivalent to that what is available on the mas=
ter branch.
>
> The two patches from me are not backports yet, but are already submitted.
>
> Alexander Kanavin (1):
>   goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task
>     signatures
>
> Osama Abdelkader (3):
>   go: add sdk test
>   go: extend runtime test
>   go: remove duplicate arch map in sdk test
>
> Peter Marko (2):
>   oeqa: fix package detection in go sdk tests
>   oeqa: drop unnecessary dependency from go runtime tests
>
> Ross Burton (3):
>   testsdk: allow user to specify which tests to run
>   oe/sdk: fix empty SDK manifests
>   lib/oe/go: document map_arch, and raise an error on unknown
>     architecture
>
>  meta/classes-recipe/goarch.bbclass  |   3 +
>  meta/classes-recipe/testsdk.bbclass |   3 +
>  meta/lib/oe/go.py                   |   6 +-
>  meta/lib/oe/sdk.py                  |   3 +-
>  meta/lib/oeqa/files/test.go         |   7 ++
>  meta/lib/oeqa/runtime/cases/go.py   |  66 +++++++++++++++++
>  meta/lib/oeqa/sdk/cases/go.py       | 107 ++++++++++++++++++++++++++++
>  meta/lib/oeqa/sdk/testsdk.py        |   3 +-
>  meta/lib/oeqa/sdkext/testsdk.py     |   3 +-
>  9 files changed, 197 insertions(+), 4 deletions(-)
>  create mode 100644 meta/lib/oeqa/files/test.go
>  create mode 100644 meta/lib/oeqa/sdk/cases/go.py
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226238): https://lists.openembedded.org/g/openembedde=
d-core/message/226238
> Mute This Topic: https://lists.openembedded.org/mt/116273058/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

