Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB7EC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:50:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11357.1722873040276168478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IzWpybEA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-369c609d0c7so7499578f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722873039; x=1723477839; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BRABvSnQVK/b9+8aOx5mNBJEKRnggyxJLoprk8f1W4s=;
        b=IzWpybEAMPVT/Rh6uwDrJyDojc7mcg6zNPgEAEFMEb7k6rMv6upIw6HLgDPm2Y1V0Y
         N0RHn24YGTx/hqGgzEDCNW1iAFjMheI+Yki9uu9S38t0qs0+IdM+PYuOG1G4SJwe5ZHc
         CUIDlgxMKGE6thsDibw/CQpuZFZVFpbfAq7rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722873039; x=1723477839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRABvSnQVK/b9+8aOx5mNBJEKRnggyxJLoprk8f1W4s=;
        b=K0VrzgDfHxvZbmZ0hEyyJxrSYIqH/Jfs1xH5oOja+ExIdD19/qqyfECVBH9JDvDtEP
         jRZ4pM+8+44XFonmHdEzXkKH7dzNk045JOA3bbAYumG/cgKnyAMEvoUMr6EbUDFivXRl
         gp9go5G9QQmwY9wjZON/gQsO0jJLPFBRM6/sCC70EkNJV7uy2uEGkm2/DfxXC1QzAxJK
         PZD0q5rY05amg7N0sx04CIpMdKNKqqAgz0+O/bT1QPWAGV+VWd57VxOnR0RMDt+fRVbw
         Z0Ls1C7UnGQTsExa0wK9I8S+w4VNseJU8AyVKlFXm/Vl1ShGCJ3qHGxYxfVcGzBhP4kK
         H8Vg==
X-Gm-Message-State: AOJu0Yxkj/Lgg+ZLBBigYKbcVslLBvBpSbmB2benDyiBF4CA8H4bbZl3
	d7OLYalgxgZXJp5uL2AsvDqlZ9ZTxyhPN4sX1C33RZ0BcaTMjBkk3ks1KZ55Lmw=
X-Google-Smtp-Source: AGHT+IG2IAWk3UtJWbduPp9QSoXL2WPmgzlJJS78LuOBtijncQoZ9vGQ2WmEwN4T1nh1oXIfhKY6Mw==
X-Received: by 2002:a5d:6448:0:b0:368:420c:74ab with SMTP id ffacd0b85a97d-36bbc117aa7mr9998641f8f.28.1722873038527;
        Mon, 05 Aug 2024 08:50:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7? ([2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0dc9asm10152510f8f.15.2024.08.05.08.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:50:38 -0700 (PDT)
Message-ID: <0162f8e09fb05ba123eab2987ecdf52b9340dd65.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] cve_check: Use a local copy of the
 database during builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 05 Aug 2024 16:50:37 +0100
In-Reply-To: <CAApg2=TWFeTC5SML6mGhwo3dXBA_PyoJykxGfjqa=1b=JwFNfA@mail.gmail.com>
References: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
	 <CAApg2=TWFeTC5SML6mGhwo3dXBA_PyoJykxGfjqa=1b=JwFNfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203003

On Mon, 2024-08-05 at 17:41 +0200, Marta Rybczynska wrote:
> On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via lists.openembed=
ded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote=
:
> > Rtaher than trying to use a sqlite database over NFS from DL_DIR,
> > work from
> > a local copy in STAGING DIR after fetching.
>=20
> I saw this patch this morning when I was nearly done with my version
> and waiting for the fresh build to finish...

Sorry, I never saw an email saying you were writing the patch or a
reply to my mail asking about it, I only wanted to try and help :(

> Do you plan to keep it for longer or is it for testing only? If for
> longer, I would likely keep old variable names for cve-update-nvd2-
> native.bb
>=20
> Did it help with the corruption issue?

It is really hard to say as it is an intermittent issue. I ended up
merging it earlier on today, partly as I wanted to get it wider
exposure for testing to see whether it really does help or not. It will
take time to see whether it recurs.

Regardless, operating on a local copy of the database rather than a
shared copy in DL_DIR should help performance and avoid some sets of
potential NFS issues.

Which variable names did you want to keep? I kept the wider
class/public names the same and only changed things within the recipe
to try and ensure fewer compatibility issues. Happy to look at a
different version of the patch/approach on top of mine.

Cheers,

Richard


