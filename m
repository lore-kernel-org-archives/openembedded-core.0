Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DAFC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 19:13:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.60948.1695064434110641262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 12:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwXJ9dTf;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b974031aeaso80223851fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695064432; x=1695669232; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4K3IwYkXvcx8+rnMnHSDRLp1O4GNwHZKvAXMOKCeXQ=;
        b=CwXJ9dTfUnlgf0NGba1blaJZvnxYhKUuvBqkU12cWdnFk/fgm7mJnTpgkaqK+6rp7g
         9U9uFI0TCe9ltkH6eAYCxUeQPltWUjwJYirzqVOcmL+Nf3rJVEGtL4uwXZrYZPDEpDHg
         KxKmogfJodFK3GYr/ZY94NpJzI6gqKdtQA9WLH+QOTw0QaepS+pq3RwFJniOMczzwmbY
         s2d2vDxcTNEDgD7L65pXktsdJsHPggaF/zzKoCl44fCQOD1zRilMUq8NoSUWbFHE5Z/8
         1VPaqwMRRDavWsKm06EHRJ09OQYbJGv8+EkCwBVc3z54zm2KYXAptgy1jfbz3s8+bfPf
         V53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695064432; x=1695669232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4K3IwYkXvcx8+rnMnHSDRLp1O4GNwHZKvAXMOKCeXQ=;
        b=nMdV+CfNCh7rSFluoDzCa6I8pLLpQbrW0nnEyyTI510AYarWNz/9tJJE07pfqBSlCo
         kMufrEsRe58Z6ffLI60NR8drJDUj3nFVUebZFcwU9O7V7CiaEmT3ur3Zdjvgfi8VX/X1
         J2HgMGsyFlsc5IdQTwfZn/1ur0zrLxL1gfacb048sVGP99/T8VlG/Oo6LnGsa011DmxE
         My6PGDXj6zAt+w/qE9IUre+UomvHIfB89iz+r6SJ90dv61179qYdJg0xowdzJDLG+y7l
         xfngbFvwcRRRCFJW0rsTIlQEWLW0ghDYwbsf4neykt3K8Gm2Zf0boRFoPonOKMfU1hQl
         cAZA==
X-Gm-Message-State: AOJu0YyIU+33zTFMCn7pgfqtWR3yN0X0kI48796ojz8a5K1GcLi0Jlh+
	QgDPNjWKHWJWCM8Hu1Y+Y6p43rfBJ1/6xI93dDE=
X-Google-Smtp-Source: AGHT+IGENizFWYf4NaSikJFadZr/dS7hzBnNxUbpYNP0H/7PGltV2WiS0D4gdkFeu3mpA5kF7Myu19eZ6a1Bh5IV/wQ=
X-Received: by 2002:a2e:8797:0:b0:2c0:21b6:e80c with SMTP id
 n23-20020a2e8797000000b002c021b6e80cmr605281lji.35.1695064431925; Mon, 18 Sep
 2023 12:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
 <071e06cc-37ab-fd55-aac5-a089bc1501b0@bootlin.com> <CANNYZj9Sy+vMoOF5s9yHejT2fCbE1LhOtbxMEXqME4sPePyJ+A@mail.gmail.com>
 <1a9a7ce4-821e-4e82-6b55-c0dd5dc9283d@bootlin.com>
In-Reply-To: <1a9a7ce4-821e-4e82-6b55-c0dd5dc9283d@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Sep 2023 21:13:40 +0200
Message-ID: <CANNYZj8T-7y9fJ3rn12mMA4Su-T=GC6Un7M+3Kd62aZP=wYjoA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.10 FAILED
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 19:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187844

On Mon, 18 Sept 2023 at 20:46, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
> Ah, right, I should have paid attention to the file name.
> I could reproduce it too.
>
> Thanks a lot Alex :)
> Michael.

I think this backport should help:
https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c

Alex

