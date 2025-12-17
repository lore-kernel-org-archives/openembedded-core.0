Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FB4D64094
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 08:41:14 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9925.1765960871357792121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 00:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNZOo++J;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a2d21427dso37596276d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 00:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765960870; x=1766565670; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EYSKDs3wCfXYLoyf0ukthSKgPocfNL4cJWRVZOUIkxY=;
        b=mNZOo++JZSlPe0J/LwoI5OVW3AqzqVwnycrpYCAShbbOhhXpMdIvpuEFv/kayKqa4r
         IfrtdCS2k8F/JWk5y/QgeXRLZKgPlWQj+V13qempdVM4jRphioaYePgp04AB93maG+Gw
         r0UMSYi+EBIejNWT15xfmHNEIkHRZwEWzvx0GglBrxjVAdJSwYfLCKv+bl1D4zmwXJHi
         O7oiZCgPl5I1Rj95ZlBGwcRhBD0tpX18Fkpj68DV0zURp1k6WdXSvuXZLzRvTAqsArGZ
         AlIx9M+yMM8dvNmIHqKwSmSmL8Lm8b8IOO7K2A3+BtxaYGzrRSON74rYzdHFt8ehjQ6J
         1NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765960870; x=1766565670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYSKDs3wCfXYLoyf0ukthSKgPocfNL4cJWRVZOUIkxY=;
        b=ePuKYw/31OnEeV/r/VZ/hbLk6F2pE70uCGMG4Jsv0pnAsuauvY6dPYGNDSCsG7kI6d
         s5qhuaEZPGrLU7U6DdfzbNHGlh3j0MrczHlHHm1BvkwKY/josCx9mvHB0SwcDOh0KZED
         2M9Zubk0dCUXOqcaNlyh9cI9sibnUM2tHh+QgDe0Z77b/UXUnOcE0lYX/o3ux5nd3An5
         NukHsyUqSWG9P3fNQrL17LXbkPOAZUE6x+SkqzfA1bwpxK9KoAM5DVXWEENNt1pzAx/7
         oWZQjnCEVctcmu5XYKqhZD9+z2gAH9jYLL7KZzlJ+b4E8RxVC9JWYHmfM0c8mQg68e/V
         hW4Q==
X-Gm-Message-State: AOJu0YytJTyK9z1QS0DEAjafiuezq3ufM77q90Qv3pbl7TL4EFZOE2ky
	r8f7t7dZ3qSHrM684Lg8UMipYNeGeMianAwLWJIu2CoLcx10iXhST0lANmz+HRkKoy1k1t4Q9Wb
	HYGcDxSL9M4vQX+519tywAteQsuANRsqb/N9H
X-Gm-Gg: AY/fxX4LCNQ8p27doGWefjBcjm8AdHBcb4j+2JAgF2Hq/uURjA/nAPfW0SM2ScTYMbg
	5jtNGjdBRsqb8MbyKDu3IY6uJBEJtMr1QcJjCIB9/2KSTsmNYyuIQ8c9jdfTBTqCsbf7DEGw0RW
	6p2dj/qDEPu7jt20I2e5tqS0hnkczBX5AXMG1CM+fxJWuIXCdaqM3gb1ErWtmmIcuz3XSe3rm7U
	6lBRdyqtBXEuFOdK0VWmMqmsmmOox0KucvFq1B8CaZWK2uOjKMnUg++I3DNRsHPwYrJaYgGzRpM
	szZKzv7qr944ols66lDSm+FNO8CkSw==
X-Google-Smtp-Source: AGHT+IGIwAYMLTEpxfPvnzxEdpCJRBPKsvmcM6qyLz73KBXJ25/eBDoQ+j0AH+gDxK6AqGjFD0WKZnnCY3Ix8tYgTzM=
X-Received: by 2002:a05:6214:20a8:b0:888:5708:57a5 with SMTP id
 6a1803df08f44-88880112bd1mr262473966d6.19.1765960870135; Wed, 17 Dec 2025
 00:41:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com> <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com>
In-Reply-To: <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 09:41:00 +0100
X-Gm-Features: AQt7F2oyd30JKp0PeZl7m_D7n2yz9myhYEfDwyMefEgIT7Wrw_g424OCPP3rt-E
Message-ID: <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228007

On Wed, 17 Dec 2025 at 03:58, Robert Yang <liezhi.yang@windriver.com> wrote:
> >> The 6.17 has 27 failed test cases, and 6.18 only has 2 failed ones:
> >> FAIL: bpf.gen.test
> >> FAIL: bpf-v.gen.test
> >
> > This needs a bit more context. If the old version had failures, and
> > the new version still has failures, why aren't they seen in testing?
>
> They are ptest failures, and there is no specific test for it, so we don't see
> the failures. I did look into the failures, but didn't know how to fix that, the
> newer version has less failures than the older one, so I sent the upgrade patch.

But we do run strace ptests, and they do not fail, e.g. with latest
nightly master:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2761/steps/14/logs/stdio

Does bitbake -c testimage core-image-ptest-strace fail for you? How
did you set up and ran the tests to see them fail?

Alex

