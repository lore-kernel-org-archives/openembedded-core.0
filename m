Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA85BCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:02:36 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13712.1782399751731485595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c88MyTFe;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so1124755a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399751; cv=none;
        d=google.com; s=arc-20260327;
        b=L3ZMC1iPS18/wR39l5qOakggvReTj0l6YssTHC9b6Z5AzXJUdhV9MGDYurB7NoAiDx
         SUVw2qDY+NO5UMPXUAC13dzxtA5W2TJ8dP5TwjUaKCnTazE5542eCO3MaBWkJarMPI7h
         L++l8OJIBGaj3AoJsi61F6g/AvTst0+3+xhTErznzEhtsNTLIRe+KSHA1IAj3UQ3CZp1
         8GCmZBwK+FOQvoNM7H2DuFL87jz+yKXcahAvGgs0zbaEkoHsF4qxK36fYhEeMfJrhpHL
         j4XaG0PsDuL/T8jcZiAQ1CwHNy43NSZy6H4MCKLXWAPB3ibjBfA6V9ALtWRhWQCmATpZ
         IIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ccKGjh08wFISG0uvzmzxoVcwcdKdSExbKCKB1CjifdI=;
        fh=7dR4I8jTai6uatR3gxGQXCKVOxcSmDot2B+5Q38XfCE=;
        b=riiazPDlE6OAATCY/W6nd+IzQnn+WynK4JNtrAgePYIFk9JJuSycpM6GWbg4K5QpgU
         u0dvaSMTyVB+MA4Guxxi3puUUEjROWLmelkq9wzjOBPUB56GwEsA6SNu4yL2tqLsnxhc
         7I01/RK/pX1cg077g/ab+N3iKuPgul4tv+sImgIthEc+PlEtuP6PvYXYUIhxBRojFz+y
         ANAcTsECGcb3FyTd1PJ9l26ju2R32SVFxVDCpL/adG5GQvTya8JO1fF9KBrLjRmthDqH
         85Wa7sdFLYiuEb8SKHkYTmySpw6nBVGjPkIngrpz0Qf1Nm7lr8mK0cc9hQnv/NhqoMzY
         5W7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782399751; x=1783004551; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccKGjh08wFISG0uvzmzxoVcwcdKdSExbKCKB1CjifdI=;
        b=c88MyTFephz5aBy3Jvj1CRacdqWdeBoKZM6kiva2YLxa0XtfTixjeK4KWG7pdJYfXY
         QcYDOZSwKDPGT6WSbH01rJhmjCwOACVDNOzskCP9kN1BYO0m5f+tNa+crOwnx4MArSRC
         CRFtPC8cuXa068dpinPSLA+4eGP0SnNwmNN8ihUvE28mSEZ++HKhK8bHJIOw3pNzgNYW
         F99LYxbU4OIgn8pCqxOD+Zk6aF0FJYH4S7iZ8oBb1GqiXfsFzybrT0aVGVhkTKgj5sDU
         FKoRbkv2DLHGy9K3x5T2W8YASEEJNtueOqMnMhCt3CkGsj1pjaCgk/ZqsBKHgR4DVD+I
         hi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782399751; x=1783004551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccKGjh08wFISG0uvzmzxoVcwcdKdSExbKCKB1CjifdI=;
        b=Vw1YgcxeF2OlB2DS/R3Wbyiactq9Mj5P/ZbmPQ03vLhTDs3TNy0fPMZgcUCFn9MIsN
         JgNNd9W0Km5Axsas426v5DE7i/0HIBlqpVi/Bjrkfc6oc+J+MkIFCDzcwG4fHCkGTMWv
         h1DbSAWINQGIeOHTytGPaGH1vUbijslLnao7u9DA1VKKldRuhw+Y7nJKZWunFLgOHDJ0
         3oHmDI7CFmfdO311lV6k14jzuL+GYO0ge+7VRpfH+fO5Xll/ENpOdxMX0Nfb0wshRgvi
         Ch2Dzwbp5yrQnWS3UzsulTVQIL9TkbxeT2yA4AJb83Epjn53uOxIJGMiGliv28nj+N/4
         zEwA==
X-Gm-Message-State: AOJu0YxJdiW4vex4EtbCDVu0E+7A9Ti7bI7qVs1g8o7bvloCTNpliZJw
	YUNzdbxcN9Wc1XIP/GAk3060MrPhj5Gf3BvJ1X4yh+sG5eNzDf7uxYpu/oA6ogwTKPJA8tUtcex
	1NRi9l22jMlBeVsUTpVhfkoxi1s3Bo8I=
X-Gm-Gg: AfdE7ckRC6Up/xIBAWTIN8nIvZHdcaAkZNfmNU+7xYdaDM9srl2L2+ip1xzS2RA1qYy
	vTsmw0cnoFlmxkK1eSFDQZRgELkfKZdGwYUAAUjYBQRfEv3QPwdjHi9xdxMUVteoA2ukdp1+8Oz
	08tsXyRW9NMf57eRcPRGJBiA0JY7cRDRPKinngfXmvcLU50LfWDMoRlC5jbP4iLIgwZHRI+WbeG
	WGsJ/6Q71czSb4vGN+YipoBht8r+m+76eMZICeWeXK3Q942J73mfouCQvCBsUZCC085/0j+vQ==
X-Received: by 2002:a05:6a20:4391:b0:3b3:fc6:6226 with SMTP id
 adf61e73a8af0-3bd4ae9f2e5mr3711974637.24.1782399750807; Thu, 25 Jun 2026
 08:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <0101019ef824a589-9a7e06f3-449b-44c1-8212-1f1e5008a460-000000@us-west-2.amazonses.com>
 <94805360-EFEF-4C36-8ACD-D3FDA81706FB@arm.com>
In-Reply-To: <94805360-EFEF-4C36-8ACD-D3FDA81706FB@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 17:02:18 +0200
X-Gm-Features: AVVi8CcIkn84J_3nadEQkkBnGWC77H49ypPzsoONLa53X-zc7K9_7Lnyhkz6dpI
Message-ID: <CANNYZj9zR29iCpFfcfMaqOhDg+6SxXKCTbdHGMtxu5tr_ADr0Q@mail.gmail.com>
Subject: Re: [OE-core] [AUH] pkgconf: upgrading to 2.9.90 SUCCEEDED
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239573

On Wed, 24 Jun 2026 at 11:43, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.9.9=
0* has Succeeded.
>
> Note that this is a release candidate and we shouldn=E2=80=99t be shippin=
g it.

I'll tweak the regex to exclude x.y.9z.

Alex

