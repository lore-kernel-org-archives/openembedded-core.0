Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41605C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:26:11 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.55725.1745864763776131217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 11:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mJWFKuFZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8fb83e137so52683316d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745864763; x=1746469563; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5PTT62aRPdFoA3QB27XeFfaR0p26xM0DVDXwQUXsCf8=;
        b=mJWFKuFZWfWbs/+ercoMPPUCxKZYUyDv6b8Zhz/ibmJ8RB0Qy87go095dUjs8iX/jG
         SLUsq0pUOCJ21Cz6S94o2SwjEyWsoil5nK5aF+VCG3LpvYHIuVLwxGNDtUdZt2LPqX6v
         qzSOUhSCAQCsRvRWxJ27TdBRVUJruzfDXsWCCAPOs68AJy3dEBu/VvEXVilVhVZMc10E
         7wcc5VEwaNMs8p+MI6CN9RNFZBuClBEqlrxp1VlllR4Mml+CA0dO2acJr4wcVgDSHxtf
         laETzzPdZ5jouwjY1p2Djuj+mORkh7UPKrwhaWUYGc/Zj0QWujoiaeFwhEGqtsiFa77p
         cWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864763; x=1746469563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PTT62aRPdFoA3QB27XeFfaR0p26xM0DVDXwQUXsCf8=;
        b=KRnVLTC5/fAyyaZLJ/WpnKHrmiL5Qqll+k3aGaFdgUYWUrGnebSPHAo83humLIRoUR
         jqiH3ZrtBIAh6Kp6pkTlbluStlP1+Y7JWoaZKh/skoCkcHbYxJ7a0ZlpoaYd7J7vR86W
         rp07OXjfj7850OPt97jCgUMBLUrSoe6ROLGOJBlBrUriz2K9xkpdpVZI4d5vGHBFM5a6
         DY8KhrRSaB+V0nQsyMEa5ROTpRZV8nxwYc47rXFhOssZrrMqYwhLIMkmEnj4s4qFOtdc
         Hgd5GU1GYXtjSkPQEyWetMi0BSUKEDXgLUikEkeK0S1sL/tfewK4gbieKxMmTy7HL4AC
         b2pQ==
X-Gm-Message-State: AOJu0YwzJXttNMC2GbYlUuqjGTFO6lEZqAoKsWvGBmb47giADdq5ICMW
	2AY33BI7Tjq7wxiHmBinyS/hMlrmr2zCKMAm0wF9Y30CVFvKLZXOF446DRFxLVt5E1uIZLIK3/U
	9oGWrbmpn3CgAtqcbzCLVSimbxealGA==
X-Gm-Gg: ASbGnctORpUjdshJ43elkHtW2NgvVrhfRS2/nsVhay5hMsvQKQI2Mzbx+Awvkj6zyep
	rWzVNS7qN9EYVM/E2OH1ejd8j75tORyQEsKNzrVTikphzfc6gOwRHOHt7FuxvgvI0nY20JIa4zq
	Qo1pJRqIkYLwigZlW6au8+PYGVNgx9PBwJXYJUO1Wa4+caIwD2rL20kwoY
X-Google-Smtp-Source: AGHT+IEsg2m9WPsOCDDfgP5Pm/CfjsgghkRRodtqHpvsJa4Kp891ZtLLDgYE2GyyHsCV6Cb0H+rya1D1YPEm0GS7NLo=
X-Received: by 2002:a05:6214:d06:b0:6f2:b094:430e with SMTP id
 6a1803df08f44-6f4cb9edb45mr252866396d6.25.1745864762630; Mon, 28 Apr 2025
 11:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250428154853.3084518-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250428154853.3084518-1-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Apr 2025 20:25:51 +0200
X-Gm-Features: ATxdqUFvh9UfdBk1DMr3abp998wA-27slwjGIwBQ76viuIOurrZTeWKW9gI4ek8
Message-ID: <CANNYZj8QQAzzb+xU-KjGLAvA723KWBOMt_+zifchuJW7-P+E=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] graphene: disable one of error flags
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215630

On Mon, 28 Apr 2025 at 17:48, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
>
> Building of graphene fails with the following error. Disable
> corresponding flag being set by meson until the issue gets resolved
> upstream.
> +Subject: [PATCH] meson.build: disable -Werror=redundant-decls
> +
> +Building of Graphene started to fail with the following errors. Disable
> +offending flag.
> +Upstream-Status: Pending

Not so quick please. This recipe does not fail on the autobuilder
(yocto ci), or in my local build (using standard poky), so there's
something else going on. You need to narrow down what really causes
the failure (something non-standard in your settings or toolchain?),
there should be a link to the upstream ticket, and the patch should
not be marked as Pending (unless a very good reason for that is
given).

Alex

