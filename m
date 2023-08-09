Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1354EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 12:20:46 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.86874.1691583644264903775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 05:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TfERlCTx;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-977e0fbd742so927496866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691583642; x=1692188442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CqU3m78oLWjsU0U8TgiMOgT7xKlQSgt21D5FvqCEuq8=;
        b=TfERlCTxWifCbpggtYFYlycnudFVln5DCyIPDwvLnJmctViJRjsXpWBRMApT9QOHjA
         SABRQEA9Gus8iIrWcXcv56wAOWobzyHGkcvxFtB7CkWg3i/+w58Wr6i/0f/XZ8CQrOzN
         grG88LqLdvvqkrD/vTGuKn1cljwXZoOOY0GcE3D1lS1rRm8eSL8xxsLgzjfAAeKiisLD
         1pRjP6bFroImYy3FI31UZq2jtVltVqT144grISsiYN3Aa/VbH0v0vhjCtrUjhSy+/+km
         ISllIrAyemg20djQ9obAZ4bnshMMXbiiKoCREaZaJ/n0mhXgP2/NfAXDlbZGOhkXV2wq
         X1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583642; x=1692188442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqU3m78oLWjsU0U8TgiMOgT7xKlQSgt21D5FvqCEuq8=;
        b=fQAIbCjoweYmM8CFB7RoNJYYcINjpJzLApf0sGuhT2opRvU9IplUoMZkKzKVP0LH6p
         bfQxNfuRfkSf9YwYMqDrTuy2HLNz7Smk5Al7CqaIfwt4yfDljw+SO9eqXXcvjRS81bg3
         0BnSSqJlqfxFcR32+sgvQiaIsFRuiMJhr/uN5LDaw0WQg3vF0sbz9mWjyLUlkhBmOISx
         QU6kW4FYRnKrb7x4Ww+uM19Gt6MFzfNVkHqQRlDtLDUofWGIShNWleKQBx1Dj9dRG5QY
         Pyf32Bds3beJMGGDgmPuEbNt/Oe3wBCzAR/pNbs566IKanpDWO8nNAPXX64BYKPMCgl9
         Ov9A==
X-Gm-Message-State: AOJu0YwNMmwPEfF108SxeRswv7fXM7ZrQufMVJkyiejOLYdy291oWjUO
	jrqdM5MIgbRx9Q8wmenoU1vbbOfB231/zmigYB8=
X-Google-Smtp-Source: AGHT+IG1v44Wj1LrTXw6wVJOM/uGPbUyWFexLoLFUDfcBqVH8jnk0kmYdeH0ndU9XcfImhfCXpKcpn1SxmGtdCXH4oY=
X-Received: by 2002:a17:907:78d9:b0:974:183a:54b6 with SMTP id
 kv25-20020a17090778d900b00974183a54b6mr1776888ejc.33.1691583642370; Wed, 09
 Aug 2023 05:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
 <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
 <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com>
 <CANNYZj_ziirujoVk+rPr1+zbg9xyHTsPYaLMbQF8QJa0djNstg@mail.gmail.com>
 <CADVatmM4PuUygcPU-e1GnYVXuxhfo8Qxey0evE___iHaA-NwTg@mail.gmail.com> <CANNYZj99Op26qQPrEVOSZgpE=HJ_6twzqsi+6O0_asPDfBc6gA@mail.gmail.com>
In-Reply-To: <CANNYZj99Op26qQPrEVOSZgpE=HJ_6twzqsi+6O0_asPDfBc6gA@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 9 Aug 2023 13:20:05 +0100
Message-ID: <CADVatmPsZofiznWT_DF5WU5+v7dHNWyDn_ZveT66zUy_PBO2qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 12:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185698

On Wed, 9 Aug 2023 at 12:21, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 9 Aug 2023 at 13:08, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> > There seems to be no way to submit a MR or patch. I have used another
> > email (non-gmail) to register, but it did not allow me to fork and
> > raise MR. So I have opened an issue -
> > https://gitlab.isc.org/isc-projects/kea/-/issues/3007
>
> https://gitlab.isc.org/isc-projects/kea/-/blob/master/CONTRIBUTING.md
> explains how to do it. The key step is:
>
> "ask someone from the ISC team to give you permission to fork Kea (ask
> @tomek, @vicky, @ondrej or @godfryd or basically anyone from the Kea
> dev team)"
>
> I suppose they will do that once someone reads the issue, until then
> you can refer to the ticket in oe-core submission (but pls roll back
> to 2.4.x).

v2.4 will also have the same problem. This change was introduced in
v2.3, so anything v2.2+ will have the problem.
Anyways, I will resubmit the upgrade patch here after upstream has
resolved the problem.


-- 
Regards
Sudip

