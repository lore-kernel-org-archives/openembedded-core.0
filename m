Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70685EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:52:43 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.3760.1687366361816161960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jx2NEZlM;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55e57337756so2436038eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687366361; x=1689958361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmUNVS2wCx75CSMx1Pptu5dVuBY2QYZiJwEZxZ+20+o=;
        b=jx2NEZlM8cn8ZfI+0svfc8U3PCMoc2EVs/Ip95l1z9zyBPsmE6kcFkDe44O5ek/S9n
         Tr01GxC7mIK5n56+LuEmotghsZKNi4CU8U2QR36U1e3Q3+PKc41R3nLmJ5P5JnQj0C0L
         Fu1xszuIW5K/iH/R8jo9JMnUtXRzeRVVgSlFmJO2IxzV4JMVrUOtOlJQ2aZTDRgA15Dh
         59Oda8RhLHeUAkh3Nae49QkwMl1HBsUv0CRLZOyZK5iX8zbu+9CYVNixu55NKY76TuVo
         Sz50p1suItQkgKTmC0MqTJGaCyCo/fEVoCRcA0NkIKU3D9wPaSjfn4I/I8Xhkblvqbcs
         me2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687366361; x=1689958361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmUNVS2wCx75CSMx1Pptu5dVuBY2QYZiJwEZxZ+20+o=;
        b=BPgGzhcDXaBE//U5cVixG4bvLvRcGjDLHSK3jkbSoREr4RfvYdjOfiTyQnI26+FUaG
         1TeYXSeQjqlzmUVHQ+20wTN4aK/L5zVRKE8YlFG+Eid8CKIk13xyUdUGr/gkQhT5549s
         l3pewVPRm2fXpxRoZcJNBCkLFXx0MW8PcTcfKPYwpjvEBeK1VpAyqSJ0RHDESXTSGzp8
         ytS+ujTPK8z3256P6c3OSod3NmxfxZZJxPvm+Z+17U9ycZnyrAoV3bCzplUqdZ7X6Xu7
         /hpjoOfHFZxU97M9HQP03EgamFfSb8afO9KsUIufvwoUp/RF7mjLvwRZaRhJdcmSIukQ
         XBEQ==
X-Gm-Message-State: AC+VfDxtmkqFip1744EE5aoGDQQsiyFMa5GXTVovI7OxP5O+nwo64VW0
	e1CT/LS9JO5SwCfS+ErKaeUu8l+lrUI6cbu9+OA=
X-Google-Smtp-Source: ACHHUZ5b2bA/rRbldd09IAelEI8Sk/qjfgo4tSFL0fDWjznDduMuVw6JtNNuKgUru61r9OFJOY0z+IM9j2pUbUfSO6E=
X-Received: by 2002:a4a:d28e:0:b0:560:befd:6d6a with SMTP id
 h14-20020a4ad28e000000b00560befd6d6amr1096455oos.7.1687366360899; Wed, 21 Jun
 2023 09:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com>
In-Reply-To: <ec700d47-482a-2b83-9bae-8d0eed55da88@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Jun 2023 09:52:14 -0700
Message-ID: <CAMKF1srpvsvaQGZrnUhNi-=1R5SLtWxVq5cxirCjPJCOaxmZjQ@mail.gmail.com>
Subject: Re: [OE-core] Building SDK from Feeds
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org, alex.stewart@ni.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183191

On Wed, Jun 21, 2023 at 9:47=E2=80=AFAM Charlie Johnston
<charlie.johnston@ni.com> wrote:
>
> Hello,
>
> I'm trying to build an SDK (or even just meta-toolchain) from feeds. For =
context, there are some dev packages in our feeds that aren't in our OpenEm=
bedded build that I'd like to include in the SDK. The normal process I use =
for building an image from feeds is to build the packages from OE locally, =
build a package index, and then build the image using those feeds and our i=
nternal feed server.

How do you do that? do you have a customized image builder ?

 I'm having trouble figuring out all the architectures and packages
that need built to do the same for the SDK.
>
> Trial and error got me to a few of the dummysdk architectures and package=
s, but is there any documentation on the required packages to build the SDK=
 that I would need to include in a feed? Has anyone tried to do this before=
?
>
> Thanks,
> Charlie Johnston
> e. charlie.johnston@ni.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183189): https://lists.openembedded.org/g/openembedde=
d-core/message/183189
> Mute This Topic: https://lists.openembedded.org/mt/99680369/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

