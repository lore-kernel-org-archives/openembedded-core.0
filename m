Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8683C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 17:41:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1105.1706550099419941757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 09:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZTK8iC1g;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5110d0b1af7so2133175e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 09:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706550097; x=1707154897; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2HCYSalGWrvEMMLGzPy1fQrIUvlHcfM4NwKAh3V4vJg=;
        b=ZTK8iC1gj+zo+XvTNTnNS3oZYl8eD22WD97rAi319UBb9yH7RHCuoI70bLT0wtg+WI
         leOJvxaoNSYlCPYH3e4uMr51LDa2ug+lNHCnSKKDQRh7fMvf84BhvwrJsR3SeAkFTflW
         MT9JuCYDlyv6KikdcUyvxzmaOgNsIUloEVmnhCA00xq0ey/jlGqE+f5HpFgP1qW7w3LA
         W3v7WwwBm28W28SAepdKWQgkWDGEoP9qiJ7+HjwW5eaG+cYlRpMCGABeVm2fEnSbKcSo
         T8Ixo0t17c7gLvZTy0hnUEO1zuCB3RNaubS2ZKx1wpNl0kn9F2ZidPHAKJ3htZwGarGU
         DJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550097; x=1707154897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HCYSalGWrvEMMLGzPy1fQrIUvlHcfM4NwKAh3V4vJg=;
        b=kja+zPJv1RAYsLaQuDL2KXFnFIi86oeeIKMgbmMw2GxAsrOwhgMFS24kd7CFISvaSa
         ZkVvf9FMpnRpgFoYN5mGr9ChPEF/AsnCsmwIuakR53TiXnoGqmkF2TiYF/rdShD102B7
         6fuM3kzAFX+ptwhYH5Fbhhv2A4oz2ATRstQoMO2vQP/0UApvv0Bn+yadj+l4JzIUm7wm
         LEOBSeA5MlYKl7eCyX5RPutrgZlIuxuJDf+cz7pITt/Le+ayxIGctFRqqoOq7p+tUbWe
         74I43HRVIxM7WAFegEi7cnHUTToK2IQZBwFv4QGOsrPIrY+/btP5YaXHvaw3JuCfZvnJ
         hRjA==
X-Gm-Message-State: AOJu0Yw8rVaEJzjk+ZNdmxu8g9XgkNqteO0AZi4omrHfm66QPXJaQw6q
	RT2mAZGTpF3CHuwjcv7ClgPW4+1r7K82smfb7FsvcU+lAXazYrHjrP/qCG0948BTJ8jRZ5JSko7
	6Lbbayx/wTHykIYltvSECzYh6RQo=
X-Google-Smtp-Source: AGHT+IFV6J4dkXJWk9dh1XFRJCoY/GOrc3bVp5/m9bxQ/l/CmSjpEHv9ulpNyQiPrQullzIIwanGo0hPttiw1Atx090=
X-Received: by 2002:ac2:4e08:0:b0:510:c48:e5de with SMTP id
 e8-20020ac24e08000000b005100c48e5demr4414449lfr.57.1706550097102; Mon, 29 Jan
 2024 09:41:37 -0800 (PST)
MIME-Version: 1.0
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
 <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
 <CANNYZj-sad7Cb8iVae=mACp55vYu8b-K9Gr69jTFpWaD=fQgmg@mail.gmail.com>
 <7d151635479f421df3e711f39ad99fef71b2f833.camel@infinera.com>
 <CANNYZj8kEHJVfpUUP3gh=rEwGe6MO_UsD8mvwe=vTVSSBJ5L3A@mail.gmail.com> <b4d6e17c57303d3de089954c0fb70febc737cea6.camel@infinera.com>
In-Reply-To: <b4d6e17c57303d3de089954c0fb70febc737cea6.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jan 2024 18:41:25 +0100
Message-ID: <CANNYZj8uqYZoDXFxGJgJXBBxzH3B1Viwn07Gtm_20RmaoTW-=g@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
 appears to hardcode important tunable params
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 17:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194471

On Mon, 29 Jan 2024 at 17:19, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> I may have found a couple of odd things:
> 1) It appears oe-selftest does a fresh checkout from git when building the B branch. We got a few pkgs
>    that builds from tip of master branch and that branch may change between A and B builds

That behaviour is not reproducible by yocto project's definition of
reproducible. You need to exclude them, or pin the recipes to specific
revisions.

> 2) There are also some extra variants of pkgs; -dbg, -src etc.
>    Are these significant or are they just included when an error is found in the binary pkg?

Yes, the reproducibility test includes the full set of packages that a
given recipe produces. In some circumstances they may be less
important, but the test checks everything.

Alex

