Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D39AD58068
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:47:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.17006.1732535239642498770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZD2K5qNs;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d40263adbaso34416176d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 03:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732535239; x=1733140039; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axGhVJo//ZFzXEX5CS1MeJtPJMuF9olNpc77WrJjm9s=;
        b=ZD2K5qNsOMYV5vxkfn+bykSEQWNOKVARpxMhmYqZM4FjcsVjQXbHjcwkd49d5moF1U
         CT0yczfPGlxhWCZyeCPpHW6ITHcz4rbUTDDspLwVJ5BdXjjB2mou3TJUF8PYHaPLts5/
         86/c7ZA4CvXIW2pcWv6yZcswSHvRizlslthMwyY4V8ylCp1QTxW93xjIpiLYOQyN0FBc
         4AowBvvtgLKPtZcXN8zCja8Z7u+zr5XS3I9RIh3Wj8QywzO/5cfeQpfqv2jtMjlBLDXy
         rWVSYqV4xR3gVz7IxwxlKeaC8FVMmJSsUksbkm2pcGjQeOqlKmyCdslg7iqDJWwQkS6p
         dmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732535239; x=1733140039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axGhVJo//ZFzXEX5CS1MeJtPJMuF9olNpc77WrJjm9s=;
        b=O7psw3ZDZpEepY12a6/gwKlraEEGIDXJs8E8Uv0Oe6dwiTmBy+a4AXbXfYIq6sC5SV
         qIz1vM24PGBLbWryuFW2lk8yjmIIahrIIxJZy5xaAGDrmNiQ1W4iP15AsImuz9uXg8lr
         Ik+U6VUDQ305nnK581Vd4YYdurQ0yaycQzrw7bk1DC7Wo+MUbd3tyo+WcsAMjxNIZ89z
         LwNZ88onbuPpRKiPhVqHptp2/Zv/bL/flbW2Kp1GaVBLZBxvkHX1sIN+9ibsbYrPHYo2
         cBNZgYIMzdXRSZ1er+TqRRRc9W8Pa8j24SigPqB4T7PTnwy7He8ZLikpeCDsJMjIk6e0
         OmQg==
X-Gm-Message-State: AOJu0Yw/TrUbyvqg8J6wu+bfmjiXxtQQl05tlp2P1w/vjhsd2qAssqJd
	Cy+VyfFXYq29LbhNi2VQ7T3rXwUes3vY0aEuTslGMi01kD8KVgpZfbHb3smdCWJRcJzQg4Q8kK8
	ds5XarOVjW6fba/qvgHfjycgWy7Tz6A==
X-Gm-Gg: ASbGnctn/DKsgE8BQSefPPpJI2gLMd/jNfagPQnbD+HCcWcOwSlDn+QOMm9H1jtjjsC
	odKRA5U71NVn4uRAzFq7pn+3LJtdUNk5NsHh0rFHUZndDZcFGskMbqIKHiXnVBGD4Lg==
X-Google-Smtp-Source: AGHT+IFvrKb27vYeM3oQDq5kQJwz+rmhIFIs4R5/GMcdsOy+syVfZjJJBp1GaoXj5UOq6uTjNY5hNr5OUisZKNQjMOg=
X-Received: by 2002:a05:6214:29ca:b0:6d4:36ff:4358 with SMTP id
 6a1803df08f44-6d450ea815emr222000436d6.25.1732535238722; Mon, 25 Nov 2024
 03:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20241125102227.1216656-1-ejo@pengutronix.de> <CANNYZj_YG8Enba=QM0niqgw0TFj_yojC8-f1rA9pBja=z38PxQ@mail.gmail.com>
 <0c7b419307de6be75df7a232440d997653809921.camel@pengutronix.de>
In-Reply-To: <0c7b419307de6be75df7a232440d997653809921.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 12:47:07 +0100
Message-ID: <CANNYZj_n+FP-F_-ghOu83tnmCgq8k_rZMF1UkpNR3aK3q3AArg@mail.gmail.com>
Subject: Re: [PATCH 1/3] barebox-tools: upgrade 2024.09.0 -> 2024.10.0
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207742

On Mon, 25 Nov 2024 at 12:07, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
> > Already in master (but barebox is still at 2023.09):
> > https://git.yoctoproject.org/poky/commit/?id=3D10a2dd4d67d57e8f91a2814c=
d61371b6cab94044
> >
> > See what I mean about not enforcing lockstep updates? :)
>
> Oh, I just looked at the Mails and did not notice a new barebox patch the=
re and the other had a
> comment that made me assume it won't get merged. Seems my assumption was =
wrong. =F0=9F=98=89

Sometimes incorrect things still slip through to master, and then we
deal with it after the fact. It's always good to
fetch/rebase/review-the-rebase before sending.

Alex

