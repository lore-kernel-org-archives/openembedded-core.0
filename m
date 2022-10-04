Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BED6C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 14:23:38 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web12.11272.1664893413822902350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+bTYF6H;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id
 g2-20020a4ac4c2000000b0047f703cbe86so117388ooq.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=5c7UvVyRLXsHXW6CT0A8Yunq8Cx2Nu58+yTatNMPaL4=;
        b=p+bTYF6Hn8srxSQi5w297/TFm4E4TPeUihSYe6kgF8qoKVhIhUrm9ktzM3ZfpOYKRy
         dqYAaWG+er+Peg6TfnTgiEReoa32W9RoKjsMbFyPMNL7szNmlT6nyOpone8p8CcecbD/
         HY4cec2ht96D/VzjPWpFU2io6vLDifBhY3ooTq49TTuRQdu3nhYT5zBPxzkociEKxRHK
         mBgajzjdTm1F26m82EoJiezI2rn2kLgiR0JHI7qKBc36Sbgc3LpHZzO2RqtUzq3KZSbX
         nhkYM7JkBdvmMRuGRtuURJZErx3hRNBFTHGntXTf3zhoDz5YL2o9bLt98cs2V4T7HFHs
         UZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5c7UvVyRLXsHXW6CT0A8Yunq8Cx2Nu58+yTatNMPaL4=;
        b=SsdIRDnppmkqy4PPP8j3ZkGkVSx3V1sgABpaooYzJXlagZiW3YmLyUU9tW0g9fuSN8
         c/bnbCD0DPNNYEvLkhs+5RSulwV/jLKZm4B7ffTpMH5FytJBYIJ3cXobws07LSHzCyM7
         rOCbARKR6Xz+6+fB0xxqlZo1el/U7XWXRRZbGXW/fEwZLVQ9kidjW3vA86ufGSoQc2F6
         HsNVmvk86He1LOIvWpqHPkO6lbL9OAkdHI5baisKpB7mV0R0IOD91gm/Wt+r/PDDiCjC
         SSL/0dTdqkmqq3maQ+s3jNnoXucBalehO1HeHvHfVERa548ZcCbZLFqABZPvdCPWulMd
         mjgQ==
X-Gm-Message-State: ACrzQf25DcnudWwV5XiV3WZjW2678Izw4bnujhdcAZ67swBKTDxKyOIc
	6/d9286VGH2qzM1RrfUAavddRQodlF63gXTvNmg=
X-Google-Smtp-Source: 
 AMsMyM6VNCgka0qSehROwWxA2eYyzp3zJGkhONl5ZHvZN04K0/Mb3IcGZD/p+DgvGWopA6BjBOomcpaCzvAl8/XJzEE=
X-Received: by 2002:a05:6830:2019:b0:65b:f320:8cd2 with SMTP id
 e25-20020a056830201900b0065bf3208cd2mr10158959otp.111.1664893412976; Tue, 04
 Oct 2022 07:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221004105106.1556357-1-ross.burton@arm.com>
 <20221004105106.1556357-4-ross.burton@arm.com>
 <CAMKF1sqk1eK0RVhQtj6WjYi4n=WrBfkP5VmgpZUdp=18dHsmgg@mail.gmail.com>
 <720037DF-9057-48C4-B5FA-D5BDE584A240@arm.com>
 <CAMKF1soNXOp6ZXDihRPw1qTzG8p01bqHfo+m4R6LO1TjL-96cA@mail.gmail.com>
 <1551A249-DD59-4B04-A5A8-6233143DCC69@arm.com>
In-Reply-To: <1551A249-DD59-4B04-A5A8-6233143DCC69@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Oct 2022 07:23:07 -0700
Message-ID: 
 <CAMKF1srsgNuSB9mT1c_Ggh+5tuWOkXsci11s8RjsN2HoiByXKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 14:23:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171400

On Tue, Oct 4, 2022 at 7:15 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 4 Oct 2022, at 15:08, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 4, 2022 at 6:39 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >>
> >> On 4 Oct 2022, at 14:36, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >>> How does debugging piglet looks like after this change ? I wonder if =
we can reduce debug info by
> >>> Using something like -g1 maybe a good middle ground
> >>
> >> The binaries have been stripped since 2016, this change simply stops d=
o_package from trying to split/strip the debug symbols.  There=E2=80=99s 2G=
B of already-stripped binaries to process, which on my machine takes over a=
 minute.
> >
> > yeah understood, I was trying to see if we can make it optimize a bit
> > while you were here.
>
> Turning on any form of debug would make that 2GB more like 3GB=E2=80=A6

hmm yeah I guess. Ignore me.

>
> Ross

