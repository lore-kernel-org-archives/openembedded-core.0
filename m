Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C893DC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:17:35 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.73883.1680535048527185795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 08:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4y1ooy3G;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id x3so118666547edb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680535046; x=1683127046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqoelS0UEpQbiC5MtZQZ+PNg3M8oxGFswMq4ZETKwFU=;
        b=4y1ooy3GD7hN2UJMBExMTlHpdf5Fws21Cmh2afHdyIRdZIJuUGuMuP+Nt1JfUCt0DK
         y2kIpqXe0Kj4ksPREvYz5Nr7lT7fcqxMFacbzdb7axTZC+nHKogsRYrInWDxhjZQ7iwS
         yMntsLAx69AjPG03/mJTuXU5nkyssIjKHSaFz1UHTU6qEhuEPdgow94wfG0bn5GsRlvX
         Xjplb09ibxSz8V1PxbgnU/onCReUu+VcJImuva2zNU8jN1SLZcol0pOTQ6RllnRFBK/E
         OvzUfSRTnugdOYC95nTbJHeYG30+1+L7uyiGhs+T2uHaAGEYcLFDUoqVyt9WoD/l5tPZ
         0ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535046; x=1683127046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqoelS0UEpQbiC5MtZQZ+PNg3M8oxGFswMq4ZETKwFU=;
        b=iDCqLTB5daRBOyjtkFREKeQCD8hBPMYy09qdhEoSnCLv5hXyARXUfwO08+dPGOLlvn
         O4uwVFj6nee7ikfoHlUehoEZ6+QVpkrUqpN20vsPIZAURbWNDpsRNLfiLPQsx5kv/HGP
         THnjUDglwdRlZV3DfIiRzfOstohqNTYIWkMyFuElN6SchkyVPbLDYMtUltKaXacCzQ2j
         e9EGy+QHB+gZH8xG9dCDChJDo4J7/2rgZwGjXvD77+anOHPtUmNDhzC2/woydrPoMPfC
         V0XCDCH7bGu9kw6i4Haks9pB/JnkCKA4AvD3EGyyjWKK769Np0o9ITOvzYz/cXCrSfdX
         o0GA==
X-Gm-Message-State: AAQBX9dh/+4cpZJcYIIvYp4wJFbuEFFTNUJxX2gps/GYjALSH18vreAF
	sL8+mYOb6IKPv8iFqHBOkHLKLZTzy5bWkqccvkUUzw==
X-Google-Smtp-Source: AKy350Zv0ngPGbcIKiazVqIbeg/iKtcoLtVHpB4Il30B8hjtvsVedOvOuDMFRdJWDFQxY1tSW5tNm4UTLvp5R3mFfL4=
X-Received: by 2002:a17:906:8683:b0:939:a51a:dc30 with SMTP id
 g3-20020a170906868300b00939a51adc30mr8908729ejx.2.1680535046513; Mon, 03 Apr
 2023 08:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <24425.1680518067436951829@lists.openembedded.org> <24425.1680518511903830352@lists.openembedded.org>
In-Reply-To: <24425.1680518511903830352@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Apr 2023 05:17:14 -1000
Message-ID: <CAOSpxdadm+JeqPYUB8+iPH-e3t0qcRaJQqFmriq0MK=2AsMuEA@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 15:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179638

On Mon, Apr 3, 2023 at 12:41=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> On Mon, Apr 3, 2023 at 03:34 AM, Pawan Badganchi wrote:
>
> Hi steve,
> I am talking about this cve CVE-2023-23916.
>
> Could you please build this patch
>
> Hi steve,
> I am talking about this cve CVE-2023-23916.
>
> Could you please build this patch as CVE-2023-23914, CVE-2023-23915 patch=
es are already present on upstream kirkstone branch.

As I mentioned in:

https://lists.openembedded.org/g/openembedded-core/message/179016

the reason I have not taken this patch is that it has fuzz errors:

WARNING: curl-native-7.82.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-23916.patch
patching file lib/content_encoding.c
patching file lib/urldata.h
patching file tests/data/Makefile.inc
Hunk #1 succeeded at 68 with fuzz 2 (offset 2 lines).
patching file tests/data/test418

Please submit a v2 with this fixed and I can then take the patch.

Thanks!

Steve

