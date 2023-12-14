Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47450C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 16:45:50 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.27629.1702572345565281511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 08:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJn58FbA;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1f060e059a3so6246439fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702572345; x=1703177145; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XftaqWad3E8R7WrFv8RpWAXZr+CDhCS+HOpZRDb+cSc=;
        b=CJn58FbAFHIH0JAtdn1h3BxthMKhx9wc5rCi2RplqBQ5KdMi1ZDJt8tUTRWHJJ8Tzp
         n+lO2+HqN1MdgY/VrOjldS2aqkvAFivPhVAlV3C/JrrbO6MlA2P0PBI0FoFeq6vA893/
         mqXVnakTJyUb7YW30LJmIqKBYixZWqiu4pxuFFFxC8DgFpk9xdj73HyEnVXYTt97+/ol
         zYp+C0BgCUxzbpjLxKuSCVEXvW+AoxBeTxuMSdYMEtnd+aV2rT2NGIoa26/Hz2wGJwxB
         UcJ6UnLDnx8stkmfIGCT39Z2uMg7gprlAsywJotqBlbalRHAOy7ptNLdeuqIC9UnoJQK
         k5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572345; x=1703177145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XftaqWad3E8R7WrFv8RpWAXZr+CDhCS+HOpZRDb+cSc=;
        b=uyLo2QCfoMHrUFo3sWD+cAIx+kLjrqfsBBdM32rAoDceJLvibEPd4TTuB7r6WCujAP
         LFs+3dgDa4Qf6g/3CHJM6G0xASdWEbMBBRqlI2FmP6y8piOL/NGaOBY51fVC/emDH8Km
         5R0GVNxEbICGhs/79JWvh9ZZ+Fsp3u/pvMvajDpQyjmylC4VRIhm8H/9dvKZlfnOo3ES
         KrAqS3rxrOJk2n5vjKfcJTRSxqS2vBVtJquQXDj7lItHH7s6nzJFWiNexYc1PL8eBePp
         q1xyPsptCuxDpzMPAbIYp3SWld7fzGjnCeq/oBT8qOCwH3qQKJLJn3d3gkKvBBiHrzCy
         nbug==
X-Gm-Message-State: AOJu0Yxl1bKn3l+eMZpMkJPz6+at0+pBtCV4+69iDEm94TiEKV4LNyHT
	cfC1T6y2ED9AkQ1IdbEDOak0QUDfquyw57mZJJV8v2X/
X-Google-Smtp-Source: AGHT+IGG61SrjAWzbdkxRPkYbR+VJcetdzW6W1nXZK8XqRSNUwuYLzn3ovjPHSieyUwgqWeMnnnllJ/pxbUyR+H70wQ=
X-Received: by 2002:a05:6870:b50b:b0:203:4038:dfd5 with SMTP id
 v11-20020a056870b50b00b002034038dfd5mr2359074oap.94.1702572344726; Thu, 14
 Dec 2023 08:45:44 -0800 (PST)
MIME-Version: 1.0
References: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr> <CXNASYPMNU9N.2AKRQ4ODCZYTH@joggee.fr>
 <CAMKF1sqUzNwDkevyhYvFdCgTMWOagqzhA=s4P9qXrSn2+_c05w@mail.gmail.com> <CAA_hxbTUek_xb8gwJtsd+U6747viKfKkb2Ae6-ATBCv2C3ZmdQ@mail.gmail.com>
In-Reply-To: <CAA_hxbTUek_xb8gwJtsd+U6747viKfKkb2Ae6-ATBCv2C3ZmdQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 08:45:18 -0800
Message-ID: <CAMKF1sqrvGpKHsbV15XHo59jWhOWkYySvYWi=5JcDdpVW_DF3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] lib/oe/package: add LOCALEEXTRADIRS to
 define extra locations for locales
To: Jonathan GUILLOT <jonathan@joggee.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 16:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192393

On Thu, Dec 14, 2023 at 2:42=E2=80=AFAM Jonathan GUILLOT <jonathan@joggee.f=
r> wrote:
>
> Hi Khem Raj,
>
> Le mer. 13 d=C3=A9c. 2023 =C3=A0 21:45, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :
> > I think using _ to separate the words would make it more readable so
> > call it LOCALE_EXTRA_PATHS or something.
> > secondly, it needs to be documented as well.
>
> The naming LOCALEEXTRADIRS is inspired from existing FILESEXTRAPATHS.
> Is there some guidelines for variable naming?

We used this convention when we used '_'  as an override separator.
That constainst is no more as we use ':' now.

> Definitely, I should add a bit of documentation.

