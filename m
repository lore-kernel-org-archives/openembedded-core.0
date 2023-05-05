Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12CAC77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:05:50 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.3875.1683313549072891354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RLy/K0FM;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ac785015d6so23990361fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 12:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683313547; x=1685905547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/J6fdyqCTuEBksRzNO1svKGGFj78BmINEag93n8ekY=;
        b=RLy/K0FM1LJmHFwZz4KlNFEHjIZ4rsIeqDfrq5pryLhWf7nsEOpUirRlRtLSrpFKOi
         OSaN98jCBkya/5ZjU3qdODkbrDuX+13nKsatjh5zAJaDkffiIglTig0a2pzfZ4dJVaSV
         y6Le6nuJlC3oh2h80ywePU+iDuyRSoEsFahTx8aoNrsYSWjQCzIVVeDNJzYwUMr9YNOc
         ubtxH2T2LaHCeyHntbvpeIw+Puv5JTL5JlJ4GypWne0I/PP8uCjkPS3DOH8XiMBgtfLd
         SV8XBVmHs1M2OI40F39Z9bsCE5To1sRMJy7/T7oKRF/0yqlI/kg0ZO/iqn6+7AjReDUS
         pQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683313547; x=1685905547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/J6fdyqCTuEBksRzNO1svKGGFj78BmINEag93n8ekY=;
        b=MpcL6VnAl11cAOWdtfQTFHN6wbCnXyWhkfOp5NqXdTijQ56siBs+E7ZcvTxEsC+x90
         XQGkIenza4xSQU/tvIL7vu0Zt4xbpFgdUtcNUoTmJvKLRMHFQ7BbkH+C9StT6HBNCkaH
         NpmYPEodEeeFZQbstk06KeYe21OMFnUQfPSXCQK/oe7fAyluALDD7SGCq2WZQLYmhApa
         aSsUFxLZAe+mHE6LpYlcZ3C8Q2CSIKKahT+VxlAiOpm1XbmEVvTjgRqtnbCYbBWECT28
         jl/9F5JFcugrPmv701ikjkX3yubFC7M/bNp9X2Q12sCKVOYlffNtVGgaHLczR4mJnHJ2
         7Vtg==
X-Gm-Message-State: AC+VfDyYng6BON3JpOo9Z1O4WMKFiCT3q68/j7t8upWVJezRZG7rC6/O
	q2QZRY+2k7wvjUkRsznFVO8Ctrm6dMt4/QTSfmg=
X-Google-Smtp-Source: ACHHUZ6OstVMSOa17PtD4lrjNypr0poEqRc5uEV42qMbxEWTEUayWxSzjs+6z2FnHU7v3bw5mlNINAh5uXDeKeyhX+A=
X-Received: by 2002:a2e:b015:0:b0:2a9:ef05:8b73 with SMTP id
 y21-20020a2eb015000000b002a9ef058b73mr751300ljk.44.1683313547052; Fri, 05 May
 2023 12:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com> <CA+cAkeqLrwgk4e-Lzk0e_k8AFKCT6nqSY7+JQNZ-fPbarK0ngw@mail.gmail.com>
In-Reply-To: <CA+cAkeqLrwgk4e-Lzk0e_k8AFKCT6nqSY7+JQNZ-fPbarK0ngw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 May 2023 21:05:35 +0200
Message-ID: <CANNYZj-KzKuu345y6nqk0r+Xch6z8oh9uGQvtDLK5PMNa-4V5A@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180971

On Fri, 5 May 2023 at 20:26, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
> That's what I did for unit test of rust recipes and I didn't get much com=
ments beside you and khem 15 days ago. And I still don't know if my patches=
 are an issue or if nobody had the time to look at them, it's pretty frustr=
ating.

They've been merged to master I think? Can you check that by
fetch/rebase? Yes, there is no separate notice when it happens, and
it's frustrating to first time contributors, but again, someone needs
to sit down and write an email bot to do the job.

> I would like to know about these, I hear a lot in this list about autobui=
lder and it seems close to what I know of continuous integration (some buil=
d of multiple configuration with the submitted patch and tests towards that=
) but I don't know how to replicate the config of those locally on my machi=
ne (in case of errors), do you have any links for that?
>

You probably should to start with reading
https://docs.yoctoproject.org/test-manual/index.html ?

> Ah great, if you point me to where I can find insights about this patchse=
t test framework, I would gladly offer my help to fox the issue. From what =
you are saying, I understand that fixing this will make the contribution sm=
oothier.

That you should discuss with Trevor.

Alex

