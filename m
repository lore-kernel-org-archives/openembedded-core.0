Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93975C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:17:48 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.85428.1738581458414675640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nt9XMdAy;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso32845186d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738581457; x=1739186257; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G5n14e9DPE5bLOAwZPHIT/LttmS/4IET4WzLkavykE=;
        b=Nt9XMdAyeXEpXRcJZLUDaqOs8Jr6UGJOOMAS4jyqBIbSfax3cC05ocVRe+sUiaLZbd
         IxI4Hfnzz0omk0EcpHbEe0Z2a9Qg9tnX1NOFzNaGZu5VcQXlvVpwq2qBpkkcct2Of0Cm
         2llPq/qxm1AbiShEkQJ8WjGlqn678Sjjn9DtnH8fe1ui5lC960JYt9Owg30lf3p5CYhV
         ZvTD3qBi2V1lnpYEdMabliDfErfqmPPhZeIMl20u6Ialep9Ij256hpv6Z5WAcRXSgzpj
         dC9HyY0Do4MKkNc4xUI5jKD9D4aTat51iddUlP6kwoGqOhVW/s/ISdaZRLiWLz7xBRxK
         fHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581457; x=1739186257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G5n14e9DPE5bLOAwZPHIT/LttmS/4IET4WzLkavykE=;
        b=b1VjfTi/g2hAd+xNXSVUJoBgyVrnqXFAID5bBYJI2x0CYgDxmh4HPz5vxgXhFbISy4
         wwgnjrYM67C4JsgziSg/1luV20YCnBzYnmWrF2eOxUWj8+jG104/VF79UUBrVsrZl26J
         2OAYmk13S5y22vrqQr13sLUSKKL5C8dnjXR5o+wGUxiBmFETN3RZH3GuESWPMpsveQYX
         6dPCCsXPf1+G1HGoolkPEtFvfCFb8HLhF0gBkv8kXSZXnIo6/3zisqnJ40dUP+ln3u+/
         JEe8+SdABqD1V84Xq5o/z3jjeU4oqIv0K37uo6a3BbIsRIByZpqDIrWR6E4OT2a5GBF9
         J3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCX93SW3Abxm5c7o7cNXwT7vch7jXPtp6QvCqoYhLt3KY+yrpqGePoViz5e7XpmPOLkHJtpdaBISxx+mMIMi5mrD1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxeyVLWuinm9GRRp0cLrlfHgNJ50DGAKFQgnfPNcAePMAKmAmVZ
	H43jSmtrZFTPqV4A+sghGcLxMZW9t7nYjr2iggbmgPFKsHWS5rNzj9TUiEqGy47wLcMy8lGLy6W
	Oikb6RCsmiUnYfs1YCWS9hO3Wd34=
X-Gm-Gg: ASbGncv2+nyZ/sSdTMRdjZf4mEsThxSAHAamITueiN9IV0rGEF8J/wtlVd3tPV8ch+a
	GhYueNNxzdM5txaiF1krCpCVK06awC1Ws/NlJ1kBd4YxaZ3fpLqgHYvJlzXI616im3oMWL6wunU
	N1KpP91IvE7/Yc4jhmCeioJWCynvQzoIU=
X-Google-Smtp-Source: AGHT+IEFXVTU3jBpIuC50xu2KdorHKBYPsYIO8TleDfqrXrP9AtxaPWLifRQztv5Y5oRY2PY+1CIQaWtIodayD2WfIs=
X-Received: by 2002:a0c:a811:0:b0:6e2:43d1:5fec with SMTP id
 6a1803df08f44-6e243d16188mr213737556d6.33.1738581457344; Mon, 03 Feb 2025
 03:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
 <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
 <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66> <048f3048-f9bd-4299-a92c-1696eaa7bb3f@gmail.com>
In-Reply-To: <048f3048-f9bd-4299-a92c-1696eaa7bb3f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:17:26 +0100
X-Gm-Features: AWEUYZlZR6Uy7-FI0OwQ2o4tNJPnEkDkpaBARrpUJbbAo-6sN62PLUzjDNKkHl8
Message-ID: <CANNYZj_qtrfy7ub++BfswurTtFT7HrsnsdwqJCPxG-W5fXf6Mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org, 
	Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210642

On Mon, 3 Feb 2025 at 06:17, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> As far as I can tell, the libclc dependency won't be needed for Mesa 25.0
> for the Intel iris driver. It will still be needed for Rusticl.

There's a 25.0-rc1 available:
https://archive.mesa3d.org/mesa-25.0.0-rc1.tar.xz

So you or Dmitry or Markus can play with that and report, we'd be all
very interested in a confirmation.

Alex

